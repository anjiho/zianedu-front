<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String name = Util.isNullValue(new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8"), "");
%>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var cartKeys = sessionStorage.getItem('cartNum');
        var gKeys = sessionStorage.getItem('gKeys');
        var goodsInfo = sessionStorage.getItem('goodsInfo');
        var resultData = JSON.parse(sessionStorage.getItem('resultData'));
        var userKey = sessionUserInfo.userKey;

        var iniResult = JSON.parse(sessionStorage.getItem('saveInipayInfoData'));
        var payMethod = iniResult.paymethod;
        var vactDate = iniResult.vactDate;
        var vateDateStr = gfn_dateFormat(vactDate, 14, 'F');
        var vactBankCode =  iniResult.vactBankCode;
        var bankCodeName = '';
        if(vactBankCode == '04'){
            bankCodeName = '국민은행';
        }else{
            bankCodeName = '농협';
        }
        if(payMethod == 'VBANK'){
            innerHTML("bankName", bankCodeName);//
            innerHTML("vactNum", iniResult.vactNum);//
            innerHTML("payMethodName ", '무통장입금');
            innerHTML("payStatusName ", '입금예정');//
            innerHTML("vactDate ", vateDateStr);//
            innerHTML("vackName ", '<%=name%>');
            gfn_display("goReceipt", false);
        }else if(payMethod == 'CARD'){
            innerHTML("payMethodName ", '신용카드');
            innerHTML("payStatusName ", '결제완료');//
            gfn_display("line1", false);
            gfn_display("line2", false);
            gfn_display("line3", false);
            gfn_display("line4", false);
            gfn_display("goReceipt", true);
        }else if(payMethod == 'BANK'){
            innerHTML("payMethodName ", '실시간 계좌이체');
            innerHTML("payStatusName ", '결제완료');//
            gfn_display("line1", false);
            gfn_display("line2", false);
            gfn_display("line3", false);
            gfn_display("line4", false);
            gfn_display("goReceipt", true);
        }

        if(cartKeys == "" && goodsInfo == ""){//바로구매
            //var gKeys = toStrFileName(gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if(gKeys == "" && goodsInfo == ""){
            //var cartKeys = toStrFileName(cartNum);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else{//패키지
            //var goodsInfo = goodsInfo;
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
    });

    function goReceiptPopup() {
        var iniResult = JSON.parse(sessionStorage.getItem('saveInipayInfoData'));
        var url = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid="+ iniResult.tid +"&noMethod=1";
        gfn_winPop(350, 350, url);
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="allProductPrice" name="allProductPrice">
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
                        <li><label>03.<b>결제하기</b></label></li>
                        <li class="active last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <p class="pay_comtitle">상품을 <span class="text_blue">구매</span>해주셔서 감사합니다.
                            <span class="subtitle"><span class="text_blue">[내 강의실-수강중인강좌]</span>에서 바로 수강하실 수 있습니다.</span>
                        </p>
                        <div class="tbd_03 mgb20">
                            <p class="title"><span class="text_blue">구매상품</span>정보</p>
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
                                <tbody id="dataList"></tbody>
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
                        <div class="pay_com">
                            <p class="title"><span class="text_blue">결제</span>정보</p>
                            <div class="left">
                                <ul>
                                    <li><span class="tit">결제방법</span><span id="payMethodName"></span></li>
                                    <li id="line1"><span class="tit">입금은행</span><span id="bankName"></span></li>
                                    <li id="line2"><span class="tit">계좌번호</span><span id="vactNum"></span></li>
                                    <li id="line3"><span class="tit">입금자명</span><span id="vackName"></span></li>
                                    <li id="line4"><span class="tit">입금예정일</span><span id="vactDate"></span></li>
                                    <li ><span class="tit">결제상태</span><span id="payStatusName"></span>
                                        <input type="button" onclick="goReceiptPopup();" value="영수증출력" id="goReceipt">
                                    </li>
                                </ul>
                            </div>
                            <div class="right">
                                <li class="pay-sum">
                                    <span class="txt1">총 주문금액</span>
                                    <span class="txt2"><b id="allPrice"></b>원</span>
                                </li>
                            </div>
                        </div>
                        <!--버튼 -->
                        <div class="btn_area">
                            <div class="center">
                                <a href="javascript:goMain();" class="blue">메인으로</a>
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