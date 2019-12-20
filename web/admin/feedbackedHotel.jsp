<%-- 
    Document   : feedbackedHotel
    Created on : Dec 19, 2019, 4:27:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="roomTypes" value="%{#application.ROOMTYPES}" />
<s:set var="areas" value="%{#application.AREAS}" />
<s:set var="cart" value="%{#session.BOOKING_CART}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../assest/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <title>Feedback Hotel</title>
    </head>
    <body class="container-fluid mx-auto">
        <h1>Feedbacked Hotel:</h1>
        <div class="mx-auto my-4" style="width: 60%;">
            <div class="d-flex justify-content-between">

                <s:iterator value="searchResults" >

                    <div class="card mb-5" style="width: 18rem; ">
                        <div class="card-header"
                             >
                            <s:property value="id" />
                        </div>
                        <div class="card-body">
                            <h5 class="card-title font-italic font-weight-bold"
                                style="height: 50px; overflow-y: hidden">
                                <s:property value="hotelName" />
                            </h5>
                            <p class="card-text truncate-overflow" 
                               style="max-height: 120px; overflow-y: auto;height: 120px">
                                <s:property value="description" />
                            </p>
                            <div class="badge badge-warning"><s:property value="%{#areas[areaID]}" /></div>
                        </div>
                    </div>
                </s:iterator>
            </div>
        </div>
        <script src="../bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
        <script src="../assest/js/jquery-ui.js" type="text/javascript"></script>

    </body>
</html>
