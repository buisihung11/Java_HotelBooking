/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.hotelDAO.HotelDAO;
import com.hotelDAO.HotelDTO;
import com.roomDAO.RoomDAO;
import com.roomDAO.RoomDTO;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

@Namespace("/")
@ResultPath(value = "/")
public class DetailPageAction {

    private int hotelID;
    
    private String checkinDate;
    private String checkoutDate;
    private int amountRoom;
    
    private HotelDTO hotel;
    private List<RoomDTO> hotelRooms;

    private static final HotelDAO HOTEL_DAO = new HotelDAO();
    private static final RoomDAO ROOM_DAO = new RoomDAO();

    //FOR CART ACTION MSG
    private String successMsg;
    private String failMsg;

    public DetailPageAction() {
    }

    @Action(value = "detailPage", results = {
        @Result(name = "success", location = "hotelDetail.jsp")
    })
    public String execute() throws Exception {
        hotel = HOTEL_DAO.getHotelById(hotelID);
        hotelRooms = ROOM_DAO.getAvailableRoomOfHotel(hotelID, amountRoom, checkinDate, checkoutDate);
        return "success";

    }

    public String getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(String checkinDate) {
        this.checkinDate = checkinDate;
    }

    public String getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(String checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public int getAmountRoom() {
        return amountRoom;
    }

    public void setAmountRoom(int amountRoom) {
        this.amountRoom = amountRoom;
    }

    
    
    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public HotelDTO getHotel() {
        return hotel;
    }

    public void setHotel(HotelDTO hotel) {
        this.hotel = hotel;
    }

    public List<RoomDTO> getHotelRooms() {
        return hotelRooms;
    }

    public void setHotelRooms(List<RoomDTO> hotelRooms) {
        this.hotelRooms = hotelRooms;
    }

    public String getSuccessMsg() {
        return successMsg;
    }

    public void setSuccessMsg(String successMsg) {
        this.successMsg = successMsg;
    }

    public String getFailMsg() {
        return failMsg;
    }

    public void setFailMsg(String failMsg) {
        this.failMsg = failMsg;
    }


    
    
}
