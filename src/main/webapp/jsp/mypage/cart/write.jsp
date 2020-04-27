<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    String cartKeys = Util.isNullValue(request.getParameter("cartKeys"), "");
    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
    String retakeInfo = Util.isNullValue(request.getParameter("retakeInfo"), "");//재수강
    String priceKey = Util.isNullValue(request.getParameter("bookPriceKey"), "");//온라인서점 바로구매 key
    String bookCount = Util.isNullValue(request.getParameter("bookCount"), "");//온라인서점 바로구매 수량
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    $(window).bind("pageshow", function() {
        $('#point').val("");
    });
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분

        if(leftMenuInfo == 'bookStore'){
            sessionStorage.setItem("myPageHeader", "cart");
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var gKeys = '<%=gKeys%>';
        var cartKeys = '<%=cartKeys%>';
        var goodsInfo = '<%=goodsInfo%>';
        var retakeInfo = '<%=retakeInfo%>';
        var priceKey =  '<%=priceKey%>';
        var bookCount = '<%=bookCount%>';
        if('<%=cartKeys%>' == '' && '<%=goodsInfo%>' == '' && '<%=retakeInfo%>' == '' && '<%=priceKey%>' == '' && '<%=bookCount%>' == ''){ //바로구매
            innerValue("gKeys", gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if('<%=gKeys%>' == '' && '<%=goodsInfo%>' == '' && '<%=retakeInfo%>' == '' && '<%=priceKey%>' == '' && '<%=bookCount%>' == ''){//장바구니
            innerValue("cartNum", cartKeys);
            getOrderSheetInfoFromCart(userKey, cartKeys);
        }else if('<%=gKeys%>' == '' && '<%=cartKeys%>' == '' && '<%=retakeInfo%>' == '' && '<%=priceKey%>' == '' && '<%=bookCount%>' == ''){//패키지
            innerValue("goodsInfo", goodsInfo);
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);
        }else if('<%=gKeys%>' == '' && '<%=cartKeys%>' == '' && '<%=goodsInfo%>' == '' && '<%=priceKey%>' == '' && '<%=bookCount%>' == ''){//재수강
            innerValue("retakeInfo", retakeInfo);
            getOrderSheetInfoFromImmediatelyAtRetake(userKey, retakeInfo);
        }else{//온라인서점 바로구매
            var arr = new Array();
            arr.push(priceKey);
            var priceList = toStrFileName(arr);
            getOrderSheetInfoFromImmediatelyAtBookStore(userKey, priceList, bookCount);
        }

        var cartProductName =  getInputTextValue("cartProductName");
        var payProductName  = getInputTextValue("payProductName");
        var pacakgeProductName = getInputTextValue("pacakgeProductName");

        var cartProduct = gfn_csplit(cartProductName, ",");
        var payProduct  = gfn_csplit(payProductName, ",");
        var pacakgeProduct = gfn_csplit(pacakgeProductName, ",");

        var productNamelength = cartProduct.length+payProduct.length+pacakgeProduct.length;
        if(cartProduct.length > 0){
            var name = cartProduct[0];
        }
        if(payProduct.length > 0){
            var name = payProduct[0];
        }
        if(pacakgeProduct.length > 0){
            var name = pacakgeProduct[0];
        }
        var resultProductName = name+" 외 "+productNamelength+"개";
        innerValue("productNames", resultProductName);

        //userInfoChk
        $("#userInfoChk").click(function(){
            if($("#userInfoChk").prop("checked")){
                innerValue("orderNameText", $("#orderName").text());
                /*연락처*/
                var telephone = $("#telephone").text();
                var telPhoneList = gfn_csplit(telephone, '-');
                $("#selTel").val(telPhoneList[0]);
                innerValue("tel1", telPhoneList[1]);
                innerValue("tel2", telPhoneList[2]);
                /*휴대전화*/
                var phoneMobile = $("#telephoneMobile").text();
                var phoneMobileList = gfn_csplit(phoneMobile, '-');
                $("#selPhone").val(phoneMobileList[0]);
                innerValue("phone1", phoneMobileList[1]);
                innerValue("phone2", phoneMobileList[2]);
                /*이메일*/
                var email = $("#email").text();
                var emailList = gfn_split(email, '@');
                innerValue("email1", emailList[0]);
                innerValue("email2", emailList[1]);
                /*우편번호*/
                var zipcode = $("#zipcode").text();
                innerValue("postcode", zipcode);
                /*주소*/
                var address = $("#address").text();
                innerValue("addressRoad", address);
                var detailAddres = $("#detailAddres").text();
                innerValue("detailAddres2", detailAddres);
            }else{
                innerValue("orderNameText", "");
                innerValue("tel1", "");
                innerValue("tel2", "");
                innerValue("phone1", "");
                innerValue("phone2", "");
                innerValue("email1", "");
                innerValue("email2", "");
                innerValue("postcode", "");
                innerValue("addressRoad", "");
                innerValue("detailAddres2", "");
            }
        });
        $("#point").change(function() {
            var userMaxPoint = getInputTextValue("userMaxPoint");
            var currentVal = $(this).val();
            if (userMaxPoint < 1000) {
                alert("보유 마일리지는 1000점이상일때만 사용가능합니다.");
                $("#point").val("");
                currentVal = 0;
            }
            if(currentVal.length <= 2) {
                alert("백단위 이상 사용 가능합니다.");
                $("#point").val("");
                currentVal = 0;
            }
            if(Number(currentVal) > Number(removeComma(userMaxPoint))){
                alert("보유포인트를 초과 하였습니다.");
                $("#point").val("");
                currentVal = 0;
            }
            var produceTotal = getInputTextValue("produceTotal");
            var changeTotal = produceTotal-currentVal;
           // innerHTML("productTotalPriceName", format(changeTotal));
            innerHTML("productTotalPriceName1", format(changeTotal));
            innerValue("changeTotal", changeTotal);
            var result  = getInputTextValue("changeTotal");
            var result1 = getInputTextValue("deliveryTotal");
            innerHTML("totalPrice", format(parseInt(result)+parseInt(result1)));
            innerValue("allProductPrice", parseInt(result)+parseInt(result1));
            innerValue("discountPoint", currentVal);
        });
    });

    //결제하기
    function goPay() {
        var check = new isCheck();
        var orderInfoType =  getInputTextValue("orderInfoType");
        if(orderInfoType == 3) {
            if (check.input("orderNameText", comment.delivery_info) == false) return;
            if (check.input("postcode", comment.delivery_info) == false) return;
        }
        var orderName = getInputTextValue("orderNameText");
        innerValue("postName", orderName);
        var tel = getSelectboxValue("selTel");
        var tel1 = getInputTextValue("tel1");
        var tel2 = getInputTextValue("tel2");
        var allTel = tel+"-"+tel1+"-"+tel2;
        if (tel == undefined) allTel = "";

        innerValue("allTel", allTel);
        var phone = getSelectboxValue("selPhone");
        var phone1 = getInputTextValue("phone1");
        var phone2 = getInputTextValue("phone2");
        var allPhone = phone+"-"+phone1+"-"+phone2;
        innerValue("allPhone", allPhone);
        var email = getInputTextValue("email1");
        var email1 = getInputTextValue("email2");
        var allEmail = email+"@"+email1;
        innerValue("allEmail", allEmail);
        var zipCode = getInputTextValue("postcode");
        innerValue("postCode1", zipCode);
        var address = getInputTextValue("addressRoad");
        innerValue("add1", address);
        var detailAddr = getInputTextValue("detailAddres2");
        innerValue("add2", detailAddr);

        sessionStorage.setItem("cartNum", '<%=cartKeys%>');
        sessionStorage.setItem("gKeys", '<%=gKeys%>');
        sessionStorage.setItem("goodsInfo", '<%=goodsInfo%>');
        sessionStorage.setItem("retakeInfo", '<%=retakeInfo%>');
        sessionStorage.setItem("priceKey", '<%=priceKey%>');
        sessionStorage.setItem("bookCount", '<%=bookCount%>');
        var allProductPrice =  getInputTextValue("allProductPrice");
        var productNames = getInputTextValue("productNames");
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var resultData = {
            allProductPrice : allProductPrice,
            postName : sessionUserInfo.name,
            allTel : allTel,
            allPhone : allPhone,
            allEmail : allEmail,
            postCode : zipCode,
            add1 : address,
            add2 : detailAddr,
            productNames : productNames,
            orderInfoType : orderInfoType
        };
        sessionStorage.setItem("resultData", JSON.stringify(resultData));
        $("#id_frm_orderPay").attr( "action", "/myPage?page_gbn=pay");
        $("#id_frm_orderPay").submit();
    }

    function goDetailbookType(type) {
        innerValue('bookType', type);
        $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
        $("#bookTypePage").submit();
    }
