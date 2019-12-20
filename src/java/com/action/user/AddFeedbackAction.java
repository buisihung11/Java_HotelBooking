package com.action.user;


import com.bookingDAO.BookingDAO;
import com.bookingDetailDAO.BookingDetailDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
@Namespace("/user")
@ResultPath(value = "/")
@Action("addFeedback")
@Results({
    @Result(name = "success", location = "bookingHistory.jsp",
            type = "redirectAction", params = {
                "actionName", "searchBooking",
                "hotelNameSearch", "${hotelNameSearch}",
                "bookingDateSearch", "${bookingDateSearch}",
                "addFeedbackSuccessMsg", "${addFeedbackSuccessMsg}"

            })
    ,
        @Result(name = "fail", location = "bookingHistory.jsp",
            type = "redirectAction", params = {
                "actionName", "searchBooking",
                "hotelNameSearch", "${hotelNameSearch}",
                "bookingDateSearch", "${bookingDateSearch}",
                "addFeedbackFailMsg", "${addFeedbackFailMsg}"
            })
})
public class AddFeedbackAction {

    private static final BookingDetailDAO BOOKING_DETAIL_DAO = new BookingDetailDAO();
    private static final BookingDAO BOOKING_DAO = new BookingDAO();

    private int bookingID;
    private int bookingDetailID;
    private String hotelNameSearch;
    private String bookingDateSearch;
    private String feedback;

    private String addFeedbackFailMsg;
    private String addFeedbackSuccessMsg;

    public AddFeedbackAction() {
    }

    public String execute() throws Exception {

        boolean addSuccess = false;

        //check booking status of bookingID
        int bookingStatus = BOOKING_DAO.getBookingStatus(bookingID);

        switch (bookingStatus) {
            case BookingDAO.BOOKING_ACTIVE:
                //cancel booking
                addSuccess = BOOKING_DETAIL_DAO.addFeedBack(bookingDetailID, feedback);
                if (!addSuccess) {
                    //was prevented from client
                    addFeedbackFailMsg = "You had added feedback before";
                } else {
                    addFeedbackSuccessMsg = "Add feedback Success";
                }   break;
            case BookingDAO.BOOKING_NOT_CONFIRMED:
                addFeedbackFailMsg = "You must confirm before can add feedback";
                addSuccess = false;
                break;
            default:
                addFeedbackFailMsg = "You cann't feedback this room because the booking was canceled";
                addSuccess = false;
                break;
        }

        return addSuccess ? "success" : "fail";

    }

    public int getBookingDetailID() {
        return bookingDetailID;
    }

    public void setBookingDetailID(int bookingDetailID) {
        this.bookingDetailID = bookingDetailID;
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

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    
    
}
