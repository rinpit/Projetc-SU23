function myFunction(e) {
    document.getElementById("${p.flightId}").value = e.target.value
}

var date = $('#datepicker1').datepicker({dateFormat: 'yy-mm-dd'}).val();
var date = $('#datepicker2').datepicker({dateFormat: 'yy-mm-dd'}).val();

function getValue(selectObject) {
    var numA = document.getElementsByClassName("numA");
    var numK = document.getElementsByClassName("numK");
    var numberAdult = numA[0].innerText;
    var numberKid = numK[0].innerText;
    var someValue = selectObject.value;
    var typePrice = someValue.substring(0,9).split(",").join('');
    var totalAdult = 1.1 * numberAdult * typePrice;
    var totalKid = 1.1 * numberKid * typePrice;
    var totalAdultS = parseInt(totalAdult, 10).toLocaleString() + " VND";
    var totalKidS = parseInt(totalKid, 10).toLocaleString() + " VND";
    var inputs = document.getElementsByClassName("price");
    var totalA = document.getElementsByClassName("totalAdult");
    var totalK = document.getElementsByClassName("totalKid");

    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = someValue;
    }
    
    for (let i = 0; i < totalA.length; i++) {
        totalA[i].value = totalAdultS;
    }
    
    for (let i = 0; i < totalK.length; i++) {
        totalK[i].value = totalKidS;
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
