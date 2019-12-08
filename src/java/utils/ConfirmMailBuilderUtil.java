/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author Admin
 */
public class ConfirmMailBuilderUtil {

    public static String confirmMailContent(String userName, float total, String bookingDate, String token, int bookingID,String hotelName) {
        String header = "Hello " + userName + ", this mail was sented to you for final step in order to confirm your booking.\n";
        String body = "Your booking in "+ hotelName + " created at " + bookingDate + ".\n";
        body += "Total Price:  " + total + "\n";
        String confirmLink = "http://localhost:8084/HotelBooking/confirmBooking?bookingID=" + bookingID + "&token=" + token + "\n";
        String footer = "Thanks you for using our service.";

        String confirmContent = header + body + confirmLink + footer;
        return confirmContent;

    }
}
