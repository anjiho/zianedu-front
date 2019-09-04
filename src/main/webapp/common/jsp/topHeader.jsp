<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!--최상단메뉴-->
<div id="topNav">
    <ul>
        <li><a href="javascript:addFavorite();" class="btn_bookmark">즐겨찾기에 등록</a></li>
        <li id="userName" style="display: none;"></li>
        <li id="login"><a href="javascript:goLoginPage();">로그인</a></li>
        <li id="logout" style="display: none;"><a href="javascript:goLogout();">로그아웃</a></li>
        <li id="join"><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
        <li><a href="#">합격수기</a></li>
        <li><a href="#">이벤트</a></li>
    </ul>
</div>
<!--//최상단메뉴-->
