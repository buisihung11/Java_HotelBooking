<%-- 
    Document   : hotelDetail
    Created on : Dec 1, 2019, 2:34:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="roomTypes" value="%{#application.ROOMTYPES}" />
<s:set var="areas" value="%{#application.AREAS}" />
<s:set var="hotel" value="hotel" />
<s:set var="hotelRooms" value="hotelRooms" />
<s:set var="cart" value="%{#session.BOOKING_CART}" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assest/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Hotel Detail</title>
    </head>
    <body >

        <div class="container-fluid m-0 p-0" style="box-sizing: border-box">


            <div class="header text-center mb-3 p-0 d-flex align-items-center"
                 style="height: 300px;background-color: #CCC">

                <h1 class="mx-auto font-weight-bold font-italic">See description of this hotel and choose your favorite room</h1>
            </div>

            <a href="user/userCart.jsp" >View your cart</a>
            <span class="mx-4 border-right"></span>
            <a href="home.jsp" class="">Choose another hotel</a>
        <!--<p class="alert-danger"><s:property value="failMsg" /></p>-->
            <s:if test="%{hotel eq null}">
                <h3>Something wrong!</h3>
                <a href="home.jsp" >Go to Homepage</a>
            </s:if>
            <s:elseif test="%{hotelRooms eq null}"> 
                <h3>No room available!</h3>
                <a href="home.jsp" >Choose another hotel</a>
            </s:elseif>
            <s:else>
                <div class="row p-5 container-fluid">
                    <div class="col-lg-5 col-12">

                        <h3 class="font-weight-bold"><s:property value="hotel.hotelName" /></h3>
                        <p class="badge badge-warning"><s:property value="%{#areas[hotel.areaID]}" /></p>
                        <hr />
                        <p style="width: 300px"><s:property value="hotel.description" /></p>
                        <hr />
                        <a href="home.jsp" >Back to Homepage</a>
                    </div>
                    <div class="col-lg-7 col-12 pt-3">

                        <div class="mb-2">
                            <div class="">
                                <p class="invalidSearchDateMsg alert-danger"></p>
                            </div>
                            <form action="detailPage">
                                <div class="row">
                                    <div class="col form-group">
                                        <label for="checkinDate">Check In: </label>
                                        <input class="form-control inputDate"   type="text" 
                                               id="checkinDate"
                                               name="checkinDate"
                                               placeholder="Checkin Date " value="<s:property value="checkinDate"/>" required>
                                    </div>
                                    <div class="col">
                                        <label for="checkoutDate">Check Out: </label>
                                        <input class="form-control inputDate"  type="text"
                                               id="checkoutDate"
                                               name="checkoutDate"
                                               placeholder="Checkout Date " value="<s:property value="checkoutDate"/>" required>
                                    </div>
                                    <div class="col align-bottom">
                                        <label for=""></label>
                                        <s:hidden name="amountRoom" value="%{amountRoom}" />
                                        <s:hidden name="hotelID" value="%{hotelID}" />
                                        <button class="btn btn-warning" type="submit">Check available room</button>
                                    </div>
                                </div>
                            </form>
                            <s:iterator value="%{hotelRooms}">
                                <form class="addToCartForm" action="user/addToCart" method="POST" >
                                    <div class="d-flex justify-content-between"> 
                                        <h4 class="font-italic "><s:property value="%{#roomTypes[roomTypeID]}" /></h4>
                                        <p><span class="font-weight-bold" style="font-size: 1.3rem">
                                                $<s:property value="price" /></span>/night
                                        </p>
                                    </div>
                                    <div class="text-center mb-4 border-bottom">

                                        <div class="row mt-2">
                                            <div class="col text-right border-right">
                                                <input class="form-control"
                                                       name="bookingQuantity"
                                                       type="number" min="1" max="<s:property value="%{quantity}" />"
                                                       required="" placeholder="Number of room" style="width: 100%"/>
                                                <p class="text-muted">Max quantity: <s:property value="quantity" /></p>
                                            </div>
                                            <div class="col d-flex align-items-center justify-content-center ">
                                                <s:hidden name="checkinDate" value="%{checkinDate}" />
                                                <s:hidden name="checkoutDate" value="%{checkoutDate}" />
                                                <s:hidden name="amountRoom" value="%{amountRoom}" />
                                                <s:hidden name="hotelID" value="%{hotelID}" />

                                                <s:hidden name="roomID" value="%{id}" />
                                                <s:hidden name="price" value="%{price}" />
                                                <s:hidden name="roomTypeID" value="%{roomTypeID}" />
                                                <s:hidden name="hotelName" value="%{hotel.hotelName}" />
                                                <s:hidden name="maxQuantity" value="%{quantity}" />
                                                <s:hidden name="dateDifference" value="" />
                                                <button class="btn"   type="submit" 
                                                        style="color:#fff;background: linear-gradient(to right, #E61E4D 0%, #E31C5F 50%, #D70466 100%)">
                                                    Add to cart
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </s:iterator>
                        </div>
                    </div>
                </div>
                <div></div>

            </s:else>
        </div>
        <div aria-live="polite" aria-atomic="true" style="position: absolute; top: 250px; right: 0; min-height: 200px;">
            <div class="toast" style="" data-autohide="false">
                <div class="toast-header">
                    <!--<img src="..." class="rounded mr-2" alt="...">-->
                    <strong class="mr-auto">Add to cart</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    Add Successfully
                </div>
            </div>
        </div>
        <script src="bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
        <script src="bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
        <script src="bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
        <script src="assest/js/jquery-ui.js" type="text/javascript"></script>
        <script>
            <s:if test="%{successMsg != null}">
            var msg = "<s:property value="successMsg" />";
            console.log("Msg: ");
            $(".toast").find(".toast-body").text(msg);
            setTimeout(function () {
                $(".toast").toast('show');
            }, 1000)
            </s:if>
            <s:if test="%{failMsg != null}">
            var msg = "<s:property value="failMsg" />";
            console.log("Msg: ");
            $(".toast").find(".toast-body").addClass("alert alert-danger")
                    .text(msg);
            setTimeout(function () {
                $(".toast").toast('show');
            }, 1000)
            </s:if>

            $(".inputDate").each(function () {
                console.log(this);
                $(this).datepicker({
                    dateFormat: "yy-mm-dd",
                    minDate: 0
                });
            })
            $(".addToCartForm").on("submit", function (e) {
                //if cart has booked difference hotel
                //get user confirm to update the cart
                var checkInInput = $(this).find("input[name=checkinDate]").val();
                var checkOutInput = $(this).find("input[name=checkoutDate]").val();
                var needConfirm = false;
                //KHAC HOTEL
            <s:if test="%{#cart != null}">
                <s:if test="%{#cart.hotelID != hotelID }">
                needConfirm = true;
                </s:if>
                if (checkInInput != '<s:property value="#cart.checkInDate" />' || checkOutInput != '<s:property value="#cart.checkInDate" />') {
                    needConfirm = true;
                }
            </s:if>

                if (needConfirm) {
                    var confirmUpdate = confirm("Would you like to remove your current cart?");
                    if (!confirmUpdate) {
                        e.preventDefault();
                    }
                }

                console.log("HANDLE DATE FORM")
                var dateDifference = $(this).find("input[name=dateDifference]");
                var date1 = new Date(checkInInput);
                var date2 = new Date(checkOutInput);
// To calculate the time difference of two dates 
                var Difference_In_Time = date2.getTime() - date1.getTime();
// To calculate the no. of days between two dates 
                var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24) + 1;
                dateDifference.val(Difference_In_Days);
                console.log("Date difference: " + Difference_In_Days)
                if (checkInInput > checkOutInput) {
                    $(this).find(".invalidSearchDateMsg").text('NOT VALID INPUT ')
                    e.preventDefault();
                }
            })
        </script>
    </body>
</html>
