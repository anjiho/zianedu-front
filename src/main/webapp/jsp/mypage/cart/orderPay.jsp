<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    String cartNum = Util.isNullValue(request.getParameter("cartNum"), "");
    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
%>
<script>
    var cartNum = <%=cartNum%>;
    var gKeys = <%=gKeys%>;
    var goodsInfo = <%=goodsInfo%>;
    $( document ).ready(function() {

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;

        var allProductPrice = "<%= request.getParameter("allProductPrice") %>";
        var postName = "<%= request.getParameter("postName") %>";
        var allTel = "<%= request.getParameter("allTel") %>";
        var allPhone = "<%= request.getParameter("allPhone") %>";
        var allEmail = "<%= request.getParameter("allEmail") %>";
        var postCode = "<%= request.getParameter("postCode1") %>";
        var add1 = "<%= request.getParameter("add1") %>";
        var add2 = "<%= request.getParameter("add2") %>";

        console.log(cartNum);
        return false;
        if(cartKeys == null){//바로구매
            var gKeys = toStrFileName(<%= request.getParameter("gKeys") %>);
            innerValue("gKeys", gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if(cartKeys != null){
            var cartKeys = toStrFileName(<%= request.getParameter("cartNum") %>);
            innerValue("cartNum", cartKeys);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else{//패키지
            var goodsInfo = toStrFileName(<%= request.getParameter("goodsInfo") %>);
            innerValue("goodsInfo", goodsInfo);
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, JSON.stringify(goodsInfo), 1);
        }

        innerValue("allProductPrice", allProductPrice);
        innerHTML("allPrice", format(allProductPrice));
        innerHTML("orderName1", postName);
        innerHTML("telephone1", allTel);
        innerHTML("telephoneMobile1", allPhone);
        innerHTML("email1", allEmail);
        innerHTML("zipcode1", postCode);
        innerHTML("address1", add1);
        innerHTML("address2", add2);

        innerValue("postName", postName);
        innerValue("allTel", allTel);
        innerValue("allPhone", allPhone);
        innerValue("allEmail", allEmail);
        innerValue("postCode1", postCode);
        innerValue("add1", add1);
        innerValue("add2", add2);

    });
    
    function goOrderResult() {
        $("#id_frm_orderPay").attr( "action", "/myPage?page_gbn=orderResult");
        $("#id_frm_orderPay").submit();
    }
</script>
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
                                <ul>
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox" value="" id="ckbox1" onClick="checkBox()">신용카드</li>
                                    <li><input type="radio" name="ckbox" value="" id="ckbox2" onClick="checkBox()">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox" value="" id="ckbox3" onClick="checkBox()">무통장입금</li>
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
                                    <a href="javascript:goOrderResult();" class="blue">결제하기</a>
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