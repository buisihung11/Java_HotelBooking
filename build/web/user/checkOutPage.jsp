<%-- 
    Document   : checkOutPage
    Created on : Dec 4, 2019, 8:30:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="roomTypes" value="%{#application.ROOMTYPES}" />
<s:set var="areas" value="%{#application.AREAS}" />
<s:set var="cart" value="%{#session.BOOKING_CART}" />
<s:set var="user" value="#attr.USER" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../assest/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <title>Check out Page</title>
    </head>
    <body>
        <s:if test="#cart == null or #cart.isEmpty">
            <h3>Something wrong</h3>
            <a href="../home.jsp" >Return to homepage</a>
        </s:if>
        <s:else>



            <h1 class="text-center my-3 font-italic font-weight-bold">Checkout Confirm</h1>
            <p style="color: red"><s:property value="#parameters.checkOutFailMsg" /></p>
            <form action="checkout" method="GET">
                <div class="order-container container  border ">


                    <div class=" pt-4 mx-auto">
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


                        </div>
                        <div class="form-row mb-4">
                            <div class="col-6">
                                <label class="font-weight-bold">Full name: </label>
                                <input name="fullName" type="text" id="defaultRegisterFormFirstName" 
                                       class="form-control"
                                       value="<s:property value="#user.fullName" />"
                                       placeholder="Full name">

                            </div>
                            <div class="col-6">
                                <label class="font-weight-bold">Phone number: </label>
                                <input type="text" name="phone"  id="defaultRegisterPhonePassword"
                                       pattern='^[0|(\+84)][1-9]\d{8}'
                                       placeholder="Enter Phone number"
                                       title="Phone must is valid number and has 10 digit."
                                       required
                                       value="<s:property value="#user.phone" />"
                                       class="form-control" placeholder="Phone number" aria-describedby="defaultRegisterFormPhoneHelpBlock">
                            </div>
                            <div class="col-12">
                                <label class="font-weight-bold">Email: </label>
                                <input type="email" id="defaultRegisterFormEmail"
                                       required
                                       name="email"
                                       value="<s:property value="#user.userID" />"
                                       class="form-control mb-4" placeholder="E-mail">
                            </div>
                        </div>
                    </div>




                    <h4>Rooms List: </h4>

                    <table class="table table-dark text-center">
                        <thead>
                        <th scope="col">No.</th>
                        <th scope="col">Room type</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Amount</th>

                        </thead>
                        <tbody>
                            <s:iterator value="%{#cart.cartItems}" status="counter" >
                                <s:set value="%{value}" var="room" />
                                <tr>
                                    <td>
                                        <s:property value="#counter.count" />
                                        <small style="color: red" class="d-block">
                                            <s:if test="%{#room.id in lackOfRoomsId }">
                                                This room was lack of quantity.
                                            </s:if>
                                        </small>
                                    </td>
                                    <td><s:property value="%{#roomTypes[#room.roomTypeID]}" /></td>
                                    <td><s:property value="#room.bookingQuantity"  /></td>
                                    <td>$<s:property value="#room.price"  /></td>
                                    <td>$<s:property value="#room.amount"  /></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                    <div class="text-right">
                        <div class="form-group d-flex justify-content-end flex-column">
                            <p>SubTotal: <strong class="mx-3">$<s:property value="#cart.subTotal" /></strong></p>
                            <p>Discount: <strong class="mx-3"><s:property value="#cart.discountValue" /></strong></p>
                            <p>Total: <strong class="mx-3">$<s:property value="#cart.total" /></strong></p>
                        </div>
                        <div class="form-group d-flex justify-content-end text-center align-items-center ">
                            <p class="m-0"><a href="../home.jsp" class=" mb-0 confirm-link col-sm-2 mr-3">Continue Shopping</a></p>

                            <button type="submit" class="btn btn-success col-sm-2 my-3 mx-3">
                                Booking
                            </button>
                        </div>

                    </div>
                </div>
            </form>




        </s:else>
        <script src="../bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
        <script src="../assest/js/jquery-ui.js" type="text/javascript"></script>
        <script>
            var checkIndate = "<s:property value="#cart.checkInDate" />";
            var checkOutdate = "<s:property value="#cart.checkOutDate" />";

            $('a.confirm-link').on('click', function () {
                return confirm('Are you sure?');
            });

            $(".checkInDate").text($.datepicker.formatDate("MM d, yy", new Date(checkIndate)));
            $(".checkOutDate").text($.datepicker.formatDate("MM d, yy", new Date(checkOutdate)));
        </script>
    </body>

</html>
