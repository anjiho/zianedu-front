<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%@ page import="com.zianedu.front.config.ConfigHolder" %>
<%
//    String cartNum = Util.isNullValue(request.getParameter("cartNum"), "");
//    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
//    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
//    String retakeInfo = Util.isNullValue(request.getParameter("retakeInfo"), "");
    //String allProductPrice = Util.isNullValue(request.getParameter("allProductPrice"), "");
    String allProductPrice = "150";
    String userName = Util.isNullValue(request.getParameter("postName"), "");
    String phoneNum = Util.isNullValue(request.getParameter("allPhone"), "");
    String email = Util.isNullValue(request.getParameter("allEmail"), "");

    String pcProductNames = Util.isNullValue(request.getParameter("productNames"), "");
    String mobileNameUtf8 = Util.isNullValue(request.getParameter("productNames"), "");
    String mobileProductNames = new String(mobileNameUtf8.getBytes("euc-kr"));

    String total = Util.isNullValue(request.getParameter("total"), "");
    String totalPoint = Util.isNullValue(request.getParameter("totalPoint"), "");
    String deliveryPrice = Util.isNullValue(request.getParameter("deliveryPrice"), "");
    String discountPoint = Util.isNullValue(request.getParameter("discountPoint"), "");
%>
<%
    // 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
    //String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)
    String mid                  = ConfigHolder.getINIPayMid();
    //인증
    //String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
    String signKey              = ConfigHolder.getINIPaySignKey();
    String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

    //String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
    String oid                  = Util.getJId();
    String price				= allProductPrice;													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)
    //String price = "150";
    String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
    String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

    //###############################################
    // 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
    //###############################################
    String mKey = SignatureUtil.hash(signKey, "SHA-256");

    //###############################################
    // 2.signature 생성
    //###############################################
    Map<String, String> signParam = new HashMap<String, String>();

    signParam.put("oid", oid); 					// 필수
    signParam.put("price", price);				// 필수
    signParam.put("timestamp", timestamp);		// 필수

    // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
    String signature = SignatureUtil.makeSignature(signParam);

    /* 기타 */
    String siteDomain = "http://localhost:8000"; //가맹점 도메인 입력
    // 페이지 URL에서 고정된 부분을 적는다.
    // Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
    // http://localhost:8080/INIpayStdSample 까지만 기입한다.
