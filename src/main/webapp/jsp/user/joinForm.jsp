<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="sun.security.krb5.Config" %>
<%@ page import="com.zianedu.front.config.ConfigHolder" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String EncodeData = ConfigHolder.getUserRegSmsEncodeData();
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
    <script language="javascript">
        var name = '<%=sName%>';
        var certCode = '<%=sDupInfo%>';
        var mobileNo = '<%=sMobileNo%>';
        window.opener.document.getElementById("name").value = name;
        window.opener.document.getElementById("name").disabled = true;
        window.opener.document.getElementById("certCode").value = certCode;
        window.opener.document.getElementById("telephoneMobile").value = mobileNo;

        var browse = navigator.userAgent.toLowerCase();
        if( (navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || (browse.indexOf("msie") != -1)) {
            window.open("about:blank","_self").close();
        } else {
            self.close();
        }
    </script>
<% } %>
<%@include file="/common/jsp/common.jsp" %>
<!-- 다음 주소 api -->
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="m" value="checkplusSerivce">
    <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <!-- 로컬 개발 핸드폰인증 키값 -->
<%--    <input type="hidden" name="EncodeData" value="AgAFRzQ1MjgEcYPg+9kV2Z0A1ygHMMSItIyAkxsv0dPppz2BN/JiH75S49ZNORP1/FUJpGiUujufqGX6E2fn1EK5iOl4bITVpCHdvpRA1h+Qg/CWNQN1+/SIXnGNoKZqKhohWZmP/q4h6HpAE91icmtyopcYPQu8XP82I79LHNq4jwmbZh+/jhE1DYCCjh3cjsfRxkQH3oqtAFWkVsfQx6OXGWrfX10tdkpgpxLEAbT+DtwNQqFqEtUNbeMpE0JKCoXuVMM3ZjS8etJyx45Kt5YC278vmfLJnfzRzeGTuKjGhQMW3eswjhoQdui4qQBDDx0wLsTE9UKRdBIFXJ6QC1S+2fELfa6HmorHNaKrz5EZI2usEzpG5ThFVNBHcstdzYDZI6S5RCKwVLD2Ljbjz+cciLlxunIupju4D/6oAYmAMjINA/Ni1TfRGQkneivColiJEH6nx8c5wXn3joKfOJQApHWQw/tgIbKjus2gAFEIfusOyLHG5g==">--%>
    <!-- 라이브 서버 핸드폰인증 키값 -->
    <input type="hidden" name="EncodeData" value="<%=EncodeData%>">
    <div id="wrap">
    <!--좌측사이트메뉴-->
<%--    <%@include file="/common/jsp/leftMenu.jsp" %>--%>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
    <!--//상단-->

    <!--본문-->
    <div id="container">
        <div class="inner">
            <div class="joinWrap">
                <h2>회원가입</h2>
<%--                <%@include file="/common/jsp/user/joinHeader.jsp" %>--%>
                <ul class="statusBar">
                    <li><label>01.<b>약관동의</b></label></li>
                    <li class="active"><label>02.<b>회원정보</b></label></li>
                    <li class="last"><label>03.<b>가입완료</b></label></li>
                </ul>
                <div class="tableBox" id="joinDiv">
                    <table class="form">
                        <input type="hidden" id="certCode" name="certCode" value="">
                        <input type="hidden" id="idValidation" value="0">
                        <input type="hidden" id="pwdValidation" value="0">
                        <input type="hidden" id="addressNumber"><!--구주소-->
<%--                        <caption>회원가입 등록폼</caption>--%>
                        <colgroup>
                            <col width="15%">
                            <col width="85%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" name="name" id="name">
                                <div class="radioGroup">
                                    <input type="radio" name="gender" id="sex_m" value="0"  checked><label>남</label>
                                    <input type="radio" name="gender" id="sex_f" value="1"><label>여</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" id="userId" name="userId">
                                <span class="captionText">(6~12자 영문+숫자 조합)</span>
<%--                                <div class="requiredText" id="idCaption" style="display:none;"></div>--%>
                                <span class="requiredText" id="idCaption" style="display:none;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="password" id="password" name="pwd">
                                <span class="captionText">(특수문자+영문+숫자 8자 이상으로 조합)</span><br>
                                <span class="requiredText" id="pwdCaption" style="display:none;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input type="password" id="rePassword">
                                <span class="requiredText" id="rePwdCaption" style="display:none;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="text" id="email" name="email"> @
                                <input type="text" id="emailAddress">
                                <select id="selEmailAddress" onchange="selEmail(this.value)" class="w150">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                </select><br>
                                <span class="requiredText">※등록된 기기변경시 인증번호가 전송됩니다. 신중히 등록해주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>휴대전화</th>
                            <td>
                                <input type="text" id="telephoneMobile"  name="telephoneMobile" placeholder="" disabled>
                                <a href="javascript:fnNicePopup();" class="btn_m">휴대폰 인증받기</a>
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                <input type="text" value="" placeholder="" title="주소 입력" id="postcode" name="postcode" disabled>
                                <input type="button" value="우편번호 찾기" class="btn_m"  onclick="execDaumPostcode()"><br>
                                <input type="text" value="" id="addressRoad" name="addressRoad" title="주소 입력" class="w60p"><br>
                                <input type="text" value="" id="address" name="address" title="상세주소 입력" class="w60p">
                                <span id="guide" style="color:#999;display:none"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>준비직렬</th>
                            <td>
                                <select id="interestCtgKey0" name="interestCtgKey0">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <a href="javascript:void(0);" onclick="goJoin();" class="btn_l w130 on">가입하기</a>
                    <a href="javascript:goMain();" class="btn_l w130">취소</a>
                </div>
            </div>
        </div>
    </div>
    <!--//본문-->

    <!--하단-->
    <%@include file="/common/jsp/footer.jsp" %>
    <!--//하단-->
    <!--우측따라다니는영역-->
    <%@include file="/common/jsp/rightMenu.jsp" %>
    <!--//우측따라다니는영역-->
    <!--하단고정식배너-->
