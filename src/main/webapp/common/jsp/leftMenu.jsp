<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    function setNoticeMenu() {
        sessionStorage.setItem("noticeHeader", "openMenu");
        goPage("notice", "list");
    }
    function setLeftMenu() {
        var topSubHtml = $("#topSub").html();

        if(topSubHtml == '기술직 학원'){
            sessionStorage.setItem("leftMenu", "techAcademy");
            goPage("techAcademy", "main");
        }else if(topSubHtml == '행정직 학원'){
            sessionStorage.setItem("leftMenu", "publicAcademy");
            goPage("publicAcademy", "main");
        }else if(topSubHtml == '계리직 학원'){
            sessionStorage.setItem("leftMenu", "postAcademy");
            goPage("postAcademy", "main");
        }else if(topSubHtml == '계리직 학원'){
            sessionStorage.setItem("leftMenu", "postAcademy");
            goPage("postAcademy", "main");
        }else if(topSubHtml == '기술직 온라인'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPage("techOnline", "main");
        }else if(topSubHtml == '행정직 온라인'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPage("publicOnline", "main");
        }else if(topSubHtml == '계리직 온라인'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPage("postOnline", "main");
        }else {
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
    }

    function setLeftMenu1(){
        var subMenuHtml = $("#subMenu1").html();
        if(subMenuHtml == '기술직'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPage("techOnline", "main");
        }else if(subMenuHtml == '행정직'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPage("publicOnline", "main");
        }else if(subMenuHtml == '계리직'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPage("postOnline", "main");
        }else{
            sessionStorage.setItem("leftMenu", "publicOnline");
        }
    }

    function setLeftMenu2(){
        var subMenuHtml = $("#subMenu2").html();
        if(subMenuHtml == '기술직'){
            sessionStorage.setItem("leftMenu", "techOnline");
            goPage("techOnline", "main");
        }else if(subMenuHtml == '행정직'){
            sessionStorage.setItem("leftMenu", "publicOnline");
            goPage("publicOnline", "main");
        }else if(subMenuHtml == '계리직'){
            sessionStorage.setItem("leftMenu", "postOnline");
            goPage("postOnline", "main");
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
            }else if(leftMenuInfo == "publicAcademy"){
                $("#siteTab").css("background","#134c97");
                var html = "행정직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "행정직 온라인");
                innerHTML("subMenu1", "기술직");
                innerHTML("subMenu2", "계리직");
            }else if(leftMenuInfo == "techOnline"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
            }else if(leftMenuInfo == "techAcademy"){
                $("#siteTab").css("background","#f69321");
                var html = "기술직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "기술직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "계리직");
            }else if(leftMenuInfo == "postOnline"){
                $("#siteTab").css("background","#ce1717");
                var html = "계리직"+"<br />"+"온라인";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 학원");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
            }else if(leftMenuInfo == "postAcademy"){
                $("#siteTab").css("background-color","#ce1717");
                var html = "계리직"+"<br />"+"학원";
                innerHTML("topName", html);
                innerHTML("topSub", "계리직 온라인");
                innerHTML("subMenu1", "행정직");
                innerHTML("subMenu2", "기술직");
            }
        }else{
            $("#siteTab").css("background","#134c97");
            var html = "행정직"+"<br />"+"온라인";
            innerHTML("topName", html);
            innerHTML("topSub", "행정직 학원");
            innerHTML("subMenu1", "기술직");
            innerHTML("subMenu2", "계리직");
        }
        //getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    });



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
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu1()"><span id="subMenu1"></span></a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu2()"><span id="subMenu2"></span></a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="#"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="#"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="#"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="#"><span class="icon item4"></span>내강의실</a></li>
                <li><a href="#"><span class="icon item5"></span>학원수강내역</a></li>
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
<%--                <li><a href="javascript:goPage('notice', 'list')"><span class="icon item7"></span>공지사항</a></li>--%>
                <li><a href="javascript:void(0);" onclick="setNoticeMenu()"><span class="icon item7"></span>공지사항</a></li>
                <li><a href="#"><span class="icon item8"></span>1:1문의</a></li>
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
</div>
