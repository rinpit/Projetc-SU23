<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
        <script type="text/javascript" src="access/jquery/jquery-3.6.0.min.js"></script>

        <!-- Search-Form -->
        <link href=access/Styles/reset-css.css rel="stylesheet" type="text/css"/>
        <link href="access/Styles/jquery-ui-1.8.7.all.css" rel="stylesheet" type="text/css"/>
        <link href=access/Styles/SearchView.css rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="access/Scripts/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" type="text/css"/>

        <title>Select Flight</title>
        <script>
            function calTotalAmount(passengers) {
                console.log(passengers);
                var prices = document.getElementsByClassName("price");
                return passengers * price[0].value * 1.1;
            }
        </script>
    </head>

    <body>
        <div class="container justify-content-around">
            <div class="row">
                <div class="col-sm-8" style="background-color: blanchedalmond ;">
                    <div class="row">
                        <div class="col-sm-6">
                            <a class="text-danger">Giá vé chưa bao gồm thuế và phí</a>
                            <br>
                            <a class="text-danger">${Departure} đi ${Destination}</a>
                            <br>
                            <a class="text-primary">Bay ngày: ${StartDate}</a>
                        </div>
                        <div class="col-sm-5 text-white" style="background-color: orange;">
                            <div><a>Bước 1: Chọn chuyến bay chiều đi</a></div>
                            <div><a>Bước 2: Chọn chuyến bay chiều về</a></div>
                            <div><a>Bước 3: Bấm vào nút Tiếp tục</a></div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <table class="search-result" style="width: 100%;">
                            <div id="accordion">
                                <thead>
                                    <tr class="table-danger">
                                        <th scope="col">Mã chuyến bay &nbsp</th>
                                        <th scope="col">Thời gian</th>
                                        <th scope="col">Giá vé</th>
                                        <th scope="col">Thông tin chi tiết &nbsp</th>
                                        <th scope="col">Chọn chuyến</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%--                        Bắt đầu tạo chuyến--%>
                                    <c:forEach items="${listFlight}" var="p">
                                        <tr class="table-info">
                                            <td><a>${p.flightId}</a></td>
                                            <td><strong>${p.startTime} - ${p.endTime} </strong></td>
                                            <td><input class="price" type="text" value="${listTicket.get(0).ticketPrice} VND"
                                                       style="background-color: rgb(65, 225, 225); border-radius: 50px; width: 120px;"
                                                       disabled></td>
                                            <td><a data-toggle="collapse" data-parent="#accordion" href="#${p.flightId}">Xem chi
                                                    tiết
                                                    <i class="bi bi-plus-square"></i></a>
                                            </td>
                                            <td><input type="radio" name="choose-flight"><label></label>Chọn</td>
                                        </tr>
                                        <tr class="table-success">
                                            <td colspan="12" class="hiddenRow">
                                                <div class="accordian-body collapse" id="${p.flightId}">
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Điểm đi</th>
                                                                <th>Điểm đến</th>
                                                                <th>Thời gian đi</th>
                                                                <th>Thời gian đến</th>
                                                                <th>Loại vé</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>${p.departure}</td>
                                                                <td>${p.destination}</td>
                                                                <td>${p.startTime},${p.startDate}</td>
                                                                <td>${p.endTime},${p.endDate}</td>
                                                                <td><select
                                                                        style="background-color: rgb(65, 225, 225); border-radius: 50px; "
                                                                        onchange="getValue(this)">
                                                                        <c:forEach items="${listTicket}" var="f">
                                                                            <option value="${f.ticketPrice} VND">${f.ticketType}</option>
                                                                        </c:forEach>
                                                                    </select></td>
                                                            </tr>
                                                        </tbody>
                                                        <thead>
                                                            <tr>
                                                                <th>Hành khách</th>
                                                                <th>Số lượng vé</th>
                                                                <th>Giá mỗi vé</th>
                                                                <th>VAT</th>
                                                                <th>Tổng giá</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Người lớn</td>
                                                                <td>${adult}</td>
                                                                <td><input class="price" type="text" value="${listTicket.get(0).ticketPrice} VND"
                                                                           style="background-color: rgb(65, 225, 225); border-radius: 50px; width: 120px;"
                                                                           disabled>
                                                                </td>
                                                                <td><p>10%</p></td>
                                                                <td class="total"></td>
                                                            </tr>
                                                        </tbody>
                                                        <tbody>
                                                            <c:if test="${kid > 0}">
                                                                <tr>
                                                                    <td>Trẻ em</td>
                                                                    <td>${kid}</td>
                                                                    <td><input class="price" type="text" value="${listTicket.get(0).ticketPrice} VND"
                                                                               style="background-color: rgb(65, 225, 225); border-radius: 50px; width: 120px;"
                                                                               disabled></td>
                                                                    <td>10%</td>
                                                                    <td class="total"></td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                        <tbody>
                                                            <c:if test="${baby > 0}">
                                                                <tr>
                                                                    <td>Trẻ sơ sinh</td>
                                                                    <td>${baby}</td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </c:forEach>
                                        <%--                        Kết thúc 1 chuyến--%>
                            </div>
                        </table>
                    </div>
                    <div class="submit-flight float-right">
                        <button href="#" type="button" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
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
    <script>
        function myFunction(e) {
                document.getElementById("${p.flightId}").value = e.target.value;
        }
    </script>

    <!-- Search-Form -->
    <script>
        var date = $('#datepicker1').datepicker({dateFormat: 'yy-mm-dd'}).val();
        var date = $('#datepicker2').datepicker({dateFormat: 'yy-mm-dd'}).val();

        function getValue(selectObject) {
            var someValue = selectObject.value;
            var inputs = document.getElementsByClassName("price");

            for (let i = 0; i < inputs.length; i++) {
                inputs[i].value = someValue;
            }
        }

        function undisable() {
            document.getElementById("datepicker2").disabled = false;
        }

        function resetDate() {
            document.getElementById("datepicker2").reset();
        }

    </script>
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
</html>
