/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingDetailDAO;

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
public class BookingDetailDAO {

    public List<BookingDetailDTO> getBookingDetailsOfBooking(int bookingID) throws NamingException, SQLException {
        List<BookingDetailDTO> bookingDetails = null;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String orderSql = "select r.rID , r.rtID , r.rPrice , bd.bdID , bd.bdBookedQuantity , bd.bdAmount , bd.bdFeedback "
                    + " from tbl_BookingDetail as bd inner join tbl_Room as r on bd.bdRoomID = r.rID "
                    + " where bd.bdBookingID = ?";
            stm = c.prepareStatement(orderSql);

            stm.setInt(1, bookingID);
            rs = stm.executeQuery();
            while (rs.next()) {

                if (bookingDetails == null) {
                    bookingDetails = new ArrayList<>();
                }

                int roomID = rs.getInt("rID");
                int bookingDetailID = rs.getInt("bdID");
                int bookedQuanity = rs.getInt("bdBookedQuantity");
                float amount = rs.getInt("bdAmount");
                int roomTypeID = rs.getInt("rtID");
                float roomPrice = rs.getFloat("rPrice");
                String bdFeedback = rs.getString("bdFeedback");
                BookingDetailDTO bookingDetail = new BookingDetailDTO(roomID, bookingDetailID, bookedQuanity, amount, bdFeedback, roomTypeID, roomPrice);
                bookingDetails.add(bookingDetail);

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

        return bookingDetails;
    }

    public boolean addFeedBack(int bookingDetailID, String feedBack) throws SQLException, NamingException {
        boolean addSuccess = false;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String addFeedbackSql = "update tbl_BookingDetail set bdFeedback = ? "
                    + " where bdID = ? and bdFeedback is null ";
            stm = c.prepareStatement(addFeedbackSql);

            stm.setString(1, feedBack);
            stm.setInt(2, bookingDetailID);
//            stm.setNull(3, java.sql.Types.NVARCHAR);
//            stm.setString(3, null);

            addSuccess = stm.executeUpdate() > 0;

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
        return addSuccess;
    }

}
