<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
        function loginCheck() {
            var userId  = getInputTextValue("userId");
            var userPwd = getInputTextValue("userPwd");
            if(userId == ""){
                alert("아이디를 입력해 주세요.");
                return false;
            }else if(userPwd == ""){
                alert("비밀번호를 입력해 주세요.");
                return false;
            }else{
                login(userId, userPwd);
            }
        }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <div class="loginWrap">
            <h1><a href="#"><img src="/common/zian/images/common/logo_b.png" alt="zion edu"></a></h1>
            <div class="loginForm">
                <input type="text" id="userId" placeholder="아이디">
                <input type="password" id="userPwd" onkeypress="if(event.keyCode==13) {loginCheck(); return false;}" placeholder="비밀번호">
                <input type="button" value="로그인" class="btn_login" onclick="loginCheck();">
                <div class="loginBtn">
                    <a href="javascript:goPage('user', 'joinAgree');" class="btn_join">회원가입</a> &nbsp;|&nbsp;
                    <a href="#" class="btn_findMember">아이디&amp;비밀번호 찾기</a>
                </div>
            </div>
            <div class="loginSns">
                <b>SNS 간편가입하기</b>
                <div class="loginBtn">
                    <a href="javascript:readyFunctionAlert();" class="btn_loginNaver">네이버로 간편가입하기</a>
                    <a href="javascript:readyFunctionAlert();" class="btn_loginKakao">카카오로 간편가입하기</a>
                </div>
            </div>
            <div class="loginBanner">
                <a href="#"><img src="/common/zian/images/content/img_loginBanner.jpg" alt=""></a>
            </div>
        </div>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
