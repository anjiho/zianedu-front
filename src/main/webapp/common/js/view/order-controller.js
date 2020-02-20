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
    var infoList = getApi("/order/getOrderSheetInfoFromCart/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
             var  productNamAarr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                if(orderInfo.type != 3){
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", false);
                }else{
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", true);
                }
                productNamAarr.push(orderInfo.productName);//결제할때 이니시스 상품명 배열
                var returnHtml  = "<tr>";
                        returnHtml += "<td>"+ orderInfo.productType +"</td>";
                        returnHtml += "<td>";
                            returnHtml += ""+ orderInfo.productName +"<br>";
                            if(orderInfo.kind == 100){
                                returnHtml += "<span class=\"bdbox\">PC</span>";
                            }else if(orderInfo.kind == 101){
                                returnHtml += "<span class=\"bdbox\">모바일</span>";
                            }else if(orderInfo.kind == 102){
                                returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                            }else if(orderInfo.kind == 0){
                                returnHtml += "";
                            } else{
                                //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                            }
                        returnHtml += "</td>";
                        returnHtml += "<td>";
                            returnHtml += orderInfo.count;
                        returnHtml += "</td>";
                        returnHtml += "<td>";
                            returnHtml += orderInfo.sellPriceName;
                        returnHtml += "</td>";
                    returnHtml += "</tr>";
                    $("#dataList").append(returnHtml);
            }
            innerValue("cartProductName", productNamAarr);
        }

        if(cmpList.productTotalPrice != null){
            if(cmpList.productTotalPrice.productTotalPriceName != null){
                innerValue("produceTotal", cmpList.productTotalPrice.productTotalPrice);
                innerHTML("productTotalPriceName", cmpList.productTotalPrice.productTotalPriceName);
                var str = cmpList.productTotalPrice.productTotalPriceName;
                innerHTML("productTotalPriceName1", str.slice(0,-1));
            }
            if(cmpList.productTotalPrice.totalPointName != null){
                innerHTML("totalPointName", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName1", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName3", cmpList.productTotalPrice.totalPointName);
            }
            if(cmpList.productTotalPrice.deliveryPriceName != null){
                innerValue("deliveryTotal", cmpList.productTotalPrice.deliveryPrice);
                innerHTML("deliveryPriceName", cmpList.productTotalPrice.deliveryPriceName);
                var str1 = cmpList.productTotalPrice.deliveryPriceName;
                innerHTML("deliveryPriceName3", str1.slice(0,-1));
            }
            var total = cmpList.productTotalPrice.productTotalPrice+cmpList.productTotalPrice.deliveryPrice;
            innerHTML("totalPrice", format(total));
            innerValue("allProductPrice", total);
            innerValue("total", total);//상품총 가격
            innerValue("totalPoint", cmpList.productTotalPrice.totalPoint);//적립될 총 포인트
            innerValue("deliveryPrice", cmpList.productTotalPrice.deliveryPrice);//배송비
        }

        if(cmpList.productGroupPrice != null){
            if(cmpList.productGroupPrice.academyTotalPriceName != null){ //결제시 지급 마일리지
                innerHTML("academyTotalPriceName", cmpList.productGroupPrice.academyTotalPriceName);
            }
            if(cmpList.productGroupPrice.bookTotalPriceName != null){ // 동영상 상품 합계
                innerHTML("bookTotalPriceName", cmpList.productGroupPrice.bookTotalPriceName);
            }
            if(cmpList.productGroupPrice.deliveryPriceName != null){
                innerHTML("deliveryPriceName1", cmpList.productGroupPrice.deliveryPriceName);
            }
            if(cmpList.productGroupPrice.promotionTotalPriceName != null){
                innerHTML("promotionTotalPriceName", cmpList.productGroupPrice.promotionTotalPriceName);
            }else{
                innerHTML("promotionTotalPriceName", "0원");
            }
            if(cmpList.productGroupPrice.videoTotalPriceName != null){
                innerHTML("videoTotalPriceName", cmpList.productGroupPrice.videoTotalPriceName);
            }
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.addressRoad);
            innerHTML("detailAddres", userInfo.address);
        }
    }
}