</script>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<form id="bookTypePage" method="post" name="bookTypePage">
    <input type="hidden" id="bookType" name="bookType">
</form>
<form action="/mypage/cart/orderPay" id="id_frm_orderPay" method="post" name="name_frm_orderPay">
    <input type="hidden" id="allProductPrice" name="allProductPrice"><!-- 결제해야할 총 금액 -->
    <input type="hidden" id="cartNum" name="cartNum">
    <input type="hidden" id="gKeys" name="gKeys">
    <input type="hidden" id="goodsInfo" name="goodsInfo">
    <input type="hidden" id="retakeInfo" name="retakeInfo">
    <input type="hidden" id="postName" name="postName">
    <input type="hidden" id="allTel" name="allTel">
    <input type="hidden" id="allPhone" name="allPhone">
    <input type="hidden" id="allEmail" name="allEmail">
    <input type="hidden" id="postCode1" name="postCode1">
    <input type="hidden" id="add1" name="add1">
    <input type="hidden" id="add2" name="add2">
    <input type="hidden" id="productNames" name="productNames">
    <!--savePayInfo-->
    <input type="hidden" id="total" name="total">
    <input type="hidden" id="totalPoint" name="totalPoint">
    <input type="hidden" id="deliveryPrice" name="deliveryPrice">
    <input type="hidden" id="discountPoint" name="discountPoint">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="produceTotal">
    <input type="hidden" id="deliveryTotal">
    <input type="hidden" id="changeTotal">
    <input type="hidden" id="cartProductName">
    <input type="hidden" id="payProductName">
    <input type="hidden" id="pacakgeProductName">
    <input type="hidden" id="orderInfoType">
    <input type="hidden" id="userMaxPoint">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->

                <%@include file="/common/jsp/myPageHeader.jsp" %>

                <div class="Mypage">
                    <ul class="statusBar">
                        <li><label>01.<b>장바구니</b></label></li>
                        <li class="active"><label>02.<b>주문서작성</b></label></li>
                        <li><label>03.<b>결제하기</b></label></li>
                        <li class="last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <div class="tbd_03 mgb20">
                            <p class="title"><span class="text_blue">주문상품</span>정보</p>
                            <table class="cart02">
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>판매가</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_06 mgb60">
                            <table class="cart02List">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col width="400px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>전체 상품별 금액 합계 :</th>
                                    <td class="text_blue" id="productTotalPriceName"></td>
                                    <th class="bggray2">결제시 지급 마일리지 :</th>
                                    <td class="bggray2" id="totalPointName3"></td>
                                </tr>
                                <tr>
                                    <th>결제시 지급 마일리지 :</th>
                                    <td class="text_blue" id="totalPointName"></td>
                                    <th class="bggray2">동영상 상품 합계 :</th>
                                    <td class="bggray2" id="videoTotalPriceName"></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <th class="bggray2">프로모션 상품 합계 :</th>
                                    <td class="bggray2" id="promotionTotalPriceName"></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <th class="bggray2">학원강의 상품 합계 :</th>
                                    <td class="bggray2" id="academyTotalPriceName"></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <th class="bggray2">도서 상품 합계 :</th>
                                    <td class="bggray2" id="bookTotalPriceName"></td>
                                </tr>
                                <tr>
                                    <th style="border-top:1px solid #e5e5e5">배송비 총 합계 :</th>
                                    <td  class="text_blue" style="border-top:1px solid #e5e5e5" id="deliveryPriceName"></td>
                                    <th class="bggray2" style="border-top:1px solid #e5e5e5">배송비 총 합계 :</th>
                                    <td class="bggray2 " style="border-top:1px solid #e5e5e5" id="deliveryPriceName1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="mgb60">
                            <div class=" reserve">
                                <p class="title"><span class="text_blue">적립금</span>사용</p>
                                <div class="inner">
                                    <ul>
                                        <li><span class="tit">마일리지 사용 :</span><span><input type="text" id="point" value=''></span><span >(보유마일리지 : <span class="text_blue" id="userPoint">원</span> / 최대 사용 마일리지 보유 :<span class="text_blue" id="maxUserPoint"> 점</span>)</span></li>
                                        <li class="txt_gray2">(단, 마일리지는 1,000점 이상 적립 되었을 때, 현금과 동일하게 100원 단위로 사용이 가능합니다.)</li>
                                    </ul>
                                    <ul>
                                        <li><span class="tit">쿠폰 사용 :</span><span class="text_blue">0원</span><a href="#modal02" class="blue small btn_modalOpen">쿠폰사용하기</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tbd_03 tbd_05 mgb60">
                            <p class="title"><span class="text_blue">주문자</span>정보확인</p>
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td id="orderName"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td id="telephone"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td id="telephoneMobile"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="email"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><span class="taxt_blue">[<span id="zipcode"></span>]</span> <span id="address"></span>&nbsp;&nbsp;<span id="detailAddres"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 tbd_05 mgb60" id="deliveryInfo">
                            <p class="title"><span class="text_blue">배송지</span>정보입력</p>
                            <input type="hidden" id="addressNumber"><!--구주소-->
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>수취인</th>
                                    <td>
                                        <div class="input_area">
                                            <input type="text" id="orderNameText"><input type="checkbox" id="userInfoChk"><span class="text">주문자와 정보 동일</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><select id="selTel"><option value="010">010</option><option value="02">02</option></select><span class="hyphen">-</span><input type="text"  maxlength="4"  class="input_number" id="tel1"><span class="hyphen">-</span><input type="text"  maxlength="4" class="input_number" id="tel2"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td>
                                        <div>
                                            <select id="selPhone"><option value="010">010</option><option value="011">011</option></select><span class="hyphen">-</span><input type="text"  id="phone1"  maxlength="4"  class="input_number"><span class="hyphen">-</span><input type="text" maxlength="4"  id="phone2" class="input_number">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <div>
                                            <input type="text" id="email1"  placeholder="주소" title="주소를 입력해주세요." class="">@<input type="text" id="email2" title="주소를 입력해주세요." class="">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <div class="input_area">
                                            <input type="text" id="postcode"  title="우편번호 앞자리를 입력해주세요." class="input_number"> <button type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
                                        </div>
                                        <div class="input_area">
                                            <input type="text" id="addressRoad"  placeholder="주소" title="주소를 입력해주세요." class="w300">
                                            <input type="text" id="detailAddres2"  placeholder="상세주소" class="w300">
                                        </div>
                                        <span id="guide" style="color:#999;display:none"></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pay_total">
                            <p>마일리지 :<span id="totalPointName1"></span></p>
                            <div class="inner">
                                <ul>
                                    <li>
                                        <span class="txt1">주문금액</span>
                                        <span class="txt2"><b id="productTotalPriceName1"></b>원</span>
                                        <span class="plus"></span>
                                    </li>
                                    <li class="pay-item">
                                        <span class="txt1">배송비</span>
                                        <span class="txt2"><b id="deliveryPriceName3"></b>원</span>
                                        <span class="icoequal "></span>
                                    </li>
                                    <li class="pay-sum">
                                        <span class="txt1">총 주문금액</span>
                                        <span class="txt2"><b id="totalPrice"></b>원</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--확인해주세요 -->
                        <div class="infoarea">
                            <p class="tit">꼭!! 확인해주세요!</p>
                            <ul>
                                <li>·장바구니에 담겨진 상품을 7일 동안 보관됩니다.(7일 이후 자동 삭제) </li>
                                <li>·동영상 강의 최초 신청시 수강기간은 정지된 상태로 [내 강의실-수강중인강좌]로 연결이 됩니다.</li>
                                <li>·최초 대기시간은 30일이며, 30일 이내 자유롭게 시작일을 정해서 시작할 수 있고, 30일이 지나면 자동 시작됩니다.</li>
                                <li>·무통장 결제는 평일 정시 단위로 9시부터 18시 사이에 확인됩니다.</li>
                                <li>·무통장 입금 시 주문자명과 입금자명, 금액이 동일해야 처리됩니다.</li>
                            </ul>
                        </div>
                        <!--마일리지안내 -->
                        <div class="mileinfo">
                            <p class="tit text_blue">마일리지 안내</p>
                            <ul>
                                <li>·마일리지 지급 내역은 [나의강의실 > 나의 마일리지]에서 확인하실 수 있습니다.</li>
                                <li>·옵션 및 추가상품, 배송비 결제금액에는 마일리지가 지급되지 않습니다.</li>
                                <li>·마일리지는 1,000점 이상 적립 되었을 때, 현금과 동일하게 100원 단위로 사용이 가능합니다.</li>
                                <li>·10,000원 이하의 결제금액은 마일리지 적용이 되지 않습니다.</li>
                                <li>·마일리지 지급 내역은 [나의강의실 > 나의 마일리지]에서 확인하실 수 있습니다.</li>
                                <li class="text_blue">※ *패키지or지안패스 구매시 할인적용된 상품으로 마일리지가 적립되지 않습니다.</li>
                            </ul>
                        </div>
                        <!--배송안내 -->
                        <div class="mileinfo">
                            <p class="tit text_blue">배송안내</p>
                            <ul>
                                <li>·택배는 CJ택배&롯데택배를 이용하며 평균 1~2일(주말 및 공휴일 제외 / 도서산간 지역의 경우 2~3일) 정도 소요됩니다.</li>
                                <li>·도서산간지역은 교재 구매시 추가 배송비가 적용됩니다. 추가 배송비는 면제/할인이 불가능합니다.</li>
                                <li>·교재배송은 당일 14:00시 이전 결제 건은 당일출고이며, 14:00시 이후 결제 건은 익일 출고입니다. 금요일 14:00시 이후 결제 건은 차주 월요일 배송입니다. (주말 및 공휴일은 배송불가)</li>
                                <li>·배송입금확인시간 평일 : 오후 2시</li>
                                <li class="text_blue">※ 무통장 결제는 정시단위로 입금확인되며, 오후 02시(14시)이후 결제 건은 다음날 오전 09시에 확인됩니다.</li>
                            </ul>
                        </div>
                        <!--버튼 -->
                        <div class="btn_area">
                            <div class="center">
                                <a href="javascript:goPage('myPage','cart')" class="gray">이전으로</a>
                                <a href="javascript:goPay();" class="blue">결제하기</a>
                            </div>
                        </div>
                    </div>
                    <!--//cart -->
                </div>

                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>