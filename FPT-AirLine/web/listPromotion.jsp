<%-- 
    Document   : updateTicketTypePrice
    Created on : Jun 14, 2023, 9:09:44 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords"
              content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title>Danh sách mã giảm giá</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link href="plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
        <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
        <!-- Custom CSS -->
        <link href="cssHome/style.min.css" rel="stylesheet">
        <link rel="stylesheet" href="access/css/updateTicketTypePrice.css"/>
    </head>
    <body>
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <%
                    // Kiểm tra vai trò của người dùng
                    String role = (String) session.getAttribute("role");
                    // Kiểm tra xem người dùng có phải là admin hay không
                    boolean isAdmin = "admin".equals(role);
                        %>
                        <% if (!isAdmin) { %>
                        <a class="navbar-brand" href="homepage.jsp">
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img style="width: 100%" src="plugins/images/users/logo_employee.png" alt="homepage" />
                            </span>
                        </a>
                        <% } %>
                        <!-- ============================================================== -->
                        <!-- Logo -->
                        <!-- ============================================================== -->
                        <% if (isAdmin) { %>
                        <a class="navbar-brand" href="homepage.jsp">
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img style="width: 100%" src="plugins/images/users/logo_admin.png" alt="homepage" />
                            </span>
                        </a>
                        <% } %>
                        <!-- ============================================================== -->
                        <!-- End Logo -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">

                        <!-- ============================================================== -->
                        <!-- Right side toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav ms-auto d-flex align-items-center">

                            <!-- ============================================================== -->
                            <!-- Log out -->
                            <!-- ============================================================== -->
                            <li>
                                <a href="logoutServlet" class="item logout-site" title="Logout">
                                    <i class="la la-sign-in-alt"></i>Đăng xuất
                                </a>
                            </li>
                            <!-- ============================================================== -->
                            <!-- User profile and search -->
                            <!-- ============================================================== -->
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="plugins/images/users/avatar.webp" alt="user-img" width="36"
                                         class="img-circle"><span class="text-white font-medium">${email}</span></a>
                            </li>
                            <!-- ============================================================== -->
                            <!-- User profile and search -->
                            <!-- ============================================================== -->
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <!-- User Profile-->
                            <li class="sidebar-item pt-2">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard.html"
                                   aria-expanded="false">
                                    <i class="far fa-clock" aria-hidden="true"></i>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <% if (!isAdmin) { %>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="ticketTypeServlet"
                                   aria-expanded="false">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span class="hide-menu">Danh sách loại vé</span>
                                </a>
                            </li>
                            <% } %>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="basic-table.html"
                                   aria-expanded="false">
                                    <i class="fa fa-table" aria-hidden="true"></i>
                                    <span class="hide-menu">Basic Table</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="fontawesome.html"
                                   aria-expanded="false">
                                    <i class="fa fa-font" aria-hidden="true"></i>
                                    <span class="hide-menu">Icon</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="map-google.html"
                                   aria-expanded="false">
                                    <i class="fa fa-globe" aria-hidden="true"></i>
                                    <span class="hide-menu">Google Map</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="blank.html"
                                   aria-expanded="false">
                                    <i class="fa fa-columns" aria-hidden="true"></i>
                                    <span class="hide-menu">Blank Page</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="404.html"
                                   aria-expanded="false">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    <span class="hide-menu">Error 404</span>
                                </a>
                            </li>
                            <li class="text-center p-20 upgrade-btn">
                                <a href="https://www.wrappixel.com/templates/ampleadmin/"
                                   class="btn d-grid btn-danger text-white" target="_blank">
                                    Upgrade to Pro</a>
                            </li>
                        </ul>

                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->

                <% if (!isAdmin) { %>
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title"></h4>
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><a href="listPromotionServlet" class="fw-normal">Xem danh sách mã giảm giá</a></li>
                                </ol>
                                <a href="createPromotion.jsp"
                                   class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">Tạo mã giảm giá</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <% } %>

                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                
                <div class="container-fluid">
                    <div class="container">
                        <div class="table">
                            <div class="table-header">
                                <div class="header__item"><a id="wins" class="filter__link filter__link--number">Mã code</a></div>
                                <div class="header__item"><a id="draws" class="filter__link filter__link--number">Mô tả</a></div>
                                <div class="header__item"><a id="losses" class="filter__link filter__link--number">Ngày bắt đầu</a></div>
                                <div class="header__item"><a id="losses" class="filter__link filter__link--number">Ngày kết thúc</a></div>
                                <div class="header__item"><a id="losses" class="filter__link filter__link--number">Giá</a></div>

                            </div>
                            <c:forEach items="${listPromotion}" var="lp">
                                <div class="table-content">	
                                    <div class="table-row">		
                                        <div class="table-data">${lp.promotionID}</div>
                                        <div class="table-data">${lp.description}</div>
                                        <div class="table-data">${lp.startDate}</div>
                                        <div class="table-data">${lp.endDate}</div>
                                        <div class="table-data">${lp.amount}</div>
                                    </div>
                                </div>
                            </c:forEach>    
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <footer class="footer text-center"> 2021 © Ample Admin brought to you by <a
                        href="https://www.wrappixel.com/">wrappixel.com</a>
                </footer>
                <!-- ============================================================== -->
                <!-- End footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/app-style-switcher.js"></script>
        <script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
        <!--Wave Effects -->
        <script src="js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/custom.js"></script>
        <!--This page JavaScript -->
        <!--chartis chart-->
        <script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
        <script src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
        <script src="js/pages/dashboards/dashboard1.js"></script>
    </body>
</html>
