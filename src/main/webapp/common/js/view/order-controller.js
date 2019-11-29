//장바구니 리스트 삭제
function deleteCartInfo(cartKeys) {
    if (cartKeys == null || cartKeys == undefined) return;
    var data = {
        cartKeys : cartKeys
    };
    var result = postApi("/order/deleteCartInfo", data);
    return result;
}

//주문서 작성 > 주문서 작성 > 장바구니에 담은 상품에서 주문서 작성으로 갈때
function getOrderSheetInfoFromCart(userKey, cartKeys) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        cartKeys : cartKeys
    };

    var InfoList = getApi("/order/getOrderSheetInfoFromCart/", userKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//주문서 작성 > 일반 상품 > '바로신청' 버튼으로 주문서 작성으로 갈때
function getOrderSheetInfoFromImmediately(userKey, gKeys) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        gKeys : gKeys
    };

    var InfoList = getApi("/order/getOrderSheetInfoFromImmediately/", userKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//주문서 작성 > 특별, 자유 패키지 > '바로신청' 버튼으로 주문서 작성으로 갈때
function getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, packageType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        goodsInfo : goodsInfo,
        packageType : packageType
    };

    var InfoList = getApi("/order/getOrderSheetInfoFromImmediatelyAtBasicPackage/", userKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//장바구니 리스트
function getUserCartInfo(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/order/getUserCartInfo/", userKey, "");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//주문배송조회 리스트
function getUserOrderDeliveryInfo(userKey, startDate, endDate, tagId) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        startDate: startDate,
        endDate : endDate
    };
    var InfoList = getApi("/order/getUserOrderDeliveryInfo/", userKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//주문배송 상세정보
function getUserOrderDeliveryInfo(userKey, jKey) {
    if (userKey == null || userKey == undefined) return;
    var pathData = userKey+"/"+jKey;
    var InfoList = getApi("/order/getUserOrderDeliveryInfo/", pathData, "");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;

    }
}

//내 강의실 > 나의 마일리지
function getUserPointInfo(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/order/getUserPointInfo/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//장바구니 담기(자유패키지 외 상품)
function saveCart(saveCartInfo) {
    if (saveCartInfo == null || saveCartInfo == undefined) return;
    var data = {
        saveCartInfo : saveCartInfo
    };
    var result = postApi("/order/saveCart", data);
    return  result;
}

//장바구니 담기(자유패키지)
//
// function saveCartFreePackage(userKey, gKeys) {
//     if (userKey == null || userKey == undefined) return;
//     var data = {
//         userKey : userKey,
//         gKeys : gKeys
//     };
//     var result = postApi("/order/saveCartFreePackage", data);
//     return  result;
// }