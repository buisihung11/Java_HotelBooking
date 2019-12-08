/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.userDAO;

/**
 *
 * @author Admin
 */
public class UserDTO {
    private String userID;
    private String password;
    private String fullName;
    private String address;
    private String phone;
    private String createdDate; // set on server
    private boolean isAdmin;

    public UserDTO() {
    }

    public UserDTO(String userID, String password, String fullName, String address, String phone, String createdDate, boolean isAdmin) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.createdDate = createdDate;
        this.isAdmin = isAdmin;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
    
}
