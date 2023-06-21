<%-- 
    Document   : addDistance
    Created on : Jun 19, 2023, 7:58:22 AM
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
        <h1>Add Distance</h1>
        <h3>${requestScope.error}</h3>
        <form action="addDistance">
            <table>
            <tr>
                <td>Distance ID</td>
                <td>
                    <input type="text" name="distance_ID"/>
                </td>
            </tr>
            <tr>
                <td>Distance</td>
                <td>
                    <input type="text" name="distance"/>
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <input type="text" name="price"/>
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
