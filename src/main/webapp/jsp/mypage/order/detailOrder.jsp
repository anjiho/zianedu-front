<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@include file="/common/jsp/common.jsp" %>
<%
    String jkey = request.getParameter("jkey");
%>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('myPageHeader');
        if(leftMenuInfo == null){
            $("#noticeMenu li:eq(0)").addClass('active');
            sessionStorage.setItem("myPageHeader", "orderList");
        }
        var jKey = <%=jkey%>;
        getUserOrderDetail(jKey);
    });

    //후기작성
    function goReview(jlecKey) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var availableReview = getAvailabilityLectureReview(sessionUserInfo.userKey, jlecKey);
        if(availableReview == false){
            alert("후기 작성을 할 수 없습니다.");
            return false;
        }else{
            innerValue("jlecKey", jlecKey);
            goPage('review','saveLecture');
        }
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="jlecKey" id="jlecKey">
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
                    <div class="tbd_03 tbd_04">
                        <div class="btn_crud2">
                            <a href="javascript:goPageNoSubmit('myPage','orderList');" class="reline_btn">목록</a>
                        </div>
                        <table>
                            <thead>
                            <tr>
                                <th style="width: 70%;">상품명</th>
                                <th style="width: 20%;">구분</th>
                                <th style="width: 10%;"></th>
                            </tr>
                            </thead>
                            <tbody id="productList"></tbody>
                        </table>
                        <table>
                            <tbody>
                            <tr>
                                <th>판매가</th>
                                <td id="priceName"></td>
                            </tr>
                            <tr>
                                <th>총 결제금액</th>
                                <td id="pricePayName"></td>
                            </tr>
                            <tr>
                                <th>결제방법</th>
                                <td id="payTypeName"></td>
                            </tr>
                            <tr>
                                <th>결제상탠</th>
                                <td id="payStatusName"></td>
                            </tr>
                            </tbody>
                        </table>

                        <table>
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
                                <td id="address"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
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

