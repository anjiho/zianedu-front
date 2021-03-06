<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%
    String lecKey = request.getParameter("lecKey");
%>
<form id="id_frm_player" method="post" name="name_frm_player">
    <input id="vodPath" name="vodPath" type="hidden" value="" />
    <input id="vodTitle" name="vodTitle" type="hidden" value="" />
    <input id="starPlayerUrl" name="starPlayerUrl" type="hidden" value="" />
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="reqKey" id="reqKey">
    <input type="hidden" name="teacherKey" id="teacherKey">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="free">
                    <div class="tab_topContent tabContent">
                        <ul class="tabBox tBox2">
                            <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">이론</a></li>
                            <li class="active"><a href="javascript:void(0);">기출풀이</a></li>
                        </ul>
                        <!-- 이론 -->
                        <div class="tabPage">
                            <!--선택-->
                            <div class="direct_view">
                                <a href="javascript:goPageNoSubmit('freeLecture', 'examQuestion')" class="btn_inline w140">목록으로</a>
                                <div class="item">
                                    <div class="inner">
                                        <div class="thumb">
                                            <img class="myarea_poster" src="" id="lecImg">
                                        </div>
                                        <div class="desc2">
                                            <div>
                                                <span class="rblack" id="subjectName"></span>
                                                <span class="rgreen" id="ctgName"></span>
                                            </div>
                                            <p class="tit" id="goodsName"></p>
                                            <span><span id="teacherName"></span> 교수님</span>
                                            <div class="utill">
                                                <a href="" class="home" id="teacherHome">교수홈</a>
                                                <a href="javascript:goPage('lectureOrder', 'single')" class="class">수강신청</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--목록-->
                            <div class="tbd_02">
                                <div class="crud_area">
                                    <span class="unit">강좌목차</span>
                                    <strong>총<span id="lecCount"></span>강</strong>
                                </div>
                                <!--class 추가 a및 코드 추가  -->
                                <table class="bd disnoneM">
                                    <caption>최근수강강좌</caption>
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>회차</th>
                                        <th>제목</th>
                                        <th>시간</th>
                                        <th>동영상</th>
                                    </tr>
                                    </thead>
                                </table>
                                <div class="scroll">
                                    <table class="classfreeList">
                                        <tbody id="dataList"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--//이론 -->
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
    $( document ).ready(function() {
        var lecKey = <%=lecKey%>;
        var pcMobile = divisionPcMobile();
        getFreeVideoLectureDetailInfo(lecKey, pcMobile);
    });
    function goTeacherHome(reqKey, teacherKey) {
        innerValue("teacherKey", teacherKey);
        innerValue("reqKey", reqKey);
        goPage("teacher", "detail");
    }
</script>
