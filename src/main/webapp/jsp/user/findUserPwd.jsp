<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //라이브
    String EncodeData = "AgAFRzQ1Mjhd3IIzWk2NPukWJik41vRks3td9S9SojuXKL3zikJYjL5S49ZNORP1/FUJpGiUujufqGX6E2fn1EK5iOl4bITV3TbJVMo8WijIkqWXjV36zgHwAIc2efmW3KE7/ZoxoRUSrXR6LgD7lQ3MOlQk+u8o5QbbXCBRouiZ5eoqiYCsql8t+o41MneD/5CDIAa7mZFBqm6hoH4jAz4dM6cuGKdLuzu+IWQnQwq+FcD7pZnK+/ILIq8RpKoPYHfsQnJYfu5ulU7yZYIXfJfE+w+LQxZNt6A31rYFZsQhy53sPN195FQKvvy7XUK0QzjckADh84Z67g4+N5aMNPigu1FEDWMakbKcMUhWjqHzTpxC1PZQd9e1M0BF8Y76yibt7PzrnKMbTiefX+OH5X2pB6Fj3ff7xTLv0aQEyp9x7SRDnFgqaZspnWqNDeKdrrJcvmM+79PfDv7sIvWBaBu7pAsRR8FM2s1XurUNo3VaNatKHdO3IQ==";
    //개발
    //String EncodeData = "AgAFRzQ1MjggmBc4FV2hsPk60S+onp/sPGguP/iH2IcLPYHRsyy1o75S49ZNORP1/FUJpGiUujufqGX6E2fn1EK5iOl4bITVW5OwueNZi7WXOXlvTLPDad7mZmTui1jNlT8Hwtvjwj6dWWOFOBi1pyFMYhWlKY9YjcYFYIxit58BaCJiOktYyUjw981KqnSD8mTh5v5j0o7FbAQZGgHWomubJYsH4odO7fu1IZZ2ZAihdqQUw9tJGjXfwShalrvgRp/jWWioBEmuz/EoubTtVE338M1ALBn+7+l63fIRxSeVgoNxY6dHYBLv94Aqzrv8bPiqIe7c6p6m9so+k+V/9HD1QvK5UbV1m+g3qOAxnyuCRV9FaaDPbWdl81QuHBjWL9bae4Ygp/nn28h+4JfefW1R/U8mP4jJA7a4B2xPu0DEyIPU49647KIlSAaQopATlkp+0mZoVsoKAn9YEiIG3jfJQCLl5LsgpcX7Wmll11trgCTkcmjbzQ==";
%>
<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = Util.requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "G4528";				// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "H9NGAJRFE6WF";			// NICE로부터 부여받은 사이트 패스워드

    String sCipherTime = "";			// 복호화한 시간
    String sRequestNumber = "";			// 요청 번호
    String sResponseNumber = "";		// 인증 고유번호
    String sAuthType = "";				// 인증 수단
    String sName = "";					// 성명
    String sDupInfo = "";				// 중복가입 확인값 (DI_64 byte)
    String sConnInfo = "";				// 연계정보 확인값 (CI_88 byte)
    String sBirthDate = "";				// 생년월일(YYYYMMDD)
    String sGender = "";				// 성별
    String sNationalInfo = "";			// 내/외국인정보 (개발가이드 참조)
    String sMobileNo = "";				// 휴대폰번호
    String sMobileCo = "";				// 통신사
    String sMessage = "";
    String sPlainData = "";

    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);

        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
        //sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 사용시 주석 해제 후 사용
        sBirthDate		= (String)mapresult.get("BIRTHDATE");
        sGender			= (String)mapresult.get("GENDER");
        sNationalInfo  	= (String)mapresult.get("NATIONALINFO");
        sDupInfo		= (String)mapresult.get("DI");
        sConnInfo		= (String)mapresult.get("CI");
        sMobileNo		= (String)mapresult.get("MOBILE_NO");
        sMobileCo		= (String)mapresult.get("MOBILE_CO");
