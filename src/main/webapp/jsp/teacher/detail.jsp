<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String teacherKey = request.getParameter("teacherKey");
    String reqKey = request.getParameter("reqKey");
%>
<style>
    .video-container {position: relative;padding-bottom: 56.25%;height: 0;overflow: hidden;}
    .video-container iframe,.video-container object,.video-container embed{position: absolute; top:0; left:0; width:100%; height: 100%}
</style>
<script>
    var teacherKey = '<%=teacherKey%>';
    var menuCtgKey = '<%=reqKey%>';

    $( document ).ready(function() {
        var pcMobile = divisionPcMobile();
        if(pcMobile == 'pc') pcMobile = 1;
        else if(pcMobile == 'mobile') pcMobile = 3;
        getTeacherHomeInfo(teacherKey, pcMobile , menuCtgKey, 10);//홈정보
        getTeacherNameSubjectName(teacherKey, menuCtgKey);//과목, 선생님명 불러오기
        getTeacherCurriculum(teacherKey, pcMobile, menuCtgKey);//커리큘럼 불러오기
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="javascript:goPage('publicOnline', 'main')"><img src="/common/zian/images/common/logo01.png" alt="지안에듀 행정직"> 온라인</a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="deaph1 cols7">
                        <li><a href="#">내강의실</a>
                            <ul class="deaph2">
                                <li><a href="#">수강중</a></li>
                                <li><a href="#">일시정지</a></li>
                                <li><a href="#">수강완료</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">지안패스</a></li>
                        <li><a href="#">무료강좌</a>
                            <ul class="deaph2">
                                <li><a href="#">이론</a></li>
                                <li><a href="#">기출풀이</a></li>
                            </ul>
                        </li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a>
                            <ul class="deaph2">
                                <li><a href="#">합격영상</a></li>
                                <li><a href="#">합겨수기</a></li>
                                <li><a href="#">수강후기</a></li>
                                <li><a href="#">도서후기</a></li>
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
                <div class="teacherView">
                    <div class="teacherInfo">
                        <div class="thumb">
                            <img src="" alt="" id="teacherImg">
                            <a href="javascript:goPage('teacher','main')" class="btn_teacherThumb">교수님 리스트</a>
                        </div>
                        <div class="info">
                            <span class="category" id="subject"></span>
                            <span class="name"><b id="teacherName"></b> 교수님</span>
<%--                            <span class="infoText">쉽고 재미있는, 공무원 국어마스터</span>--%>
                            <dl class="profile">
                                <dt>약력</dt>
                                <dd id="history"></dd>
                            </dl>
                            <div class="teacherInfoTab tabContent">
                                <ul class="tabBar">
                                    <li class="active" style="width:340px;"><a href="#">OT영상</a></li>
                                </ul>
                                <div class="tabPage active">
                                    <div class="otMovie video-container" id="youtube"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="teacherContentsTab tabContent">
                        <ul class="tabBar">
                            <li><a href="#">커리큘럼</a></li>
                            <li><a href="#">강좌소개</a></li>
                            <li><a href="#">학습안내</a></li>
                            <li><a href="#">학습 Q&A</a></li>
                        </ul>
                        <div class="tabPage active">
                            <div class="tab_curriculum">
                                <span id="curriculum"></span>
                            </div>
                        </div>
                        <div class="tabPage">
                            계리직 탭컨텐츠
                        </div>
                        <div class="tabPage">
                            전산직 탭컨텐츠
                        </div>
                        <div class="tabPage">
                            토목직 탭컨텐츠
                        </div>
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

