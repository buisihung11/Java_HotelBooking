/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelDAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class HotelDAO {

    
    public List<HotelDTO> getAvailableHotel(String checkinDate, String checkoutDate, int amount, String hotelName, int areaID) throws SQLException, NamingException {
        List<HotelDTO> results = null;
        Connection c = null;
        CallableStatement cStmt = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "{call GetAvailableHotelInDate(?, ?,?,?,?)}";

            cStmt = c.prepareCall(sql);
            cStmt.setString(1, checkinDate);
            cStmt.setString(2, checkoutDate);
            cStmt.setInt(3, amount);
            cStmt.setString(4, hotelName);
            if (areaID == -1) {
                cStmt.setString(5, "%%");//get all area
            } else {
                cStmt.setString(5, Integer.toString(areaID));
            }

            rs = cStmt.executeQuery();

            while (rs.next()) {
                if (results == null) {
                    results = new ArrayList<>();
                }

                int hID = rs.getInt("hID");

                int hAreaID = rs.getInt("hAreaID");
                String hName = rs.getString("hName");
                String hDescription = rs.getString("hDescription");

                HotelDTO hotel = new HotelDTO(hID, hAreaID, hName, hDescription);
                results.add(hotel);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cStmt != null) {
                cStmt.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return results;
    }

    public HotelDTO getHotelById(int hotelID) throws NamingException, SQLException {

        HotelDTO result = null;
        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "  select hID, hName, hAreaID , hDescription "
                    + " from tbl_Hotel"
                    + " where  hID = ?";

            stm = c.prepareCall(sql);
            stm.setInt(1, hotelID);
            rs = stm.executeQuery();
            if (rs.next()) {

                int hID = rs.getInt("hID");
                int hAreaID = rs.getInt("hAreaID");
                String hName = rs.getString("hName");
                String hDescription = rs.getString("hDescription");

                result = new HotelDTO(hID, hAreaID, hName, hDescription);

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return result;
    }

    
 
}
