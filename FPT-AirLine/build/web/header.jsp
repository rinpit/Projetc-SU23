<%-- 
    Document   : header
    Created on : May 24, 2023, 9:50:01 PM
    Author     : Pham Thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPTAirLine</title>
        <link rel="stylesheet" href="./Styles/styles.css">
        <link rel="stylesheet" href="Font/themify-icons/themify-icons.css">

        <!--  -->

        <link href=Styles/reset-css.css rel="stylesheet" type="text/css" />
        <link href="Styles/jquery-ui-1.8.7.all.css" rel="stylesheet" type="text/css" />
        <link href=Styles/SearchView.css rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" type="text/css" />
    </head>
    <body>
        <div id="header">
            <div id="nav">
                <div class="logo">
                    <a href="index.jsp"><img src="./Img/FPT Airline.png" alt="" class="logo-img"></a>
                </div>

                <div class="nav-menu">
                    <div class="nav-sublist">
                        <i class="ti-user"></i>
                        <li><a href="login">Đăng nhập</a></li>
                        <li><a href="login">Đăng kí</a></li>
                        <select class="nav-sublist-select" name="" id="">
                            <option class="a" value="">Tiếng Việt</option>
                            <option value="">English</option>
                        </select>
                    </div>

                    <div class="nav-list">
                        <li><a href="#">Tra cứu</a></li>
                        <li><a href="#">Ưu đãi</a></li>
                        <li><a href="#">Dịch vụ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Liên hệ</a></li>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
