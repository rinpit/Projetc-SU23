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
                            <div class="col-6 col-lg-12"><a href="#">
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
                            <div class="col-6 col-lg-12"><a href="/mavenproject1/cancelTicket.jsp">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fa fa-ban"></i></div>
                                        <div class="col-12 col-lg-9 title"> Hủy vé</div>
                                    </div>
                                </a></div>
                            <div class="col-6 col-lg-12"><a href="lookUpFlight.jsp">
                                    <div class="row">
                                        <div class="col-12 col-lg-3"><i class="fa fa-search"></i></div>
                                        <div class="col-12 col-lg-9 title"> Tra cứu chuyến bay</div>
                                    </div>
                                </a></div> 
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="card custom-card">
                        <div class="row custom-card-title">
                            <div class="col-4" >Thông tin cá nhân</div>
                            <div class="col-8"><a href="http://localhost:8080/mavenproject1/UpdateInformationServlet"><i class="fas fa-user-edit fa-fw"></i><span> Cập nhật</span></a></div>
                        </div> 
                        <div class="row custom-card-item">
                            <div class="col-4">Họ và tên</div>
                            <div class="col-8 custom-information">${information.getName()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4">Ngày sinh</div>
                            <div class="col-8 custom-information">${information.getBirthday()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4">Căn cước công dân</div>
                            <div class="col-8 custom-information">${information.getCccd()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4"></i>Quốc tịch</div>
                            <div class="col-8 custom-information">${information.getNationality()}</div>
                        </div>
                    </div>
                    <div class="card custom-card">
                        <div class="row custom-card-title">
                            <div class="col-4">Thông tin liên hệ</div>
                            <div class="col-8"><a href="http://localhost:8080/mavenproject1/UpdateInformationServlet"><i class="fas fa-user-edit fa-fw"></i><span> Cập nhật</span></a></div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4">Số điện thoại</div>
                            <div class="col-8 custom-information">${information.getPhone()}</div>
                        </div>
                        <div class="row custom-card-item">
                            <div class="col-4">Địa chỉ</div>
                            <div class="col-8 custom-information">${information.getAddress()}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
