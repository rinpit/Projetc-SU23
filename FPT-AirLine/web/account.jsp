<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Information" %>
<%@page import="Model.InformationDAO" %>
<%@page import="DBcontext.DB" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/account.css"/>
    </head>
    <body>
        <c:set var="information" value="${requestScope.information}" />
        <div class="container"> 
            <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="card custom-card">
                        <div class="row custom-card-title">
                            <div class="col-6 col-lg-12"><a href="#">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fas fa-info-circle"></i></div>
                                        <div class="col-12 col-lg-9 title"> Tài khoản của tôi</div>
                                    </div>
                                </a></div>
                            <div class="col-6 col-lg-12"><a href="PersonalServlet">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fas fa-id-badge"></i></div>
                                        <div class="col-12 col-lg-9 title"> Thông tin cá nhân</div>
                                    </div>
                                </a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="card custom-card">
                        <div class="row custom-card-title">
                            <div class="col-12 title">Tài khoản</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"><i class="fas fa-id-card fa-fw"></i> ID</div>
                            <div class="col-8 custom-information">${information.getUserID()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"><i class="fas fa-phone-volume fa-fw"></i> Số điện thoại</div>
                            <div class="col-8 custom-information">${information.getPhone()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"><i class="fas fa-mail-bulk fa-fw"></i> Email</div>
                            <div class="col-8 custom-information">${information.getEmail()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"><i class="fas fa-lock fa-fw"></i> Mật khẩu</div>
                            <div class="col-8 custom-information">${information.getPassword()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"></div>
                            <div class="col-8 custom-information"><a href="UpdatePasswordServlet"><i class="fas fa-edit fa-fw"></i><span class="title"> Đổi mã pin</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
