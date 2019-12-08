/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roomDAO;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RoomDTO implements Serializable{
    private int id;
    private int availableQuantity;
//    private int hotelID;
    private int roomTypeID;
//    private String roomDescription;
    private float price;

    public RoomDTO() {
    }

    public RoomDTO(int id, int quantity, int roomTypeID, float price) {
        this.id = id;
        this.availableQuantity = quantity;
        this.roomTypeID = roomTypeID;
        this.price = price;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return availableQuantity;
    }

    public void setQuantity(int quantity) {
        this.availableQuantity = quantity;
    }



    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }


    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    
    
    
    
    
}
