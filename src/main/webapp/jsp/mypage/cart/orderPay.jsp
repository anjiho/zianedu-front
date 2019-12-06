<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%
    String cartNum = Util.isNullValue(request.getParameter("cartNum"), "");
    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
    //String allProductPrice = Util.isNullValue(request.getParameter("allProductPrice"), "");
    String allProductPrice = "1000";
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
    String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)

    //인증
    String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
    String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

    //String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
    String oid                  = Util.getJId();
    //String price				= allProductPrice;													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)
    String price = "150";
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
        });
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;

        <%--var allProductPrice = "<%= request.getParameter("allProductPrice") %>";--%>
        <%--var postName = "<%= request.getParameter("postName") %>";--%>
        <%--var allTel = "<%= request.getParameter("allTel") %>";--%>
        <%--var allPhone = "<%= request.getParameter("allPhone") %>";--%>
        <%--var allEmail = "<%= request.getParameter("allEmail") %>";--%>
        <%--var postCode = "<%= request.getParameter("postCode1") %>";--%>
        <%--var add1 = "<%= request.getParameter("add1") %>";--%>
        <%--var add2 = "<%= request.getParameter("add2") %>";--%>

        // var resultData = {
        //     allProductPrice : allProductPrice,
        //     postName : postName,
        //     allTel : allTel,
        //     allPhone : allPhone,
        //     allEmail : allEmail,
        //     postCode : postCode,
        //     add1 : add1,
        //     add2 : add2
        // };
        // sessionStorage.setItem("resultData", JSON.stringify(resultData));

        var cartKeys = sessionStorage.getItem('cartNum');
        var gKeys = sessionStorage.getItem('gKeys');
        var goodsInfo = sessionStorage.getItem('goodsInfo');
        var resultData = JSON.parse(sessionStorage.getItem('resultData'));

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
        sessionStorage.setItem("savePayInfo", JSON.stringify(data));

        if( cartKeys == "" && goodsInfo == ""){//바로구매
            <%--//var gKeys = toStrFileName(<%= request.getParameter("gKeys") %>);--%>
            innerValue("gKeys", gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if(gKeys == "" && goodsInfo == ""){
            <%--//var cartKeys = toStrFileName(<%= request.getParameter("cartNum") %>);--%>
            innerValue("cartNum", cartKeys);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else{//패키지
            <%--//var goodsInfo ='<%= request.getParameter("goodsInfo") %>';--%>
            innerValue("goodsInfo", goodsInfo);
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);
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
        <form id="form1" name="ini" method="post" action="" style="display: none;" accept-charset="euc-kr">
            <tr>
                <td height="347" align="center" valign="top" background="images/bg_01.png"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="298" height="296" align="center" background="images/table_bg.png"><table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="95" height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">방식</td>
                                <td align="left">
                                    <select name="inipaymobile_type" id="select">
                                        <option value="web">INIpayMobile Web
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">주문번호</td>
                                <td align="left"><input type="hidden" name="P_OID" id="textfield2" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">상품명</td>
                                <td align="left"><input type="hidden" name="P_GOODS" value="<%=pcProductNames%>" id="textfield3" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">가격 </td>
                                <td align="left"><input type="hidden" name="P_AMT" value="<%=allProductPrice%>" id="textfield4" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">구매자이름</td>
                                <td align="left"><input type="hidden" name="P_UNAME" value="<%=userName%>" id="textfield5" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">상점이름 </td>
                                <td align="left"><input type="hidden" name="P_MNAME" value="이니시스 쇼핑몰" id="textfield6" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">휴대폰번호</td>
                                <td align="left"><input type="hidden" name="P_MOBILE" id="textfield7" value="<%=phoneNum %>" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">이메일</td>
                                <td align="left"><input type="hidden" name="P_EMAIL" value="<%=email  %>" id="textfield8" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
<%--                                <input type="hidden" name="paymethod"  id="paymethod" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/>--%>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">결제방법 </td>
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
            <input type="hidden" name="P_MID" value="INIpayTest">
            <input type=hidden name="P_NEXT_URL" id="P_NEXT_URL" value="">
            <input type=hidden name="P_RESERVED" id="P_RESERVED" value="twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N">
            <input type=hidden name="P_NOTI_URL" value="">
            <input type=hidden name="P_HPP_METHOD" value="1">
        </form>
    </table>
</div>
<form id="SendPayForm_id" name="SendPayForm_id" method="POST" style="display: none;">
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><input type="hidden"  style="width:100%;" name="version" value="1.0">
        <br/><input type="hidden"  style="width:100%;" name="mid" value="<%=mid%>">
        <br/><input type="hidden"  style="width:100%;" name="goodname" id="goodname" value="<%=pcProductNames%>">
        <br/><input type="hidden" style="width:100%;" name="oid" value="<%=oid%>">
        <br/><input type="hidden" style="width:100%;" name="price" value="<%=price%>">
        <br/><input type="hidden" style="width:100%;" name="currency" value="WON">
        <br/><input type="hidden" style="width:100%;" name="buyername" value="<%=userName%>">
        <br/><input type="hidden" style="width:100%;" name="buyertel" value="<%=phoneNum%>">
        <br/><input type="hidden" style="width:100%;" name="buyeremail" value="<%=email%>">
        <input type="hidden" style="width:100%;" name="timestamp" value="<%=timestamp %>">
        <input type="hidden" style="width:100%;" name="signature" value="<%=signature%>">
        <br/><input type="hidden" style="width:100%;" name="returnUrl" id="returnUrl" value="">
        <input type="hidden"  name="mKey" value="<%=mKey%>">
    </div>

    <br/><br/>
    <b>***** 기본 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <b>gopaymethod</b> : 결제 수단 선택
        <br/>ex) Card (계약 결제 수단이 존재하지 않을 경우 에러로 리턴)
        <br/>사용 가능한 입력 값
        <br/>Card,DirectBank,HPP,Vbank,kpay,Swallet,Paypin,EasyPay,PhoneBill,GiftCard,EWallet
        <br/>onlypoint,onlyocb,onyocbplus,onlygspt,onlygsptplus,onlyupnt,onlyupntplus
        <br/><input type="hidden" style="width:100%;" name="gopaymethod" id="gopaymethod" value="" >
        <br/><br/>

        <br/>
        <b>offerPeriod</b> : 제공기간
        <br/>ex)20151001-20151231, [Y2:년단위결제, M2:월단위결제, yyyyMMdd-yyyyMMdd : 시작일-종료일]
        <br/><input type="hidden" style="width:100%;" name="offerPeriod" value="20151001-20151231" >
        <br/><br/>

        <br/><b>acceptmethod</b> : acceptmethod
        <br/>acceptmethod  ex) CARDPOINT:SLIMQUOTA(코드-개월:개월):no_receipt:va_receipt:vbanknoreg(0):vbank(20150425):va_ckprice:vbanknoreg:
        <br/>KWPY_TYPE(0):KWPY_VAT(10|0) 기타 옵션 정보 및 설명은 연동정의보 참조 구분자 ":"
        <br/><input type="hidden" style="width:100%;" name="acceptmethod" value="CARDPOINT:HPP(1):no_receipt:va_receipt:vbanknoreg(0):below1000" >
    </div>

    <br/><br/>
    <b>***** 표시 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><b>languageView</b> : 초기 표시 언어
        <br/>[ko|en] (default:ko)
        <br/><input style="width:100%;" name="languageView" value="" >

        <br/><b>charset</b> : 리턴 인코딩
        <br/>[UTF-8|EUC-KR] (default:UTF-8)
        <br/><input style="width:100%;" name="charset" value="" >

        <br/><b>payViewType</b> : 결제창 표시방법
        <br/>[overlay] (default:overlay)
        <br/><input style="width:100%;" name="payViewType" value="" >

        <br/><b>closeUrl</b> : payViewType='overlay','popup'시 취소버튼 클릭시 창닥기 처리 URL(가맹점에 맞게 설정)
        <br/>close.jsp 샘플사용(생략가능, 미설정시 사용자에 의해 취소 버튼 클릭시 인증결과 페이지로 취소 결과를 보냅니다.)
        <br/><input style="width:100%;" name="closeUrl" id="closeUrl" >

        <br/><b>popupUrl</b> : payViewType='popup'시 팝업을 띄울수 있도록 처리해주는 URL(가맹점에 맞게 설정)
        <br/>popup.jsp 샘플사용(생략가능,payViewType='popup'으로 사용시에는 반드시 설정)
        <br/><input style="width:100%;" name="popupUrl" value="<%=siteDomain%>/popup.jsp" >

    </div>

    <b>***** 결제 수단별 옵션 *****</b>
    <br/>
    <b>-- 카드(간편결제도 사용) --</b>
    <div style="border:2px #cccccc solid;padding:10px;background-color:#f3f3f3;">

        <br/><b>quotabase</b> : 할부 개월 설정
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="quotabase" value="<%=cardQuotaBase%>" >

        <br/><b>ini_onlycardcode</b> : 중복 카드 코드
        <br/>ex) 01:03:04:11
        <br/><input  style="width:100%;" name="ini_onlycardcode" value="" >

        <br/><b>ini_cardcode</b> : 카드 코드
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="ini_cardcode" value="" >

        <br/><b>ansim_quota</b> : 할부 선택
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="ansim_quota" value="" >

    </div>

    <b>-- 가상계좌 --</b>
    <div style="border:2px #cccccc solid;padding:10px;background-color:#f3f3f3;">
        <br/><b>INIregno</b> : 주민번호 설정 기능
        <br/>13자리(주민번호),10자리(사업자번호),미입력시(화면에서입력가능)
        <br/><input  style="width:100%;" name="INIregno" value="" >
    </div>

    <br/><br/>
    <b>***** 추가 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><b>merchantData</b> : 가맹점 관리데이터(2000byte)
        <br/>인증결과 리턴시 함께 전달됨(한글 지원 안됨, 개인정보 암호화(권장))
        <br/><input  style="width:100%;" name="merchantData" value="" >
    </div>

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
                        <div class="tbd_03 tbd_05 mgb60">
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
                            <div class="left" style="width: 750px;">
                                <ul id="pcPaymentMethodUl" style="display: none">
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox" value="Card" id="ckbox1">신용카드</li>
                                    <li><input type="radio" name="ckbox" value="DirectBank" id="ckbox2">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox" value="VBank" id="ckbox3">무통장입금</li>
                                </ul>
                                <ul id="mobilePaymentMethodUl" style="display: none">
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox2" value="wcard" id="ckbox1">신용카드</li>
                                    <li><input type="radio" name="ckbox2" value="bank" id="ckbox2">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox2" value="vbank" id="ckbox3">무통장입금</li>

                                </ul>
                                <div id="1" class="ckctn">
                                    <div class="ckinner credit"></div>
                                </div>
                                <div id="2" class="ckctn">
                                    <div class="ckinner transfer"></div>
                                </div>
                                <div id="3" class="ckctn">
                                    <div class="ckinner receipt">
                                        <p class="title">입금은행</p>
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>은행명</th>
                                                <th>계좌번호</th>
                                                <th>예금주</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>국민은행</td>
                                                <td>013837-04-002130</td>
                                                <td>(주)지안에듀</td>
                                            </tr>
                                            <tr>
                                                <td>농협</td>
                                                <td>355-0019-9102-83</td>
                                                <td>(주)지안에듀</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div class="detail">
                                                        <ul>
                                                            <li>입금자 <input type="text" name="" value="" class="">
                                                                <span class="txt">(단, 마일리지는 1,000점 이상 적립 되었을때, 현금과 동일하게 100원 단위로 사용이 가능합니다.) </span>
                                                            </li>
                                                            <li>입금예정일<span class="date">2019년 07월 26일</span></li>
                                                            <li>현금영수증발급
                                                                <select name="" class="w200">
                                                                    <option value="">신청안함</option>
                                                                    <option value="">소득공제용(개인-주민번호)</option>
                                                                    <option value="">소득공제용(개인-휴대폰번호)</option>
                                                                    <option value="">소득공제용(사업자-사업자번호)</option>
                                                                </select>
                                                            </li>
                                                            <li class="text_blue">※ 당일 오후 3시(토요일은 오후 12시) 까지 입금확인 된 주문건에 한하여 당일 발송이 가능합니다</li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
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