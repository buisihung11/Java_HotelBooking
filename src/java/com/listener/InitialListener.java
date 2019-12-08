/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.listener;

import com.areaDAO.AreaDAO;
import com.bookingStatusDAO.BookingStatusDAO;
import com.roomTypeDAO.RoomTypeDAO;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Web application lifecycle listener.
 *
 * @author Admin
 */
@WebListener()
public class InitialListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        System.out.println("[LISTENER]");
        ServletContext ctx = sce.getServletContext();
        Map<Integer, String> areas = null;
        Map<Integer, String> roomTypes = null;
        Map<Integer, String> bookingStatus = null;

        AreaDAO dao = new AreaDAO();
        RoomTypeDAO rtDAO = new RoomTypeDAO();
        BookingStatusDAO bsDAO = new BookingStatusDAO();
        try {
            areas = dao.getAreas();
            ctx.setAttribute("AREAS", areas);
            roomTypes = rtDAO.getRoomTypes();
            ctx.setAttribute("ROOMTYPES", roomTypes);
            bookingStatus = bsDAO.getBookingStatus();
            ctx.setAttribute("BOOKING_STATUS", bookingStatus);
            
//            System.out.println("[ROOMTYPES]" + roomTypes);
        } catch (NamingException ex) {
            sce.getServletContext().log("InitialationLister-NamingException: " + ex.getMessage());
//            Logger.getLogger(InitialListener.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            sce.getServletContext().log("InitialationLister-SQLException: " + ex.getMessage());
//            Logger.getLogger(InitialListener.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        ctx.removeAttribute("AREAS");
        ctx.removeAttribute("ROOMTYPES");
        ctx.removeAttribute("BOOKING_STATUS");
    }
}
