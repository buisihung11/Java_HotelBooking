/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roomTypeDAO;

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
public class RoomTypeDAO {
    public Map<Integer,String> getRoomTypes() throws SQLException, NamingException{
        Map<Integer,String> roomTypes = null;
        
        Connection c = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "select rtID,rtName"
                    + " from  tbl_RoomType";

            stm = c.createStatement();
            rs = stm.executeQuery(sql);
            
            while (rs.next()) {
                if( roomTypes == null)
                    roomTypes = new HashMap<>();
                
                int rtID = rs.getInt("rtID");
                String rtName = rs.getString("rtName");
                
                roomTypes.put(rtID, rtName);
                
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
        
        return  roomTypes;
    }
}
