/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.discountDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.DBUtils;


public class DiscountDAO {
    
    public static float NOT_VALID_DISCOUNT  = -1 ;
    
    public float getDiscountValue(String discountCode) throws NamingException, SQLException{
        float value = NOT_VALID_DISCOUNT;
        
        Connection c = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "select dValue"
                    + " from  tbl_Discount"
                    + " where dCode = ? and dExpireDate > ?";
            
            ptm = c.prepareCall(sql);
            ptm.setString(1, discountCode);
            java.util.Date currentDate = new java.util.Date();
            ptm.setDate(2, new Date(currentDate.getTime()));
            
            rs = ptm.executeQuery();
            
            if(rs.next()){
                value = rs.getFloat("dValue");
            }
            
            
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (c != null) {
                c.close();
            }
        }
        
        return value;
    }
}
