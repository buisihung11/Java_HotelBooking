/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingStatusDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BookingStatusDAO {
     public Map<Integer,String> getBookingStatus() throws SQLException, NamingException{
        Map<Integer,String> bookingStatus = null;
        
        Connection c = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "select bsID,bsName "
                    + " from  tbl_BookingStatus ";

            stm = c.createStatement();
            rs = stm.executeQuery(sql);
            
            while (rs.next()) {
                if( bookingStatus == null)
                    bookingStatus = new HashMap<>();
                
                int bsID = rs.getInt("bsID");
                String bsName = rs.getString("bsName");
                
                bookingStatus.put(bsID, bsName);
                
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
        
        return  bookingStatus;
    }
}
