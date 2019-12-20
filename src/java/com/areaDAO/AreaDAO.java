/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.areaDAO;

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
public class AreaDAO {

    public Map<Integer, String> getAreas() throws SQLException, NamingException {
        Map<Integer, String> areas = new HashMap<>();

        Connection c = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();
            String sql = "SELECT aID , aName "
                    + "FROM tbl_Area ";
            stm = c.createStatement();
            rs = stm.executeQuery(sql);

            while (rs.next()) {

                int aID = rs.getInt("aID");
                String aName = rs.getString("aName");

                areas.put(aID, aName);

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

        return areas;
    }
}
