/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.bookingDAO.BookingDAO;
import com.bookingDAO.BookingDTO;
import com.bookingDetailDAO.BookingDetailDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@ResultPath(value = "/")
@Action("searchBooking")
@Results({
    @Result(name = "success", location = "bookingHistory.jsp")
    ,
        @Result(name = "fail", location = "../home.jsp",
            type = "redirect"
    )
})
public class SearchBookingHistoryAction {

    private static final BookingDAO BOOKING_DAO = new BookingDAO();
    private static final BookingDetailDAO BOOKING_DETAIL_DAO = new BookingDetailDAO();

    private String hotelNameSearch;
    private String bookingDateSearch;

    private List<BookingDTO> results;

    //for cancel booking action
    private String cancelFailMsg;
    private String cancelSuccessMsg;

    //for add feedback action
    private String addFeedbackFailMsg;
    private String addFeedbackSuccessMsg;

    public SearchBookingHistoryAction() {
    }

    public String execute() throws Exception {
        HttpServletRequest req = ServletActionContext.getRequest();
        HttpSession sessionSevlet = req.getSession();
        String userID = (String) sessionSevlet.getAttribute("USER_ID");

        if (userID != null) {
            if (hotelNameSearch == null) {
                hotelNameSearch = "";
            }
            if (bookingDateSearch == null) {
                bookingDateSearch = "";
            }
            //1. get all booking from that user
            results = BOOKING_DAO.getBookingsHistoryOfUser(userID, hotelNameSearch, bookingDateSearch);

            //2. get booking detail from that booking list
            if (results != null) {
                for (BookingDTO booking : results) {
                    int bookingID = booking.getBookingID();

                    booking.setBookingDetails(BOOKING_DETAIL_DAO.getBookingDetailsOfBooking(bookingID));

                }
            }

        }

        return "success";
    }

    public String getAddFeedbackFailMsg() {
        return addFeedbackFailMsg;
    }

    public void setAddFeedbackFailMsg(String addFeedbackFailMsg) {
        this.addFeedbackFailMsg = addFeedbackFailMsg;
    }

    public String getAddFeedbackSuccessMsg() {
        return addFeedbackSuccessMsg;
    }

    public void setAddFeedbackSuccessMsg(String addFeedbackSuccessMsg) {
        this.addFeedbackSuccessMsg = addFeedbackSuccessMsg;
    }

    
    
    public String getCancelFailMsg() {
        return cancelFailMsg;
    }

    public void setCancelFailMsg(String cancelFailMsg) {
        this.cancelFailMsg = cancelFailMsg;
    }

    public String getCancelSuccessMsg() {
        return cancelSuccessMsg;
    }

    public void setCancelSuccessMsg(String cancelSuccessMsg) {
        this.cancelSuccessMsg = cancelSuccessMsg;
    }

    public String getHotelNameSearch() {
        return hotelNameSearch;
    }

    public void setHotelNameSearch(String hotelNameSearch) {
        this.hotelNameSearch = hotelNameSearch;
    }

    public String getBookingDateSearch() {
        return bookingDateSearch;
    }

    public void setBookingDateSearch(String bookingDateSearch) {
        this.bookingDateSearch = bookingDateSearch;
    }

    public List<BookingDTO> getResults() {
        return results;
    }

    public void setResults(List<BookingDTO> results) {
        this.results = results;
    }

}