%>
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<script src="/common/js/common.js"></script>
<script src="/common/js/rest-api.js"></script>
<script src="/common/js/view/user-controller.js"></script>
<script language="javascript">
    var name = '<%=sName%>';
    var certCode = '<%=sDupInfo%>';
    var mobileNo = '<%=sMobileNo%>';

    // window.opener.document.getElementById("name").value = name;
    // window.opener.document.getElementById("name").disabled = true;
    // window.opener.document.getElementById("certCode").value = certCode;
    // window.opener.document.getElementById("telephoneMobile").value = mobileNo;

    var browse = navigator.userAgent.toLowerCase();
    if( (navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || (browse.indexOf("msie") != -1)) {
        window.open("about:blank","_self").close();
    } else {
        var mobileNo = '<%=sMobileNo%>';
        var phoneNum = blur(mobileNo);
        var userInputId = window.opener.document.getElementById("userId").value;
        if(mobileNo != ''){
            var userInfo  = getUserInfoFromFindPwd(userInputId, phoneNum);
            if(userInfo != null){
                var userKey = userInfo.result.userKey;
                window.opener.document.getElementById("userKey").value = userKey;
                window.opener.document.getElementById("searchDiv").style.display ='none';
                window.opener.document.getElementById("changePwdDiv").style.display ='block';
            }else{
                window.opener.document.getElementById("searchDiv").style.display ='block';
                window.opener.document.getElementById("changePwdDiv").style.display ='none';
                window.opener.document.getElementById("userIdPwd").innerHTML = '가입하신 아이디가 아닙니다.';
            }
        }
        self.close();
    }
</script>
<% } %>
<%@include file="/common/jsp/common.jsp" %>
<script>
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="userKey" id="userKey">
    <input type="hidden" name="EncodeData" value="<%=EncodeData%>">
    <input type="hidden" id="pwdValidation" value="0">
    <input type="hidden" name="m" value="checkplusSerivce">
    <div id="wrap">
        <div class="loginWrap">
            <h1><a href="#"><img src="/common/zian/images/common/logo_b.png" alt="zion edu"></a></h1>
            <div class="serchForm">
                <div class="serch">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('user','findUserId');">아이디 찾기</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('user','findUserPwd');">비밀번호 찾기</a></li>
                    </ul>
                </div>
                <div class="serchBox"  id="searchDiv">
                    <div class="serchBoard">
                        <p id="userIdPwd">아이디와 가입당시 입력한 휴대폰 번호를 통해<br>비밀번호를 찾을 수 있습니다.</p>
                        <input type="text" id="userId" placeholder="아이디를 입력해주세요">
                        <a href="javascript:fnNicePopup();">휴대폰인증</a>
                    </div>
                </div>
                <div class="serchBox" style="display:none;" id="changePwdDiv">
                    <div class="serchBoard">
                        <input type="password" id="changeUserPwd" placeholder="변경할 비밀번호를 입력해 주세요." style="margin-top: 100px;">
                        <div class="requiredText" id="pwdCaption" style="display:none;color:red;text-align: center;"></div>
                        <input type="password" id="reUserPwd" placeholder="변경비밀번호 재확인" >
                        <div class="requiredText" id="rePwdCaption" style="display:none;color:red;text-align: center;"></div>
                        <div class="loginBtn">
                            <a href="javascript:goChangePwd();" class="btn_join">비밀번호 변경</a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="loginBanner">
                <a href="#"><img src="/common/zian/images/common/c_banner.jpg" alt=""></a>
            </div>
        </div>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
<script>
    window.name ="Parent_window";
    $(document).ready(function () {
        //비밀번호 확인 체크
        $("#changeUserPwd").keyup(function () {
            var password = getInputTextValue("changeUserPwd");
            innerHTML("rePwdCaption","");
            validationPassword(password);
        });
        $("#reUserPwd").keyup(function () {
            var password   = getInputTextValue("changeUserPwd");
            var rePassword = getInputTextValue("reUserPwd");
            if(rePassword != ""){
                if(password != ""){
                    gfn_display("rePwdCaption", true);
                    if(password == rePassword){
                        innerHTML("rePwdCaption","비밀번호 일치");
                        innerValue('pwdValidation', 1);
                    }else{
                        innerHTML("rePwdCaption","비밀번호가 일치하지 않습니다. 다시 확번 확인해주세요.");
                    }
                }else{
                    alert('비밀번호를 입력하세요');
                    innerValue("rePassword", "");
                    focusInputText("password");
                    return false;
                }
            }
        });
    });
    function goChangePwd() {
        var pwdValidation = getInputTextValue('pwdValidation');
        if(pwdValidation == 0){
            alert("비밀번호를 다시 확인해 주세요.");
        }else{
            var userKey = getInputTextValue('userKey');
            var changeUserPwd = getInputTextValue('changeUserPwd');
            var resultInfo = modifyPwdByMobileNumber(userKey, changeUserPwd);
            if(resultInfo != null){
                if(resultInfo.resultCode == 200){
                    alert("비밀번호가 변경되었습니다.");
                    goLoginPage();
                }
            }
        }
    }
</script>
