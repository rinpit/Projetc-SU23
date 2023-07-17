var animateButton = function (e) {

    e.preventDefault;
    //reset animation
    e.target.classList.remove('animate');

    e.target.classList.add('animate');
    setTimeout(function () {
        e.target.classList.remove('animate');
    }, 700);
};

var bubblyButtons = document.getElementsByClassName("bubbly-button");

for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('click', animateButton, false);
}



//
//function validateDateKid(event) {
//    event.preventDefault(); // Ngăn chặn chuyển trang mặc định
//
//    var selectedDate = new Date(document.getElementById("birthdateKid").value);
//    var today = new Date();
//    var minDate = new Date();
//    minDate.setFullYear(today.getFullYear() - 11); // Giới hạn từ 11 tuổi trở lại
//    minDate.setDate(minDate.getDate() - 365 * 2); // Giới hạn từ 2 năm trước ngày hiện tại (không chính xác 730 ngày)
//
//    if (selectedDate < minDate || selectedDate > today) {
//        alert("Vui lòng chọn ngày sinh trẻ em hợp lệ!");
//        return false;
//    }
//
//    // Ngày sinh hợp lệ, cho phép chuyển trang
//    // document.getElementById("formId").submit(); // Gửi form
//    // window.location.href = "new-page.html"; // Chuyển trang
//
//    return true;
//}
//
//// Lấy ngày hiện tại
//var today = new Date().toISOString().split('T')[0];
//
//// Thiết lập giá trị tối đa cho thẻ input ngày sinh người lớn
//document.getElementById("birthdateAdult").max = today;
//
//function validateDateAdult(event) {
//    event.preventDefault(); // Ngăn chặn chuyển trang mặc định
//
//    var birthdateInput = document.getElementById("birthdateAdult");
//    var selectedDate = new Date(birthdateInput.value);
//
//    // Kiểm tra nếu ngày sinh không hợp lệ hoặc nhỏ hơn tuổi 18
//    if (isNaN(selectedDate) || selectedDate > new Date(today) || getAge(selectedDate) < 18) {
//        alert("Vui lòng chọn ngày sinh người lớn hợp lệ!");
//        birthdateInput.value = ""; // Xóa giá trị ngày sinh
//        return false;
//    }
//
//    // Ngày sinh hợp lệ, cho phép chuyển trang
//    // document.getElementById("formId").submit(); // Gửi form
//    // window.location.href = "new-page.html"; // Chuyển trang
//
//    return true;
//}
//function getAge(date) {
//    var today = new Date();
//    var age = today.getFullYear() - date.getFullYear();
//    var monthDiff = today.getMonth() - date.getMonth();
//    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < date.getDate())) {
//        age--;
//    }
//    return age;
//}