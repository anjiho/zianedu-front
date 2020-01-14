<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo == "publicOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "publicAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "techOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "techAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
            $(".bookStore").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "postOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "postAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "bookStore") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").hide();
            $(".bookStore").show();
            $("#logo").attr("src", "/common/zian/images/common/logo04.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('bookStore', 'main')");
            //sessionStorage.setItem("leftMenu", "publicOnline");
           // innerHTML("mainName", "학원");
            //$("#mainName").css('color', '#ce1717');
        }
    });

    function goMyPage() {
        goPageNoSubmit('myPage','orderList');
    }
    
    function goPassReview() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');
        if(leftMenuInfo == 'bookStore') {
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
        goPageNoSubmit('review', 'videoList');
    }
</script>
<!--상단-->
<div id="header">
    <div class="inner">
        <h1><a href="" id="mainUrl"><img src="" id="logo"> <span id="mainName"></span></a></h1>
        <!--최상단메뉴-->
        <div id="topNav">
            <ul>
                <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>
                <li id="userName" style="display: none;"><a href="#"></a></li>
<%--                <li id="mypage" style="display: none;"><a href="javascript:goPageNoSubmit('myPage','orderList')">마이페이지</a></li>--%>
                <li id="mypage" style="display: none;"><a href="javascript:goMyPage();">마이페이지</a></li>
                <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
                <li id="logout" style="display: none;"><a href="javascript:goLogout();">로그아웃</a></li>
                <li id="join"><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
<%--                <li><a href="javascript:goPageNoSubmit('review', 'videoList');">합격수기</a></li>--%>
                <li id="mypage" style="display: none;"><a href="javascript:goPassReview();">합격수기</a></li>
                <li><a href="javascript:goPageNoSubmit('event', 'proceedList');">이벤트</a></li>
            </ul>
        </div>
        <!--//최상단메뉴-->

    </div>
    <!--주메뉴-->
    <div id="gnb" class="acaTopMenu" style="display: none;">
        <div class="inner">
            <ul class="deaph1 cols7">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'academy')">학원수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">연간관리반</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="#">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
        </div>
    </div>

    <div id="gnb" class="onlineTopMenu" style="display: none;">
        <div class="inner">
            <ul class="deaph1 cols7">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'single')">수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">지안패스</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="#">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
        </div>
    </div>

    <div id="gnb" class="bookStore" style="display: none;">
        <div class="inner">
            <ul class="deaph1 cols7">
                <li><a href="javascript:goDetailbookType('COMMON');">공통과목</a></li>
                <li><a href="javascript:goDetailbookType('PUBLIC');">행정직군</a></li>
                <li><a href="javascript:goDetailbookType('TECH');">기술직군</a></li>
                <li><a href="javascript:goDetailbookType('POST');">계리직군</a></li>
                <li><a href="javascript:goDetailbookType('CERT');">자격증</a></li>
                <li><a href="#">정오표</a></li>
            </ul>
        </div>
        <!-- gnb_area -->
<%--        <div class="gnb_area">--%>
<%--            <ul class="Mdepth1">--%>
<%--                <li><a href="#">모의고사신청</a></li>--%>
<%--                <li><a href="#">학원모의고사</a></li>--%>
<%--                <li><a href="#">주간모의고사</a></li>--%>
<%--                <li><a href="#">기출문제</a></li>--%>
<%--                <li><a href="#">응시후기</a></li>--%>
<%--                <li><a href="#">자료실</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
        <!-- //gnb_area -->
    </div>
    <!--//주메뉴-->
</div>
<!--//상단-->
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            var userName = sessionUserInfo.name;
            innerHTML("userName", userName+" 님");
            gfn_display("mypage", true);
            gfn_display("userName", true);
            gfn_display("logout", true);
            gfn_display("login", false);
            gfn_display("join", false);
        }
        //오른쪽메뉴 오늘 안보기 클릭 이벤트
        $("#todayClose").click(function () {
            setCookieMobile( "todayCookie", "done" , 1);
            $("#quickBar").hide();
        });
    });

    function goLogout() {
        if(confirm("로그아웃 하시겠습니까?")){
            sessionStorage.clear();
            innerHTML("userName", "");
            gfn_display("mypage", false);
            gfn_display("userName", false);
            gfn_display("logout", false);
            gfn_display("login", true);
            gfn_display("join", true);
            goMain();
        }
    }
</script>