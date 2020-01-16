<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        innerHTML('cartCnt', sessionUserInfo.cartCount);
    });

    function setNoticeMenu() {
        sessionStorage.setItem("noticeHeader", "openMenu");
        goPageNoSubmit("notice", "list");
    }
    function setLeftMenu() {
        var topSubHtml = $("#topSub").html();
        if(topSubHtml == '기술직 학원'){
            sessionStorage.setItem("leftMenu", "techAcademy");
            goPageNoSubmit("techAcademy", "main");
        }else if(topSubHtml == '행정직 학원'){
            sessionStorage.setItem("leftMenu", "publicAcademy");
            goPageNoSubmit("publicAcademy", "main");
        }else if(topSubHtml == '계리직 학원'){
            sessionStorage.setItem("leftMenu", "postAcademy");
            goPageNoSubmit("postAcademy", "main");
        }else if(topSubHtml == '계리직 학원'){
            sessionStorage.setItem("leftMenu", "postAcademy");
            goPageNoSubmit("postAcademy", "main");
        }else if(topSubHtml == '기술직 온라인'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPageNoSubmit("techOnline", "main");
        }else if(topSubHtml == '행정직 온라인'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }else if(topSubHtml == '계리직 온라인'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPageNoSubmit("postOnline", "main");
        }else {
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
    }

    function setLeftMenu1(){
        var subMenuHtml = $("#subMenu1").html();
        if(subMenuHtml == '기술직'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPageNoSubmit("techOnline", "main");
        }else if(subMenuHtml == '행정직'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }else if(subMenuHtml == '계리직'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPageNoSubmit("postOnline", "main");
        }else{
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
    }

    function setLeftMenu2(){
        var subMenuHtml = $("#subMenu2").html();
        if(subMenuHtml == '기술직'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPageNoSubmit("techOnline", "main");
        }else if(subMenuHtml == '행정직'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }else if(subMenuHtml == '계리직'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPageNoSubmit("postOnline", "main");
        }else{
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
    }

    $(document).ready(function () {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');
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
            }else if(leftMenuInfo == "publicAcademy"){
                $("#siteTab").css("background","#134c97");
                var html = "행정직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "행정직 온라인");
                innerHTML("subMenu1", "기술직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
            }else if(leftMenuInfo == "techOnline"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
            }else if(leftMenuInfo == "techAcademy"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
            }else if(leftMenuInfo == "postOnline"){
                $("#siteTab").css("background","#ce1717");
                var html = "계리직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
            }else if(leftMenuInfo == "postAcademy"){
                $("#siteTab").css("background-color","#ce1717");
                var html = "계리직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
                innerHTML("subMenu3", "자격증/가산점");
                innerHTML("subMenu4", "온라인서점");
            }else if(leftMenuInfo == "bookStore"){
                $("#siteTab").hide();
                $("#bookStoreTab").show();
                innerHTML("topSub", "온라인"+"<br>"+"서점");
                innerHTML("subMenu1", "기술직");
                innerHTML("subMenu2", "계리직");
                innerHTML("subMenu3", "행정직");
                innerHTML("subMenu4", "자격증/가산점");
            }
        }
        getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    });

    function goLecRoom() {
        sessionStorage.setItem("noticeHeader", "lectureRoom");
        $("#noticeMenu li:eq(2)").addClass('active');
        goPageNoSubmit('notice', 'lecRoom');
    }
    
    function goExamGuide() {
        sessionStorage.setItem("noticeHeader", "examGuide");
        $("#noticeMenu li:eq(4)").addClass('active');
        goPageNoSubmit('notice', 'examGuide');
    }
    
    function setLeftMenu4() {
        var subMenuHtml = $("#subMenu4").html();
        if(subMenuHtml == '자격증/가산점'){
            window.open("http://www.algisa.com/public/main.html", "_blank");
            return false;
        }else if(subMenuHtml == '온라인서점'){
            sessionStorage.setItem("leftMenu", 'bookStore');
            goPageNoSubmit('bookStore','main');
        }
    }

    function goMyCart() {
        sessionStorage.setItem("myPageHeader", "cart");
        $("#myPageMenu li:eq(1)").addClass('active');
        goPageNoSubmit('myPage', 'cart');
    }
    
    function setLeftMenu3() {
        var subMenuHtml = $("#subMenu3").html();
        if(subMenuHtml == '자격증/가산점'){
            window.open("http://www.algisa.com/public/main.html", "_blank");
            return false;
        }else if(subMenuHtml == '온라인서점'){
            sessionStorage.setItem("leftMenu", 'bookStore');
            goPageNoSubmit('bookStore','main');
        }else if(subMenuHtml == '행정직'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPageNoSubmit("publicOnline", "main");
        }
    }

</script>
<div id="skipLink">
    <a href="#">본문바로가기</a>
    <a href="#">주메뉴바로가기</a>
</div>
<!--좌측사이트메뉴-->
<div id="publicOnline">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#"><span id="topName"></span></a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu()"><span id="topSub"></span></a>
        </div>
        <div id="bookStoreTab" style="background: #003471;display: none;    height: 160px; text-align: center;">
            <h1 style="border-bottom: none;display: block; margin: 0 20px;"><a href="javascript:goPageNoSubmit('bookStore','main')" style="padding: 50px 0;display: block;margin: 0; padding: 46px 0;font-size: 26px;color: #fff; line-height: 30px">온라인<br>서점</a></h1>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu1()"><span id="subMenu1"></span></a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu2()"><span id="subMenu2"></span></a></li>
                <li class="item5"><a href="javascript:void(0);" onclick="setLeftMenu3()"><span id="subMenu3"></span></a></li>
                <li class="item4"><a href="javascript:void(0);" onclick="setLeftMenu4()"><span id="subMenu4"></span></a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="javascript:goLecRoom();"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="#"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="javascript:goExamGuide();"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')"><span class="icon item4"></span>내강의실</a></li>
                <li><a href="#"><span class="icon item5"></span>학원수강내역</a></li>
                <li><a href="javascript:goMyCart();"><span class="icon item6"><em id="cartCnt"></em></span>장바구니</a></li>
                <li><a href="javascript:void(0);" onclick="setNoticeMenu()"><span class="icon item7"></span>공지사항</a></li>
                <li><a href="javascript:goPageNoSubmit('customerCenter','consult');"><span class="icon item8"></span>1:1문의</a></li>
            </ul>
        </div>
        <div id="examBanner" class="slider useBx">
            <ul id="dDayBanner">
<%--                <li>--%>
<%--                    <span>2019 국가직 7급 필기시험</span>--%>
<%--                    <b>D-116</b>--%>
<%--                    <a href="#">상세정보</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <span>2019 국가직 7급 필기시험</span>--%>
<%--                    <b>D-116</b>--%>
<%--                    <a href="#">상세정보</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <span>2019 국가직 7급 필기시험</span>--%>
<%--                    <b>D-116</b>--%>
<%--                    <a href="#">상세정보</a>--%>
<%--                </li>--%>
            </ul>
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
</div>