function getOrderSheetInfoFromPay(userKey, cartKeys) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        cartKeys : cartKeys
    };

    var infoList = getApi("/order/getOrderSheetInfoFromCart/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
            var orderGoodArr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                if(orderInfo.type != 3){
                    gfn_display("deliveryInfo", false);
                }else{
                 //   innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", true);
                }
                var orderGoodData = {
                    priceKey : orderInfo.priceKey,
                    cartKey : orderInfo.cartKey,
                    kind : orderInfo.kind,
                    gKey : orderInfo.gkey,
                    extendDay : orderInfo.extendDay,
                    pmType : orderInfo.pmType
                };
                orderGoodArr.push(orderGoodData);

                var returnHtml  = "<tr>";
                returnHtml += "<td>"+ orderInfo.productType +"</td>";
                returnHtml += "<td>";
                returnHtml += ""+ orderInfo.productName +"<br>";
                if(orderInfo.kind == 100){
                    returnHtml += "<span class=\"bdbox\">PC</span>";
                }else if(orderInfo.kind == 101){
                    returnHtml += "<span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 102){
                    returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 0){
                    returnHtml += "";
                } else{
                    //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "1";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.sellPriceName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#dataList").append(returnHtml);
            }
            sessionStorage.setItem("orderGoodsList",  JSON.stringify(orderGoodArr));
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.address);
        }
    }
}


//주문서 작성 > 일반 상품 > '바로신청' 버튼으로 주문서 작성으로 갈때
function getOrderSheetInfoFromImmediately(userKey, gKeys) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        priceKeys : gKeys
    };
    var infoList = getApi("/order/getOrderSheetInfoFromImmediately/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
            var payProductNameArr = new Array();
            var orderGoodArr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                if(orderInfo.type != 3){
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", false);
                }else{
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", true);
                }
                payProductNameArr.push(orderInfo.productName);
                var orderGoodData = {
                    priceKey : orderInfo.priceKey,
                    cartKey : orderInfo.cartKey,
                    kind : orderInfo.kind,
                    gKey : orderInfo.gkey,
                    extendDay : orderInfo.extendDay,
                    pmType : orderInfo.pmType
                };
                orderGoodArr.push(orderGoodData);
                var returnHtml  = "<tr>";
                returnHtml += "<td>"+ orderInfo.productType +"</td>";
                returnHtml += "<td>";
                returnHtml += ""+ orderInfo.productName +"<br>";
                if(orderInfo.kind == 100){
                    returnHtml += "<span class=\"bdbox\">PC</span>";
                }else if(orderInfo.kind == 101){
                    returnHtml += "<span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 102){
                    returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 0){
                    returnHtml += "";
                } else{
                    //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "1";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.sellPriceName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#dataList").append(returnHtml);
            }
            innerValue("payProductName",payProductNameArr);
           // var orderGoods = toStrFileName(orderGoodArr);
            sessionStorage.setItem("orderGoodsList", JSON.stringify(orderGoodArr));
        }

        if(cmpList.productTotalPrice != null){
            if(cmpList.productTotalPrice.productTotalPriceName != null){
                innerValue("produceTotal", cmpList.productTotalPrice.productTotalPrice);
                innerHTML("productTotalPriceName", cmpList.productTotalPrice.productTotalPriceName);
                var str = cmpList.productTotalPrice.productTotalPriceName;
                innerHTML("productTotalPriceName1", str.slice(0,-1));
            }
            if(cmpList.productTotalPrice.totalPointName != null){
                innerHTML("totalPointName", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName1", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName3", cmpList.productTotalPrice.totalPointName);
            }
            if(cmpList.productTotalPrice.deliveryPriceName != null){
                innerValue("deliveryTotal", cmpList.productTotalPrice.deliveryPrice);
                innerHTML("deliveryPriceName", cmpList.productTotalPrice.deliveryPriceName);
                var str1 = cmpList.productTotalPrice.deliveryPriceName;
                innerHTML("deliveryPriceName3", str1.slice(0,-1));
            }
            var total = cmpList.productTotalPrice.productTotalPrice+cmpList.productTotalPrice.deliveryPrice;
            innerHTML("totalPrice", format(total));
            innerValue("allProductPrice", total);

            innerValue("total", total);//상품총 가격
            innerValue("totalPoint", cmpList.productTotalPrice.totalPoint);//적립될 총 포인트
            innerValue("deliveryPrice", cmpList.productTotalPrice.deliveryPrice);//배송비
        }

        if(cmpList.productGroupPrice != null){
            if(cmpList.productGroupPrice.academyTotalPriceName != null){ //결제시 지급 마일리지
                innerHTML("academyTotalPriceName", cmpList.productGroupPrice.academyTotalPriceName);
            }
            if(cmpList.productGroupPrice.bookTotalPriceName != null){ // 동영상 상품 합계
                innerHTML("bookTotalPriceName", cmpList.productGroupPrice.bookTotalPriceName);
            }
            if(cmpList.productGroupPrice.deliveryPriceName != null){
                innerHTML("deliveryPriceName1", cmpList.productGroupPrice.deliveryPriceName);
            }
            if(cmpList.productGroupPrice.promotionTotalPriceName != null){
                innerHTML("promotionTotalPriceName", cmpList.productGroupPrice.promotionTotalPriceName);
            }else{
                innerHTML("promotionTotalPriceName", "0원");
            }
            if(cmpList.productGroupPrice.videoTotalPriceName != null){
                innerHTML("videoTotalPriceName", cmpList.productGroupPrice.videoTotalPriceName);
            }
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.addressRoad);
            innerHTML("detailAddres", userInfo.address);
        }
    }
}

