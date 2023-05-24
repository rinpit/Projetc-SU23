<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Information" %>
<%@page import="Model.InformationDAO" %>
<%@page import="DBcontext.DB" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>Update Password</title>
        <script>
            function validateForm() {
                var recentPassword = document.getElementById("recentPassword").value;
                var newPassword1 = document.getElementById("newPassword1").value;
                var newPassword2 = document.getElementById("newPassword").value;
                // Kiểm tra mật khẩu hiện tại có trùng khớp với mật khẩu trong cơ sở dữ liệu
                if (recentPassword === "${information.getPassword()}") {
                    // Kiểm tra hai lần nhập mật khẩu mới có giống nhau không
                    if (newPassword1 === newPassword2) {
                        // Submit form
                        return true;
                    } else {
                        alert("Hai lần nhập mật khẩu mới không giống nhau. Hãy nhập lại.");
                        return false;
                    }
                } else {
                    alert("Mật khẩu hiện tại không đúng. Hãy nhập lại.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <c:set var="information" value="${requestScope.information}" />
        <c:set var="recentPassword" value="${information.getPassword()}" />
        <form action="UpdatePasswordServlet" method="post" class="was-validated" onsubmit="return validateForm();">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="form-group">
                            <label for="recentPassword">Mật khẩu hiện tại:</label>
                            <input type="password" class="form-control" id="recentPassword" placeholder="Nhập mật khẩu hiện tại" name="recentPasswordPara" required>
                            <div class="invalid-feedback">Hãy nhập trường này.</div>
                        </div>
                        <div class="form-group">
                            <label for="newPassword1">Mật khẩu mới:</label>
                            <input type="password" class="form-control" id="newPassword1" placeholder="Nhập mật khẩu mới" name="newPassword1Para" required>
                            <div class="invalid-feedback">Hãy nhập trường này.</div>
                        </div>
                        <div class="form-group">
                            <label for="newPassword">Nhập lại mật khẩu mới:</label>
                            <input type="password" class="form-control" id="newPassword" placeholder="Nhập mật lại mật khẩu mới" name="newPasswordPara" required>
                            <div class="invalid-feedback">Hãy nhập trường này.</div>
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="remember" required> Tôi xác nhận thông tin trên là đúng.
                                <div class="invalid-feedback">Hãy nhấn xác nhận.</div>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
