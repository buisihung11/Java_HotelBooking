/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart;

/**
 *
 * @author Admin
 */
public class RoomCartItem {
    private int id;
    private int roomTypeID;
    private int maxQuantity;
    private int bookingQuantity;
    private float amount;
    private float price;

    public RoomCartItem(int id, int roomTypeID, int maxQuantity, int bookingQuantity, float price) {
        this.id = id;
        this.roomTypeID = roomTypeID;
        this.maxQuantity = maxQuantity;
        this.bookingQuantity = bookingQuantity;
        this.price = price;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
    
    public float getAmount() {
        amount =  price* bookingQuantity;
        return amount;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public int getMaxQuantity() {
        return maxQuantity;
    }

    public void setMaxQuantity(int maxQuantity) {
        this.maxQuantity = maxQuantity;
    }

    public int getBookingQuantity() {
        return bookingQuantity;
    }

    public void setBookingQuantity(int bookingQuantity) {
        this.bookingQuantity = bookingQuantity;
    }


    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

        
    
    
    public RoomCartItem() {
    }

    
    
    
}
