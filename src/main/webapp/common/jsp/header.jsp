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
                    <li><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
                    <li><a href="#">로그인</a></li>
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
        <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
        <a href="#" class="titleBarLeft"><img src="/common/zian/images/content/img_titleBarLeft.jpg" alt=""></a>
        <a href="#" class="titleBarRight"><img src="/common/zian/images/content/img_titleBarRight.jpg" alt=""></a>
    </div>
</div>
<!--//상단-->
<%--<div style="text-align: center">--%>
<%--    <div id="login">--%>
<%--        <label>아이디</label><input type="text" id="userId">--%>
<%--        <label>비밀번호</label><input type="password" id="userPwd">--%>
<%--        <input type="button" value="로그인" onclick="loginCheck();">--%>
<%--    </div>--%>
<%--    <div id="logout" style="display: none;">--%>
<%--        <span id="userName"></span><input type="button" value="로그아웃" onclick="logout();">--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    $( document ).ready(function() {--%>
<%--        var user = JSON.parse(sessionStorage.getItem('userInfo'));--%>
<%--        if(user != null){--%>
<%--            var userName = user.name;--%>
<%--            innerHTML("userName", userName);--%>
<%--            gfn_display("logout", true);--%>
<%--            gfn_display("login", false);--%>
<%--        }--%>
<%--    });--%>

<%--    function loginCheck() {--%>
<%--        var userId  = getInputTextValue("userId");--%>
<%--        var userPwd = getInputTextValue("userPwd");--%>
<%--        var data = {--%>
<%--            userId : userId,--%>
<%--            userPwd : userPwd--%>
<%--        };--%>
<%--        var loginChk =  postApi("/user/login", data);--%>

<%--        if(loginChk.resultCode == 200){--%>
<%--            var result  = loginChk.result;--%>
<%--            sessionStorage.setItem("userInfo", JSON.stringify(result));--%>

<%--            gfn_display("logout", true);--%>
<%--            gfn_display("login", false);--%>
<%--        }else if(loginChk.resultCode == 900){--%>
<%--            alert(comment.blank_login_check);--%>
<%--            return;--%>
<%--        }--%>
<%--    }--%>

<%--    function logout() {--%>
<%--        sessionStorage.clear();--%>
<%--        gfn_display("logout", false);--%>
<%--        gfn_display("login", true);--%>
<%--    }--%>
<%--    --%>
<%--    function getLoginState() {--%>
<%--        var user = JSON.parse(sessionStorage.getItem('userInfo'));--%>
<%--        var boolean = false;--%>
<%--        if(user != null){--%>
<%--            boolean = true;--%>
<%--        }--%>
<%--        /**--%>
<%--         * TODO : 로그인 팝업 or 로그인 페이지로 이동하는 로직 추가 해야함--%>
<%--         */--%>
<%--        return boolean;--%>
<%--    }--%>
<%--</script>--%>
