package com.action;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.bookingDAO.BookingDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/")
@ResultPath(value = "/")
@Action("confirmBooking")
@Results({
    @Result(name = "success", location = "home.jsp",
            type = "redirect",
            params = {
                "confirmSuccess", "Your booking with bookingID[%{bookingID}] was confirm.\n Thanks for using our service. 🙏"
            })
    ,
        @Result(name = "fail", location = "home.jsp",
            type = "redirect",
            params = {
                "confirmFail", "Not valid token"
            })
})
public class ConfirmBookingAction {

    private static final BookingDAO BOOKING_DAO = new BookingDAO();
    
    private int bookingID;
    private String token;

    public ConfirmBookingAction() {
    }

    public String execute() throws Exception {
        boolean confirmSuccess = false;
        if(!(token == null || token.trim().isEmpty() || bookingID == 0)){
            //check token with that booking ID
            //set the booking status to active
            confirmSuccess = BOOKING_DAO.confirmBooking(bookingID, token);
        }
        
        return confirmSuccess ? "success" : "fail";
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

   
    

}
