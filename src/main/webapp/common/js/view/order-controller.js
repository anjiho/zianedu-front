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
function getUserCartInfo(userKey) {
    if (userKey == null || userKey == undefined) return;
    var infoList = getApi("/order/getUserCartInfo/", userKey, "");
    var totalSellPrice = 0;
    var totalPoint = 0;
    if (infoList != null) {
        console.log(infoList);
        if(infoList.result.deliveryPrice == 0){
            innerHTML("deliveryPrice", "0");
        }else{
            innerHTML("deliveryPrice", infoList.deliveryPriceName);
        }
       // innerHTML("deliveryPrice", infoList.deliveryPriceName);
        if (infoList.result.academyCartInfo.length > 0) {
            for (var i = 0; i < infoList.result.academyCartInfo.length; i++) {
                var acaInfo = infoList.result.academyCartInfo[i];
                totalSellPrice += acaInfo.sellPrice;
                totalPoint += acaInfo.point;
                var returnHtml = "<tr>";
                returnHtml += "<td><input type=\"checkbox\" name='acaChk' id='"+ acaInfo.cartKey +"' class=\"ck\"></td>";
                returnHtml += "<td>";
                returnHtml += "" + acaInfo.goodsName + " <br>";
                returnHtml += "<span class=\"text_blue\">판매가격 : </span>" + acaInfo.kind + "개월<span class=\"thm text_blue pl30\">" + acaInfo.sellPriceName + "</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "<span class=\"thm line\">" + acaInfo.priceName + "</span><span class=\"arrow\"></span>";
                returnHtml += "<span class=\"thm text_blue\">" + acaInfo.sellPriceName + "</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += acaInfo.pointName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#acaList").append(returnHtml);
            }
        }else{
            $("#acaDiv").hide();
        }

        if (infoList.result.videoCartInfo.length > 0) {
            for (var j = 0; j < infoList.result.videoCartInfo.length; j++) {
                var playInfo = infoList.result.videoCartInfo[j];
                totalSellPrice += playInfo.sellPrice;
                totalPoint += playInfo.point;
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='playChk' id='"+ playInfo.cartKey +"' class=\"ck2\"></td>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "" + playInfo.goodsName + "<br>";
                if (playInfo.kind == 100) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span><span class=\"thm text_blue pl30\">" + playInfo.sellPriceName + "</span>";
                } else if (playInfo.kind == 101) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">모바일</span><span class=\"thm text_blue pl30\">" + playInfo.sellPriceName + "</span>";
                } else {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span><span class=\"thm text_blue pl30\">" + playInfo.sellPriceName + "</span>";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += playInfo.subjectCount;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "<span class=\"thm line\">" + playInfo.priceName + "</span><span class=\"arrow\">＞</span>";
                returnHtml += "<span class=\"thm text_blue\">" + playInfo.sellPriceName + "</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += playInfo.pointName;
                returnHtml += "</td>";
                returnHtml += "<tr>";
                $("#playList").append(returnHtml);
            }
        }else{
            $("#playDiv").hide();
        }

        if (infoList.result.promotionCartInfo.length > 0) {
            for (var k = 0; k < infoList.result.promotionCartInfo.length; k++) {
                var promotionInfo = infoList.result.promotionCartInfo[k];
                console.log(promotionInfo);
                totalSellPrice += promotionInfo.sellPrice;
                totalPoint += promotionInfo.point;
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='promotionChk' id='"+ promotionInfo.cartKey +"' class=\"ck3\">";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += promotionInfo.goodsName;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "<span class=\"thm line\">" + promotionInfo.priceName + "</span><span class=\"arrow\"></span>";
                returnHtml += "<span class=\"thm text_blue\">" + promotionInfo.sellPriceName + "</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += promotionInfo.pointName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#promotionList").append(returnHtml);
            }
        }else{
            $("#promotionDiv").hide();
        }

        if (infoList.result.bookCartInfo.length > 0) {
            for (var l = 0; l < infoList.result.bookCartInfo.length;l++) {
                var bookInfo = infoList.result.bookCartInfo[l];
                totalSellPrice += bookInfo.sellPrice;
                totalPoint += bookInfo.point;
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='bookChk' id='"+ bookInfo.cartKey +"' class=\"ck4\"></td>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += bookInfo.goodsName;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "<span class=\"thm line\">"+ bookInfo.priceName +"</span><span class=\"arrow\">＞</span>";
                returnHtml += "<span class=\"thm text_blue\">"+ bookInfo.sellPriceName +"</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += bookInfo.pointName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#bookList").append(returnHtml);
            }
        }else{
            $("#bookDiv").hide();
        }

        innerHTML("price", format(totalSellPrice));
        innerHTML("totalPrice", format(totalSellPrice));
        innerHTML("totalPoint", format(totalPoint));
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
    console.log(data);
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