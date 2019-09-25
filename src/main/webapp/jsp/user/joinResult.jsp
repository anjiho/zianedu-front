<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap">
    <!--좌측사이트메뉴-->
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--//좌측사이트메뉴-->

    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
            <!--최상단메뉴-->
            <div id="topNav">
                <ul>
                    <li><a href="#" class="btn_bookmark">즐겨찾기에 등록</a></li>
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">합격수기</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>
            </div>
            <!--//최상단메뉴-->
        </div>
        <!--주메뉴-->
        <div id="gnb">
            <div class="inner">
                <ul class="deaph1 cols7">
                    <li><a href="#">내강의실</a>
                        <%--                        <ul class="deaph2">--%>
                        <%--                            <li><a href="#">수강중</a></li>--%>
                        <%--                            <li><a href="#">일시정지</a></li>--%>
                        <%--                            <li><a href="#">수강완료</a></li>--%>
                        <%--                        </ul>--%>
                    </li>
                    <li><a href="#">교수소개</a>
                        <ul class="deaph2 cols3">
                            <%--                            <li>--%>
                            <%--                                <label>국어</label>--%>
                            <%--                                <a href="#">윤서영</a>--%>
                            <%--                                <a href="#">오선희</a>--%>
                            <%--                                <a href="#">안효선</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>영어</label>--%>
                            <%--                                <a href="#">김성익</a>--%>
                            <%--                                <a href="#">윤광덕</a>--%>
                            <%--                                <a href="#">조재권</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>한국사</label>--%>
                            <%--                                <a href="#">임찬호</a>--%>
                            <%--                                <a href="#">김준호</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>사회</label>--%>
                            <%--                                <a href="#">함보연</a>--%>
                            <%--                                <a href="#">이동훈</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>경영학</label>--%>
                            <%--                                <a href="#">박병호</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>행정법</label>--%>
                            <%--                                <a href="#">장다훈</a>--%>
                            <%--                                <a href="#">조대진</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>행정학</label>--%>
                            <%--                                <a href="#">천정운</a>--%>
                            <%--                                <a href="#">염오봉</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <label>면접</label>--%>
                            <%--                                <a href="#">오재우</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </li>
                    <li><a href="#">수강신청</a></li>
                    <li><a href="#">지안패스</a></li>
                    <li><a href="#">무료강좌</a>
                        <ul class="deaph2">
                            <%--                            <li><a href="#">이론</a></li>--%>
                            <%--                            <li><a href="#">기출풀이</a></li>--%>
                        </ul>
                    </li>
                    <li><a href="#">빅모의고사</a></li>
                    <li><a href="#">합격수기</a>
                        <ul class="deaph2">
                            <%--                            <li><a href="#">합격영상</a></li>--%>
                            <%--                            <li><a href="#">합겨수기</a></li>--%>
                            <%--                            <li><a href="#">수강후기</a></li>--%>
                            <%--                            <li><a href="#">도서후기</a></li>--%>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--//주메뉴-->
    </div>
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
    <%@include file="/common/jsp/footerBanner.jsp" %>
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