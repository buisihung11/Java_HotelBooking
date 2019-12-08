/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingDAO;

import com.bookingDetailDAO.BookingDetailDTO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BookingDTO implements Serializable{
    
    private int bookingID;
    private int bookingStatus;
    private String checkInDate;
    private String checkOutDate;
    private String bookingDate;
    private String userID;
    private String customerEmail;
    private String customerPhone;
    private String customerFullName;
    private float total;
    
    //extra info
    private String hotelName;
    private int hotelAreaID;
    
    
    private List<BookingDetailDTO> bookingDetails;

    public BookingDTO(int bookingID, int bookingStatus, String checkInDate, String checkOutDate, String bookingDate, String userID, String customerEmail, String customerPhone, String customerFullName, float total, String hotelName, int hotelAreaID) {
        this.bookingID = bookingID;
        this.bookingStatus = bookingStatus;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.bookingDate = bookingDate;
        this.userID = userID;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerFullName = customerFullName;
        this.total = total;
        this.hotelName = hotelName;
        this.hotelAreaID = hotelAreaID;
    }

    

    
    
    public BookingDTO() {
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public int getHotelAreaID() {
        return hotelAreaID;
    }

    public void setHotelAreaID(int hotelAreaID) {
        this.hotelAreaID = hotelAreaID;
    }

    
    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(int bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerFullName() {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) {
        this.customerFullName = customerFullName;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public List<BookingDetailDTO> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetailDTO> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

 

    
}
