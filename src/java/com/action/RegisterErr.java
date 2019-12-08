/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RegisterErr implements Serializable {

    String fullNameErr;
    String phoneErr;
    String emailErr;
    String duplicateEmailErr;
    String passwordErr;
    String confirmPasswordErr;
    String addressErr;

    public RegisterErr() {
    }

    public RegisterErr(String fullNameErr, String phoneErr, String emailErr, String passwordErr, String confirmPasswordErr, String addressErr) {
        this.fullNameErr = fullNameErr;
        this.phoneErr = phoneErr;
        this.emailErr = emailErr;
        this.passwordErr = passwordErr;
        this.confirmPasswordErr = confirmPasswordErr;
        this.addressErr = addressErr;
    }

    public String getFullNameErr() {
        return fullNameErr;
    }

    public void setFullNameErr(String fullNameErr) {
        this.fullNameErr = fullNameErr;
    }

    public String getPhoneErr() {
        return phoneErr;
    }

    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

    public String getEmailErr() {
        return emailErr;
    }

    public void setEmailErr(String emailErr) {
        this.emailErr = emailErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getConfirmPasswordErr() {
        return confirmPasswordErr;
    }

    public void setConfirmPasswordErr(String confirmPasswordErr) {
        this.confirmPasswordErr = confirmPasswordErr;
    }

    public String getAddressErr() {
        return addressErr;
    }

    public void setAddressErr(String addressErr) {
        this.addressErr = addressErr;
    }

    public String getDuplicateEmailErr() {
        return duplicateEmailErr;
    }

    public void setDuplicateEmailErr(String duplicateEmailErr) {
        this.duplicateEmailErr = duplicateEmailErr;
    }

    
    
}
