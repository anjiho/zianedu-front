<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo == "publicOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "publicAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "techOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "techAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "postOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postOnline', 'main')");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "postAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postAcademy', 'main')");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "bookStore") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").hide();
            $(".bookStore").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo04.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('bookStore', 'main')");
        }else if(leftMenuInfo == "bigExam"){
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").show();
            $("#logo").attr("src", "/common/zian/images/bigimg/logo.gif");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('bigExam', 'main')");
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

    function goBigExam() {
        sessionStorage.setItem("leftMenu", "bigExam");
        goPageNoSubmit('bigExam','main');
    }

    //파일다운로드
    function download(fileName) {
        var downloadUrl = apiHost + "/download/fileDownload?filePath=" + fileName;
        $.fileDownload(downloadUrl);
    }
</script>
<!--상단-->
<div id="header">
    <div class="inner">
        <h1 class="logo_pc"><a href="" id="mainUrl"><img src="" id="logo"> <span id="mainName"></span></a></h1>
        <h1 class="logo_mb"><a href="#"><img src="/common/zian/images/ex/logo01.png" alt="지안에듀 행정직"></a></h1>
        <!--최상단메뉴-->
        <!-- 로그인 -->
        <div id="topNav">
            <ul id="topNav_login" style="display: none;">
                <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>
                <li id="userName"><a href="#"></a></li>
                <li><a href="javascript:goMyPage();">마이페이지</a></li>
                <li><a href="javascript:goLogout();">로그아웃</a></li>
                <li id="mypage"><a href="javascript:goPassReview();">합격수기</a></li>
                <li><a href="javascript:goPageNoSubmit('event', 'proceedList');">이벤트</a></li>
            </ul>
            <ul id="topNav_logout" style="display: none;">
                <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>
                <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
                <li id="join"><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
                <li><a href="javascript:goPageNoSubmit('event', 'proceedList');">이벤트</a></li>
            </ul>
        </div>
        <!-- 로그아웃 -->
        <%--        <div id="topNav" class="logout" style="display: none;">--%>
        <%--            <ul>--%>
        <%--                <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>--%>
        <%--                <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>--%>
        <%--                <li id="join"><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>--%>
        <%--                <li><a href="javascript:goPageNoSubmit('event', 'proceedList');">이벤트</a></li>--%>
        <%--            </ul>--%>
        <%--        </div>--%>
        <!--//최상단메뉴-->
        <!--추가-->
        <div id="topNavM">
            <ul>
                <li><a href="#" class="login_btn">로그인</a>
                    <ul class="logindrop">
<%--                        <li><a href="">장바구니</a></li>--%>
<%--                        <li><a href="">내강의실</a></li>--%>
<%--                        <li><a href="">마이페이지</a></li>--%>
                        <li><a href="javascript:goLoginPage();">로그인</a></li>
                    </ul>
                </li>
                <li><a href="#" class="header_menu" id="header_menu">메뉴</a></li>
            </ul>
        </div>

        <!-- sitemap_layer -->
        <form id="bookTypePage" method="post" name="bookTypePage">
            <input type="hidden" id="bookType" name="bookType">
        </form>
        <div class="sitemap_layer" id="sitemap_layer">
            <div class="sitemap_layer_wrapper">
                <div class="side_menu_header">
                    <div id="side_logout" style="display: none;">
                        <p class="btn_home"><span id="userName2"></span><span></span></p>
                        <span class="bar"></span>
                        <a href="javascript:goLogout();" class="btn_logout">로그아웃</a>
                    </div>
                    <div id="side_login" style="display: none;">
                        <a href="javascript:goLoginPage();" class="btn_logout">로그인</a>
                    </div>
                    <button class="btn_close_menu">닫기</button>
                </div>
                <!-- sitemap_wrap -->
                <div class="sitemap_wrap">
                    <!-- sitemap_box -->
                    <div class="sitemap_box">
                        <ul>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>행정직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goAcademyMenu('main', 'public');">메인으로</a></li>
                                    <li><a href="javascript:goAcademyMenu('myLecRoom', 'public');">내강의실</a></li>
                                    <li><a href="javascript:goAcademyMenu('teacher', 'public');">교수소개</a></li>
                                    <li><a href="javascript:goAcademyMenu('lecApply', 'public');">수강신청</a></li>
                                    <li><a href="javascript:goAcademyMenu('year', 'public');">1:1관리반</a></li>
                                    <li><a href="javascript:goAcademyMenu('free', 'public');">무료강좌</a></li>
                                    <li><a href="javascript:goAcademyMenu('passReview', 'public');">합격수기</a></li>
                                    <li><a href="javascript:goAcademyMenu('customerCenter', 'public');">고객센터</a></li>
                                    <li><a href="javascript:goAcademyMenu('notice', 'public');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>행정직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goOnlineMenu('main', 'public');">메인으로</a></li>
                                    <li><a href="javascript:goOnlineMenu('myLecRoom', 'public');">내강의실</a></li>
                                    <li><a href="javascript:goOnlineMenu('teacher', 'public');">교수소개</a></li>
                                    <li><a href="javascript:goOnlineMenu('lecApply', 'public');">수강신청</a></li>
                                    <li><a href="javascript:goOnlineMenu('zianPass', 'public');">지안패스</a></li>
                                    <li><a href="javascript:goOnlineMenu('free', 'public');">무료강좌</a></li>
                                    <li><a href="javascript:goOnlineMenu('passReview', 'public');">합격수기</a></li>
                                    <li><a href="javascript:goOnlineMenu('customerCenter', 'public');">고객센터</a></li>
                                    <li><a href="javascript:goOnlineMenu('notice', 'public');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goAcademyMenu('main', 'tech');">메인으로</a></li>
                                    <li><a href="javascript:goAcademyMenu('myLecRoom', 'tech');">내강의실</a></li>
                                    <li><a href="javascript:goAcademyMenu('teacher', 'tech');">교수소개</a></li>
                                    <li><a href="javascript:goAcademyMenu('lecApply', 'tech');">수강신청</a></li>
                                    <li><a href="javascript:goAcademyMenu('main', 'tech');">연간관리반</a></li>
                                    <li><a href="javascript:goAcademyMenu('free', 'tech');">무료강좌</a></li>
                                    <li><a href="javascript:goAcademyMenu('main', 'tech');">합격수기</a></li>
                                    <li><a href="javascript:goAcademyMenu('customerCenter', 'tech');">고객센터</a></li>
                                    <li><a href="javascript:goAcademyMenu('notice', 'tech');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goOnlineMenu('main', 'tech');">메인으로</a></li>
                                    <li><a href="javascript:goOnlineMenu('myLecRoom', 'tech');">내강의실</a></li>
                                    <li><a href="javascript:goOnlineMenu('teacher', 'tech');">교수소개</a></li>
                                    <li><a href="javascript:goOnlineMenu('lecApply', 'tech');">수강신청</a></li>
                                    <li><a href="javascript:goOnlineMenu('zianPass', 'tech');">지안패스</a></li>
                                    <li><a href="javascript:goOnlineMenu('free', 'tech');">무료강좌</a></li>
                                    <li><a href="javascript:goOnlineMenu('passReview', 'tech');">합격수기</a></li>
                                    <li><a href="javascript:goOnlineMenu('customerCenter', 'tech');">고객센터</a></li>
                                    <li><a href="javascript:goOnlineMenu('notice', 'tech');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goAcademyMenu('main', 'post');">메인으로</a></li>
                                    <li><a href="javascript:goAcademyMenu('myLecRoom', 'post');">내강의실</a></li>
                                    <li><a href="javascript:goAcademyMenu('teacher', 'post');">교수소개</a></li>
                                    <li><a href="javascript:goAcademyMenu('lecApply', 'post');">수강신청</a></li>
                                    <li><a href="javascript:goAcademyMenu('year', 'post');">1:1관리반</a></li>
                                    <li><a href="javascript:goAcademyMenu('free', 'post');">무료강좌</a></li>
                                    <li><a href="javascript:goAcademyMenu('passReview', 'post');">합격수기</a></li>
                                    <li><a href="javascript:goAcademyMenu('customerCenter', 'post');">고객센터</a></li>
                                    <li><a href="javascript:goAcademyMenu('notice', 'post');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goOnlineMenu('main', 'post');">메인으로</a></li>
                                    <li><a href="javascript:goOnlineMenu('myLecRoom', 'post');">내강의실</a></li>
                                    <li><a href="javascript:goOnlineMenu('teacher', 'post');">교수소개</a></li>
                                    <li><a href="javascript:goOnlineMenu('lecApply', 'post');">수강신청</a></li>
                                    <li><a href="javascript:goOnlineMenu('zianPass', 'post');">지안패스</a></li>
                                    <li><a href="javascript:goOnlineMenu('free', 'post');">무료강좌</a></li>
                                    <li><a href="javascript:goOnlineMenu('passReview', 'post');">합격수기</a></li>
                                    <li><a href="javascript:goOnlineMenu('customerCenter', 'post');">고객센터</a></li>
                                    <li><a href="javascript:goOnlineMenu('notice', 'post');">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>온라인서점</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goBookStoreMobile('main');">온라인서점</a></li>
                                    <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>
                                    <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직</a></li>
                                    <li><a href="javascript:goBookStoreMobile('TECH');">기술직</a></li>
                                    <li><a href="javascript:goBookStoreMobile('POST');">계리직</a></li>
                                    <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>
                                    <li><a href="javascript:goBookStoreMobile('errata');">정오표</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>빅모의고사</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="javascript:goBigExam();">빅모의고사</a></li>
                                    <li><a href="javascript:goBigExamMenu('apply');">모의고사신청</a></li>
                                    <li><a href="javascript:goBigExamMenu('acaExam');">학원모의고사</a></li>
                                    <li><a href="javascript:goBigExamMenu('weekExam');">주간모의고사</a></li>
                                    <li><a href="javascript:goBigExamMenu('pastQuestion');">기출문제</a></li>
                                    <li><a href="javascript:goBigExamMenu('bigReviewList');">응시후기</a></li>
                                    <li><a href="javascript:goBigExamMenu('referenceList');">자료실</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>자격증</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="http://www.algisa.com/public/main.html">알기사 사이트이동</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- //sitemap_box -->
                </div>
                <!-- //sitemap_wrap -->
            </div>
        </div>
        <!-- sitemap_layer -->
    </div>
    <!--주메뉴-->
    <div id="gnb">
        <div class="inner">
            <ul class="deaph1 cols7 acaTopMenu" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'academy')">학원수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">연간관리반</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="deaph1 cols7 onlineTopMenu" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'single')">수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">지안패스</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="deaph1 cols7 bookStore" style="display: none;">
                <li><a href="javascript:goDetailbookType('COMMON');">공통과목</a></li>
                <li><a href="javascript:goDetailbookType('PUBLIC');">행정직군</a></li>
                <li><a href="javascript:goDetailbookType('TECH');">기술직군</a></li>
                <li><a href="javascript:goDetailbookType('POST');">계리직군</a></li>
                <li><a href="javascript:goDetailbookType('CERT');">자격증</a></li>
                <li><a href="javascript:goPageNoSubmit('bookStore','errataList')">정오표</a></li>
            </ul>
            <ul class="deaph1 cols7 bigExam" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('bigExam','examApply')">모의고사신청</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','acaExam')">학원모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','weekExam')">주간모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','pastQuestion')">기출문제</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','bigReviewList')">응시후기</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','referenceList')">자료실</a></li>
            </ul>
        </div>

        <!-- gnb_area -->
        <div class="gnb_area">
            <ul class="Mdepth1 acaTopMenu" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'academy')">학원수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">연간관리반</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="Mdepth1 onlineTopMenu" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('teacher', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('lectureOrder', 'single')">수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('zianPass', 'list')">지안패스</a></li>
                <li><a href="javascript:goPageNoSubmit('freeLecture', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="Mdepth1 bookStore" style="display: none;">
                <li><a href="javascript:goDetailbookType('COMMON');">공통과목</a></li>
                <li><a href="javascript:goDetailbookType('PUBLIC');">행정직군</a></li>
                <li><a href="javascript:goDetailbookType('TECH');">기술직군</a></li>
                <li><a href="javascript:goDetailbookType('POST');">계리직군</a></li>
                <li><a href="javascript:goDetailbookType('CERT');">자격증</a></li>
                <li><a href="javascript:goPageNoSubmit('bookStore','errataList')">정오표</a></li>
            </ul>
            <ul class="Mdepth1 bigExam"style="display: none;">
                <li><a href="javascript:goPageNoSubmit('bigExam','examApply')">모의고사신청</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','acaExam')">학원모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','weekExam')">주간모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','pastQuestion')">기출문제</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','bigReviewList')">응시후기</a></li>
                <li><a href="javascript:goPageNoSubmit('bigExam','referenceList')">자료실</a></li>
            </ul>
        </div>
        <!-- //gnb_area -->
    </div>
    <!--//주메뉴-->
