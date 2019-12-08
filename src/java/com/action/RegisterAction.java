/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.userDAO.UserDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/")
@ResultPath(value = "/")
@Action("register")
@Results({
    @Result(name = "success", type = "redirect", location = "login.jsp" ,
            params = {
                "registerSuccessMsg" ,"Register successful, Please login to your account"
            })
    ,
    @Result(name = "fail", location = "register.jsp")
})
public class RegisterAction {

    private String fullName;
    private String phone;
    private String email;
    private String password;
    private String confirmPassword;
    private String address;

    private RegisterErr err;

    private static final UserDAO USER_DAO = new UserDAO();

    public RegisterAction() {
    }

    public String execute() throws Exception {

        boolean validInput = true;
        err = new RegisterErr();
        if (fullName == null || fullName.isEmpty()) {
            validInput = false;
            err.setFullNameErr("Please enter name");
        }
        if (phone == null || phone.isEmpty()) {
            validInput = false;
            err.setPhoneErr("Please enter phone number");
        }
        if (email == null || email.isEmpty()) {
            validInput = false;
            err.setEmailErr("Please enter email");
        }
        if (password == null || password.isEmpty()) {
            validInput = false;
            err.setPasswordErr("Please enter password");
        } else {
            if (confirmPassword == null || confirmPassword.isEmpty()) {
                validInput = false;
                err.setConfirmPasswordErr("Please enter confirm password");
            } else if (!confirmPassword.equals(password)) {
                validInput = false;
                err.setConfirmPasswordErr("Confirm password not matched");
            }
        }
        if (address == null || address.isEmpty()) {
            validInput = false;
            err.setAddressErr("Please enter address");
        }
        if (validInput) {
            //check duplicate 
            if (USER_DAO.isUserExisted(email)) {
                err.setDuplicateEmailErr("That userID was existed. Please choose another userID.");
                validInput = false;
            } else {
                //create user
                validInput = USER_DAO.createUser(email, password, fullName, address, phone);
            }
        }

        return validInput ? "success" : "fail";
    }

    public RegisterErr getErr() {
        return err;
    }

    public void setErr(RegisterErr err) {
        this.err = err;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
