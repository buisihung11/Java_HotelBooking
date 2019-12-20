<%-- 
    Document   : home
    Created on : Nov 30, 2019, 9:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="user" value="#attr.USER" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assest/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
    </head>
    <body class="container-fluid">
        <div class="header text-center m-0 p-0 d-flex align-items-center"
             style="height: 300px;background-color: #CCC">

            <h1 class="mx-auto font-weight-bold font-italic">Find room</h1>
        </div>
        <div class="my-4">

            <s:if test="%{#user != null}">
                <h2>Welcome , <strong><s:property value="#user.fullName" /></strong></h2>
                <s:if test="%{#user.isAdmin}" >
                    <a href="admin/getFeedbackHotel" class="px-3 border-right">See feedbacked hotel</a>
                </s:if>
                <s:else>
                    <a href="user/userCart.jsp" class="px-3 border-right">View your cart</a>
                    <a href="user/searchBooking" class="pl-3">See your bookings has made</a>
                </s:else>
                <a href="logout" class="btn btn-success">Log out</a>

            </s:if>
            <s:else>

                <a href="login.jsp" class="btn btn-success">Log in</a>
            </s:else>
        </div>

        <!--ERR MSG-->
        <h3 style="color: red"><s:property value="#parameters.confirmFail" /></h3>

        <!--SUCCESS MSG-->
        <h3 style="color: #28a745"><s:property value="#parameters.checkOutSuccessMsg" /></h3>
        <h3 style="color: #28a745"><s:property value="#parameters.confirmSuccess" /></h3>

        <div id="search_form "style="width: 70%" class="mt-3">
            <form id="searchByDateForm" action="searchRoomAvailable">
                <div class="row mb-4">
                    <div class="col">
                        <input id="checkInInput" class="inputDate form-control" type="text"  name="checkinDate"
                               placeholder="Checkin Date " value="<s:property value="#session.CHECK_IN_DATE"/>" required>
                    </div>
                    <div class="col">
                        <input id="checkOutInput" class="inputDate form-control" type="text"  name="checkoutDate"
                               placeholder="Checkout Date " value="<s:property value="#session.CHECK_OUT_DATE"/>" required>
                    </div>
                </div>
                <div  style="width: 90% ">
                    <p class=" alert-danger" id="invalidSearchDateMsg"></p>
                    <h3 class="border-top">Add filter</h3>
                    <div class="row">

                        <div class="col">

                            <input class="form-control" type="text" name="hotelName" value="<s:property value="hotelName"/>"
                                   placeholder="Enter name" />
                        </div>
                        <div class="col">
                            <s:set var="areas" value="%{#application.AREAS}" />
                            <s:select 
                                cssClass="custom-select"
                                name="areaID"
                                headerKey="-1" headerValue="All area"
                                list="%{#areas}" />
                        </div>
                        <div class="col d-flex">
                            <p>Amount</p>
                            <s:if test="%{amountRoom == null}">
                                <s:set var="amountParam" value="0" />
                            </s:if>
                            <s:else>
                                <s:set var="amountParam" value="amountRoom" />
                            </s:else>
                            <input type="number" name="amountRoom" min="0" step="1" class="form-control"
                                   value="<s:property value="#amountParam"/>" placeholder="Number of room you want" />
                        </div>
                        <div class="col-2 d-flex align-items-start align-content-start">
                            <button class="btn btn-info mr-3" type="button" id="clearFilterBtn">Clear</button>
                            <button class="btn btn-primary" type="submit">Search</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="search-result">
            <s:if test="%{#session.CHECK_IN_DATE != null}">

                <s:if test="%{searchResults eq null and #session.CHECK_IN_DATE != null}" >
                    <h3>No hotel founded with your condition!!</h3>
                </s:if>
                <s:else>
                    <h3>List of hotel </h3>
                    <div class="hotel-container d-flex justify-content-around flex-wrap">
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
                                <div class="card-footer text-right">
                                    <s:url action="detailPage" var="detailURL" >
                                        <s:param name="hotelID" value="id"/>
                                        <s:param name="amountRoom" value="amountRoom"/>
                                        <s:param name="checkinDate" value="checkinDate"/>
                                        <s:param name="checkoutDate" value="checkoutDate"/>
                                    </s:url>
                                    <s:a href="%{detailURL}" cssClass="btn btn-primary">See Detail</s:a>
                                    </div>
                                </div>
                        </s:iterator>
                    </div>
                </s:else>
            </s:if>


        </div>                    
        <script src="bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
        <script src="bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
        <script src="bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
        <script src="assest/js/jquery-ui.js" type="text/javascript"></script>

        <script>
            $(function () {
                $(".inputDate").datepicker({
                    dateFormat: "yy-mm-dd",
                    minDate: 0
                });
            });

            $("#searchByDateForm").submit(function (e) {
                console.log("HANDLE DATE FORM")
                var checkInInput = $("#checkInInput").val();
                var checkOutInput = $("#checkOutInput").val();


                if (checkInInput > checkOutInput) {
                    $("#invalidSearchDateMsg").addClass("alert")
                            .text('NOT VALID INPUT ')
                    e.preventDefault();
                }

            })
            $("#searchByAreaForm").submit(function (e) {
                var areaId = $("select[name=areaID]").val()
                console.log(areaId)
                if (areaId == -1) {
                    $("#invalidSearchAreaMsg").text('PLEASE CHOOSE AREA')
                    e.preventDefault();
                }
            })

            $("#clearFilterBtn").on("click", function () {
                $('select>option:eq(0)').prop('selected', true);
                $("input[name=hotelName]").val('');
                $("input[name=amountRoom]").val('0');
            })

        </script>
    </body>
</html>
