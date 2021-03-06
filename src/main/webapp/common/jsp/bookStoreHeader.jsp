<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            $("#topNav_login").show();
            $("#side_logout").show();
            innerHTML('topNavM_state', '로그아웃');
            var userName = sessionUserInfo.name;
            innerHTML("loginUserName", userName+" 님");
            innerHTML("userName2", userName+" 님");
        }else{
            $("#side_login").show();
            $("#topNav_logout").show();
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
        getMainBottomBanner(6285, 2);
    });

</script>
<div id="wrap" class="shop">
    <div id="skipLink">
        <a href="#">본문바로가기</a>
        <a href="#">주메뉴바로가기</a>
    </div>
    <!--좌측사이트메뉴-->
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">온라인<br />서점</a></h1>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:bookLeftMenu('tech');">기술직</a></li>
                <li class="item3"><a href="javascript:bookLeftMenu('post');">계리직</a></li>
                <li class="item3"><a href="javascript:bookLeftMenu('public');">행정직</a></li>
                <li class="item5"><a href="javascript:goAlgisa();">자격증/가산점</a></li>
                <li class="item4"><a href="javascript:bookLeftMenu('big');">빅모의고사</a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="javascript:goLecRoom();"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="javascript:goOpenMenu();"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="javascript:goExamGuide();"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')"><span class="icon item4"></span>내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main');"><span class="icon item5"></span>학원수강내역</a></li>
                <li><a href="javascript:goMyCart();"><span class="icon item6"><em id="cartCnt"></em></span>장바구니</a></li>
                <li><a href="javascript:goOpenMenu();"><span class="icon item7"></span>공지사항</a></li>
                <li><a href="javascript:goPageNoSubmit('customerCenter','consult');"><span class="icon item8"></span>1:1문의</a></li>
            </ul>
        </div>
        <div id="examBanner" class="slider useBx">
            <ul id="dDayBanner"></ul>
        </div>
        <div id="snsLink">
            <b>지안에듀 SNS</b>
            <ul>
                <li><a href="https://www.facebook.com/zianedu/"><img src="/common/zian/images/common/btn_snsLinkFacebook.png" alt="페이스북"></a></li>
                <li><a href="https://www.instagram.com/zianedu_algisa/"><img src="/common/zian/images/common/btn_snsLinkInstgram.png" alt="인스타그램"></a></li>
                <li><a href="https://www.youtube.com/channel/UCVggN-Fjn55m-v6SposcJJw/featured?view_as=subscriber"><img src="/common/zian/images/common/btn_snsLinkYoutube.png" alt="유투브"></a></li>
                <li><a href="https://blog.naver.com/dreamart0829"><img src="/common/zian/images/common/btn_snsLinkBlog.png" alt="네이버블로그"></a></li>
            </ul>
        </div>
        <a href="#" id="btn_asideToggle">죄측메뉴열기/닫기</a>
    </div>
    <!--//좌측사이트메뉴-->
    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1 class="logo_pc"><a href="javascript:goBookStore();"><img src="/common/zian/images/common/logo04.png" alt="지안에듀 온라인서점"></a></h1>
            <h1 class="logo_mb"><a href="javascript:goBookStore();"><img src="/common/zian/images/ex/logo07.png" alt="지안에듀 온라인서점"></a></h1>
            <!--최상단메뉴-->
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
            <!--//최상단메뉴-->
            <!--추가-->
            <div id="topNavM">
                <ul>
                    <li><a href="#" class="login_btn">로그인</a>
                        <ul class="logindrop">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'cart');">장바구니</a></li>
                            <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main');">내강의실</a></li>
                            <li><a href="javascript:goMyPage();">마이페이지</a></li>
                            <li><a href="javascript:goLogout();" id="topNavM_state">로그아웃</a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="header_menu" id="header_menu">메뉴</a></li>
                </ul>
            </div>

            <!-- sitemap_layer -->
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
                                        <span>자격증</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="http://www.algisa.com/public/main.html">알기사 사이트이동</a></li>
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
                <ul class="deaph1 cols7">
                    <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>
                    <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직</a></li>
                    <li><a href="javascript:goBookStoreMobile('TECH');">기술직</a></li>
                    <li><a href="javascript:goBookStoreMobile('POST');">계리직</a></li>
                    <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>
                    <li><a href="javascript:goPageNoSubmit('bookStore','errataList');">정오표</a></li>
                </ul>
            </div>
            <!-- gnb_area -->
            <div class="gnb_area">
                <ul class="Mdepth1">
                    <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>
                    <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직</a></li>
                    <li><a href="javascript:goBookStoreMobile('TECH');">기술직</a></li>
                    <li><a href="javascript:goBookStoreMobile('POST');">계리직</a></li>
                    <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>
                    <li><a href="javascript:goPageNoSubmit('bookStore','errataList');">정오표</a></li>
                </ul>
            </div>
            <!-- //gnb_area -->
        </div>
        <!--//주메뉴-->
    </div>
    <!--//상단-->
<script>
    getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    function bookLeftMenu(val) {
        if(val == 'tech'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPageNoSubmit("techOnline", "main");
        }else if(val == 'post'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPageNoSubmit("postOnline", "main");
        }else if(val == 'public'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }else if(val == 'big'){
            var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
            if(leftMenuInfo != 'bigExam') {
                sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
            }
            sessionStorage.setItem("leftMenu", "bigExam");
            goPageNoSubmit('bigExam','bigExamMain');
        }
    }

    function goAlgisa() {
        window.open("http://www.algisa.com/public/main.html", "_blank");
        return false;
    }

    function goBookStore() {
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }
</script>