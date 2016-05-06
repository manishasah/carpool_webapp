<%--
  Created by IntelliJ IDEA.
  User: anavikajla
  Date: 29/04/16
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.mongodb.*, in.edu.ashoka.*" %>
<%@ page import="in.edu.ashoka.*" %>
<html>
<head>
    <title>Confirmation</title>
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="stylesheet.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>


<div id="header">
    <p><a href="userpage.jsp">CarPool</a></p>
</div>

<h3 style="text-align: center">You have successfully offered a ride!</h3>
<p style="text-align: center">Your details are below:</p>

<%
    //requests for details from offer_form.jsp
    String offerer = request.getParameter("offerer");

    String phoneNumber = request.getParameter("phoneNumber");

    String destination = request.getParameter("destination");

    String travelDate = request.getParameter("travelDate");

    String deptTime = request.getParameter("deptTime");

    String numOfSeats = request.getParameter("riders");

    String charged = request.getParameter("charges");

    String description = request.getParameter("description");

    Offer.submit(offerer, phoneNumber, destination, travelDate, deptTime, numOfSeats, charged, description);


%>

<form name="offer_form" aria-disabled="true">
    <div class="form-group">
        <label>Name</label>
        <input type="text" value="<%=offerer%>" name="offerer" class="form-control" id="offerer" disabled>
    </div>

    <%--check to see if you can restrict phone number input to 10 digits--%>
    <div class="form-group">
        <label for="phoneNumber">Phone Number</label>
        <input type="number" value="<%=phoneNumber%>" name="phoneNumber" class="form-control" id="phoneNumber" disabled>
    </div>

    <div class="form-group">
        <label for="destination">destination</label>
        <input type="text" value="<%=destination%>" name="destination" class="form-control" id="destination"
               placeholder="Delhi,Parker,etc." disabled>
    </div>

    <div class="form-group">
        <label for="travelDate">Date(DD/MM/YYYY)</label>
        <input type="date" value="<%=travelDate%>" name="travelDate" class="form-control" id="travelDate" disabled>
    </div>

    <div class="form-group">
        <label for="deptTime">Departure Time</label>
        <input type="time" value="<%=deptTime%>" name="deptTime" class="form-control" id="deptTime" disabled>
    </div>

    <div class="form-group">
        <label for="riders">Number of Preferred Riders</label>
        <input type="number" value="<%=numOfSeats%>" name="riders" class="form-control" id="riders" disabled>
    </div>

    <%--check to keep a bound on description--%>
    <div class="form-group">
        <label for="description">Briefly describe your ride</label>
        <input type="text" value="<%=description%>" name="description" class="form-control" id="description" disabled>
    </div>

    <div class='form-group'>
        <label for="charges">Any charges? </label>
        <input type="text" value="<%=charged%>" name="charges" class="form-control" id="charges" disabled>
    </div>
</form>


</body>
</html>