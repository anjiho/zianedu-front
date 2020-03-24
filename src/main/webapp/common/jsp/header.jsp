<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        var prevLeftMenu = sessionStorage.getItem('prevLeftMenu');//직렬 구분
        if(leftMenuInfo == "bigExam" || leftMenuInfo == "bookStore"){
            leftMenuInfo = prevLeftMenu;
            sessionStorage.setItem("leftMenu", prevLeftMenu);
        }
        if(leftMenuInfo == 'publicOnline' || leftMenuInfo == "publicAcademy"){
            $("#cssDivsion").prop('href', '/common/zian/css/publicContent.css');
        }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){
            $("#cssDivsion").prop('href', '/common/zian/css/postContent.css');
        }else{
            $("#cssDivsion").prop('href', '/common/zian/css/techContent.css');
        }

        if(leftMenuInfo == "publicOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicOnline', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo01.png");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "publicAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo01.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('publicAcademy', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo02.png");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#134c97');
        }else if(leftMenuInfo == "techOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techOnline', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo03.png");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "techAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo02.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('techAcademy', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo04.png");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#f69321');
        }else if(leftMenuInfo == "postOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
            $(".bookStore").hide();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postOnline', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo05.png");
            innerHTML("mainName", "온라인");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "postAcademy") {
            $(".onlineTopMenu").hide();
            $(".bookStore").hide();
            $(".acaTopMenu").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo03.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('postAcademy', 'main')");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo06.png");
            innerHTML("mainName", "학원");
            $("#mainName").css('color', '#ce1717');
        }else if(leftMenuInfo == "bookStore") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").hide();
            $(".bookStore").show();
            $(".bigExam").hide();
            $("#logo").attr("src", "/common/zian/images/common/logo04.png");
            $("#mainLogoImg").attr("src", "/common/zian/images/ex/logo07.png");
            $("#mainUrl").attr("href", "javascript:goPageNoSubmit('bookStore', 'main')");
        }

        if(leftMenuInfo == "publicOnline") getMainBottomBanner(6284, 2);
        else if(leftMenuInfo == "publicAcademy") getMainBottomBanner(6285, 2);
        else if(leftMenuInfo == "techOnline") getMainBottomBanner(6287, 2);
        else if(leftMenuInfo == "techAcademy") getMainBottomBanner(6286, 2);
        else if(leftMenuInfo == "postOnline") getMainBottomBanner(6289, 2);
        else if(leftMenuInfo == "postAcademy") getMainBottomBanner(6288, 2);
        else getMainBottomBanner(6285, 2);


        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            $("#topNav_login").show();
            $("#side_logout").show();
            innerHTML('topNavM_state', '로그아웃');
            //$(".topNavClass").show();
            var userName = sessionUserInfo.name;
            innerHTML("loginUserName", userName+" 님");
            innerHTML("userName2", userName+" 님");
        }else{
            $("#topNav_logout").show();
            $("#side_login").show();
            innerHTML('topNavM_state', '로그인');
        }
        //오른쪽메뉴 오늘 안보기 클릭 이벤트
        $("#todayClose").click(function () {
            setCookieMobile( "todayCookie", "done" , 1);
            $("#quickBar").hide();
        });

        if(sessionUserInfo != null){
            if(sessionUserInfo.cartCount > 0){
                $("#cartCnt").show();
                innerHTML('cartCnt', sessionUserInfo.cartCount);
            }else{
                $("#cartCnt").hide();
            }
        }else{
            $("#cartCnt").hide();
        }

        if(leftMenuInfo != null){
            if(leftMenuInfo == "publicOnline"){
                $("#siteTab").css("background","#134c97");
                var html = "행정직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "행정직 학원");
                innerHTML("subMenu1", "기술직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }else if(leftMenuInfo == "publicAcademy"){
                $("#siteTab").css("background","#134c97");
                var html = "행정직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "행정직 온라인");
                innerHTML("subMenu1", "기술직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }else if(leftMenuInfo == "techOnline"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }else if(leftMenuInfo == "techAcademy"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }else if(leftMenuInfo == "postOnline"){
                $("#siteTab").css("background","#ce1717");
                var html = "계리직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }else if(leftMenuInfo == "postAcademy") {
                $("#siteTab").css("background-color", "#ce1717");
                var html = "계리직" + "<br />" + "학원";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
                innerHTML("subMenu5", "빅모의고사");
            }
        }
        getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너

    });

    //모바일 로그인,로그아웃 버튼 연동
    function mobileLoginChk() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) goLogout();
        else goLoginPage();
    }
</script>
<!--상단-->
<div id="header">
    <div class="inner">
        <h1 class="logo_pc"><a href="" id="mainUrl"><img src="" id="logo"> <span id="mainName"></span></a></h1>
        <h1 class="logo_mb"><a href="#"><img src="" id="mainLogoImg"></a></h1>
        <!--최상단메뉴-->
        <!-- 로그인 -->
        <div id="topNav">
            <ul id="topNav_login" style="display: none;">
                <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>
                <li id="loginUserName"><a href="#"></a></li>
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
        <div id="topNavM">
            <ul>
                <li><a href="#" class="login_btn">로그인</a>
                    <ul class="logindrop">
                        <li><a href="">장바구니</a></li>
                        <li><a href="">내강의실</a></li>
                        <li><a href="">마이페이지</a></li>
                        <li><a href="javascript:mobileLoginChk();" id="topNavM_state">로그아웃</a></li>
                    </ul>
                </li>
                <li><a href="#" class="header_menu" id="header_menu">메뉴</a></li>
            </ul>
        </div>
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
                    <input type="button" class="btn_close_menu"/>
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
                                    <li><a href="javascript:goPageNoSubmit('bookStore','errataList');">정오표</a></li>
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
<%--            <ul class="deaph1 cols7 bookStore" style="display: none;">--%>
<%--                <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>--%>
<%--                <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직군</a></li>--%>
<%--                <li><a href="javascript:goBookStoreMobile('TECH');">기술직군</a></li>--%>
<%--                <li><a href="javascript:goBookStoreMobile('POST');">계리직군</a></li>--%>
<%--                <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bookStore','errataList')">정오표</a></li>--%>
<%--            </ul>--%>
<%--            <ul class="deaph1 cols7 bigExam" style="display: none;">--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','examApply')">모의고사신청</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','acaExam')">학원모의고사</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','weekExam')">주간모의고사</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','pastQuestion')">기출문제</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','bigReviewList')">응시후기</a></li>--%>
<%--                <li><a href="javascript:goPageNoSubmit('bigExam','referenceList')">자료실</a></li>--%>
<%--            </ul>--%>
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
                <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>
                <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직군</a></li>
                <li><a href="javascript:goBookStoreMobile('TECH');">기술직군</a></li>
                <li><a href="javascript:goBookStoreMobile('POST');">계리직군</a></li>
                <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>
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