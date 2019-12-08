<%-- 
    Document   : userCart.jsp
    Created on : Dec 1, 2019, 7:46:45 PM
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
        <title>User Cart</title>
    </head>
    <body class="container-fluid">
        <h1>Your cart items:</h1>
        <a href="../home.jsp">Return to search page</a>
        <p class="alert-danger"><s:property value="#parameters.updateFailMsg" /></p>
        <p class="alert-danger"><s:property value="#parameters.removeFailMsg" /></p>
        <s:if test="%{#cart == null}">
            <h3>Nothing in your cart</h3>
        </s:if>
        <s:else>


            <div class="cart-container my-5">
                <div class="d-flex flex-wrap justify-content-between mx-auto container-fluid" style="width: 90%">


                    <div class="col-lg-7 col-12">

                        <s:iterator value="%{#cart.cartItems}" status="counter" >
                            <s:set value="%{value}" var="room" />
                            <form action="updateItemInCart">

                                <div class="cart-item-wrapper border-bottom p-0 m-0 pb-4 my-2 row">
                                    <div class="col-12 row">
                                        <div class="col-10">
                                            <h4 class="font-weight-bold "><s:property value="%{#roomTypes[#room.roomTypeID]}" /></h4>
                                        </div>
                                        <div class="col-2 text-center">
                                            <p><span class="font-weight-bold" style="font-size: 1.1rem">$<s:property value="#room.price"  /></span>/night</p>
                                        </div>

                                    </div>
                                    <div class="col-12 row">
                                        <div class="col-10">
                                            <input class="form-control"
                                                   name="updateQuantity"
                                                   value="<s:property value="#room.bookingQuantity"  />"
                                                   type="number" min="1" max="<s:property value="#room.maxQuantity" />"
                                                   required="" placeholder="Number of room" style="width: 100%"/>
                                            <small class="text-muted"><strong><s:property value="#room.maxQuantity" /></strong> rooms available</small>

                                        </div>
                                        <div class="col-2 text-center">
                                            <p>$<s:property value="%{#room.amount}" /></p>
                                        </div>
                                    </div>
                                    <div class="text-right col-12">
                                        <s:hidden name="updateRoomId" value="%{#room.id}" />
                                        <button class="btn btn-primary mr-3" type="submit">Update</button>
                                        <s:url var="removeLink" action="removeItemInCart">
                                            <s:param name="removeRoomID" value="#room.id" />
                                        </s:url>
                                        <s:a href="%{removeLink}" cssClass="btn btn-danger confirm-link">Remove</s:a>
                                        </div>
                                    </div>
                                </form>
                        </s:iterator>
                    </div>

                    <div class="col-lg-5 col-12 border-success border pt-4 pl-3">
                        <h3 class="font-weight-bold"><s:property value="#cart.hotelName"  /></h3>
                        <div class="">
                            <div class="">
                                <p class="invalidSearchDateMsg alert-danger"></p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span class="checkInDate font-italic"></span>
                                <span class="mx-4">-</span>
                                <span class="checkOutDate font-italic"></span>

                            </div>
                            <p>
                                <strong><s:property value="#cart.dateDifference" /></strong> nights
                            </p>
                            <div class="border-dark  d-flex col-12 justify-content-between">
                                <div class="text-right font-italic" style="font-size: 1.1rem">
                                    Total: 
                                </div>
                                <div class=" border-left pl-5">
                                    <strong>$<s:property value="#cart.total" /></strong>
                                </div>
                            </div>
                            <form action="checkOutPage">

                                <div class="d-flex justify-content-between my-3">
                                    <div class="d-flex align-items-center" style="width: 75%">
                                        <input type="text" name="discountCode" 
                                               <s:if test="%{discountCode != null}">
                                                   value="<s:property value="discountCode" />"
                                               </s:if>
                                               <s:else>
                                                   value="<s:property value="#cart.discountCode" />"
                                               </s:else>
                                               class="form-control" placeholder="Enter your disconunt code here" />
                                        <small  style="color: red;width: 100px" class="ml-3 font-italic form-text d-inline-block">
                                            <s:property value="checkOutFailMsg" />
                                        </small>
                                    </div>
                                    <div>
                                        <button class="btn btn-primary">Checkout</button>
                                    </div>

                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </table>

    </s:else>
    <script src="../bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
    <script src="../bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
    <script src="../assest/js/jquery-ui.js" type="text/javascript"></script>

    <script>
        $(function () {
            //            $(".inputDate").datepicker({
            //                dateFormat: "MM d, yy"
            //            });
        });

        var checkIndate = "<s:property value="#cart.checkInDate" />";
        var checkOutdate = "<s:property value="#cart.checkOutDate" />";

        $('a.confirm-link').on('click', function () {
            return confirm('Are you sure?');
        });

        $(".checkInDate").text($.datepicker.formatDate("MM d, yy", new Date(checkIndate)));
        $(".checkOutDate").text($.datepicker.formatDate("MM d, yy", new Date(checkOutdate)));
        $(".updateCartForm").on("submit", function (e) {
            console.log("HANDLE DATE FORM")
            var checkInInput = $(this).find("input[name=updateCheckinDate]").val();
            var checkOutInput = $(this).find("input[name=updateCheckoutDate]").val();

            console.log(checkInInput)

            var dateDifference = $(this).find("input[name=updateDateDifference]");
            var date1 = new Date(checkInInput);
            var date2 = new Date(checkOutInput);
            // To calculate the time difference of two dates 
            var Difference_In_Time = date2.getTime() - date1.getTime();
            // To calculate the no. of days between two dates 
            var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24) + 1;
            dateDifference.val(Difference_In_Days);
            console.log(Difference_In_Days)
            if (checkInInput > checkOutInput) {
                $(this).find(".invalidSearchDateMsg").text('NOT VALID INPUT ')
            }
            e.preventDefault();
        })
    </script>
</body>
</html>