//주문서 작성 > 특별, 자유 패키지 > '바로신청' 버튼으로 주문서 작성으로 갈때
function getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, packageType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        goodsInfo : goodsInfo,
        packageType : packageType
    };
    var infoList = getApi("/order/getOrderSheetInfoFromImmediatelyAtBasicPackage/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
            var pacakgeProductNameArr = new Array();
            var orderGoodArr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                pacakgeProductNameArr.push(orderInfo.productName);
                var orderGoodData = {
                    priceKey : orderInfo.priceKey,
                    cartKey : orderInfo.cartKey,
                    kind : orderInfo.kind,
                    gKey : orderInfo.gkey,
                    extendDay : orderInfo.extendDay,
                    pmType : orderInfo.pmType
                };
                orderGoodArr.push(orderGoodData);

                var returnHtml  = "<tr>";
                returnHtml += "<td>"+ orderInfo.productType +"</td>";
                returnHtml += "<td>";
                returnHtml += ""+ orderInfo.productName +"<br>";
                if(orderInfo.kind == 100){
                    returnHtml += "<span class=\"bdbox\">PC</span>";
                }else if(orderInfo.kind == 101){
                    returnHtml += "<span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 102){
                    returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 0){
                    returnHtml += "";
                } else{
                    //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "1";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.sellPriceName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#dataList").append(returnHtml);
            }
            innerValue("pacakgeProductName", pacakgeProductNameArr);
           //var orderGoods = toStrFileName(orderGoodArr);
            sessionStorage.setItem("orderGoodsList", JSON.stringify(orderGoodArr));
        }

        if(cmpList.productTotalPrice != null){
            if(cmpList.productTotalPrice.productTotalPriceName != null){
                innerValue("produceTotal", cmpList.productTotalPrice.productTotalPrice);
                innerHTML("productTotalPriceName", cmpList.productTotalPrice.productTotalPriceName);
                var str = cmpList.productTotalPrice.productTotalPriceName;
                innerHTML("productTotalPriceName1", str.slice(0,-1));
            }
            if(cmpList.productTotalPrice.totalPointName != null){
                innerHTML("totalPointName", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName1", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName3", cmpList.productTotalPrice.totalPointName);
            }
            if(cmpList.productTotalPrice.deliveryPriceName != null){
                innerValue("deliveryTotal", cmpList.productTotalPrice.deliveryPrice);
                innerHTML("deliveryPriceName", cmpList.productTotalPrice.deliveryPriceName);
                var str1 = cmpList.productTotalPrice.deliveryPriceName;
                innerHTML("deliveryPriceName3", str1.slice(0,-1));
            }
            var total = cmpList.productTotalPrice.productTotalPrice+cmpList.productTotalPrice.deliveryPrice;
            innerHTML("totalPrice", format(total));
            innerValue("allProductPrice", total);

            innerValue("total", total);//상품총 가격
            innerValue("totalPoint", cmpList.productTotalPrice.totalPoint);//적립될 총 포인트
            innerValue("deliveryPrice", cmpList.productTotalPrice.deliveryPrice);//배송비
        }

        if(cmpList.productGroupPrice != null){
            if(cmpList.productGroupPrice.academyTotalPriceName != null){ //결제시 지급 마일리지
                innerHTML("academyTotalPriceName", cmpList.productGroupPrice.academyTotalPriceName);
            }
            if(cmpList.productGroupPrice.bookTotalPriceName != null){ // 동영상 상품 합계
                innerHTML("bookTotalPriceName", cmpList.productGroupPrice.bookTotalPriceName);
            }
            if(cmpList.productGroupPrice.deliveryPriceName != null){
                innerHTML("deliveryPriceName1", cmpList.productGroupPrice.deliveryPriceName);
            }
            // if(cmpList.productGroupPrice.examTotalPriceName != null){
            //     innerHTML("examTotalPriceName", cmpList.productGroupPrice.examTotalPriceName);
            // }
            if(cmpList.productGroupPrice.promotionTotalPriceName != null){
                innerHTML("promotionTotalPriceName", cmpList.productGroupPrice.promotionTotalPriceName);
            }else{
                innerHTML("promotionTotalPriceName", "0원");
            }
            if(cmpList.productGroupPrice.videoTotalPriceName != null){
                innerHTML("videoTotalPriceName", cmpList.productGroupPrice.videoTotalPriceName);
            }
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.addressRoad);
            innerHTML("detailAddres", userInfo.address);
        }
    }
}

