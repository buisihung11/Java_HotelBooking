/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

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
@Action("logout")
@Results({
    @Result(name = "success", type = "redirect", location = "home.jsp"),})
public class LogoutAction {

    public LogoutAction() {
    }

    public String execute() throws Exception {
        HttpServletRequest req = ServletActionContext.getRequest();
        HttpSession session = req.getSession();
        session.invalidate();

        return "success";
    }

}
