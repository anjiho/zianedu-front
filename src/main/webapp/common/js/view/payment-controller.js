//주문키값 가져오기
function getJId() {
    //if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/payment/getJId", "","");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//이니페이 결과 저장하기 - 보류
function saveInipayInfo(data) {
    var result = postApi("/payment/saveInipayInfo", data);
}

//결제 결과 저장하기 - 보류
// /payment/savePaymentInfo