//장바구니 리스트
function getUserCartInfo(userKey) {
    if (userKey == null || userKey == undefined) return;
    var infoList = getApi("/order/getUserCartInfo/", userKey, "");
    if (infoList != null) {
        if(infoList.result.deliveryPrice == 0){
            innerHTML("deliveryPrice", "0");
        }else{
            innerHTML("deliveryPrice", infoList.result.deliveryPriceName);
        }
        innerHTML("price", infoList.result.orderPriceName);
        innerHTML("totalPrice", infoList.result.totalPriceName);
        innerHTML("totalPoint", infoList.result.totalPointName);
        if(infoList.result.orderPrice == 0){
            innerHTML("deliveryPrice", "0");
            innerHTML("totalPrice", "0");
        }
        if (infoList.result.academyCartInfo.length > 0) {
            for (var i = 0; i < infoList.result.academyCartInfo.length; i++) {
                var acaInfo = infoList.result.academyCartInfo[i];
                var returnHtml = "<tr>";
                returnHtml += "<td><input type=\"checkbox\" name='acaChk' id='"+ acaInfo.cartKey +"' class=\"ck\"></td>";
                returnHtml += "<td>";
                returnHtml += "" + acaInfo.goodsName + " <br>";
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

        /* 재수강 리스트 */
        if (infoList.result.retakeCartInfo.length > 0) {
            for (var m = 0; m < infoList.result.retakeCartInfo.length; m++) {
                var retakeCartInfo = infoList.result.retakeCartInfo[m];
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='rePlayChk' id='"+ retakeCartInfo.cartKey +"' class=\"ck2\"></td>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "" + retakeCartInfo.goodsName + "<br>";
                if (retakeCartInfo.kind == 100) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span>";
                } else if (retakeCartInfo.kind == 101) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">모바일</span>";
                } else {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += retakeCartInfo.subjectCount;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "<span class=\"thm line\">" + retakeCartInfo.priceName + "</span><span class=\"arrow\">＞</span>";
                returnHtml += "<span class=\"thm text_blue\">" + retakeCartInfo.sellPriceName + "</span>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += retakeCartInfo.pointName;
                returnHtml += "</td>";
                returnHtml += "<tr>";
                $("#rePlayList").append(returnHtml);
            }
        }else{
            $("#rePlayDiv").hide();
        }


        if (infoList.result.videoCartInfo.length > 0) {
            for (var j = 0; j < infoList.result.videoCartInfo.length; j++) {
                var playInfo = infoList.result.videoCartInfo[j];
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='playChk' id='"+ playInfo.cartKey +"' class=\"ck2\"></td>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "" + playInfo.goodsName + "<br>";
                if (playInfo.kind == 100) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span>";
                } else if (playInfo.kind == 101) {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">모바일</span>";
                } else {
                    returnHtml += "<span class=\"text_blue\">판매가격 :</span><span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
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
                var returnHtml = "<tr>";
                returnHtml += "<td>";
                returnHtml += "<input type=\"checkbox\" name='bookChk' id='"+ bookInfo.cartKey +"' class=\"ck4\"></td>";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += bookInfo.goodsName;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += bookInfo.cnt;
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

function saveCartAtRetake(saveCartInfo) {
    if (saveCartInfo == null || saveCartInfo == undefined) return;
    var data = {
        saveCartInfo : saveCartInfo
    };
    var result = postApi("/order/saveCartAtRetake", data);
    return  result;
}

//주문서작성 > 재수강 바로구매
function getOrderSheetInfoFromImmediatelyAtRetake(userKey, retakeInfo) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        productInfo : retakeInfo
    };
    var infoList = getApi("/order/getOrderSheetInfoFromImmediatelyAtRetake/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
            var payProductNameArr = new Array();
            var orderGoodArr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                if(orderInfo.type != 3){
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", false);
                }else{
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", true);
                }
                payProductNameArr.push(orderInfo.productName);
                var orderGoodData = {
                    priceKey : orderInfo.priceKey,
                    cartKey : orderInfo.cartKey,
                    kind : orderInfo.kind,
                    gKey : orderInfo.gkey,
                    extendDay : orderInfo.extendDay,
                    pmType : orderInfo.pmType
                };
                orderGoodArr.push(orderGoodData);
                var returnHtml  = "<tr>";
                returnHtml += "<td>"+ orderInfo.productType +"</td>";
                returnHtml += "<td>";
                returnHtml += ""+ orderInfo.productName +"<br>";
                if(orderInfo.kind == 100){
                    returnHtml += "<span class=\"bdbox\">PC</span>";
                }else if(orderInfo.kind == 101){
                    returnHtml += "<span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 102){
                    returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 0){
                    returnHtml += "";
                } else{
                    //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += "1";
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.sellPriceName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#dataList").append(returnHtml);
            }
            innerValue("payProductName",payProductNameArr);
            // var orderGoods = toStrFileName(orderGoodArr);
            sessionStorage.setItem("orderGoodsList", JSON.stringify(orderGoodArr));
        }

        if(cmpList.productTotalPrice != null){
            if(cmpList.productTotalPrice.productTotalPriceName != null){
                innerValue("produceTotal", cmpList.productTotalPrice.productTotalPrice);
                innerHTML("productTotalPriceName", cmpList.productTotalPrice.productTotalPriceName);
                var str = cmpList.productTotalPrice.productTotalPriceName;
                innerHTML("productTotalPriceName1", str.slice(0,-1));
            }
            if(cmpList.productTotalPrice.totalPointName != null){
                innerHTML("totalPointName", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName1", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName3", cmpList.productTotalPrice.totalPointName);
            }
            if(cmpList.productTotalPrice.deliveryPriceName != null){
                innerValue("deliveryTotal", cmpList.productTotalPrice.deliveryPrice);
                innerHTML("deliveryPriceName", cmpList.productTotalPrice.deliveryPriceName);
                var str1 = cmpList.productTotalPrice.deliveryPriceName;
                innerHTML("deliveryPriceName3", str1.slice(0,-1));
            }
            var total = cmpList.productTotalPrice.productTotalPrice+cmpList.productTotalPrice.deliveryPrice;
            innerHTML("totalPrice", format(total));
            innerValue("allProductPrice", total);

            innerValue("total", total);//상품총 가격
            innerValue("totalPoint", cmpList.productTotalPrice.totalPoint);//적립될 총 포인트
            innerValue("deliveryPrice", cmpList.productTotalPrice.deliveryPrice);//배송비
        }

        if(cmpList.productGroupPrice != null){
            if(cmpList.productGroupPrice.academyTotalPriceName != null){ //결제시 지급 마일리지
                innerHTML("academyTotalPriceName", cmpList.productGroupPrice.academyTotalPriceName);
            }
            if(cmpList.productGroupPrice.bookTotalPriceName != null){ // 동영상 상품 합계
                innerHTML("bookTotalPriceName", cmpList.productGroupPrice.bookTotalPriceName);
            }
            if(cmpList.productGroupPrice.deliveryPriceName != null){
                innerHTML("deliveryPriceName1", cmpList.productGroupPrice.deliveryPriceName);
            }
            // if(cmpList.productGroupPrice.examTotalPriceName != null){
            //     innerHTML("examTotalPriceName", cmpList.productGroupPrice.examTotalPriceName);
            // }
            if(cmpList.productGroupPrice.promotionTotalPriceName != null){
                innerHTML("promotionTotalPriceName", cmpList.productGroupPrice.promotionTotalPriceName);
            }else{
                innerHTML("promotionTotalPriceName", "0원");
            }
            if(cmpList.productGroupPrice.videoTotalPriceName != null){
                innerHTML("videoTotalPriceName", cmpList.productGroupPrice.videoTotalPriceName);
            }
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.addressRoad);
            innerHTML("detailAddres", userInfo.address);
        }
    }
}

function getAvailabilityLectureReview(userKey, jLecKey) {
    if (userKey == null || userKey == undefined) return;
    if (jLecKey == null || jLecKey == undefined) return;
    var data = {
        jLecKey : jLecKey
    };
    var infoList = getResultApi("/order/getAvailabilityLectureReview/", userKey, data);
    if(infoList != null){
        return infoList.keyValue;
    }
}

function addLectureLimitDay(jLecKey) {
    if (jLecKey == null || jLecKey == undefined) return;
    var data = {
        jLecKey : jLecKey
    };
    var result = postApi("/order/addLectureLimitDay", data);
    return  result;
}

//온라인서점 상세보기 >  바로구매
function getOrderSheetInfoFromImmediatelyAtBookStore(userKey, priceKeys, bookCount) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        priceKeys : priceKeys,
        bookCount : Number(bookCount)
    };

    var infoList = getApi("/order/getOrderSheetInfoFromImmediatelyAtBookStore/", userKey, data);
    if(infoList != null){
        var cmpList = infoList.result;
        innerHTML("userPoint", format(cmpList.userPoint));
        innerHTML("maxUserPoint", format(cmpList.userPoint));
        innerValue("userMaxPoint", format(cmpList.userPoint));
        if(cmpList.orderProductList.length > 0){
            var payProductNameArr = new Array();
            var orderGoodArr = new Array();
            for(var i = 0; i < cmpList.orderProductList.length; i++){
                var orderInfo = cmpList.orderProductList[i];
                if(orderInfo.type != 3){
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", false);
                }else{
                    innerValue("orderInfoType", orderInfo.type);
                    gfn_display("deliveryInfo", true);
                }
                payProductNameArr.push(orderInfo.productName);
                var orderGoodData = {
                    priceKey : orderInfo.priceKey,
                    cartKey : orderInfo.cartKey,
                    kind : orderInfo.kind,
                    gKey : orderInfo.gkey,
                    extendDay : orderInfo.extendDay,
                    pmType : orderInfo.pmType
                };
                orderGoodArr.push(orderGoodData);
                var returnHtml  = "<tr>";
                returnHtml += "<td>"+ orderInfo.productType +"</td>";
                returnHtml += "<td>";
                returnHtml += ""+ orderInfo.productName +"<br>";
                if(orderInfo.kind == 100){
                    returnHtml += "<span class=\"bdbox\">PC</span>";
                }else if(orderInfo.kind == 101){
                    returnHtml += "<span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 102){
                    returnHtml += "<span class=\"bdbox\">PC</span><span class=\"bdbox\">모바일</span>";
                }else if(orderInfo.kind == 0){
                    returnHtml += "";
                } else{
                    //returnHtml += "<span class=\"text_blue\">판매가격 : </span>"+ orderInfo.kind +"개월";
                }
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.count;
                returnHtml += "</td>";
                returnHtml += "<td>";
                returnHtml += orderInfo.sellPriceName;
                returnHtml += "</td>";
                returnHtml += "</tr>";
                $("#dataList").append(returnHtml);
            }
            innerValue("payProductName",payProductNameArr);
            // var orderGoods = toStrFileName(orderGoodArr);
            sessionStorage.setItem("orderGoodsList", JSON.stringify(orderGoodArr));
        }

        if(cmpList.productTotalPrice != null){
            if(cmpList.productTotalPrice.productTotalPriceName != null){
                innerValue("produceTotal", cmpList.productTotalPrice.productTotalPrice);
                innerHTML("productTotalPriceName", cmpList.productTotalPrice.productTotalPriceName);
                var str = cmpList.productTotalPrice.productTotalPriceName;
                innerHTML("productTotalPriceName1", str.slice(0,-1));
            }
            if(cmpList.productTotalPrice.totalPointName != null){
                innerHTML("totalPointName", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName1", cmpList.productTotalPrice.totalPointName);
                innerHTML("totalPointName3", cmpList.productTotalPrice.totalPointName);
            }
            if(cmpList.productTotalPrice.deliveryPriceName != null){
                innerValue("deliveryTotal", cmpList.productTotalPrice.deliveryPrice);
                innerHTML("deliveryPriceName", cmpList.productTotalPrice.deliveryPriceName);
                var str1 = cmpList.productTotalPrice.deliveryPriceName;
                innerHTML("deliveryPriceName3", str1.slice(0,-1));
            }
            var total = cmpList.productTotalPrice.productTotalPrice+cmpList.productTotalPrice.deliveryPrice;
            innerHTML("totalPrice", format(total));
            innerValue("allProductPrice", total);

            innerValue("total", total);//상품총 가격
            innerValue("totalPoint", cmpList.productTotalPrice.totalPoint);//적립될 총 포인트
            innerValue("deliveryPrice", cmpList.productTotalPrice.deliveryPrice);//배송비
        }

        if(cmpList.productGroupPrice != null){
            if(cmpList.productGroupPrice.academyTotalPriceName != null){ //결제시 지급 마일리지
                innerHTML("academyTotalPriceName", cmpList.productGroupPrice.academyTotalPriceName);
            }
            if(cmpList.productGroupPrice.bookTotalPriceName != null){ // 동영상 상품 합계
                innerHTML("bookTotalPriceName", cmpList.productGroupPrice.bookTotalPriceName);
            }
            if(cmpList.productGroupPrice.deliveryPriceName != null){
                innerHTML("deliveryPriceName1", cmpList.productGroupPrice.deliveryPriceName);
            }
            if(cmpList.productGroupPrice.promotionTotalPriceName != null){
                innerHTML("promotionTotalPriceName", cmpList.productGroupPrice.promotionTotalPriceName);
            }else{
                innerHTML("promotionTotalPriceName", "0원");
            }
            if(cmpList.productGroupPrice.videoTotalPriceName != null){
                innerHTML("videoTotalPriceName", cmpList.productGroupPrice.videoTotalPriceName);
            }
        }

        if(cmpList.orderUserInfo != null){
            var userInfo = cmpList.orderUserInfo;
            innerHTML("orderName", userInfo.name);
            innerHTML("telephone", userInfo.telephone);
            innerHTML("telephoneMobile", userInfo.telephoneMobile);
            innerHTML("email", userInfo.email);
            innerHTML("zipcode", userInfo.zipcode);
            innerHTML("address", userInfo.addressRoad);
            innerHTML("detailAddres", userInfo.address);
        }
    }
}