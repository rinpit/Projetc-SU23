<%-- 
    Document   : addFlight
    Created on : Jun 19, 2023, 7:58:32 AM
    Author     : Pham Thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add Flight</h1>
        <h3>${requestScope.error}</h3>
        <form action="addFlight">
            
            <table>
                <tr>
                    <td>Flight ID</td>
                    <td>
                        <input type="text" name="flightId"/>
                    </td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td>
                        <input type="text" name="startDate"/>
                    </td>
                </tr>
                <tr>
                    <td>End Date</td>
                    <td>
                        <input type="text" name="endDate"/>
                    </td>
                </tr>
                <tr>
                    <td>Start Time</td>
                    <td>
                        <input type="text" name="startTime"/>
                    </td>
                </tr>
                <tr>
                    <td>End Time</td>
                    <td>
                        <input type="text" name="endTime"/>
                    </td>
                </tr>
                <tr>
                    <td>Departure</td>
                    <td>
                        <input type="text" name="departure"/>
                    </td>
                </tr>

                <tr>
                    <td>Destination</td>
                    <td>
                        <input type="text" name="destination"/>
                    </td>
                </tr>
                <tr>
                    <td>Gate</td>
                    <td>
                        <input type="text" name="gate"/>
                    </td>
                </tr>
                <tr>
                    <td>Seats B</td>
                    <td>
                        <input type="text" name="seatsB"/>
                    </td>
                </tr>
                <tr>
                    <td>Seats C</td>
                    <td>
                        <input type="text" name="seatsC"/>
                    </td>
                </tr>
                <tr>
                    <td>Distance_ID</td>
                    <td>
                        <input type="text" name="distanceID"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="SAVE"/>
                    </td>
                </tr>
            </table>
        </form>

    </body>
</html>
