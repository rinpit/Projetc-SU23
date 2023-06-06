<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>chọn vé</title>
        <link rel="stylesheet" href="access/css/orderDetail.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container mt-5 pt-5" >
            <div class="row">
                <div class="col-8 ">
                    <div class="content-right bg-light" style="  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); ">
                        <div class="heading-h3">
                            <h3>
                                <span>Thông tin chuyến bay</span>
                            </h3>
                        </div>
                        <table class="info_flight" width="100%">
                            <tbody>
                                <tr>
                                    <td>Chuyến bay:</td>
                                    <td>
                                        <b>Khứ hồi</b>
                                    </td>
                                    <td>Số lượng hành khách:</td>
                                    <td>
                                        <b>${adult} người lớn, ${kid} trẻ em, ${baby} trẻ sơ sinh</b>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Ngày xuất phát:</td>
                                    <td>
                                        <b>${StartDate}</b>
                                    </td>
                                    <td>Ngày về:</td>
                                    <td>
                                        <b>${EndDate}</b>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>

                        <table width="97%" style="background: #e7e7e7; margin: 0 10px 10px" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <span><img style="width: 200px" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/346174991_938688050705337_5510518778339764567_n.png?_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=74Rt-4oHONkAX83EHxV&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRK96Hza83actCHEgbZiTdP5U7xB1yPEo5iwGC7Sop-8A&oe=649AA78B" alt="FPT Airline"/></span>
                                    </td>
                                    <td class="dep-res">
                                        <a>Điểm đi</a> <br>
                                        <strong style="color: #000">${Departure}</strong> <br>
                                        <strong style="color: #000">${StartDate}</strong>
                                    </td>
                                    <td>
                                        <a></a> <br>
                                        <span><img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/349448550_229029786542212_455189157684848947_n.png?stp=cp0_dst-png&_nc_cat=105&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Mi25v96bEmUAX9NpKuL&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRLVkhjpxc05_bdJ5gDlqiwUbeefntJhKkSbh6UOyO6hQ&oe=649AB773" alt="alt"/></span>
                                    </td>
                                    <td class="dep-res">
                                        <a>Điểm đến</a> <br>
                                        <strong style="color: #000">${Destination}</strong> <br>
                                    </td>
                                </tr>

<!--                                <tr>
                                    <td></td>
                                    <td class="ticket-type">
                                        <p>Loại vé:
                                            <strong style="color: #000"> Thương gia</strong>
                                        </p>
                                    </td>
                                </tr>-->
                            </tbody>
                        </table>

                        <table width="97%" style="background: #e7e7e7; margin: 0 10px 10px" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <span><img style="width: 200px" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/346174991_938688050705337_5510518778339764567_n.png?_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=74Rt-4oHONkAX83EHxV&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRK96Hza83actCHEgbZiTdP5U7xB1yPEo5iwGC7Sop-8A&oe=649AA78B" alt="FPT Airline"/></span>
                                    </td>
                                    <td class="dep-res">
                                        <a>Điểm đi</a> <br>
                                        <strong style="color: #000">${Destination}</strong> <br>
                                        <strong style="color: #000">${EndDate}</strong>
                                    </td>
                                    <td>
                                        <a></a> <br>
                                        <span><img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/349448550_229029786542212_455189157684848947_n.png?stp=cp0_dst-png&_nc_cat=105&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Mi25v96bEmUAX9NpKuL&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRLVkhjpxc05_bdJ5gDlqiwUbeefntJhKkSbh6UOyO6hQ&oe=649AB773" alt="alt"/></span>
                                    </td>
                                    <td class="dep-res">
                                        <a>Điểm về</a> <br>
                                        <strong style="color: #000">${Departure}</strong> <br>
                                        <strong style="color: #000"></strong>
                                    </td>
                                </tr>
