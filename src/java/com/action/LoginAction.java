/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.userDAO.UserDAO;
import com.userDAO.UserDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

@Namespace("/")
@ResultPath(value = "/")
@Action("login")
@Results({
    @Result(name = "success",type="redirect", location = "home.jsp"),
    @Result(name = "fail", location = "login.jsp")
})
public class LoginAction {
    
    private String userID;
    private String password;
    private String loginFailMsg;
    
    private static final UserDAO USER_DAO = new UserDAO();
    
    public LoginAction() {
    }
    
    public String execute() throws Exception {
        HttpServletRequest req = ServletActionContext.getRequest();
        
        HttpSession session = req.getSession();
        UserDTO user =  USER_DAO.getUser(userID, password);
        
        if(user != null){
            session.setAttribute("USER", user);
            session.setAttribute("USER_ID", userID);
        }else{
            loginFailMsg = "Wrong username or password!";
        }
        
        return  user != null ? "success" : "fail";
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

    public String getLoginFailMsg() {
        return loginFailMsg;
    }
    
    
    
}
