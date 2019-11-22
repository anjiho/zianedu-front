<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap">
    <!--좌측사이트메뉴-->
<%--    <%@include file="/common/jsp/leftMenu.jsp" %>--%>
    <!--//좌측사이트메뉴-->

    <!--상단-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--//상단-->
    <!--본문-->
    <div id="container">
        <div class="inner">
            <!--서브 컨텐츠-->
            <div class="joinWrap">
                <h2>회원가입</h2>
                <ul class="statusBar">
                    <li><label>01.<b>약관동의</b></label></li>
                    <li><label>02.<b>회원정보</b></label></li>
                    <li class="active last"><label>03.<b>가입완료</b></label></li>
                </ul>
                <div class="joinResult">
                    <b>가입을 축하드립니다.</b>
                    지안에듀 가입을 축하드립니다 다양한 컨텐츠들을 이용바랍니다.<br>
                    지금 바로 서비스를 이용해보세요.
                </div>


                <div class="btnArea">
                    <a href="javascript:goPage('user', 'login');" class="btn_l on">로그인</a>
                    <a href="javascript:goMain();" class="btn_l white">메인이동</a>
                </div>


            </div>
            <!--//서브 컨텐츠-->
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
<%--    <%@include file="/common/jsp/footerBanner.jsp" %>--%>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
<script>
$(function(){
    $(".joinAgree label b").click(function(){
        $(this).parent().parent().toggleClass("active");
    });
});
</script>
