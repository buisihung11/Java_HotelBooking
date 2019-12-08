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
        <title>Register Page</title>
    </head>
    <body>
        <div class="container mx-auto my-5" style="width: 80%">

            <h1>Register page</h1>


            <form action="register" method="POST" class="form-signin">
                <div class="form-row mb-4">
                    <div class="col">
                        <input name="fullName" type="text" id="defaultRegisterFormFirstName" 
                               class="form-control"
                               maxlength="45"
                               value="<s:property value="fullName" />"
                               placeholder="Full name">
                        <small style="color: red"  class="form-text  mb-4">
                            <s:property value="err.fullNameErr" />
                        </small>
                    </div>
                    <div class="col">
                        <input type="text" name="phone"  id="defaultRegisterPhonePassword"
                               pattern='^[0|(\+84)][1-9]\d{8}'
                               placeholder="Enter Phone number"
                               title="Phone must is valid number and has 10 digit."
                               required
                               value="<s:property value="phone" />"
                               class="form-control" placeholder="Phone number" aria-describedby="defaultRegisterFormPhoneHelpBlock">
                        <small style="color: red"  class="form-text  mb-4">
                            <s:property value="err.phoneErr" />
                        </small>
                    </div>
                </div>

                <!-- E-mail -->
                <input type="email" id="defaultRegisterFormEmail"
                       required
                       name="email"
                       maxlength="45"
                       value="<s:property value="email" />"
                       class="form-control mb-4" placeholder="E-mail">
                <small style="color: red"  class="form-text  mb-4">
                    <s:property value="err.emailErr" />
                </small>
                <small style="color: red"  class="form-text  mb-4">
                    <s:property value="err.duplicateEmailErr" />
                </small>



                <!-- Password -->
                <input type="password" required id="defaultRegisterFormPassword" 
                       name="password"
                       maxlength="30"
                       class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
                <small style="color: red"  class="form-text  mb-4">
                    <s:property value="err.passwordErr" />
                </small>


                <input type="password" required id="defaultRegisterFormPassword"
                       name="confirmPassword"
                       maxlength="30"
                       class="form-control" placeholder="Confirm Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
                <small style="color: red"  class="form-text  mb-4">
                    <s:property value="err.confirmPasswordErr" />
                </small>


                <textarea type="text" class="form-control" id="description" required minlength="5" maxlength="200" 
                          name="address" placeholder="Enter your address"  ><s:property value="address" /></textarea>
                <small style="color: red"  class="form-text  mb-4">
                    <s:property value="err.addressErr" />
                </small>
                <button class="btn btn-info my-4 btn-block" type="submit">Sign up</button>
                <!-- Terms of service -->
                <p>By clicking
                    <em>Sign up</em> you agree to our
                    <a href="" target="_blank">terms of service</a>
            </form>
        </div>
        <script src="bootstrap-4.3.1-dist/js/jquery.js" ></script>                
        <script src="bootstrap-4.3.1-dist/js/popper.js" ></script>
        <script src="bootstrap-4.3.1-dist/js/bootstrap.js" ></script>
    </body>
</html>