<%--    <%@include file="/common/jsp/footerBanner.jsp" %>--%>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    $(function(){
        $(".joinAgree label b").click(function(){
            $(this).parent().parent().toggleClass("active");
        });
    });
    window.name ="Parent_window";
    //window.close();

    $(document).ready(function () {
        getUserRegSerialList("interestCtgKey0"); //준비직렬
        //비밀번호 정규식 체크
        $("#password").keyup(function () {
            var password = getInputTextValue("password");
            innerHTML("rePwdCaption","");
            innerValue("pwdValidation", 0); // 0 : 실패 , 1 : 성공
            validationPassword(password);
        });
        //아이디 정규식 체크 /  중복체크
        $("#userId").keyup(function (e) {
            var objTarget = e.srcElement || e.target;
            if(objTarget.type == 'text') { //한글 입력 방지
                var value = objTarget.value;
                if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/.test(value)) {
                    objTarget.value = objTarget.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');
                }
            }
            var userId = getInputTextValue("userId");
            innerValue("idValidation", 0); // 0 : 실패 , 1 : 성공
            validationUserId(userId);
        });
        //비밀번호 확인 체크
        $("#rePassword").keyup(function () {
            var password   = getInputTextValue("password");
            var rePassword = getInputTextValue("rePassword");
            if(rePassword != ""){
                if(password != ""){
                    gfn_display("rePwdCaption", true);
                    if(password == rePassword){
                        innerHTML("rePwdCaption","비밀번호 일치");
                    }else{
                        innerHTML("rePwdCaption","비밀번호가 일치하지 않습니다. 다시 확번 확인해주세요.");
                    }
                }else{
                    alert(comment.insert_password);
                    innerValue("rePassword", "");
                    focusInputText("password");
                    return false;
                }
            }
        });
    });

    function goJoin() {
        var check = new isCheck();
        if (check.input("name", comment.search_input_id_name) == false) return;
        if (check.input("userId", comment.insert_id) == false) return;
        if (check.input("password", comment.insert_password) == false) return;
        if (check.input("email", comment.input_member_email) == false) return;
        if (check.input("emailAddress", comment.input_member_email) == false) return;
        if (check.input("zipcode", comment.input_zip_code) == false) return;
        if (check.input("addressRoad", comment.input_id_address) == false) return;
        if (check.input("address", comment.input_address) == false) return;
        if (check.selectbox("interestCtgKey0", comment.sel_ctgkey) == false) return;
        if (check.input("telephoneMobile", comment.access_telphone) == false) return;
        var email    = getInputTextValue("email");
        var emailAdd = getInputTextValue("emailAddress");
        var allEmail = email+"@"+emailAdd;
        var fnEmail  =  fn_isemail(allEmail);//이메일 형식 체크
        if(fnEmail == true) return;
        var gender  = get_radio_value("gender");//성별
        var interestCtgKey0 = getSelectboxValue("interestCtgKey0");
        var phoneNum = getInputTextValue("telephoneMobile");
        var phoneNumHypen = getPhoneNumHypen(phoneNum);
        var name = getInputTextValue("name");
        var data = getJsonObjectFromDiv("joinDiv");
        var postcode =  getInputTextValue('postcode');

        data.gender = gender;
        data.email = allEmail;
        data.addressNumber = "";
        data.interestCtgKey0 = interestCtgKey0;
        data.certCode = getInputTextValue("certCode");
        data.telephoneMobile = phoneNumHypen;
        data.name = name;
        data.zipcode = postcode;

        var idValidation  = getInputTextValue("idValidation");//아이디 확인
        var pwdValidation = getInputTextValue("pwdValidation");//비밀번호 확인
        //회원가입 전송
        if(idValidation == 1 && pwdValidation == 1){
            var result  =  userReg(data);
            if(result.resultCode == 200){
                goPage('user', 'joinResult');
            }else if(result.resultCode == 902){
                alert(comment.overlap_user_id);
                return false;
            }
        }else if(idValidation == 0){
            alert(comment.check_user_id);
            focusInputText("userId");
            return false;
        }else{
            alert(comment.check_user_pwd);
            focusInputText("password");
            return false;
        }
    }
    //남,여 선택 라디오버튼 이벤트 스트립트
    $(function(){
        $(".radioGroup > label").click(function(){
            $(this).parent().find("input[type='radio']").prop("checked", false);
            $(this).prev().prop("checked", true);
        });
    });
</script>
