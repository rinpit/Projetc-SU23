<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Flights Manager</h1>
        <table id="myTable" class="table" border="1" width="60%">
            <thead>
                <tr> 
                    <th>STT</th>
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
            </thead>
            <tbody class=".table tbody">
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
            </tbody>
        </table>


    </center>
    <!--    <script type="text/javascript">
            function ondelete(id) {
                if (confirm("Are you Delete Flight with ID = " + id)) {
                    window.location = "delete?id = " + id;
                }
            }
        </script>-->
</body>
<script>
    const table = document.querySelector('.table tbody');
    const rows = table.querySelectorAll('tr');

// loop through each row and add an "STT" column
    rows.forEach((row, index) => {
        const sttColumn = document.createElement('td');
        sttColumn.textContent = index + 1;
        row.insertBefore(sttColumn, row.firstElementChild);
    });
    $(document).ready(function () {
        $('#myTable').DataTable();
    });
    $(document).ready(function () {
        if ($.fn.DataTable.isDataTable('#myTable')) {
            $('#myTable').DataTable().destroy();
        }
        $('#myTable').DataTable({
            "pagingType": "full_numbers",
            "pageLength": 10,
            "lengthMenu": [10, 25, 50, 75, 100]
        });
    });
</script>
</html>
