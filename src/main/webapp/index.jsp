<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap" class="landing">
    <!--좌측사이트메뉴-->
<%--    <%@include file="/common/jsp/leftMenu.jsp" %>--%>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
    <!--//최상단배너-->
<%--    <%@include file="/common/jsp/header.jsp" %>--%>
    <!--상단-->
    <!--//상단-->

    <!--본문-->
    <div id="skipLink">
        <a href="#">본문바로가기</a>
        <a href="#">주메뉴바로가기</a>
    </div>
    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1><input type="button" value="입력" onclick="javascript:test1234();"></h1>
            <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
            <!--최상단메뉴-->
            <div id="topNav">
                <ul>
                    <li id="userName" style="display: none;"><a href="#"></a></li>
                    <li id="mypage" style="display: none;"><a href="javascript:goMyPage();">마이페이지</a></li>
                    <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
                    <li id="logout" style="display: none;"><a href="javascript:goLogout();">로그아웃</a></li>
                    <li id="join"><a href="javascript:goPageNoSubmit('user', 'joinAgree');">회원가입</a></li>
                    <li><a href="javascript:goPageNoSubmit('review', 'videoList');">합격수기</a></li>
                    <li><a href="javascript:goPageNoSubmit('event', 'proceedList');">이벤트</a></li>
                </ul>
            </div>
            <div id="topNavM">
                <ul>
                    <li><a href="#" class="login_btn">로그인</a>
                        <ul class="logindrop">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'cart');">장바구니</a></li>
                            <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main');">내강의실</a></li>
                            <li><a href="javascript:goMyPage();">마이페이지</a></li>
                            <li><a href="javascript:mobileLoginChk();" id="topNavM_state">로그아웃</a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="header_menu" id="header_menu">메뉴</a></li>
                </ul>
            </div>
            <!--//최상단메뉴-->
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
    </div>
    <!--본문-->
    <div id="container">
        <div class="inner">
            <div id="lendingVisual">
                <div class="lendingVisualText">
                    지안에듀 하나면 끝
                    <b>공무원 합격의 첫 걸음<br />여러분의 꿈이 이루어지는 곳</b>
                    <div class="btnArea">
                        <a href="javascript:goLecReview();">수강후기</a>
                        <a href="javascript:goPassReview();">합격수기</a>
                    </div>
                </div>
                <ul>
                    <li class="item1"><a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')"><b>지안에듀 행정직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('techOnline')"><b>지안에듀 기술직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu('postOnline')"><b>지안에듀 계리직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item4"><a href="http://www.algisa.com/public/main.html" target="_blank"><b>자격증/가산점</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                </ul>
            </div>

            <!-- 랜딩페이지 배너 -->
            <div class="divGroup cols3 noMargin">
                <div class="w30p">
                    <a href="javascript:goBookStore();" class="btn_lendingLink1"><b>온라인 서점</b></a>
                </div>
                <div class="w30p">
