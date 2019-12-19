<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var menuCtgKey = getTeacherMenuCtgKey();
        var teacherCtgKey = getTeacherListCtgKey();
        getLeftMenu(menuCtgKey, "subjectMenuList"); //교수 메뉴 불러오기
        getTeacherIntroduceLeftMenu(teacherCtgKey, 'teacherList'); // 교수 전체 리스트

        $("#subjectMenuList li:eq(0)").addClass('active');
        $("#subjectMenuList li").click(function () { // 과목메뉴 클릭시 class active 기능
            $(this).addClass('active').siblings().removeClass('active');
        });
    });

    //과목별 선생님 리스트 불러오기
    function getSubjectTeacherInfo(ctgKey) {
        dwr.util.removeAllOptions("teacherList");
        getTeacherIntroduceLeftMenu(ctgKey, 'teacherList');
    }

    //교수 상세페이지 이동
    function goTeacherDetail(teacherKey, reqKey) {
        innerValue("teacherKey", teacherKey);
        innerValue("reqKey", reqKey);
        goPage("teacher", "detail");
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="teacherKey" id="teacherKey">
    <input type="hidden" name="reqKey" id="reqKey">
    <input type="hidden" id="subject">
    <input type="hidden" id="name">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->

        <!--본문-->
        <div id="container">
            <div id="snb">
                <div class="inner">
                    <ul class="deaph1 cols9" id="subjectMenuList"></ul>
                </div>
            </div>
            <br />
            <div class="inner">
                <!--서브 컨텐츠-->
                <p class="subIntroduction">지안에듀 최고의 교수진을 소개합니다!</p>
                <ul class="teacherThumb" id="teacherList"></ul><!--선생님 리스트-->
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

