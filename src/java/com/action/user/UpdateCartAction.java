/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.cart.BookingCart;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@ResultPath(value = "/")
@Action("updateItemInCart")
@Results({
    @Result(name = "success" , location = "userCart.jsp", type = "redirect"),
    @Result(name = "fail" , location = "userCart.jsp", type = "redirect" , 
            params = {
                "updateFailMsg" , "Something wrong!"
            })
})
public class UpdateCartAction {

    //FOR UPDATE

    private int updateQuantity;
    private int updateRoomId;


    public UpdateCartAction() {
    }

    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        boolean updateSuccess = true;
        BookingCart cart = (BookingCart) session.get("BOOKING_CART");

        if (cart != null) {
            //Check quantity
            if (cart.getCartItems() == null || cart.getCartItems().get(updateRoomId) == null 
                     || updateQuantity > cart.getCartItems().get(updateRoomId).getMaxQuantity() ) {
                updateSuccess = false;
            } else {
                //update room
                cart.updateItem(updateQuantity, updateRoomId);
                session.put("BOOKING_CART", cart);
            }
        }

        return updateSuccess ? "success" : "fail";
    }



    public int getUpdateQuantity() {
        return updateQuantity;
    }

    public void setUpdateQuantity(int updateQuantity) {
        this.updateQuantity = updateQuantity;
    }

    public int getUpdateRoomId() {
        return updateRoomId;
    }

    public void setUpdateRoomId(int updateRoomId) {
        this.updateRoomId = updateRoomId;
    }


    
    
}
