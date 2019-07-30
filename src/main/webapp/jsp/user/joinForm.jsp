<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap">
    <!--좌측사이트메뉴-->
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
    <!--//최상단배너-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--상단-->
    <!--//상단-->

    <!--본문-->
    <script>
        function init() {
        }
    </script>
    <div id="container">
        <div class="inner">
            <div class="joinWrap">
                <h2>회원가입</h2>
                <ul class="statusBar">
                    <li class="active"><b>01.</b>약관동의</li>
                    <li><b>02.</b>회원정보</li>
                    <li class="last"><b>03.</b>가입완료</li>
                </ul>
                <div class="joinAgreeAll">
                    <label for="">회원 이용약관, 개인정보 수집 및 이용, 이벤트 및 광고알림 sms / 메일수신(선택)에 모두 동의합니다.</label>
                    <input type="checkbox" name="" value="">
                </div>
                <div class="joinAgree">
                    <label for="">이용 약관 동의 <b>(필수)</b></label>
                    <input type="checkbox" name="" value="">
                    <p>내용</p>
                </div>
                <div class="joinAgree">
                    <label for="">개인정보 수집 및 허용에 관한 안내 <b>(필수)</b></label>
                    <input type="checkbox" name="" value="">
                    <p>내용</p>
                </div>
                <div class="joinAgree">
                    <label for="">이벤트 및 광고 알림  sns / 메일 수신 <b>(필수)</b></label>
                    <input type="checkbox" name="" value="">
                    <p>내용</p>
                </div>
                <div class="btnArea">
                    <a href="#" class="btn_l w130 on">동의합니다</a>
                    <a href="javascript:goBack();" class="btn_l w130">돌아가기</a>
                </div>
            </div>
        </div>
    </div>
    <!--//본문-->

    <!--하단-->
    <%@include file="/common/jsp/footer.jsp" %>
    <!--//하단-->
    <!--우측따라다니는영역-->
    <%@include file="/common/jsp/rightMenu.jsp" %>
    <!--//우측따라다니는영역-->
    <!--하단고정식배너-->
    <%@include file="/common/jsp/footerBanner.jsp" %>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
