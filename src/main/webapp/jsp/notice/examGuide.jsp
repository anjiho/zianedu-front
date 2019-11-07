<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {

    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="cols7">
                        <li><a href="#">내강의실</a></li>
                        <li><a href="#">교수소개</a></li>
                        <li><a href="#">학원수강신청</a></li>
                        <li><a href="#">1:1 관리반</a></li>
                        <li><a href="#">무료강좌</a></li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a></li>
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
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="noticeGuideWrap tabContent">
                    <ul class="tabBar">
                        <li class="active"><a href="#">행정직</a></li>
                        <li><a href="#">계리직</a></li>
                        <li><a href="#">전산직</a></li>
                        <li><a href="#">토목직</a></li>
                        <li><a href="#">임업직</a></li>
                        <li><a href="#">농업직</a></li>
                        <li><a href="#">건축직</a></li>
                        <li><a href="#">환경직</a></li>
                        <li><a href="#">운전직</a></li>
                        <li><a href="#">통신직</a></li>
                        <li><a href="#">전기직</a></li>
                        <li><a href="#">군수직</a></li>
                    </ul>
                    <div class="tabPage active"><!-- 행정직 탭컨텐츠 -->
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_hang.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_geri.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_jun.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_tomok.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_im.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_nong.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_gun.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_hwan.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_unjun.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_tongsin.jpg" alt="">
                    </div>
                    <div class="tabPage">
                        <img src="http://52.79.40.214/Upload/exam_guide/zian_guide_jungi.jpg" alt="">
                    </div>
                    <div class="tabPage">

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
