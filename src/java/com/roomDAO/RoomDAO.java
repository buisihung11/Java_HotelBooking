/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roomDAO;

import java.sql.CallableStatement;
import java.sql.Connection;
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
public class RoomDAO {

    public boolean checkRoomAvailable(int roomID , String checkIn,String checkOut , int quantity) throws SQLException, NamingException{
        
        boolean result = false;
        
        Connection c = null;
        CallableStatement cStmt = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
        
            String sql = "{call CheckRoomAvailable(?, ?,?,?)}";

            cStmt = c.prepareCall(sql);
            cStmt.setString(1, checkIn);
            cStmt.setString(2, checkOut);
            cStmt.setInt(3, roomID);
            cStmt.setInt(4, quantity);
            
            rs = cStmt.executeQuery();
            
            
            if (rs.next()) {
                result = true;
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
        return result;
    }
    
    
    public List<RoomDTO> getAvailableRoomOfHotel(int hotelID, int amount, String checkInDate, String checkOutDate) throws SQLException, NamingException {
        List<RoomDTO> rooms = null;

        Connection c = null;
        CallableStatement cStmt = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
        
            String sql = "{call GetAvailableRoomOfHotel(?, ?,?,?)}";

            cStmt = c.prepareCall(sql);
            cStmt.setString(1, checkInDate);
            cStmt.setString(2, checkOutDate);
            cStmt.setInt(3, amount);
            cStmt.setInt(4, hotelID);
            
            
            
            rs = cStmt.executeQuery();
            
            
            while (rs.next()) {
                if (rooms == null) {
                    rooms = new ArrayList<>();
                }
                int rId = rs.getInt("rId");
                int rtID = rs.getInt("rtID");
                int rQuantity = rs.getInt("ROOM_QUANTITY_AVAILABLE");
                float rPrice = rs.getFloat("rPrice");

                RoomDTO room = new RoomDTO(rId, rQuantity, rtID, rPrice);

                rooms.add(room);
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

        return rooms;
    }
}
