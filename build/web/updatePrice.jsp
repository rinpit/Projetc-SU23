<%-- 
    Document   : updatePrice
    Created on : Jun 20, 2023, 3:52:10 PM
    Author     : Pham Thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Price</h1>
        <c:set var="d" value="${requestScope.distance}"></c:set>
            <form action="UpdatePriceServlet" method="post">
            <table>
            <tr>
                <td>Distance ID</td>
                <td>
                    <input type="text" name="distance_ID" readonly value="${d.distanceID}"/>
                </td>
            </tr>
            <tr>
                <td>Distance</td>
                <td>
                    <input type="text" name="distance" readonly value="${d.distance}"/>
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <input type="text" name="price" value="${d.price}"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="UPDATE"/>
                </td>
            </tr>
            </table>
        </form>
    </body>
</html>
