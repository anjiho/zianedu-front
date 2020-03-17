<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            $("#topNav_login").show();
            $("#side_logout").show();
            var userName = sessionUserInfo.name;
            innerHTML("loginUserName", userName+" 님");
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
<div id="wrap" class="big">
    <div id="skipLink" class="administration">
        <a href="#">본문바로가기</a>
        <a href="#">주메뉴바로가기</a>
    </div>
    <!--좌측사이트메뉴-->
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">BIG<br />모의고사</a></h1>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:bigLeftMenu('tech');">기술직</a></li>
                <li class="item3"><a href="javascript:bigLeftMenu('post');">계리직</a></li>
                <li class="item3"><a href="javascript:bigLeftMenu('public');">행정직</a></li>
                <li class="item5"><a href="javascript:goAlgisa();">자격증/가산점</a></li>
                <li class="item4"><a href="javascript:bigLeftMenu('book');">온라인 서점</a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="javascript:goLecRoom();"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="javascript:goOpenMenu();"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="javascript:goExamGuide();"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main');"><span class="icon item4"></span>내강의실</a></li>
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
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkFacebook.png" alt="페이스북"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkInstgram.png" alt="인스타그램"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkYoutube.png" alt="유투브"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkBlog.png" alt="네이버블로그"></a></li>
            </ul>
        </div>
        <a href="#" id="btn_asideToggle">죄측메뉴열기/닫기</a>
    </div>
    <!--//좌측사이트메뉴-->
<div id="header">
    <div class="inner">
        <h1 class="logo_pc"><a href="#"><img src="/common/zian/images/bigimg/logozian.gif" alt="빅모의고사"><img src="/common/zian/images/bigimg/logo.gif" alt="빅모의고사"> </a></h1>
        <h1 class="logo_mb"><a href="#"><img src="/common/zian/images/ex/logo08.png" alt="빅모의고사"></a></h1>
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
                        <li><a href="">장바구니</a></li>
                        <li><a href="">내강의실</a></li>
                        <li><a href="">마이페이지</a></li>
                        <li><a href="">로그아웃</a></li>
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
                                    <li><a href="#">전체</a></li>
                                    <li><a href="#">10일</a></li>
                                    <li><a href="#">전체</a></li>
                                    <li><a href="#">10일</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>행정직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>자격증</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>온라인서점</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">전체</a></li>
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
            <ul class="Mdepth1">
                <li><a href="#">모의고사신청</a></li>
                <li><a href="#">학원모의고사</a></li>
                <li><a href="#">주간모의고사</a></li>
                <li><a href="#">기출문제</a></li>
                <li><a href="#">응시후기</a></li>
                <li><a href="#">자료실</a></li>
            </ul>
        </div>
        <!-- //gnb_area -->
    </div>
    <!--//주메뉴-->
</div>
<script>
    getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    function bigLeftMenu(val) {
        if(val == 'tech'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPageNoSubmit("techOnline", "main");
        }else if(val == 'post'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPageNoSubmit("postOnline", "main");
        }else if(val == 'public'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }else if(val == 'book'){
            sessionStorage.setItem("leftMenu", 'bookStore');
            goPageNoSubmit('bookStore','main');
        }
    }

    function goAlgisa() {
        window.open("http://www.algisa.com/public/main.html", "_blank");
        return false;
    }
</script>