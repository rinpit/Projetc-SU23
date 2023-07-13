<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Flights Manager</h1>
        <table class="table" border="1" width="60%">
            <tr>
                <th>Flight ID</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Departure</th>
                <th>Destination</th>
                <th>Gate</th>
                <th>Seat B</th>
                <th>Seat C</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="f">
                <c:set var="id" value="${f.flightId}"/>
                <tr>
                    <td>${id}</td>
                    <td>${f.startDate}</td>
                    <td>${f.endDate}</td>
                    <td>${f.startTime}</td>
                    <td>${f.endTime}</td>
                    <td>${f.departure}</td>
                    <td>${f.destination}</td>
                    <td>${f.gate}</td>
                    <td>${f.seatsB}</td>
                    <td>${f.seatsC}</td>
                    <td>${f.price}</td>
                    <td>
                        <a href="DeleteFlightServlet?id=${f.flightId}">Delete</a>
<!--                        <a href="#" onclick="ondelete('${f.flightId}')">Delete</a>-->
                    </td>
                </tr>
            </c:forEach>
        </table>

        <h3>
            <a href="addDistance.jsp">ADD Distance</a>
        </h3>
        <h3>
            <a href="addFlight.jsp">ADD Flight</a>
        </h3>

        <h3>
            <a href="ListDistanceServlet">Distance Manager</a> 
            &nbsp;&nbsp;&nbsp;
        </h3>
    </center>
    <!--    <script type="text/javascript">
            function ondelete(id) {
                if (confirm("Are you Delete Flight with ID = " + id)) {
                    window.location = "delete?id = " + id;
                }
            }
        </script>-->
</body>
</html>
