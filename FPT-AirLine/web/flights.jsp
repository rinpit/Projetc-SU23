<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Flights</title>
</head>
<body>
<table class="table" border="1" width="100%">
    <thead>
    <tr>
        <td>Flight ID</td>
        <td>Start Date</td>
        <td>End Date</td>
        <td>Start Time</td>
        <td>End Time</td>
        <td>Departure</td>
        <td>Destination</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listFlight}" var="p">
        <tr>
            <td>${p.flightId}</td>
            <td>${p.startDate}</td>
            <td>${p.endDate}</td>
            <td>${p.startTime}</td>
            <td>${p.endTime}</td>
            <td>${p.departure}</td>
            <td>${p.destination}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