<%--                    <a href="javascript:goPageNoSubmit('bigExam','examApply');" class="btn_lendingLink2"><b>빅모의고사</b></a>--%>
                    <a href="javascript:goBigExam();" class="btn_lendingLink2"><b>빅모의고사</b></a>
                </div>
                <div class="w40p">
                    <div class="mainGuide">
                        <b>지안에듀<br />수험가이드</b>
                        <ul>
                            <li><a href="javascript:goExamGuide(0);">행정직</a></li>
                            <li><a href="javascript:goExamGuide(1);">계리직</a></li>
                            <li><a href="javascript:goExamGuide(2);">전산직</a></li>
                            <li><a href="javascript:goExamGuide(3);">토목직</a></li>
                            <li><a href="javascript:goExamGuide(4);">임업직</a></li>
                            <li><a href="javascript:goExamGuide(5);">농업직</a></li>
                            <li><a href="javascript:goExamGuide(6);">건축직</a></li>
                            <li><a href="javascript:goExamGuide(7);">환경직</a></li>
                            <li><a href="javascript:goExamGuide(8);">운전직</a></li>
                            <li><a href="javascript:goExamGuide(9);">통신직</a></li>
                            <li><a href="javascript:goExamGuide(10);">전기직</a></li>
                            <li><a href="javascript:goExamGuide(11);">군수직</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="lendingBanner">
                <div>
                    <!-- DB 배너 -->
                    <a id="eventBannerHref0" href=""><img id="eventBanner0" src="" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/common/zian/images/content/img_banner0003.jpg" alt=""></a>
                </div>
                <div class="divGroup cols3">
                    <!-- DB 배너 -->
                    <div><a id="mainBannerHref0" href=""><img id="mainBanner0"></a></div>
                    <div><a id="mainBannerHref1" href=""><img id="mainBanner1" src="" alt=""></a></div>
                    <div><a id="mainBannerHref2" href=""><img id="mainBanner2" src="" alt=""></a></div>
                </div>
            </div>

            <!-- 지안에듀 고객센터 -->
            <div class="divGroup">
                <div class="mainCustomer w45p">
                    <div>
                        <div class="titleBar">
                            <h5>고객센터</h5>
                        </div>
                        <ul>
                            <li>
                                <span class="title">대표전화</span>
                                <b class="phone">02-816-1724</b>
                            </li>
                            <li>
                                <span class="title">2관학원</span>
                                <b>070-4870-0634</b>
                                <span class="desc">
									1번 학원동영상 상담 및 결재문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결재 및 환불문의
								</span>
                                <span class="desc">
									운영시간 09:00~18:00 (주말,공휴일 제외)<br />
									점심시간 12:00~13:00
								</span>
                            </li>
                        </ul>
                        <a href="javascript:goPageNoSubmit('customerCenter','consult');" class="btn_apply">1:1문의</a>
                    </div>
                </div>
                <div class="mainInfo w55p">
                    <ul>
                        <li><a href="javascript:goExamNotice();" class="item1">시험공공</a></li>
                        <li><a href="javascript:goOpenMenu();" class="item2">개강안내</a></li>
                        <li><a href="javascript:goMyPage();" class="item3">교재배송</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');" class="item4">모바일 문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');" class="item5">자주하는 질문</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');" class="item6">1:1 고객상담</a></li>
                    </ul>
                </div>
            </div>
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
<%--    <%@include file="/common/jsp/footerBanner.jsp" %>--%>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
<script>
    $(document).ready(function () {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo == null){
            sessionStorage.setItem("leftMenu", "techOnline");
        }
        getEventMiniBanner("", 6283, 1);//이벤트 배너
        getRandingBannerList(224, 3);//미니배너
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            var userName = sessionUserInfo.name;
            innerHTML("userName", userName+" 님");
            innerHTML("userName2", userName+" 님");
            innerHTML('topNavM_state', '로그아웃');
            $("#side_logout").show();
            gfn_display("mypage", true);
            gfn_display("userName", true);
            gfn_display("logout", true);
            gfn_display("login", false);
            gfn_display("join", false);
        }else{
            $("#side_login").show();
            innerHTML('topNavM_state', '로그인');
        }
        //오른쪽메뉴 오늘 안보기 클릭 이벤트
        $("#todayClose").click(function () {
            setCookieMobile( "todayCookie", "done" , 1);
            $("#quickBar").hide();
        });
    });
    //직렬별 leftMenu 세션 셋팅
    function setLeftMenu(val) {
        if(val != ""){
            sessionStorage.setItem("leftMenu", val);
            if(val == 'publicOnline'){
                goPage('publicOnline', 'main');
            }else if(val == 'techOnline'){
                goPage('techOnline', 'main');
            }else if(val == 'postOnline'){
                goPage('postOnline', 'main')
            }
        }
    }

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

    function goMyPage() {
        goPageNoSubmit('myPage','orderList');
    }
    
    function goBookStore() {
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }
    
    function goLecReview() {
        sessionStorage.setItem("leftMenu", 'techOnline');
        goPageNoSubmit('review','lectureList');
    }
    
    function goPassReview() {
        sessionStorage.setItem("leftMenu", 'techOnline');
        goPageNoSubmit('review','passList');
    }
    
    function goExamGuide(idx) {
        sessionStorage.setItem("leftMenu", 'techOnline');
        sessionStorage.setItem("noticeHeader", "examGuide");
        $("#noticeMenu li:eq(4)").addClass('active');
        location.href = location.href = "/notice?page_gbn=examGuide&idx="+idx;
    }
    function goBigExam() {
        sessionStorage.setItem("leftMenu", 'bigExam');
        goPageNoSubmit('bigExam','main');
    }

    //모바일 로그인,로그아웃 버튼 연동
    function mobileLoginChk() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) goLogout();
        else goLoginPage();
    }

    function test1234() {
        var data = {
            USER_ID : "test1234566",
            USER_KEY : "123898",
            NAME : "안지호",
            PWD : "c7684301-+",
            GENDER : "0",
            EMAIL :  "anjo0070@naver.com",
            TELEPHONE_MOBILE : "010-6258-5228",
            RECV_SMS : "1",
            RECV_EMAIL : "1",
            AUTHORITY : "10",
            ZIPCODE : "12345",
            ADDRESS_ROAD : "경기 성남시 수정구 탄리로 81",
            ADDRESS : "302"
        };
        var resultData = null;
        $.post("http://118.217.181.175:8088/login/memberInsert.html", data, function (response) {
            resultData = response;
            console.log(resultData);
        }).fail(function() {
            alert(comment.error);
        });
    }
</script>
