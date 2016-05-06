<%--
  Created by IntelliJ IDEA.
  User: anavikajla
  Date: 30/04/16
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.mongodb.*, java.lang.*" %>
<%@ page import="in.edu.ashoka.Rider" %>
<html>
<head>
    <title>Search Results</title>
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="stylesheet.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

<div id="header">
    <p><a href="userpage.jsp">CarPool</a></p>
</div>


<%
    MongoClient User = new MongoClient();
    DB db = User.getDB("user");
    DBCollection rides = db.getCollection("rides");
    BasicDBObject searchQuery = new BasicDBObject();

    //for use later
    String rider = request.getParameter("rider");

    //for use later
    String phoneNumber = request.getParameter("phoneNumber");
    session.setAttribute("Phone Number", phoneNumber);

    String travelDate = request.getParameter("travelDate");
    searchQuery.put("Date", travelDate);
    session.setAttribute("Date", travelDate);

    String destination = request.getParameter("destination");
    searchQuery.put("Destination", destination.toLowerCase()); //source
    session.setAttribute("Destination", destination);

    String numberOfSeatsRequested = request.getParameter("numberOfSeats");
    searchQuery.put("Riders", new BasicDBObject("$gte", numberOfSeatsRequested));
    session.setAttribute("Number of Seats Booked", numberOfSeatsRequested);

    //int count= Rider.searchRides (travelDate, destination,numberOfSeatsRequested);

    DBCursor cursor = rides.find(searchQuery);
    DBObject rideInfo;

    int count = 0;
%>

<p class="text-center" style="color: darkgray;font-size: 2em">search results for:<%="  " + destination%>
</p>

<table class="table table-hover table-responsive table-striped">
    <tr>
        <th style="width: 15%;font-size: 1em">Name</th>
        <th style="width: 15%;font-size: 1em">Phone Number</th>
        <th style="width: 13%;font-size: 1em">Seats Available</th>
        <th style="width: 12%;font-size: 1em">Departure Time</th>
        <th style="width: 35%;font-size: 1em">Description</th>
        <th style="width: 10%;font-size: 1em">Book it!</th>

    </tr>
    <%
        //declaration here to update on next page
        String info3 = null;
        while (cursor.hasNext()) {
            //change variable names
            rideInfo = cursor.next();
            String info1 = rideInfo.get("Name").toString();
            String info2 = rideInfo.get("Phone Number").toString();
            info3 = rideInfo.get("Riders").toString();
            String info4 = rideInfo.get("Time").toString();
            String info5 = rideInfo.get("Description").toString();
            String id = rideInfo.get("_id").toString();
    %>

    <tr>
        <td><%=info1%>
        </td>
        <td><%=info2%>
        </td>
        <td><%=info3%>
        </td>
        <td><%=info4%>
        </td>
        <td><%=info5%>
        </td>
        <td>

            <form method="post">
                <button data-id="<%=id%>" class="btn btn-primary" onclick="book(this)" type="submit"
                        formaction="confirm_booking.jsp">Book
                </button>
            </form>

        </td>

    </tr>

    <%
            count++;
        }

        if (count == 0) {
    %>
    <h4>Sorry,no Rides found :(</h4>
    <%
        }

    %>


</table>
<% //jam the data-id field of the clicked button into the method parameter rideId
    document.getElementByID("offererID").value = element.getAttribute("data-id");
    }
%>

</body>
</html>
