/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.cart.BookingCart;
import com.cart.RoomCartItem;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@ResultPath(value = "/")
@Action("addToCart")
@Results({
    @Result(name = "success",
            type = "redirectAction",
            params = {
                "namespace", "/",
                "actionName", "detailPage",
                "hotelID", "${hotelID}",
                "checkinDate", "${checkinDate}",
                "checkoutDate", "${checkoutDate}",
                "amountRoom", "${amountRoom}",
                "successMsg", "Add successfully"
            })
    ,
        @Result(name = "fail",
            type = "redirectAction",
            params = {
                "namespace", "/",
                "actionName", "detailPage",
                "hotelID", "${hotelID}",
                "checkinDate", "${checkinDate}",
                "checkoutDate", "${checkoutDate}",
                "amountRoom", "${amountRoom}",
                "failMsg", "Not enough room!"
            })
})
public class AddToCartAction {

    private int maxQuantity;
    private int bookingQuantity;
    private int roomID;
    private int dateDifference;
    private float price;
    private int roomTypeID;

    //USE TO REDIRECT TO DETAILPAGE ACTION
    private int hotelID;
    private int amountRoom;
    private String checkinDate;

    private String checkoutDate;
    private String hotelName;

    public AddToCartAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        boolean addSuccess = true;
        BookingCart cart = (BookingCart) session.get("BOOKING_CART");
        //Neu nhu hotelId khac voi trong cart da co
        //DA CONFIRM O CLIENT
        //THUC HIEN NEW CART
        if (maxQuantity < bookingQuantity) {
            addSuccess = false;
        } else if (cart == null || cart.getHotelID() != hotelID) {
            cart = new BookingCart();
            
            //set up cart 
            cart.setUpCart(hotelID, null, dateDifference, checkinDate, checkoutDate, hotelName);
            //them room
            RoomCartItem room = new RoomCartItem(roomID, roomTypeID, maxQuantity, bookingQuantity, price);
            cart.addItem(room);

            session.put("BOOKING_CART", cart);

        } else {

            //Neu nhu hotelID trung ma checkincheckout khac date
            //XU LY O CLIENT [TODO]
            //O DAY MAC DINH SE GHI DE
            //update checkin checkout dateDiffer
            cart.updateCartInfo(checkinDate, checkoutDate, dateDifference);

            //Check quantity
            if (cart.checkMaxQuantity(roomID, bookingQuantity) ) {
                addSuccess = false;
            } else {
                //them room
                RoomCartItem room = new RoomCartItem(roomID, roomTypeID, maxQuantity, bookingQuantity, price);
                cart.addItem(room);
                session.put("BOOKING_CART", cart);
            }

        }

        return addSuccess ? "success" : "fail";
    }

    public int getAmountRoom() {
        return amountRoom;
    }

    public void setAmountRoom(int amountRoom) {
        this.amountRoom = amountRoom;
    }

    public int getBookingQuantity() {
        return bookingQuantity;
    }

    public void setBookingQuantity(int bookingQuantity) {
        this.bookingQuantity = bookingQuantity;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(String checkinDate) {
        this.checkinDate = checkinDate;
    }

    public String getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(String checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public int getDateDifference() {
        return dateDifference;
    }

    public void setDateDifference(int dateDifference) {
        this.dateDifference = dateDifference;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public int getMaxQuantity() {
        return maxQuantity;
    }

    public void setMaxQuantity(int maxQuantity) {
        this.maxQuantity = maxQuantity;
    }

}
