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
                    <p class="btn_home">지안에듀<span>님</span></p>
                    <span class="bar"></span>
                    <a href="" class="btn_logout">로그아웃</a>
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
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">1:1관리반</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>행정직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">지안패스</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">연간관리반</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>기술직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">지안패스</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직학원</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">1:1관리반</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>계리직온라인</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">메인으로</a></li>
                                    <li><a href="#">내강의실</a></li>
                                    <li><a href="#">교수소개</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">지안패스</a></li>
                                    <li><a href="#">무료강좌</a></li>
                                    <li><a href="#">합격수기</a></li>
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">공지사항</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>온라인서점</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">온라인서점</a></li>
                                    <li><a href="#">공통과목</a></li>
                                    <li><a href="#">행정직</a></li>
                                    <li><a href="#">기술직</a></li>
                                    <li><a href="#">계리직</a></li>
                                    <li><a href="#">자격증</a></li>
                                    <li><a href="#">정오표</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>빅모의고사</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">빅모의고사</a></li>
                                    <li><a href="#">모의고사신청</a></li>
                                    <li><a href="#">학원모의고사</a></li>
                                    <li><a href="#">주간모의고사</a></li>
                                    <li><a href="#">기출문제</a></li>
                                    <li><a href="#">응시후기</a></li>
                                    <li><a href="#">자료실</a></li>
                                </ul>
                            </li>
                            <li class="deth1_tit">
                                <a href="#" class="normal">
                                    <span>자격증</span>
                                </a>
                                <ul class="deth2_list">
                                    <li><a href="#">알기사 사이트이동</a></li>
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
                <li><a href="javascript:goPageNoSubmit('', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'academy')">학원수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'list')">연간관리반</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="deaph1 cols7 onlineTopMenu" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')">내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'main')">교수소개</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'single')">수강신청</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'list')">지안패스</a></li>
                <li><a href="javascript:goPageNoSubmit('', 'theory')">무료강좌</a></li>
                <li><a href="javascript:goBigExam()">빅모의고사</a></li>
                <li><a href="javascript:goPassReview();">합격수기</a></li>
            </ul>
            <ul class="deaph1 cols7 bookStore" style="display: none;">
                <li><a href="javascript:goDetailbookType('');">공통과목</a></li>
                <li><a href="javascript:goDetailbookType('');">행정직군</a></li>
                <li><a href="javascript:goDetailbookType('');">기술직군</a></li>
                <li><a href="javascript:goDetailbookType('');">계리직군</a></li>
                <li><a href="javascript:goDetailbookType('');">자격증</a></li>
                <li><a href="javascript:goPageNoSubmit('','errataList')">정오표</a></li>
            </ul>
            <ul class="deaph1 cols7 bigExam" style="display: none;">
                <li><a href="javascript:goPageNoSubmit('','examApply')">모의고사신청</a></li>
                <li><a href="javascript:goPageNoSubmit('','acaExam')">학원모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('','weekExam')">주간모의고사</a></li>
                <li><a href="javascript:goPageNoSubmit('','pastQuestion')">기출문제</a></li>
                <li><a href="javascript:goPageNoSubmit('','bigReviewList')">응시후기</a></li>
                <li><a href="javascript:goPageNoSubmit('','referenceList')">자료실</a></li>
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
            var userName = sessionUserInfo.name;
            innerHTML("userName", userName+" 님");
        }else{
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
</script>