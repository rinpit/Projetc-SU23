<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
        <style>
            body{
                background-image: url('https://www.vietjetair.com/static/media/bay_vao_tuong_lai_bg_mb.e310d427.png');
                background-size: 100%;
                background-repeat: no-repeat;
            }
        </style>

        <title>Select Flight</title>
    </head>
    <body>
        <div class="container justify-content-around" style="margin-top: 75px">
            <form action="SelectFlightServlet" method="post">
                <div class="row">
                    <div class="col-sm-8" style="background-color: blanchedalmond ;" >
                        <div class="row">
                            <div class="col-sm-6">
                                <a class="text-danger">Giá vé chưa bao gồm thuế và phí</a>
                                <br>
                                <a class="text-danger">${Departure} đi ${Destination}</a>
                                <br>
                                <a class="text-primary">Bay ngày: ${StartDate}</a>
                            </div>
                            <div class="col-sm-6 text-white" style="background-color: orange;">
                                <div><a>Bước 1: Chọn chuyến bay chiều đi</a></div>
                                <div><a>Bước 2: Chọn chuyến bay chiều về</a></div>
                                <div><a>Bước 3: Bấm vào nút Tiếp tục</a></div>
                            </div>
                        </div>        
                            <div>Chuyến Bay Không Tồn Tại</div>
                    </div>
                    </body>

                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                    crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                    crossorigin="anonymous"></script>
                    <script src="access/js/select-flights.js"></script>
                    </html>