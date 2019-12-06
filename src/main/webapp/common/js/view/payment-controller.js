//주문키값 가져오기
function getJId() {
    //if (userKey == null || userKey == undefined) return;
    var infoList = getPayApi("/payment/getJId", "","");
    return infoList;
}

//이니페이 결과 저장하기 - 보류
function saveInipayInfo(data) {
    if (data == null || data == undefined) return;
    var result = postApi("/payment/saveInipayInfo", data);
    console.log(result);
}

function savePaymentInfo(data){
    if (data == null || data == undefined) return;
    var result = postApi("/payment/savePaymentInfo", data);
    console.log(result);
}