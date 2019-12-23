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
        //goMain();
        var targetUrl = getParameterByName("target_url");
        location.href = targetUrl;
    }else if(loginChk.resultCode == 900){
        alert(comment.blank_login_check);
        return;
    }
}

//회원탈퇴

//회원정보 수정
function memberModify(userKey, telephoneMobile, zipcode, addressRoad, addressNumber, address, interestCtgKey0) {
    var data = {
        userKey: userKey,
        telephoneMobile : telephoneMobile,
        zipcode : zipcode,
        addressRoad : addressRoad,
        addressNumber : addressNumber,
        address : address,
        interestCtgKey0 : interestCtgKey0
    };
    var result = postApi("/user/modify", data);
    return result;
}

//회원 비밀번호 변경

//장바구니 리스트 삭제

//회원가입
function userReg(data) {
    var result = postApi("/user/reg", data);
    return result;
}

//회원정보가져오기
function getUserInfo(userKey) {
    if (userKey == null || userKey == undefined) return;
    var userInfo = getApi("/user/getUserInfo/", userKey, '');
    return userInfo.result;
}

function requestChangeDevice(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        deviceType: deviceType
    };
    var resultInfo = postMailApi("/user/requestChangeDevice/", userKey, data);
    return resultInfo;
}

function confirmChangeDeviceCode(userKey, code) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        code: code
    };
    var resultInfo = postMailApi("/user/confirmChangeDeviceCode/", userKey, data);
    return resultInfo;

}
