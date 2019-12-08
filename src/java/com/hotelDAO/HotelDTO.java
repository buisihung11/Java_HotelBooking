/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelDAO;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class HotelDTO implements Serializable{
    private int id;
    private int areaID;
    private String hotelName;
    private String description;

    public HotelDTO() {
    }

    public HotelDTO(int hID, int hAreaID, String hName, String hDescription) {
        this.id = hID;
        this.areaID = hAreaID;
        this.hotelName = hName;
        this.description = hDescription;
    }

    @Override
    public String toString() {
        return "HotelDTO{" + "hID=" + id + ", hAreaID=" + areaID + ", hName=" + hotelName + ", hDescription=" + description + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAreaID() {
        return areaID;
    }

    public void setAreaID(int areaID) {
        this.areaID = areaID;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

 
   
    
    
    
}
