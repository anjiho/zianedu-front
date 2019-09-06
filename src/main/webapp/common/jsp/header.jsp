<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!--최상단배너-->
<div id="topBanner" style="background-color:#520404;">
    <div class="inner">
        <a href="#"><img src="/common/zian/images/content/img_topBanner.jpg" alt=""></a>
    </div>
</div>
<!--//최상단배너-->
<!--상단-->
<div id="header" class="landing">
    <!--최상단메뉴-->
    <div id="topBar">
        <div class="inner">
            <div class="left">
                <a href="javascript:addFavorite();">지안에듀를 즐겨찾기로 &gt;</a>
            </div>
            <div class="right">
                <ul>
                    <li id="mypage" style="display: none;"><a href="#">마이페이지</a></li>
                    <li id="join"><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
                    <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
                    <li id="logout" style="display: none;"><a href="javascript:goLogout();">로그아웃</a></li>
                    <li><a href="#">내강의실</a></li>
                    <li><a href="#">장바구니<!--<em>30</em>--></a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--//최상단메뉴-->
    <div class="inner">
        <h1><a href="javascript:goMain()"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
        <a href="#" class="titleBarLeft"><img src="/common/zian/images/content/img_titleBarLeft.jpg" alt=""></a>
        <a href="#" class="titleBarRight"><img src="/common/zian/images/content/img_titleBarRight.jpg" alt=""></a>
    </div>
</div>
<!--//상단-->
