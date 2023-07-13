<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <title>Ample Admin Lite Template by WrapPixel</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link href="plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
        <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet">
        <link href="./access/css/basic-table.css" rel="stylesheet">
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
                                    <span class="text-white font-medium">${email}</span></a>
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
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="listUser.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-table" aria-hidden="true"></i>
                                    <span class="hide-menu">Danh sách người dùng</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="listUser.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-table" aria-hidden="true"></i>
                                    <span class="hide-menu">Danh sách vé</span>
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
                <% }%>

                <!-- ============================================================== -->
                <!-- NỘI DUNG THAY ĐỔI Ở TRONG container-fluid-->
                <!-- ============================================================== -->
                <jsp:useBean id="cusList" class="Model.UserDAO"/>
                <jsp:useBean id="ticketList" class="Model.TicketDAO"/>
                <c:set var="page" value="${param.page}"/>

                <c:if test="${page == null}">
                    <c:set var="page" value="1"/>
                </c:if>
                <c:set var="pageSize" value="5"/>
                <c:set var="listTicket" value="${ticketList.getTicketByPage(page)}"/>
                <c:set var="maxPage" value="${cusList.getMaxPage(pageSize, ticketList.getTicket().size())}"/>
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="white-box">
                                <h3 class="box-title">Danh sách vé</h3>
                                <div class="table-responsive">
                                    <table class="table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">Ticket ID</th>
                                                <th class="border-top-0">Seat</th>
                                                <th class="border-top-0">Ngày đi</th>
                                                <th class="border-top-0">Giờ đi</th>
                                                <th class="border-top-0">Nơi đi</th>
                                                <th class="border-top-0">Nơi đến</th>
                                                <th class="border-top-0">Cổng</th>
                                                <th class="border-top-0">Hành lý</th>
                                                <th class="border-top-0">Tên hành khách</th>
                                                <th class="border-top-0">Loại vé</th>
                                                <th class="border-top-0">Ngày tạo vé</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="ticketArray" items="${listTicket}">
                                                    <tr>
                                                        <c:forEach var="ticket" items="${ticketArray}">
                                                            <td>${ticket}</td>
                                                        </c:forEach>
                                                    </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty listTicket}">
                        <div>
                            <ul class="pagination">
                                <c:if test="${page>1}">
                                    <li><input type="hidden"><a href="listTicket.jsp"><<</a></li>
                                    <li><input type="hidden"><a href="listTicket.jsp?page=${page!=1?page-1:1}"><</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                    <li><a class="${page == i?'active':''}" href="listTicket.jsp?page=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${page<maxPage}">
                                    <li><input type="hidden"><a href="listTicket.jsp?page=${page!=maxPage?page+1:maxPage}">></a></li>
                                    <li><input type="hidden"><a href="listTicket.jsp?page=${maxPage}">>></a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </c:if>
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
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