<!--                                <tr>
                                    <td></td>
                                    <td class="ticket-type">
                                        <p>Loại vé:
                                            <strong style="color: #000"> Thương gia</strong>
                                        </p>
                                    </td>
                                </tr>-->
                            </tbody>
                        </table>

                        <div class="dieu-kien-ve">
                            <div class="heading-h3" onclick="myFunction()" style="cursor:pointer;">
                                <h3>
                                    <span>Điều kiện vé</span>
                                    <i style="margin-right:10px; padding-top: 10px; font-size: 18px;float:right;">Bấm để xem chi tiết</i>
                                </h3>
                            </div>
                            <div id="myDIV" style="display: none">
                                <strong style="font-size: 18px; margin:0 5%; line-height: 22px; display: inline-block;">Điều kiện vé chiều đi</strong>
                                <span class="dieu-kien-chieu-di">
                                    <table cellpadding="8" cellspacing="0" height="70" style="table-layout: fixed;">
                                        <colgroup>
                                            <col width="200">
                                            <col width="450">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <span style="color: #F44D06; line-height: 32px; padding: 0px;">Điều kiện hành lý  </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hành lý xách tay</td>
                                                <td>7 kg</td>
                                            </tr>
                                            <tr>
                                                <td>Hành lý ký gửi</td>
                                                <td>Vui lòng chọn ở bước sau</td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <table cellpadding="8" cellspacing="0" height="70" style="table-layout: fixed;">
                                        <colgroup>
                                            <col width="200">
                                            <col width="450">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <span style="color: #F44D06; line-height: 32px; padding: 0px;">Điều kiện về vé  </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Đổi tên hành khách</td>
                                                <td>Không được phép</td>
                                            </tr>
                                            <tr>
                                                <td>Đổi Hành Trình</td>
                                                <td>Được phép - Thu phí : 500.000 VND + chênh lệch giá vé (nếu có)</td>
                                            </tr>
                                            <tr>
                                                <td>Bảo lưu</td>
                                                <td>Không được phép</td>
                                            </tr>
                                            <tr>
                                                <td>Thời hạn thay đổi (bao gồm thay đổi tên, ngày/chuyến bay, hành trình)</td>
                                                <td>Trước 12 tiếng so với giờ khởi hành</td>
                                            </tr>
                                            <tr>
                                                <td>Thay đổi chuyến bay</td>
                                                <td>Được phép - Thu phí: 500.000 VND + chênh lệch giá vé (nếu có)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </span>
                                <hr style="border-width: 2px; border-style: solid; border-color: #F44D06">
                                <strong style="font-size: 18px; margin:0 5%; line-height: 22px; display: inline-block;">Điều kiện vé chiều về</strong>
                                <span class="dieu-kien-chieu-ve">
                                    <table cellpadding="8" cellspacing="0" height="70" style="table-layout: fixed;">
                                        <colgroup>
                                            <col width="200">
                                            <col width="450">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <span style="color: #F44D06; line-height: 32px; padding: 0px;">Điều kiện hành lý  </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hành lý xách tay</td>
                                                <td>7 kg</td>
                                            </tr>
                                            <tr>
                                                <td>Hành lý ký gửi</td>
                                                <td>Vui lòng chọn ở bước sau</td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <table cellpadding="8" cellspacing="0" height="70" style="table-layout: fixed;">
                                        <colgroup>
                                            <col width="200">
                                            <col width="450">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <span style="color: #F44D06; line-height: 32px; padding: 0px;">Điều kiện về vé  </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Đổi tên hành khách</td>
                                                <td>Không được phép</td>
                                            </tr>
                                            <tr>
                                                <td>Đổi Hành Trình</td>
                                                <td>Được phép - Thu phí : 500.000 VND + chênh lệch giá vé (nếu có)</td>
                                            </tr>
                                            <tr>
                                                <td>Bảo lưu</td>
                                                <td>Không được phép</td>
                                            </tr>
                                            <tr>
                                                <td>Thời hạn thay đổi (bao gồm thay đổi tên, ngày/chuyến bay, hành trình)</td>
                                                <td>Trước 12 tiếng so với giờ khởi hành</td>
                                            </tr>
                                            <tr>
                                                <td>Thay đổi chuyến bay</td>
                                                <td>Được phép - Thu phí: 500.000 VND + chênh lệch giá vé (nếu có)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </span>
                            </div>
                        </div>

                        <div class="thong-tin-hanh-ly">
                            <div class="heading-h3">
                                <h3>
                                    <span>Thông tin hành lý</span>
                                </h3>
                            </div>
                            <table width="100%" cellpadding="0" cellspacing="0" style="padding: 15px";">
                                <tbody> 
                                    <!-- hành lý lượt đi -->
                                    <tr style="background: #ffffff">
                                        <td >
                                            <span style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Hành lý lượt đi</span>
                                        </td>
                                        <td>
                                            <!-- người lớn -->
                                            <c:forEach var="list" begin="1" end="2"> 
                                                <p>
                                                    <span>hành khách thứ ${list}</span>
                                                    <select>
                                                        <option value="0">Không mang hành lý</option>
                                                        <option value="200000">Thêm 20Kg hành lý (200,000 VND)</option>
                                                        <option value="300000">Thêm 30Kg hành lý (300,000 VND)</option>
                                                        <option value="400000">Thêm 40Kg hành lý (400,000 VND)</option>
                                                        <option value="500000">Thêm 50Kg hành lý (500,000 VND)</option>
                                                        <option value="600000">Thêm 60Kg hành lý (600,000 VND)</option>
                                                        <option value="700000">Thêm 70Kg hành lý (700,000 VND)</option>
                                                    </select>
                                                </p>
                                            </c:forEach>
                                            <!-- trẻ em -->
                                            <c:forEach var="list" begin="1" end="2"> 
                                                <p>
                                                    <span style="margin-right: 35px">trẻ em thứ ${list}</span>
                                                    <select>
                                                        <option value="0">Không mang hành lý</option>
                                                        <option value="200000">Thêm 20Kg hành lý (200,000 VND)</option>
                                                        <option value="300000">Thêm 30Kg hành lý (300,000 VND)</option>
                                                        <option value="400000">Thêm 40Kg hành lý (400,000 VND)</option>
                                                        <option value="500000">Thêm 50Kg hành lý (500,000 VND)</option>
                                                        <option value="600000">Thêm 60Kg hành lý (600,000 VND)</option>
                                                        <option value="700000">Thêm 70Kg hành lý (700,000 VND)</option>
                                                    </select>
                                                </p>
                                            </c:forEach>
                                        </td>

                                    </tr>

                                    <!-- hành lý lượt về -->
                                    <tr>
                                        <td >
                                            <span style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Hành lý lượt về</span>
                                        </td>
                                        <td>
                                            <!-- người lớn -->
                                            <c:forEach var="list" begin="1" end="3"> 
                                                <p>
                                                    <span>hành khách thứ ${list}</span>
                                                    <select>
                                                        <option value="0">Không mang hành lý</option>
                                                        <option value="200000">Thêm 20Kg hành lý (0 VND)</option>
                                                        <option value="300000">Thêm 30Kg hành lý (300,000 VND)</option>
                                                        <option value="400000">Thêm 40Kg hành lý (400,000 VND)</option>
                                                        <option value="500000">Thêm 50Kg hành lý (500,000 VND)</option>
                                                        <option value="600000">Thêm 60Kg hành lý (600,000 VND)</option>
                                                        <option value="700000">Thêm 70Kg hành lý (700,000 VND)</option>
                                                    </select>
                                                </p>
                                            </c:forEach>
                                            <!-- trẻ em -->
                                            <c:forEach var="list" begin="1" end="2"> 
                                                <p>
                                                    <span style="margin-right: 35px">trẻ em thứ ${list}</span>
                                                    <select>
                                                        <option value="0">Không mang hành lý</option>
                                                        <option value="200000">Thêm 20Kg hành lý (200,000 VND)</option>
                                                        <option value="300000">Thêm 30Kg hành lý (300,000 VND)</option>
                                                        <option value="400000">Thêm 40Kg hành lý (400,000 VND)</option>
                                                        <option value="500000">Thêm 50Kg hành lý (500,000 VND)</option>
                                                        <option value="600000">Thêm 60Kg hành lý (600,000 VND)</option>
                                                        <option value="700000">Thêm 70Kg hành lý (700,000 VND)</option>
                                                    </select>
                                                </p>
                                            </c:forEach>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="heading-h3">
                            <h3>
                                <span>Thông tin hành khách</span>
                            </h3>
                        </div>
                        <c:forEach var="list" begin="1" end="2"><!-- người lớn -->
                            <table width="100%" cellpadding="0" cellspacing="0" style="padding: 15px; background: #ffffff";">
                                <tr>      
                                    <td colspan="1">
                                        <b style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Người lớn ${list}</b>
                                    </td>
                                    <td colspan="2">
                                        <p><input type="text" style="width: 270px" name="name${list}"></p>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="1">
                                        <span style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Ngày sinh</span>
                                    </td>
                                    <td>
                                        <input type="date" name="txtDate" id="txtDate" min="1900-01-01" style="margin-bottom: 10px"/>
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>



                        <c:forEach var="list" begin="1" end="2"><!-- trẻ em -->
                            <table width="100%" cellpadding="0" cellspacing="0" style="padding-top: : 150px; ";">
                                <tr>      
                                    <td colspan="1">
                                        <b style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Trẻ em ${list}</b>
                                    </td>
                                    <td colspan="2">
                                        <p><input type="text" style="width: 270px;"></p>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="1">
                                        <span style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Ngày sinh</span>
                                    </td>
                                    <td>
                                        <input type="date" name="txtDate" id="txtDate" min="1900-01-01" style="margin-bottom: 10px"/>
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>

                        <c:forEach var="list" begin="1" end="2"> <!-- trẻ sơ sinh -->
                            <table width="100%" cellpadding="0" cellspacing="0" style="padding-top: : 150px; background: #ffffff";">
                                <tr>      
                                    <td colspan="1">
                                        <b style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Trẻ sơ sinh ${list}</b>
                                    </td>
                                    <td colspan="2">
                                        <p><input type="text" style="width: 270px;"></p>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="1">
                                        <span style="font-size: 14px;  width: 140px;  display: block; margin-left: 20px;">Ngày sinh</span>
                                    </td>
                                    <td>
                                        <input type="date" name="txtDate" id="txtDate" min="2020-01-01" style="margin-bottom: 10px"/>
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>

                    </div>
                </div>
                <div class="col-3 p-0">
                    <div class="price-details">
                        <h3 class="price-details-title">Chi tiết giá</h3>
                        <table class="price-details-list">

                        </table>
                        <table class="infoticket" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td colspan="5" style="color: #f44d06;font-size: 18px;font-weight: bold;">Chi tiết giá vé lượt đi</td>
                                </tr>
                                <tr>
                                    <td><span>1 Người lớn</span></td>
                                    <td><b>X</b></td>
                                    <td style="text-align: right;">
                                        <b class="color-red">
                                            <script type="text/javascript">
                                                document.write(formatCurrency(369000));
                                            </script>369.000 .VND
                                        </b>
                                    </td>
                                    <td style="padding:0px;">=</td>
                                    <td style="text-align: right;">
                                        <b class="color-red">
                                            <script type="text/javascript">
                                                document.write(formatCurrency(369000));
                                            </script>369.000 .VND
                                        </b>
                                    </td>
                                </tr>
                                <!-- thue phi-->
                                <tr class="border-airline">
                                    <td colspan="5"></td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="font-weight:bold">Thuế và phí</td>
                                </tr>
                                <tr>
                                    <td><span>1 Người lớn</span></td>
                                    <td><b>X</b></td>
                                    <td style="text-align: right;">
                                        <b class="color-red">
                                            <script type="text/javascript">
                                                document.write(formatCurrency(
                                                        816000));
                                            </script>816.000 .VND
                                        </b>
                                    </td>
                                    <td style="padding:0px;">=</td>
                                    <td style="text-align: right;">
                                        <b class="color-red">
                                            <script type="text/javascript">
                                                document.write(formatCurrency(816000));
                                            </script>816.000 .VND
                                        </b>
                                    </td>

                                </tr>

                                <tr class="border-airline">
                                    <td colspan="5"></td>
                                </tr>
                                <tr>
                                    <td><span style="font-weight:bold">Hành Lý</span></td>
                                    <td colspan="4" id="valuehanhlyld"><span> <b class="color-red">
                                                0 VND</b>
                                        </span></td>
                                </tr>
                                <tr class="border-airline">
                                    <td colspan="5"></td>
                                </tr>
                                <tr>
                                    <td><span style="font-weight:bold">Tổng giá</span></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td id="totalld" style="font-weight:bold; text-align:right"><span data="1185000">
                                            <b class="color-red">
                                                <script type="text/javascript">
                                                    document.write(formatCurrency(1185000));
                                                </script>1.185.000 .VND
                                            </b></span></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>






        <script type="text/javascript">
            function myFunction() {
                var x = document.getElementById('myDIV');
                if (x.style.display === 'none') {
                    x.style.display = 'block';
                } else {
                    x.style.display = 'none';
                }
            }
        </script>
    </body>
</html>