%>
<script src="/common/zian/js/inicis.js"></script>
<script>
    $( document ).ready(function() {

        var locationHost = location.host;
        var returnUrl = "http://" + locationHost + "/myPage?page_gbn=orderResult";
        var notiUrl = "http://" + locationHost + "/jsp/payment/INIPayMobileNoti.jsp";
        var nextUrl = "http://" + locationHost + "/jsp/payment/INIPayMobileNext.jsp";

        innerValue("returnUrl", returnUrl);
        innerValue("P_NEXT_URL", nextUrl);
        innerValue("P_NOTI_URL", notiUrl);

        var closeUrl = "http://" + locationHost + "/payment?page_gbn=inicisClose";
        innerValue("closeUrl", closeUrl);

        $("input:radio[name=ckbox]").click(function(){
            var pcMobile =  divisionPcMobile();
            if(pcMobile == "PC"){
                innerValue("gopaymethod", $(this).val())
            }else{
                innerValue("paymethod", $(this).val())
            }
            //무통장입금 클릭했을때
            if($(this).val() == 'VBank'){
                gfn_display("bankInfoDiv", true);
            }else{
                gfn_display("bankInfoDiv", false);
            }
        });
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var cartKeys = sessionStorage.getItem('cartNum');
        if(sessionStorage.getItem('gKeys') != ""){
            var gKeys = JSON.parse(sessionStorage.getItem('gKeys'));
        }else{
            gKeys = "";
        }
        if(sessionStorage.getItem('goodsInfo') != "") {
            var goodsInfo = sessionStorage.getItem('goodsInfo');
        }else{
            goodsInfo = "";
        }
        if(sessionStorage.getItem('retakeInfo') != "") {
            var retakeInfo = sessionStorage.getItem('retakeInfo');
        }else{
            retakeInfo = "";
        }
        if(sessionStorage.getItem('resultData') != "") {
            var resultData = JSON.parse(sessionStorage.getItem('resultData'));
        }else{
            resultData = "";
        }
        if(sessionStorage.getItem('priceKey') != ""){
            var priceKey = JSON.parse(sessionStorage.getItem('priceKey'));
        }else{
            priceKey = "";
        }
        if(sessionStorage.getItem('bookCount') != ""){
            var bookCount = JSON.parse(sessionStorage.getItem('bookCount'));
        }else{
            bookCount = "";
        }
        var total = '<%=total%>';
        var totalPoint = '<%=totalPoint%>';
        var deliveryPrice = '<%=deliveryPrice%>';
        var discountPoint = '<%=discountPoint%>';
        var data = {
            price : total,
            pricePay : parseInt(resultData.allProductPrice),
            point : parseInt(totalPoint),
            discountPoint : parseInt(discountPoint),
            deliveryPrice : parseInt(deliveryPrice)
        };
        if(sessionStorage.getItem('savePayInfo') != "") {
            sessionStorage.setItem("savePayInfo", JSON.stringify(data));
        }
        if(gKeys != ""){//바로구매
            innerValue("gKeys", gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if(gKeys == "" && goodsInfo == "" && retakeInfo == '' && priceKey == "" && bookCount == ''){
            innerValue("cartNum", cartKeys);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else if(gKeys == "" && cartKeys == "" && retakeInfo == '' && priceKey == "" && bookCount == ''){//패키지
            innerValue("goodsInfo", goodsInfo);
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);
        }else if(gKeys == "" && cartKeys == "" && goodsInfo == '' && priceKey == "" && bookCount == ''){//재수강
            getOrderSheetInfoFromImmediatelyAtRetake(userKey, retakeInfo);
        }else{
            var arr = new Array();
            arr.push(priceKey);
            var priceList = toStrFileName(arr);
            getOrderSheetInfoFromImmediatelyAtBookStore(userKey, priceList, bookCount);
        }

        innerValue("allProductPrice", resultData.allProductPrice);
        innerHTML("allPrice", format(resultData.allProductPrice));
        innerHTML("orderName1", resultData.postName);
        innerHTML("telephone1", resultData.allTel);
        innerHTML("telephoneMobile1", resultData.allPhone);
        innerHTML("email1", resultData.allEmail);
        innerHTML("zipcode1", resultData.postCode);
        innerHTML("address1", resultData.add1);
        innerHTML("address2", resultData.add2);

        innerValue("postName", resultData.postName);
        innerValue("allTel", resultData.allTel);
        innerValue("allPhone", resultData.allPhone);
        innerValue("allEmail", resultData.allEmail);
        innerValue("postCode1", resultData.postCode);
        innerValue("add1", resultData.add1);
        innerValue("add2", resultData.add2);
    });

    function goOrderResult() {
        $("#id_frm_orderPay").attr( "action", "/myPage?page_gbn=orderResult");
        $("#id_frm_orderPay").submit();
    }
</script>
<style>
    body, tr, td {font-size:10pt; font-family:돋움,verdana; color:#433F37; line-height:19px;}
    table, img {border:none}
</style>
<script language="javascript" type="text/javascript" src="https://stgstdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
<form action="/mypage/cart/orderResult" id="id_frm_orderPay" method="post" name="name_frm_orderPay">
    <input type="hidden" id="allProductPrice" name="allProductPrice"><!-- 결제해야할 총 금액 -->
    <input type="hidden" id="cartNum" name="cartNum">
    <input type="hidden" id="gKeys" name="gKeys">
    <input type="hidden" id="postName" name="postName">
    <input type="hidden" id="allTel" name="allTel">
    <input type="hidden" id="allPhone" name="allPhone">
    <input type="hidden" id="allEmail" name="allEmail">
    <input type="hidden" id="postCode1" name="postCode1">
    <input type="hidden" id="add1" name="add1">
    <input type="hidden" id="add2" name="add2">
</form>
<!--pc-->
<body onload="setOid()" topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
<div id="mobilePay" style="display: none">
    <table width="320" border="0" cellpadding="0" cellspacing="0">
        <form id="form1" name="ini" method="post" style="display: none;" accept-charset="euc-kr">
            <tr>
                <td height="347" align="center" valign="top" background="images/bg_01.png"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="298" height="296" align="center" background="images/table_bg.png"><table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="left">
                                    <select name="inipaymobile_type" id="select">
                                        <option value="web">INIpayMobile Web
                                    </select>
                                </td>
                            </tr>
                            <input type="hidden" name="P_OID" id="textfield2"/>
                            <td align="left"><input type="hidden" name="P_GOODS" value="<%=pcProductNames%>" id="textfield3"/></td>
                            <td align="left"><input type="hidden" name="P_AMT" value="<%=allProductPrice%>" id="textfield4"></td>
                            <td align="left"><input type="hidden" name="P_UNAME" value="<%=userName%>" id="textfield5"></td>
                            <td align="left"><input type="hidden" name="P_MNAME" value="이니시스 쇼핑몰" id="textfield6"></td>
                            <td align="left"><input type="hidden" name="P_MOBILE" id="textfield7" value="<%=phoneNum %>"></td>
                            <td align="left"><input type="hidden" name="P_EMAIL" value="<%=email%>" id="textfield8"></td>
                            <tr>
                                <td width="95" height="25" align="left">결과페이지 링크</td>
                            </tr>
                            <tr>
<%--                                <input type="hidden" name="paymethod"  id="paymethod" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/>--%>
                                <td height="25" align="left">결제방법 </td>
                                <td align="left"><label>
                                    <select name="paymethod" id="select">
                                        <option value="wcard">신용카드
                                        <option value="vbank">가상계좌
                                        <option value="mobile">휴대폰
                                        <option value="culture">문화 상품권
                                        <option value="hpmn">해피머니 상품권
                                    </select>
                                </label></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td height="39" align="center" valign="bottom"><input type="button" value="결제하기" onclick="javascript:onSubmit();"/></td>
                    </tr>
                </table></td>
            </tr>
            <input type="hidden" name="P_MID" value="<%=mid%>">
            <input type=hidden name="P_NEXT_URL" id="P_NEXT_URL" value="">
            <input type=hidden name="P_RESERVED" id="P_RESERVED" value="">
            <input type=hidden name="P_NOTI_URL" value="">
            <input type=hidden name="P_HPP_METHOD" value="1">
        </form>
    </table>
</div>
<form id="SendPayForm_id" name="SendPayForm_id" method="POST" style="display: none;">
    <div>
        <input type="hidden"  name="version" value="1.0">
        <input type="hidden"  name="mid" value="<%=mid%>">
        <input type="hidden"  name="goodname" id="goodname" value="<%=pcProductNames%>">
        <input type="hidden" name="oid" value="<%=oid%>">
        <input type="hidden" name="price" value="<%=price%>">
        <input type="hidden" name="currency" value="WON">
        <input type="hidden" name="buyername" value="<%=userName%>">
        <input type="hidden" name="buyertel" value="<%=phoneNum%>">
        <input type="hidden" name="buyeremail" value="<%=email%>">
        <input type="hidden" name="timestamp" value="<%=timestamp %>">
        <input type="hidden" name="signature" value="<%=signature%>">
        <input type="hidden" name="returnUrl" id="returnUrl" value="">
        <input type="hidden" name="mKey" value="<%=mKey%>">
    </div>
        <input type="hidden" name="gopaymethod" id="gopaymethod" value="" >
        <input type="hidden" name="offerPeriod" value="20151001-20151231" >
        <input type="hidden" name="acceptmethod" value="CARDPOINT:HPP(1):no_receipt:va_receipt:vbanknoreg(0):below1000" >
        <input type="hidden" name="languageView" value="" >
        <input type="hidden" name="charset" value="" >
        <input type="hidden" name="payViewType" value="" >
        <input type="hidden" name="closeUrl" id="closeUrl" >
        <input type="hidden" name="popupUrl" value="<%=siteDomain%>/popup.jsp" >
        <input type="hidden" name="quotabase" value="<%=cardQuotaBase%>" >
        <input type="hidden" name="ini_onlycardcode" value="" >
        <input type="hidden" name="ini_cardcode" value="" >
        <input type="hidden" name="ansim_quota" value="" >
        <input type="hidden" name="INIregno" value="" >
        <input type="hidden" name="merchantData" value="" >
</form>

<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
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
                        <li><label>02.<b>주문서작성</b></label></li>
                        <li class="active"><label>03.<b>결제하기</b></label></li>
                        <li class="last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <div class="tbd_03 mgb20">
                            <p class="title"><span class="text_blue">최종 주문상품</span> 확인</p>
                            <table>
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
                                    <td><span class="taxt_blue">[<span id="zipcode"></span>]</span><span id="address"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 tbd_05 mgb60" id="deliveryInfo">
                            <p class="title"><span class="text_blue">배송지</span>정보확인</p>
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td id="orderName1"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td id="telephone1"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td id="telephoneMobile1"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="email1"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><span class="taxt_blue">[<span id="zipcode1"></span>]</span> <span id="address1"></span> <br><span id="address2"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pay">
                            <p class="title"><span class="text_blue">결제</span>하기</p>
                            <div class="left" style="width: 700px;">
                                <ul id="pcPaymentMethodUl" style="display: none">
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox" value="Card" id="ckbox1" checked>신용카드</li>
                                    <li><input type="radio" name="ckbox" value="DirectBank" id="ckbox2">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox" value="VBank" id="ckbox3">무통장입금</li>
                                </ul>
                                <ul id="mobilePaymentMethodUl" style="display: none">
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox2" value="wcard" id="ckbox1">신용카드</li>
                                    <li><input type="radio" name="ckbox2" value="bank" id="ckbox2">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox2" value="vbank" id="ckbox3">무통장입금</li>
                                </ul>
                            </div>
                            <div class="right">
                                <li class="pay-sum">
                                    <span class="txt1">총 주문금액</span>
                                    <span class="txt2"><b id="allPrice"></b>원</span>
                                </li>
                                <div class="btn_area">
                                    <a href="javascript:void(0);" onclick="INIStdPay.pay('SendPayForm_id')"  class="blue" id="pcBtn" style="display: none;">결제하기</a>
                                    <a href="javascript:void(0);" onclick="javascript:onSubmit();"  class="blue" id="mobileBtn" style="display: none;">결제하기</a>
                                    <a href="javascript:window.history.back();" class="gray">이전으로</a>
                                </div>
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