</div>
<!--//상단-->
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            $("#topNav_login").show();
            $("#side_logout").show();
            var userName = sessionUserInfo.name;
            innerHTML("userName", userName+" 님");
            innerHTML("userName2", userName+" 님");
        }else{
            $("#side_login").show();
            $("#topNav_logout").show();
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
            $("#topNav_logout").show();
            goMain();
        }
    }


    function goAcademyMenu(gbnMenu, lefMenu) {
        if(lefMenu == 'public'){
            sessionStorage.setItem("leftMenu", "publicAcademy");
            var menu = "publicAcademy";
        }else if(lefMenu == 'tech'){
            sessionStorage.setItem("leftMenu", "techAcademy");
            var menu = "techAcademy";
        }else if(lefMenu == 'post'){
            sessionStorage.setItem("leftMenu", "postAcademy");
            var menu = "postAcademy";
        }

        if(gbnMenu == 'main') goPageNoSubmit(menu, "main");
        else if(gbnMenu == 'myLecRoom') goPageNoSubmit('myLecRoom', 'main');
        else if(gbnMenu == 'teacher') goPageNoSubmit('teacher', 'main');
        else if(gbnMenu == 'lecApply') goPageNoSubmit('lectureOrder', 'academy');
        else if(gbnMenu == 'passReview') goPassReview();
        else if(gbnMenu == 'customerCenter')  goPageNoSubmit('customerCenter', 'saveQuestion');
        else if(gbnMenu == 'notice'){
            sessionStorage.setItem("noticeHeader", "openMenu");
            $("#noticeMenu li:eq(0)").addClass('active');
            goPageNoSubmit('notice', 'list');
        }else if(gbnMenu == 'year'){
            javascript:goPageNoSubmit('zianPass', 'list');
        }else if(gbnMenu == 'free'){
            goPageNoSubmit('freeLecture', 'theory');
        }
    }

    function goOnlineMenu(gbnMenu, lefMenu) {
        if(lefMenu == 'public'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            var menu = "postOnline";
        }else if(lefMenu == 'tech'){
            sessionStorage.setItem("leftMenu", "techOnline");
            var menu = "techOnline";
        }else if(lefMenu == 'post'){
            sessionStorage.setItem("leftMenu", "postOnline");
            var menu = "postOnline";
        }
        if(gbnMenu == 'main') goPageNoSubmit(menu, "main");
        else if(gbnMenu == 'myLecRoom') goPageNoSubmit('myLecRoom', 'main');
        else if(gbnMenu == 'teacher') goPageNoSubmit('teacher', 'main');
        else if(gbnMenu == 'lecApply') goPageNoSubmit('lectureOrder', 'academy');
        else if(gbnMenu == 'passReview') goPassReview();
        else if(gbnMenu == 'zianPass') goPageNoSubmit('zianPass', 'list');
        else if(gbnMenu == 'free') goPageNoSubmit('freeLecture', 'theory');
        else if(gbnMenu == 'customerCenter')  goPageNoSubmit('customerCenter', 'saveQuestion');
        else if(gbnMenu == 'notice'){
            sessionStorage.setItem("noticeHeader", "openMenu");
            $("#noticeMenu li:eq(0)").addClass('active');
            goPageNoSubmit('notice', 'list');
        }
    }

    function goBookStoreMobile(gbnMenu) {
        if(gbnMenu == 'main'){
            sessionStorage.setItem("leftMenu", 'bookStore');
            goPageNoSubmit('bookStore','main');
        }else if (gbnMenu != 'main' && gbnMenu != 'errata') {
            //innerValue('bookType', 'COMMON');
            // $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
            // $("#bookTypePage").submit();
            location.href = "/bookStore?page_gbn=bookTypeList&bookType=" + gbnMenu;
        } else if(gbnMenu == 'errata'){
            goPageNoSubmit('bookStore','errataList');
        }
    }

    function goBigExamMenu(gbnMenu) {
        sessionStorage.setItem("leftMenu", "bigExam");
        if(gbnMenu == 'apply'){
            goPageNoSubmit('bigExam','examApply');
        }else if(gbnMenu == 'acaExam'){
            goPageNoSubmit('bigExam','acaExam');
        }else if(gbnMenu == 'weekExam'){
            goPageNoSubmit('bigExam','weekExam');
        }else if(gbnMenu == 'pastQuestion'){
            goPageNoSubmit('bigExam','pastQuestion');
        }else if(gbnMenu == 'bigReviewList'){
            goPageNoSubmit('bigExam','bigReviewList');
        }else if(gbnMenu == 'referenceList'){
            goPageNoSubmit('bigExam','referenceList')
        }
    }
</script>
