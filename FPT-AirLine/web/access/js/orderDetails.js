function CaculatePrice() {
    var numA = document.getElementsByClassName("sAdult");
    var numberAdult = numA[0].innerText.substring(0, 1);
    console.log(numberAdult);
    var numK = document.getElementsByClassName("sKid");
    var typePriceA = document.getElementsByClassName("typePriceA");
    console.log(typePriceA);
    typePriceA = typePriceA[0].innerText.split(",").join('');
    var totalA = numberAdult * typePriceA;
    var totalPriceA = document.getElementsByClassName("totalPriceA");
    totalPriceA[0].innerText = parseInt(totalA, 10).toLocaleString() + " VND";
    var totalK = 0;
    if (numK.length > 0) {
        var numberKid = numK[0].innerText.substring(0, 1);
        console.log(numberKid);
        var typePriceK = document.getElementsByClassName("typePriceK");
        typePriceK = typePriceK[0].innerText.split(",").join('');
        console.log(typePriceK);
        totalK = numberKid * typePriceK;
        var totalPriceK = document.getElementsByClassName("totalPriceK");
        totalPriceK[0].innerText = parseInt(totalK, 10).toLocaleString() + " VND";
    }
    var finalTotal = document.getElementById("totalld");
    var total = totalA * 1.1 + totalK * 1.1;
    finalTotal.value = parseInt(total, 10).toLocaleString() + " VND";
}

CaculatePrice();


