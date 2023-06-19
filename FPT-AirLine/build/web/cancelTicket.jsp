<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Information" %>
<%@page import="Model.InformationDAO" %>
<%@page import="DBcontext.DB" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/personal.css"/>
    </head>
    <body>
        <c:set var="information" value="${requestScope.information}" />
        <div class="container"> 
            <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="card custom-card">
                        <div class="row custom-card-title">
                            <div class="col-6 col-lg-12"><a href="AccountServlet">
                                    <div class="row ">
                                        <div class="col-12 col-lg-3"><i class="fas fa-info-circle"></i></div>
                                        <div class="col-12 col-lg-9"> Tài khoản của tôi</div>
                                    </div>
                                </a></div>
                            <div class="col-6 col-lg-12"><a href="PersonalServlet">
                                    <div class="row ">
                                        <div class="col-12 col-lg-3"><i class="fas fa-id-badge"></i></div>
                                        <div class="col-12 col-lg-9"> Thông tin cá nhân</div>
                                    </div>
                                </a></div>
                            <div class="col-6 col-lg-12"><a href="viewHistoryServlet">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fa fa-history"></i></div>
                                        <div class="col-12 col-lg-9 title"> Lịch sử đặt vé</div>
                                    </div>
                                </a></div>
                            <div class="col-6 col-lg-12"><a href="#">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fa fa-ban"></i></div>
                                        <div class="col-12 col-lg-9 title"> Hủy vé</div>
                                    </div>
                                </a></div> 
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="col-12 col-lg-8" style="background-color: rgb(211, 122, 21);">
                        <h1 style="text-align: center; margin-bottom: 30px;">Hủy vé máy bay</h1>
                        <form action="cancelTicketServlet" method="post">
                            <label for="booking_number"
                                   style="color: #333; background-color: #f5f5f5; padding: 5px 10px; border-radius: 5px;">Mã
                                vé:</label>
                            <input type="text" name="ticketId"
                                   style="padding: 10px; border-radius: 5px; border: 1px solid #ccc;"><br><br>
                            <label for="email"
                                   style="color: #333; background-color: #f5f5f5; padding: 5px 10px; border-radius: 5px;">Họ và Tên</label>
                            <input type="name""
                                   style="padding: 10px; border-radius: 5px; border: 1px solid #ccc;"><br><br>
                            <input type="checkbox" required> Bạn chấp nhận điều khoản của chúng tôi <br><br>
                            <button type="submit"
                                    style="padding: 10px 20px; font-size: 16px; border-radius: 5px; background-color: #0077cc; color: #fff;"><i
                                    class="fa fa-times"></i> Hủy vé</button>
                        </form>
                    </div>
                </div>  
            </div>
        </div>
    </div>
</body>
</html>
