<%-- 
    Document   : login.jsp
    Created on : Dec 3, 2019, 7:39:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Login Page</title>
    </head>
    <body>
        <div class="container mx-auto my-5" style="width: 40%">

            <h1>LOGIN PAGE</h1>

            <p style="color: red"><s:property value="loginFailMsg" /></p>
            <p style="color: #28a745"><s:property value="#parameters.registerSuccessMsg" /></p>

            <form action="login" method="POST" class="form-signin">
                <!--<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>-->
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="text" id="inputEmail" class="form-control" placeholder="Email UserID"  name="userID" required="" autofocus="">
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required="">
                <input type="hidden" name="action" value="Login" />
                <div class="d-flex mt-3 justify-content-between align-items-center">
                    <button style="width: 50%" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    <a href="register.jsp">Create account</a>
                </div>
            </form>
        </div>
        <script src="bootstrap-4.3.1-dist/js/jquery.js" ></script>                
        <script src="bootstrap-4.3.1-dist/js/popper.js" ></script>
        <script src="bootstrap-4.3.1-dist/js/bootstrap.js" ></script>
    </body>
</html>
