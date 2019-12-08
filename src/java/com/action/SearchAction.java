/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.hotelDAO.HotelDAO;
import com.hotelDAO.HotelDTO;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Results;

@ResultPath(value = "/")
@Results({
    @Result(name = "success", location = "home.jsp")
})
public class SearchAction {

    private static final HotelDAO HOTEL_DAO = new HotelDAO();

    private String hotelName;
    private String checkinDate;
    private String checkoutDate;
    private int areaID;
//    private String areaIDStr;
    private int amountRoom;

    private List<HotelDTO> searchResults;

    public SearchAction() {
    }

    @Action("searchRoomAvailable")
    public String searchAvailableHotel() throws Exception {
        //Save the current checkIn and checkOut to session 
        //so that user dont have to enter again when turn back to search page again
        
         Map session = ActionContext.getContext().getSession();
         
         session.put("CHECK_IN_DATE",checkinDate);
         session.put("CHECK_OUT_DATE",checkoutDate);
         
        this.searchResults = HOTEL_DAO.getAvailableHotel(checkinDate, checkoutDate, amountRoom, hotelName, areaID);
        return "success";
    }


    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
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

    public int getAreaID() {
        return areaID;
    }

    public void setAreaID(int areaID) {
        this.areaID = areaID;
    }

    public int getAmountRoom() {
        return amountRoom;
    }

    public void setAmountRoom(int amountRoom) {
        this.amountRoom = amountRoom;
    }

    public List<HotelDTO> getSearchResults() {
        return searchResults;
    }

    public void setSearchResults(List<HotelDTO> searchResults) {
        this.searchResults = searchResults;
    }


    
    
}
