<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="com.zianedu.front.config.ConfigHolder" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String EncodeData = ConfigHolder.getUserModifySmsEncodeData();
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
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li:eq(0)").addClass('active');
            }else{
                $("#tabHeader li:eq(0)").removeClass('active');
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'memberMain');
            }else{
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'pwdMain');
            }
        });
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="m" value="checkplusSerivce">
    <input type="hidden" id="addressNumber"><!--구주소-->
    <input type="hidden" name="EncodeData" value="<%=EncodeData%>">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <input type="hidden" id="certCode" name="certCode" value="">
                <input type="hidden" id="idValidation" value="0">
                <input type="hidden" id="pwdValidation" value="0">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage userinfo">
                    <div class="tabBox review coupon">
                        <ul id="tabHeader">
                            <li><a href="javascript:void(0);">회원정보수정<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'pwdMain');">비밀번호변경<span></span></a></li>
                        </ul>
                    </div>

                    <!--회원정보수정 -->
                    <div class="reviewBoard">
                        <div class="tbd_03 tbd_05">
                            <table>
                                <colgroup>
                                    <col width="200px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td id="memberName"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td id="userId"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>*********</td>
                                </tr>
                                </tbody>
                            </table>
                            <table>
                                <colgroup>
                                    <col width="200px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" id="email1" disabled>@<input type="text" id="email2" disabled><br>
                                        <span class="text_red">※이메일 변경은 학원에 문의해 주세요.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text"  id="telephoneMobile"  name="telephoneMobile" class=" w190" disabled>
                                        <a href="javascript:fnNicePopup();" class="btn_inline">휴대폰 인증받기</a>
                                    </td>

                                </tr>
                                <tr>
                                    <th>기기변경인증하기</th>
                                    <td><a href="#modal305" class="btn_modalOpen btn_m bdgray2">인증하기</a>
                                        <span class="text_red">※기기변경은 pc1회, 모바일 1회 가능합니다.</span></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                         <span class="input_txt">
                                            <input type="text" value="" placeholder="" title="주소 입력" id="postcode" name="postcode" disabled>
                                            <input type="button" value="우편번호 찾기" class="btn_inline"  onclick="execDaumPostcode()"><br>
                                            <input type="text" value="" id="addressRoad" name="addressRoad" title="주소 입력" class="w60p"><br>
                                            <input type="text" value="" id="address" name="address" title="상세주소 입력" class="w60p">
                                            <span id="guide" style="color:#999;display:none"></span>
                                         </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>준비직렬</th>
                                    <td>
                                        <select id="interestCtgKey0" name="interestCtgKey0" class="w180">
                                            <option value="">선택</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goBack();" class="btn_m radius bdgray w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:modifyMemberInfo();" class="btn_m radius bdblue w110 ">수정</a>
                        </div>
                    </div>
                </div>
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>

<!--팝업 modal305-->
<div id="modal305" class="modalWrap modalWrap2 ">
    <div class="inner">
        <div class="modalTitle">
            <h2>알림</h2>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                <span class="txtBox">요청하신 기기변경은 pc 또는 모바일 기기 각각<br>
					1회에 한해 제한적용 됨을 알려드립니다.<br><br>
					기기변경 후 지안패스 상품은 기기변경이 불가하오니<br>
					이점 유의하시어 수강하시길 바랍니다.
				</span>
                <select id="selPcMobile">
                    <option value="PC">PC 기기 변경</option>
                    <option value="MOBILE">모바일 기기 변경</option>
                </select>
                <span>
					<input type="checkbox" name="popupChk" id="popupChk" >위 내용을 읽었음을 동의합니다.
				</span>
            </div>
            <div class="modal_btn_box">
                <a href="" class="bdgray">확인</a>
                <a href="javascript:goRequestMail();" class="bdblue">인증메일발송</a>
            </div>
        </div>
    </div>
</div>
<!--//팝업-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            var result = getUserInfo(sessionUserInfo.userKey);
            innerHTML("memberName", result.name);
            innerHTML("userId", result.userId);
            var email = gfn_split(result.email, '@');
            innerValue("email1", email[0]);
            innerValue("email2",  email[1]);
            innerValue("telephoneMobile", result.telephoneMobile);
            getUserRegSerialList("interestCtgKey0"); //준비직렬
            innerValue("postcode", result.zipcode);

            innerValue("addressRoad", result.addressRoad);
            innerValue("address", result.address);
            getUserRegSerialList("interestCtgKey0");
            innerValue("interestCtgKey0", result.interestCtgKey0);
        }else{
            alert("로그인을 해주세요.");
            goLoginPage();
        }
    });

    function modifyMemberInfo() {
        if(confirm("수정 하시겠습니까?")){
            var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
            var telephoneMobile =  getInputTextValue("telephoneMobile");
            var postcode = getInputTextValue("postcode");
            var address = getInputTextValue("address");//상세주소
            var addressNumber = getInputTextValue("addressNumber");//구주소
            var roadAddress =  getInputTextValue("addressRoad");
            var ctgKey =  getSelectboxValue("interestCtgKey0");
            var memberResult  = memberModify(sessionUserInfo.userKey, telephoneMobile, postcode, roadAddress, addressNumber, address, ctgKey);
            if(memberResult.resultCode == 200){
                alert("수정이 완료 되었습니다.");
                isReloadPage();
            }
        }
    }

    function goRequestMail() {
        var chk =  isCheckedCheckbox("popupChk", "ID");
        if(chk == false) {
            alert("기기변경 내용 동의를 체크해 주세요.");
            return false;
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var pcMobile = getSelectboxValue("selPcMobile");
        var result = requestChangeDevice(sessionUserInfo.userKey, pcMobile);
        if(result.resultCode == 200){
            alert("기기변경을 신청하였습니다.등록된 이메일에서 인증번호 확인 부탁드립니다.");
            goPage("myPage","changeDevice");
        }else if(result.resultCode == 911){
            alert("기기가 등록되어 있지 않습니다.");
            return false;
        }else if(result.resultCode == 907){//pc
            alert("기기변경은 총 모바일 1번, PC 1번씩  변경 가능합니다.");
            return false;
        }else if(result.resultCode == 908){//mobile
            alert("기기변경은 총 모바일 1번, PC 1번씩  변경 가능합니다.");
            return false;
        }else if(result.resultCode == 913){
            alert("기기변경 횟수가 초가되었습니다. 관리자에게 문의하세요.");
            return false;
        }
    }
</script>