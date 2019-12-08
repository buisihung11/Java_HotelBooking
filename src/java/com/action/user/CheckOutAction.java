/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.bookingDAO.BookingDAO;
import com.cart.BookingCart;
import com.cart.RoomCartItem;
import com.opensymphony.xwork2.ActionContext;
import com.roomDAO.RoomDAO;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import utils.ConfirmMailBuilderUtil;
import utils.GenerateRandomStringUtil;
import utils.SendMailByGmailProviderUtil;

@Namespace("/user")
@ResultPath(value = "/")
@Action("checkout")
@Results({
    @Result(name = "success", location = "../home.jsp",
            type = "redirect",
            params = {
                //                "namespace", "/",
                "checkOutSuccessMsg", "Check out success, Please your mail to confirm booking"
            })
    ,
        @Result(name = "fail", location = "checkOutPage.jsp",
            params = {
                "checkOutFailMsg", "Check out fail"
            })
})
public class CheckOutAction {

    private static final RoomDAO ROOM_DAO = new RoomDAO();
    private static final BookingDAO BOOKING_DAO = new BookingDAO();

    private String fullName;
    private String phone;
    private String email;

    private List<Integer> lackOfRoomsId;

    public CheckOutAction() {
        lackOfRoomsId = new ArrayList<>();
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        BookingCart cart = (BookingCart) session.get("BOOKING_CART");
        boolean success = false;
        if (cart != null && !cart.isEmpty()) {
            //1. Check rooms available
            for (Map.Entry<Integer, RoomCartItem> entry : cart.cartItems.entrySet()) {
                int roomId = entry.getKey();
                RoomCartItem room = entry.getValue();

                if (!ROOM_DAO.checkRoomAvailable(roomId, cart.getCheckInDate(), cart.getCheckOutDate(),
                        room.getBookingQuantity())) {
                    lackOfRoomsId.add(roomId);
                }

            }

            if (!lackOfRoomsId.isEmpty()) {
                success = false;
            } else {

                //2. Create order
                cart.setCustomerEmail(email);
                cart.setCustomerFullName(fullName);
                cart.setCustomerPhone(phone);

                HttpServletRequest req = ServletActionContext.getRequest();
                HttpSession sessionSevlet = req.getSession();
                String userID = (String) sessionSevlet.getAttribute("USER_ID");
                cart.setUserID(userID);

                //2.1 Create confirm token 
                String confirmToken = GenerateRandomStringUtil.generateRandomString();

                try {
                    //create booking and get the bookingID
                    int bookingID = BOOKING_DAO.createBooking(cart, confirmToken);
//                    sendBookingConfirmMailWithMailtrapProvider(email, confirmToken);
                    if (bookingID != 0) {
                        //3. Send mail confirm 
                        String mailMsg = ConfirmMailBuilderUtil.confirmMailContent(fullName, cart.getTotal(), new Date().toLocaleString(), confirmToken, bookingID, cart.getHotelName());
                        System.out.println("[MAIL_MSG: ]" + mailMsg);
                        SendMailByGmailProviderUtil.sendTextMailTo(email, mailMsg, "Confirm Booking");
                        //4. remove cart on session 
                        session.remove("BOOKING_CART");
                        success = true;
                    }
                } catch (MessagingException ex) {
                    ServletActionContext.getServletContext().log("CheckOutAction _ MessagingException " + ex.getMessage());
                }

            }
        }
        return success ? "success" : "fail";
    }

 


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Integer> getLackOfRoomsId() {
        return lackOfRoomsId;
    }

    public void setLackOfRoomsId(List<Integer> lackOfRoomsId) {
        this.lackOfRoomsId = lackOfRoomsId;
    }

}
