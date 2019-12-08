/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.userDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public boolean isUserExisted(String userID) throws NamingException, SQLException {
        boolean existed = false;

        Connection c = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();

            String sql = "SELECT  UserID"
                    + " FROM tbl_User "
                    + " WHERE UserID = ? and isActive = ?";

            ptm = c.prepareCall(sql);
            ptm.setString(1, userID);
            ptm.setBoolean(2, true);

            rs = ptm.executeQuery();
            if (rs.next()) {
                existed = true;
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

        return existed;
    }

    public UserDTO getUser(String userID, String password) throws NamingException, SQLException {

        UserDTO user = null;

        Connection c = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();

            String sql = "SELECT uFullName , uAddress , uPhone ,uIsAdmin ,uCreatedDate "
                    + " FROM tbl_User "
                    + " WHERE UserID = ? and uPassword = ? and isActive = ?";

            ptm = c.prepareCall(sql);

            ptm.setString(1, userID);
            ptm.setString(2, password);
            ptm.setBoolean(3, true);

            rs = ptm.executeQuery();
            if (rs.next()) {
//                String userID = rs.getString("");
//                String password= rs.getString("");
                String fullName = rs.getString("uFullName");
                String address = rs.getString("uAddress");
                String phone = rs.getString("uPhone");
                String createdDate = rs.getString("uCreatedDate");
                boolean isAdmin = rs.getBoolean("uIsAdmin");

                user = new UserDTO(userID, password, fullName, address, phone, createdDate, isAdmin);

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

        return user;

    }

    public boolean createUser(String userID, String password, String fullName, String address, String phone) throws NamingException, SQLException {
        boolean success = false;
        Connection c = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            c = DBUtils.makeConnection();

            String sql = "INSERT INTO tbl_User ( UserID , uPassword , uFullName , uAddress , uPhone ,uIsAdmin ,uCreatedDate ,isActive )"
                    + " VALUES (?,?,?,?,?,?,?,?)";

            ptm = c.prepareCall(sql);

            ptm.setString(1, userID);
            ptm.setString(2, password);
            ptm.setString(3, fullName);
            ptm.setString(4, address);
            ptm.setString(5, phone);
            ptm.setBoolean(6, false);

            java.util.Date currentDate = new java.util.Date();
            ptm.setDate(7, new Date(currentDate.getTime()));
            ptm.setBoolean(8, true);

            success = ptm.executeUpdate() > 0;

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

        return success;

    }

}
