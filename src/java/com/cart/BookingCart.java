/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cart;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class BookingCart {
    
    private int hotelID;
    private String userID;
    private String hotelName;
    private String checkInDate;
    private String checkOutDate;
    private int dateDifference; // number of days between two dates
//    private int status;
    private String bookingDate; // current date of req, set when checkout
    private String discountCode;

    private float discountValue; 
    private float total; // not have set method

    private String customerPhone;
    private String customerFullName;
    private String customerEmail;
    
    
    public Map<Integer, RoomCartItem> cartItems;

    public BookingCart() {
        discountValue = 0;
    }

    public boolean isEmpty() {
        return cartItems == null || cartItems.isEmpty();
    }

    public void updateItem(int updateQuantity, int updateRoomId) {
        if (cartItems != null && cartItems.containsKey(updateRoomId)) {

            RoomCartItem updateRoom = cartItems.get(updateRoomId);
            updateRoom.setBookingQuantity(updateQuantity);

            cartItems.replace(updateRoomId, updateRoom);

        }

    }

    public void setUpCart(int hotelID, String userID, int dateDifference,
            String checkInDate, String checkOutDate, String hotelName) {
        this.hotelID = hotelID;
        this.userID = userID;
        this.dateDifference = dateDifference;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.hotelName = hotelName;
    }

    public float getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(float discountValue) {
        this.discountValue = discountValue;
    }

    
    
    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public void addItem(RoomCartItem room) {
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        RoomCartItem existedRoom = cartItems.get(room.getId());
        if (existedRoom == null) {

            cartItems.put(room.getId(), room);
        } else {
            existedRoom.setBookingQuantity(existedRoom.getBookingQuantity() + room.getBookingQuantity());
            cartItems.replace(existedRoom.getId(), existedRoom);
        }

    }

    public void removeItem(int removeRoomID) {
        if (cartItems != null && cartItems.containsKey(removeRoomID)) {

            cartItems.remove(removeRoomID);

        }
    }

    public boolean checkMaxQuantity(int roomId, int addedQuantity) {
        if (cartItems.get(roomId) == null || cartItems == null) {
            return false;
        }
        return cartItems.get(roomId).getBookingQuantity() + addedQuantity > cartItems.get(roomId).getMaxQuantity();
    }

    public Map<Integer, RoomCartItem> getCartItems() {
        return cartItems;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public int getDateDifference() {
        return dateDifference;
    }

    public void setDateDifference(int dateDifference) {
        this.dateDifference = dateDifference;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    
    
    public float getSubTotal() {

        //loop amount of each item and get total
        float subTotal = 0;
        for (Map.Entry<Integer, RoomCartItem> entry : cartItems.entrySet()) {
            subTotal += entry.getValue().getAmount();
        }
        
        subTotal = subTotal * dateDifference ;
        
        return subTotal;
    }
    
    public float getTotal() {

        //loop amount of each item and get total
        total = 0;
        cartItems.entrySet().forEach((entry) -> {
            total += entry.getValue().getAmount();
        });
        
        total = total * dateDifference * (1 - discountValue);
        
        return total;
    }


    public void updateCartInfo(String checkinDate, String checkoutDate, int dateDifference) {

        this.checkInDate = checkinDate;
        this.checkOutDate = checkoutDate;
        this.dateDifference = dateDifference;
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

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    
    
    
}
