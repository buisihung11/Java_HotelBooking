/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.user;

import com.cart.BookingCart;
import com.discountDAO.DiscountDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/user")
@ResultPath(value = "/")
@Action("checkOutPage")
@Results({
    @Result(name = "success", location = "checkOutPage.jsp")
    ,
        @Result(name = "fail", location = "userCart.jsp")
})
public class CheckOutPageAction {

    private String discountCode;
    private String checkOutFailMsg;

    private static final DiscountDAO DISCOUNT_DAO = new DiscountDAO();

    public CheckOutPageAction() {
    }

    public String execute() throws Exception {

        Map session = ActionContext.getContext().getSession();
        BookingCart cart = (BookingCart) session.get("BOOKING_CART");
        boolean success = true;
        if (cart != null && !cart.isEmpty()) {

            if (discountCode != null && !discountCode.trim().isEmpty()) {
                //check valid discount
                float value = DISCOUNT_DAO.getDiscountValue(discountCode);

                if (value == DiscountDAO.NOT_VALID_DISCOUNT) {
                    checkOutFailMsg = "Not valid";
                    success = false;
                } else {
                    //set the discount Code and discount Value to cart
                    cart.setDiscountCode(discountCode);
                    cart.setDiscountValue(value);
                    //update cart on session
                    session.put("BOOKING_CART", cart);
                    success = true;
                }
            }

        } else {
            success = false;
        }

        return success ? "success" : "fail";
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public String getCheckOutFailMsg() {
        return checkOutFailMsg;
    }

    public void setCheckOutFailMsg(String checkOutFailMsg) {
        this.checkOutFailMsg = checkOutFailMsg;
    }

}
