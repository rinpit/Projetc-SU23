function myFunction(e) {
    document.getElementById("${p.flightId}").value = e.target.value
}

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

function calTotalAmount(passengers) {
    console.log(passengers);
    var prices = document.getElementsByClassName("price");
    return passengers * price[0].value * 1.1;
}
