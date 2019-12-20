<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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
    });
</script>
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
                    <div class="tbd_03 tbd_04">
                        <div class="btn_crud2">
                            <a href="javascript:goPageNoSubmit('myPage','orderList');" class="reline_btn">목록</a>
                            <a href="" class="re_btn">후기작성<span ></span></a>
                        </div>
                        <table>
                            <tbody>
                            <tr>
                                <th>상품명</th>
                                <td>2019 시험대비 이학민 응용역학 기본+심화이론강의 [5% 적립]</td>
                            </tr>
                            <tr>
                                <th>구분</th>
                                <td>온라인 강좌</td>
                            </tr>
                            <tr>
                                <th>판매가</th>
                                <td>340,000원</td>
                            </tr>
                            <tr>
                                <th>총 결제금액</th>
                                <td>300,000</td>
                            </tr>
                            <tr>
                                <th>결제방법</th>
                                <td>신용카드</td>
                            </tr>
                            <tr>
                                <th>결제상탠</th>
                                <td>결제완료</td>
                            </tr>
                            </tbody>
                        </table>

                        <table>
                            <tbody>
                            <tr>
                                <th>주문자</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>010-0000-0000</td>
                            </tr>
                            <tr>
                                <th>휴대전화</th>
                                <td>010-0000-0000</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>abc@gmail.com</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>서울특별시 서초구</td>
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

