<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //라이브
    String EncodeData = "AgAFRzQ1MjiSyEDzN+LycTxTiNf2vC5mFqrP/zlqlGBtlUB763ezVb5S49ZNORP1/FUJpGiUujufqGX6E2fn1EK5iOl4bITVJdxrIfSVXxR9uhRS/xt6GNWW37ZtqCj17NXLjTcFMDPRxARk+VAeWoPw+rkNB4aqDrwJ+QdfcfybewFLQmDPUNr1prHfCEngjtUti0N63syETnCCGQmRqcB9AsOe5IOr4nDdVHCCRpBotf1d1LMvVS18SIEMDdFc34zUDl/FlxfrJ1DsadThc/Oafmg7s4HNpQWzI9KBBCsgVs0dcVTuOTeM4Xld/2h2CKjcL5DunjDf9k/3sD7p17xXY/wlX715ooT9Wq0AEPoqvkdWSd8DfBX+26Wom3P47MqgpAGIB1YS6EttO8gRS67xTVUXzItmfHPSlOqeMAaftfGllXdBCl2XkXX9dhU3bpzKKMZqMR8i+u1qJTdEd1sZE+rO/g8KpUwHgIo5atTdMH0J/Aq2LQ==";
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
        var userInputId = getInputTextValue('userId');
        if(mobileNo != ''){
            var userInfo  = getUserInfoByMobileNumber(phoneNum);
            if(userInfo != null){
                var userId = userInfo.result.userId;
                window.opener.document.getElementById("userIdText").innerHTML = "가입하신 아이디는 <span style='font-weight: bold'>" + userId + " </span>입니다";
            }else{
                window.opener.document.getElementById("userIdText").innerHTML = "가입하신 휴대폰번호가 아닙니다.";
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
    <input type="hidden" name="EncodeData" value="<%=EncodeData%>">
    <input type="hidden" name="m" value="checkplusSerivce">
    <div id="wrap">
        <div class="loginWrap">
            <h1><a href="#"><img src="/common/zian/images/common/logo_b.png" alt="zion edu"></a></h1>
            <div class="serchForm">
                <div class="serch">
                    <ul>
                        <li class="active"><a href="javascript:goPageNoSubmit('user','findUserId');">아이디 찾기</a></li>
                        <li><a href="javascript:goPageNoSubmit('user','findUserPwd');">비밀번호 찾기</a></li>
                    </ul>
                </div>
                <div class="serchBox">
                    <div class="serchBoard">
                        <p id="userIdText">가입 당시 입력한 휴대폰 번호를 통해<br>아이디를 찾을 수 있습니다.</p>
                        <a href="javascript:fnNicePopup();" id="phoneBtn">휴대폰인증</a>
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
</script>
