/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingDAO;

import com.cart.BookingCart;
import com.cart.RoomCartItem;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BookingDAO {

    public static final int BOOKING_INACTIVE = 1;
    public static final int BOOKING_ACTIVE = 2;
    public static final int BOOKING_NOT_CONFIRMED = 3;

    public int createBooking(BookingCart cart, String confirmToken) throws NamingException, NamingException, SQLException {
        int bookingID = 0;
        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
//        boolean success = false;
        try {
            c = DBUtils.makeConnection();
            c.setAutoCommit(false);

            //1. Insert into Booking firstly
            String orderSql = "INSERT INTO tbl_Booking "
                    + "( bCheckin , bCheckout ,bStatusID , bBookingDate , bUserID ,bConfirmToken "
                    + ", bTotal , bDiscountCode ,bCustomerPhone ,  bCustomerFullName , bCustomerEmail , bHotelId ) "
                    + " VALUES (?,?,?,?,?,? , ?, ?,?,?,?,?)";

            stm = c.prepareStatement(orderSql);

            java.util.Date currentDate = new java.util.Date();
            stm.setString(1, cart.getCheckInDate());
            stm.setString(2, cart.getCheckOutDate());
            stm.setInt(3, BOOKING_NOT_CONFIRMED);
            stm.setDate(4, new Date(currentDate.getTime()));
            stm.setString(5, cart.getUserID());
            stm.setString(6, confirmToken);
            stm.setFloat(7, cart.getTotal());
            stm.setString(8, cart.getDiscountCode());
            stm.setString(9, cart.getCustomerPhone());
            stm.setString(10, cart.getCustomerFullName());
            stm.setString(11, cart.getCustomerEmail());
            stm.setInt(12, cart.getHotelID());

            stm.executeUpdate();

            //2. Get the last orderID
            String getOrderIDSql = "Select Max( bID )  as bookingID"
                    + " from tbl_Booking ";

//            Integer bookingID = null;
            stm = c.prepareCall(getOrderIDSql);

            rs = stm.executeQuery();

            if (rs.next()) {
                bookingID = rs.getInt("bookingID");
            }
            if(bookingID == 0)
                return bookingID; //error when create booking record
            //3.Insert to BookingDetail
            String orderDetailSql = "  INSERT INTO tbl_BookingDetail "
                    + " ( bdBookingID , bdRoomID , bdAmount, bdBookedQuantity ) "
                    + "VALUES (?,?,?,?)";

            stm = c.prepareStatement(orderDetailSql);
            for (Map.Entry<Integer, RoomCartItem> item : cart.cartItems.entrySet()) {

                int roomID = item.getKey();
                RoomCartItem room = item.getValue();

                stm.setInt(1, bookingID);
                stm.setInt(2, roomID);
                stm.setFloat(3, room.getAmount());
                stm.setInt(4, room.getBookingQuantity());

                stm.addBatch();
            }
            stm.executeBatch();

//            success = true;
            c.commit();
        } catch (SQLException ex) {
            if (c != null) {
                c.rollback();
            }
            bookingID = 0;
//            ex.printStackTrace();
            throw ex;
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
        return bookingID;
    }

    public List<BookingDTO> getBookingsHistoryOfUser(String userID, String hotelNameSearch, String bookingDate) throws NamingException, SQLException {
        List<BookingDTO> bookings = null;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String orderSql = "Select b.bID , b.bBookingDate , b.bCheckin,b.bCheckout,b.bCustomerEmail , b.bCustomerFullName , b.bCustomerPhone , b.bStatusID ,b.bTotal, h.hName , h.hAreaID "
                    + " from tbl_Booking as b inner join tbl_Hotel as h on b.bHotelID = h.hID "
                    + " where b.bUserID = ? and hName like ? and bBookingDate like ?"
                    + " order by b.bID desc , b.bStatusID  desc";
            stm = c.prepareStatement(orderSql);

            stm.setString(1, userID);
            stm.setString(2, "%" + hotelNameSearch + "%");
            stm.setString(3, "%" + bookingDate + "%");

            rs = stm.executeQuery();

            while (rs.next()) {

                if (bookings == null) {
                    bookings = new ArrayList<>();
                }

                int bookingID = rs.getInt("bID");
                int bookingStatus = rs.getInt("bStatusID");
                String checkInDate = rs.getString("bCheckin");
                String checkOutDate = rs.getString("bCheckout");
                bookingDate = rs.getString("bBookingDate");
                String customerEmail = rs.getString("bCustomerEmail");
                String customerPhone = rs.getString("bCustomerPhone");
                String customerFullName = rs.getString("bCustomerPhone");
                String hotelName = rs.getString("hName");
                int hotelAreaID = rs.getInt("hAreaID");

                float total = rs.getFloat("bTotal");

                BookingDTO booking = new BookingDTO(bookingID, bookingStatus, checkInDate, checkOutDate, bookingDate, userID, customerEmail, customerPhone, customerFullName, total, hotelName, hotelAreaID);
                bookings.add(booking);

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

        return bookings;
    }

    public boolean cancelBooking(int bookingID) throws SQLException, NamingException {

        boolean cancelSuccess = false;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String cancelSql = "UPDATE tbl_Booking SET bStatusID = ?"
                    + " WHERE  bID = ? ";
            stm = c.prepareStatement(cancelSql);

            stm.setInt(1, BOOKING_INACTIVE);
            stm.setInt(2, bookingID);
            
            cancelSuccess = stm.executeUpdate() > 0;

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
        return cancelSuccess;
    }

    public int getBookingStatus(int bookingID) throws SQLException, NamingException {

        int bookingStatus = 0;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String orderSql = "Select  b.bStatusID  "
                    + " from tbl_Booking as b "
                    + " where b.bID = ? ";
            stm = c.prepareStatement(orderSql);

            stm.setInt(1, bookingID);

            rs = stm.executeQuery();

            if (rs.next()) {

                bookingStatus = rs.getInt("bStatusID");

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

        return bookingStatus;
    }

    public boolean confirmBooking(int bookingID, String confirmToken ) throws SQLException, NamingException{
        boolean confirmSuccess = false;

        Connection c = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            c = DBUtils.makeConnection();

            //1. Insert into Booking firstly
            String updateStatus = "UPDATE tbl_Booking SET bStatusID = ? , bConfirmToken = null"
                    + " WHERE  bID = ? and bStatusID = ? and bConfirmToken = ?";
            stm = c.prepareStatement(updateStatus);

            stm.setInt(1, BOOKING_ACTIVE);
            stm.setInt(2, bookingID);
            stm.setInt(3, BOOKING_NOT_CONFIRMED);
            stm.setString(4, confirmToken);
            
            confirmSuccess = stm.executeUpdate() > 0;

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
        return confirmSuccess;
    }
    
}
