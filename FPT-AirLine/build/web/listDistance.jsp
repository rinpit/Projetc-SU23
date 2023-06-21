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
        <h1>Distance Manager</h1>

        <table border="1" width="60%">
            <tr>
                <th>Distance ID</th>
                <th>Distance</th>
                <th>Price</th>    
                <th>Action</th> 
            </tr>
            <c:forEach items="${requestScope.data}" var="d">
                <tr>
                    <td>${d.distanceID}</td>
                    <td>${d.distance}</td>
                    <td>${d.price}</td>
                    <td>
                        <a href="UpdatePriceServlet?id=${d.distanceID}">Update Price</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
