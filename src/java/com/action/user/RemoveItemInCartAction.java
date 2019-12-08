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
@Action("removeItemInCart")
@Results({
    @Result(name = "success", location = "userCart.jsp", type = "redirect")
    ,
    @Result(name = "fail", location = "userCart.jsp", type = "redirect",
            params = {
                "removeFailMsg", "Something wrong!"
            })
})
public class RemoveItemInCartAction {

    
    private int removeRoomID;
    
    public RemoveItemInCartAction() {
    }

    public String execute() throws Exception {
        boolean removeSuccess = false;

        Map session = ActionContext.getContext().getSession();
        BookingCart cart = (BookingCart) session.get("BOOKING_CART");

        if (cart != null && cart.getCartItems() != null) {
            //remove room
            
            cart.removeItem(removeRoomID);
            if(cart.isEmpty())
                cart = null;
            session.put("BOOKING_CART", cart);
            removeSuccess = true;
        }

        return removeSuccess ? "success" : "fail";
    }

    public int getRemoveRoomID() {
        return removeRoomID;
    }

    public void setRemoveRoomID(int removeRoomID) {
        this.removeRoomID = removeRoomID;
    }
    
    

}
