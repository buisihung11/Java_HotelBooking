/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.admin;

import com.hotelDAO.HotelDAO;
import com.hotelDAO.HotelDTO;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/admin")
@ResultPath(value = "/")
@Action("getFeedbackHotel")
@Results({
    @Result(name = "success", location = "feedbackedHotel.jsp"   )
})
public class GetFeedbackedHotelAction {
    private static final HotelDAO HOTEL_DAO = new HotelDAO();
    private List<HotelDTO> searchResults;
    
    public GetFeedbackedHotelAction() {
    }
    
    public String execute() throws Exception {
        
        this.searchResults = HOTEL_DAO.getHotelHasFeedback();
        return "success";
        
    }

    public List<HotelDTO> getSearchResults() {
        return searchResults;
    }

    public void setSearchResults(List<HotelDTO> searchResults) {
        this.searchResults = searchResults;
    }
    
    
    
}
