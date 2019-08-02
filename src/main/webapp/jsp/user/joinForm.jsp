<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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
        window.opener.document.getElementById("name").value = name;
        window.opener.document.getElementById("name").disabled = true;
    </script>
<% } %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="m" value="checkplusSerivce">				<!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="EncodeData" value="AgAFRzQ1MjgEcYPg+9kV2Z0A1ygHMMSItIyAkxsv0dPppz2BN/JiH75S49ZNORP1/FUJpGiUujufqGX6E2fn1EK5iOl4bITVpCHdvpRA1h+Qg/CWNQN1+/SIXnGNoKZqKhohWZmP/q4h6HpAE91icmtyopcYPQu8XP82I79LHNq4jwmbZh+/jhE1DYCCjh3cjsfRxkQH3oqtAFWkVsfQx6OXGWrfX10tdkpgpxLEAbT+DtwNQqFqEtUNbeMpE0JKCoXuVMM3ZjS8etJyx45Kt5YC278vmfLJnfzRzeGTuKjGhQMW3eswjhoQdui4qQBDDx0wLsTE9UKRdBIFXJ6QC1S+2fELfa6HmorHNaKrz5EZI2usEzpG5ThFVNBHcstdzYDZI6S5RCKwVLD2Ljbjz+cciLlxunIupju4D/6oAYmAMjINA/Ni1TfRGQkneivColiJEH6nx8c5wXn3joKfOJQApHWQw/tgIbKjus2gAFEIfusOyLHG5g==">
    <div id="wrap">
    <!--좌측사이트메뉴-->
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
    <!--//최상단배너-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--상단-->
    <!--//상단-->

    <!--본문-->
    <script>
        window.name ="Parent_window";
        //window.opener.location.reload();
        window.close();


        function init() {
            activeJoinHeaderBtn("statusBar_02");
            getUserRegSerialList("interestCtgKey0"); //준비직렬
        }

        $(document).ready(function () {
            //비밀번호 정규식 체크
            $("#password").keyup(function () {
                var password = getInputTextValue("password");
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
                        alert("비밀번호를 입력해 주세요.");
                        innerValue("rePassword", "");
                        focusInputText("password");
                        return false;
                    }
                }
            });
        });

        function goJoin() {
            /**
             * TODO 1. 비빌번호 공백체크,
             *      2. 이메일 정규식이 정상 작동 여부 확인,
             *      3. 회원가입 서버통신 시 아이디 중복 에러(902) 일때 예외 처리
             */
            var check = new isCheck();
            if (check.input("name", comment.search_input_id_name) == false) return;
            if (check.input("email", comment.input_member_email) == false) return;
            if (check.input("emailAddress", comment.input_member_email) == false) return;
            if (check.input("zipcode", comment.input_zip_code) == false) return;
            if (check.input("roadAddress", comment.input_id_address) == false) return;
            if (check.input("address", comment.input_address) == false) return;
            if (check.selectbox("interestCtgKey0", comment.sel_ctgkey) == false) return;
            //if (check.input("telephoneMobile", comment.input_id_telphone) == false) return;
            var email    = getInputTextValue("email");
            var emailAdd = getInputTextValue("emailAddress");
            var allEmail = email+"@"+emailAdd;
            var fnEmail  =  fn_isemail(allEmail);//이메일 형식 체크
            if(fnEmail == true) return;
            var gender  = get_radio_value("gender");//성별
            var interestCtgKey0 = getSelectboxValue("interestCtgKey0");

            var data = getJsonObjectFromDiv("joinDiv");

            data.gender = gender;
            data.email = allEmail;
            data.addressNumber = "구주소testtest";
            data.interestCtgKey0 = interestCtgKey0;
            data.certCode = "sdfsdfsdfsdfsdfasfs";
            data.telephoneMobile = "010-5053-4564";

            var idValidation  = getInputTextValue("idValidation");//아이디 확인
            var pwdValidation = getInputTextValue("pwdValidation");//비밀번호 확인
            //회원가입 전송
            if(idValidation == 1 && pwdValidation ==1){
                var result  =  userReg(data);
                if(result.resultCode == 200){
                    goPage('user', 'joinResult');
                }else{
                    alert("에러");
                }
            }else if(idValidation == 0){
                alert("아이디를 확인해 주세요.");
                focusInputText("userId");
                return false;
            }else{
                alert("비밀번호를 확인해 주세요.");
                focusInputText("password");
                return false;
            }
        }
    </script>
    <div id="container">
        <div class="inner">
            <div class="joinWrap">
                <h2>회원가입</h2>
                <%@include file="/common/jsp/user/joinHeader.jsp" %>
                <div class="tableBox" id="joinDiv">
                    <table class="form">
                        <input type="hidden" id="certCode" name="certCode" value="">
                        <input type="hidden" id="idValidation" value="0">
                        <input type="hidden" id="pwdValidation" value="0">
                        <caption>회원가입 등록폼</caption>
                        <colgroup>
                            <col class="w150">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="col">이름</th>
                            <td>
                                <input type="text" name="name" id="name" class="w150">
                                <span class="radioGroup w60 cols2">
									<input type="radio" name="gender" id="sex_m" value="0" checked><label for="sex_m">남</label>
									<input type="radio" name="gender" id="sex_f" value="1"><label for="sex_f">여</label>
								</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">아이디</th>
                            <td>
                                <input type="text" id="userId" name="userId" class="w270">
                                (6~12자 영문+숫자 조합)
                                <div class="captionText" id="idCaption" style="display:none;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">비밀번호</th>
                            <td>
                                <input type="password" id="password" name="pwd" class="w270">
                                (특수문자+영문+숫자 8자 이상으로 조합)
                                <div class="captionText" id="pwdCaption" style="display:none;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">비밀번호 확인</th>
                            <td>
                                <input type="password" id="rePassword" class="w270">
                                <div class="captionText" id="rePwdCaption" style="display:none;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">이메일</th>
                            <td>
                                <input type="text" id="email" name="email" class="w180"> @
                                <input type="text" id="emailAddress" class="w180">
                                <select id="selEmailAddress" onchange="selEmail(this.value)" class="w180">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                                <div class="captionText">※등록된 기기변경시 인증번호가 전송됩니다. 신중히 등록해주세요.</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">휴대전화</th>
                            <td>
                                <input type="text" id="telephoneMobile"  name="telephoneMobile" class="w270" disabled>
<%--                                <input type="text" name="" value="" class="w270" disabled>--%>
                                <a href="javascript:fnNicePopup();" class="btn_inline">휴대폰 인증받기</a>
                            </td>
                        </tr>
<%--                        <tr>--%>
<%--                            <th scope="col">인증번호</th>--%>
<%--                            <td>--%>
<%--								<span class="timerWrap">--%>
<%--									<input type="text" name="" value="123456" class="w270">--%>
<%--									<span class="timer">02:59</span>--%>
<%--								</span>--%>
<%--                                <a href="#" class="btn_inline">인증번호 확인</a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        <tr>
                            <th scope="col">주소</th>
                            <td class="multiLine">
                                <input type="text" class="w150" id="postcode" name="zipcode">
                                <a href="#" onclick="execDaumPostcode()" class="btn_inline">우편번호 찾기</a><br />
                                <input type="text" id="roadAddress" name="addressRoad" class="w400">
                                <input type="text" id="address" name="address" class="w200" placeholder="상세주소">
                                <span id="guide" style="color:#999;display:none"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">준비직렬</th>
                            <td>
                                <select id="interestCtgKey0" name="interestCtgKey0" class="w180">
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
    <%@include file="/common/jsp/footerBanner.jsp" %>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
