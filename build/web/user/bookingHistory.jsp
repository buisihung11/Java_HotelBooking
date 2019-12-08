<%-- 
    Document   : bookingHistory
    Created on : Dec 6, 2019, 7:50:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="roomTypes" value="%{#application.ROOMTYPES}" />
<s:set var="areas" value="%{#application.AREAS}" />
<s:set var="bookingStatusList" value="%{#application.BOOKING_STATUS}" />
<s:set var="cart" value="%{#session.BOOKING_CART}" />
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../assest/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <title>Booking History</title>
        <style>
            .result-container{
                max-width: 100%;
                padding: 1.5rem 4rem;
                background-color: #ccc;
            }
            .result-container .booking-container{
                background-color: #fff;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">

            <h1>See your bookings:  </h1>
            <a href="../home.jsp">Return to homepage</a>
            <div class="search-control my-3 mx-auto" style="width: 80%">
                <form action="searchBooking">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <input style="width: 65%;" type="text" name="hotelNameSearch" 
                               value="<s:property value="hotelNameSearch" />"
                               placeholder="Enter hotelname" class="form-control" />
                        <button class="btn btn-primary">Search by name</button>
                    </div>
                </form>
                <form action="searchBooking">
                    <div class="d-flex justify-content-between align-items-center">
                        <input style="width: 65%;"  type="text"  name="bookingDateSearch" 
                               value="<s:property value="bookingDateSearch" />"
                               placeholder="Enter booking date" class="form-control inputDate" />
                        <button class="btn btn-warning">Search by date</button>
                    </div>
                </form>
            </div>

            <h3 style="color: red"><s:property value="cancelFailMsg" /></h3>                   
            <h3 style="color: red"><s:property value="addFeedbackFailMsg" /></h3>                   
            <h3 style="color: #28a745"><s:property value="cancelSuccessMsg" /></h3>                   
            <h3 style="color: #28a745"><s:property value="addFeedbackSuccessMsg" /></h3>                   
            <s:if test="%{results == null }">
                <h3>No booking has found with that condition!</h3>
            </s:if>    
            <s:else>

                <h3>Your bookings list🛌: </h3>

                <div class="result-container container   ">

                    <s:iterator value="results">
                        <div class="booking-container mb-4 border p-2 shadow">

                            <div class=" pt-4 mx-auto">
                                <h3 class="font-weight-bold">
                                    <s:property value="hotelName"  /> 
                                    <span class="badge badge-warning"><s:property value="%{#areas[hotelAreaID]}" /></span>
                                </h3>
                                <h5>Booking Date: <s:property value="bookingDate" /></h5>
                                <h5>Booking Status: 
                                    <span 
                                        <s:if test="%{bookingStatus == 1}">
                                            class="badge badge-secondary"
                                        </s:if> 
                                        <s:if test="%{bookingStatus == 3}">
                                            class="badge badge-warning"
                                        </s:if> 
                                        <s:if test="%{bookingStatus == 2}">
                                            class="badge badge-success"
                                        </s:if> 
                                        ><s:property value="#bookingStatusList[bookingStatus]" /></span>
                                </h5>
                                <div class="">
                                    <div class="">
                                        <p class="invalidSearchDateMsg alert-danger"></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Check In: <span class=" font-weight-bold checkInDate font-italic"><s:property value="checkInDate" /></span></p>
                                        <span class="mx-4">-</span>
                                        <p>Check Out: <span class=" font-weight-bold checkOutDate font-italic"><s:property value="checkOutDate" /></span></p>
                                    </div>
                                    <p class="m-0">
                                        <span class="dateDiffer font-weight-bold" style="font-size: 1.1rem"></span>nights
                                    </p>
                                </div>
                                <div class="form-row mb-2">
                                    <div class="col-6">
                                        <p class="mb-0 font-italic ">Full name: <span class="font-weight-bold"><s:property value="customerFullName" /></span></p>
                                    </div>
                                    <div class="col-6">
                                        <p class="mb-0 font-italic ">Phone number: <span class="font-weight-bold"><s:property value="customerPhone" /></span></p>
                                    </div>
                                    <div class="col-12">
                                        <p class="mb-0 font-italic ">Email: <span class="font-weight-bold"><s:property value="customerEmail" /></span></p>
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
                                    <s:iterator value="bookingDetails" status="counter" >
                                        <s:set value="%{value}" var="room" />
                                        <tr>
                                            <td>
                                                <s:property value="#counter.count" />
                                            </td>
                                            <td><s:property value="%{#roomTypes[roomTypeID]}" /></td>
                                            <td><s:property value="bookedQuanity"  /></td>
                                            <td>$<s:property value="roomPrice"  /></td>
                                            <td>$<s:property value="amount"  /></td>
                                        </tr>   
                                        <s:if test="%{bookingStatus != 1}">
                                            <tr>
                                                <td colspan="5" >
                                                    <form action="addFeedback">
                                                        <div class="d-flex justify-content-end align-items-center">
                                                            <s:if test="%{feedback != null}">
                                                                <p class="font-weight-bold mr-3">Feedback: </p>
                                                                <textarea class="form-control"  style="max-width: 60%" disabled=""><s:property value="feedback" /></textarea>
                                                            </s:if>
                                                            <s:else>
                                                                <s:hidden name="bookingID" value="%{bookingID}" />
                                                                <s:hidden name="bookingDetailID" value="%{bookingDetailID}" />
                                                                <s:hidden name="hotelNameSearch" value="%{hotelNameSearch}" />
                                                                <s:hidden name="bookingDateSearch" value="%{bookingDateSearch}" />
                                                                <textarea cols="4" class="form-control" name="feedback" placeholder="Enter your feedback"
                                                                          style="max-width: 60%" maxlength="200" required=""></textarea>
                                                                <button style="height: 40px" class="ml-3 btn btn-primary">Send feedback</button>
                                                            </s:else>
                                                        </div>
                                                    </form>
                                                </td>

                                            </tr>
                                        </s:if>
                                    </s:iterator>
                                </tbody>
                            </table>
                            <div class="text-right">
                                <div class=" d-flex justify-content-end flex-column">
                                    <p>Total: <strong class="mx-3">$<s:property value="total" /></strong></p>
                                </div>
                                <form action="cancelBooking" id="cancelBookingForm">
                                    <div class="form-group d-flex justify-content-end text-center align-items-center ">
                                        <!--<p class="m-0"><a href="../home.jsp" class=" mb-0 confirm-link col-sm-2 mr-3">Continue Shopping</a></p>-->

                                        <input type="hidden" value="<s:property value="hotelNameSearch" />" name="hotelNameSearch" />
                                        <input type="hidden" value="<s:property value="bookingDateSearch" />" name="bookingDateSearch" />
                                        <input type="hidden" value="<s:property value="bookingID" />" name="bookingID" />
                                        <button id="cancelBookingBtn" type="button" style="width:30%" type="submit" class="confirm-link btn btn-danger col-sm-2 my-3 mx-3" 
                                                <s:if test="%{bookingStatus == 1}">
                                                    disabled=""
                                                </s:if> 
                                                >
                                            Cancel booking
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </s:iterator>
                </div>

            </s:else>



        </div>


        <script src="../bootstrap-4.3.1-dist/js/jquery.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/popper.js" type="text/javascript"></script>
        <script src="../bootstrap-4.3.1-dist/js/bootstrap.js" type="text/javascript"></script>
        <script src="../assest/js/jquery-ui.js" type="text/javascript"></script>

        <script>
            $(function () {
                $(".inputDate").datepicker({
                    dateFormat: "yy-mm-dd"
                });
            });
            $('a.confirm-link').on('click', function () {
                return confirm('Are you sure?');
            });
            $(".booking-container").each(function () {

                var checkIn = $(this).find("span.checkInDate").html();
                var checkOut = $(this).find("span.checkOutDate").html();
                var dateDifference = $(this).find("span.dateDiffer");

                console.log(dateDifference)

                var date1 = new Date(checkIn);
                var date2 = new Date(checkOut);
                // To calculate the time difference of two dates 
                var Difference_In_Time = date2.getTime() - date1.getTime();
                // To calculate the no. of days between two dates 
                var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24) + 1;
                console.log("DATE_DIFFER : " + Difference_In_Days);
                dateDifference.text(Difference_In_Days);
            })
            $("#cancelBookingBtn").click(function (e) {

                var confirm = window.confirm("Do you want to cancel this booking?");
                if (confirm) {

                    $(this).closest("form#cancelBookingForm").submit();
                }

//                    e.preventDefault();
            })
        </script>
    </body>
</html>
