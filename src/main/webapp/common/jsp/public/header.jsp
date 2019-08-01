<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--최상단배너-->
<div id="topBanner" style="background-color:#520404;">
    <div class="inner">
        <a href="#"><img src="/common/zian/images/content/img_topBanner0101.jpg" alt=""></a>
    </div>
</div>
<!--//최상단배너-->
<!--상단-->
<div id="header">
    <div class="inner">
        <h1><a href="javascript:goPage('publicOnline', 'main')"><img src="/common/zian/images/common/logo01.png" alt="지안에듀 행정직"></a></h1>
        <div id="topSelect">
            <ul>
                <li id="publicHeaderLi_1"><a href="javascript:goPage('publicOnline', 'main')">온라인</a></li>
                <li id="publicHeaderLi_2"><a href="javascript:goPage('publicAcademy', 'main')">학원</a></li>
            </ul>
        </div>
        <!--최상단메뉴-->
        <div id="topNav">
            <ul>
                <li id="userName" style="display: none;"></li>
                <li id="join"><a href="javascript:goPage('user', 'joinAgree')">회원가입</a></li>
                <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
                <li id="logout" style="display: none;"><a href="javascript:goLogout();">로그아웃</a></li>
                <li><a href="#">내강의실</a></li>
                <li><a href="#">장바구니<!--<em>30</em>--></a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </div>
        <!--//최상단메뉴-->
    </div>
    <!--주메뉴-->
    <div id="gnb">
        <div class="inner">
            <ul class="cols7">
                <li><a href="#">내강의실</a></li>
                <li><a href="#">교수소개</a></li>
                <li><a href="#">지안패스</a></li>
                <li><a href="#">동영상강좌</a></li>
                <li><a href="#">무료강좌</a></li>
                <li><a href="#">빅모의고사</a></li>
                <li><a href="#">합격수기</a></li>
            </ul>
            <a href="#" class="btn_navOpen">전체메뉴 열기</a>
        </div>
    </div>
    <!--//주메뉴-->
</div>
<!--//상단-->
