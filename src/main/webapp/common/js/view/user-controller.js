//회원 아이디 중복체크
function checkDuplicate(userId) {
    if (userId == null || userId == undefined) return;

    var data = {
        userId : userId
    };
    var info = getLoginApi("/user/checkDuplicate", "", data);
    return info.result;
}
//로그인
function login(userId, userPwd) {
    var data = {
        userId : userId,
        userPwd: userPwd
    };
    var loginChk =  postApi("/user/login", data);
    if(loginChk.resultCode == 200){
        var result  = loginChk.result;
        sessionStorage.setItem("userInfo", JSON.stringify(result));
        //gfn_display("logout", true);
        //gfn_display("login", false);
        goMain();
    }else if(loginChk.resultCode == 900){
        alert(comment.blank_login_check);
        return;
    }
}

//회원탈퇴

//회원정보 수정

//회원 비밀번호 변경

//장바구니 리스트 삭제

//회원가입
function userReg(data) {
    var result = postApi("/user/reg", data);
    return result;
}
