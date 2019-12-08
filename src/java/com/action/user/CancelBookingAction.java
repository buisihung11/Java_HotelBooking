/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.bookingDAO.BookingDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@ResultPath(value = "/")
@Action("cancelBooking")
@Results({
    @Result(name = "success", location = "bookingHistory.jsp",
            type = "redirectAction", params = {
                "actionName", "searchBooking",
                "hotelNameSearch", "${hotelNameSearch}",
                "bookingDateSearch", "${bookingDateSearch}",
                "cancelSuccessMsg", "${cancelSuccessMsg}"

            })
    ,
        @Result(name = "fail", location = "bookingHistory.jsp",
            type = "redirectAction", params = {
                "actionName", "searchBooking",
                "hotelNameSearch", "${hotelNameSearch}",
                "bookingDateSearch", "${bookingDateSearch}",
                "cancelFailMsg", "${cancelFailMsg}"
            })
})
public class CancelBookingAction {

    private static final BookingDAO BOOKING_DAO = new BookingDAO();

    private int bookingID;
    private String hotelNameSearch;
    private String bookingDateSearch;

    private String cancelFailMsg;
    private String cancelSuccessMsg;

    public CancelBookingAction() {
    }

    public String execute() throws Exception {

        boolean cancelSuccess = false;

        //check booking status of bookingID
        int bookingStatus = BOOKING_DAO.getBookingStatus(bookingID);
        
        if (bookingStatus == BookingDAO.BOOKING_ACTIVE || bookingStatus == BookingDAO.BOOKING_NOT_CONFIRMED) {
            //cancel booking

            cancelSuccess = BOOKING_DAO.cancelBooking(bookingID);

            if (!cancelSuccess) {
                cancelFailMsg = "Something error";
            } else {
                cancelSuccessMsg = "Cancel Success";
            }

        } else {
            cancelFailMsg = "The booking must be active or waiting for confirm state.";
            cancelSuccess = false;
        }

        return cancelSuccess ? "success" : "fail";
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
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

    public String getCancelSuccessMsg() {
        return cancelSuccessMsg;
    }

    public void setCancelSuccessMsg(String cancelSuccessMsg) {
        this.cancelSuccessMsg = cancelSuccessMsg;
    }

    public String getCancelFailMsg() {
        return cancelFailMsg;
    }

    public void setCancelFailMsg(String cancelFailMsg) {
        this.cancelFailMsg = cancelFailMsg;
    }

}
