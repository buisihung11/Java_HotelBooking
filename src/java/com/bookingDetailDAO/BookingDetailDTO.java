/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingDetailDAO;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class BookingDetailDTO implements Serializable{
    private int roomID;
    private int bookingDetailID;
    private int bookedQuanity;
    private float amount;

    private String feedback;
    //extra
    private int roomTypeID;
    private float roomPrice;
    public BookingDetailDTO() {
    }

    public BookingDetailDTO(int roomID, int bookingDetailID, int bookedQuanity, float amount, String feedback, int roomTypeID, float roomPrice) {
        this.roomID = roomID;
        this.bookingDetailID = bookingDetailID;
        this.bookedQuanity = bookedQuanity;
        this.amount = amount;
        this.feedback = feedback;
        this.roomTypeID = roomTypeID;
        this.roomPrice = roomPrice;
    }

    

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

   
    
    
    public float getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(float roomPrice) {
        this.roomPrice = roomPrice;
    }

    
    
    
    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getBookingDetailID() {
        return bookingDetailID;
    }

    public void setBookingDetailID(int bookingDetailID) {
        this.bookingDetailID = bookingDetailID;
    }

    public int getBookedQuanity() {
        return bookedQuanity;
    }

    public void setBookedQuanity(int bookedQuanity) {
        this.bookedQuanity = bookedQuanity;
    }

 
    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public float getAmount() {
        return amount;
    }
    
    
    
}
