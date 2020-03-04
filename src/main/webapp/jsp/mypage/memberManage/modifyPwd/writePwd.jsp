<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
//비밀번호 정규식 체크
        $("#changeUserPwd").keyup(function () {
            var password = getInputTextValue("changeUserPwd");
            innerHTML("pwdCaption","");
            validationChkPassword(password);
        });

        //비밀번호 확인 체크
        $("#chkChangeUserPwd").keyup(function () {
            var password   = getInputTextValue("changeUserPwd");
            var rePassword = getInputTextValue("chkChangeUserPwd");
            var pwdValidation =  getInputTextValue("pwdValidation");
            if(pwdValidation == 1) {
                if (rePassword != "") {
                    if (password != "") {
                        if (password == rePassword) {
                            innerHTML("rePwdCaption", "일치");
                        } else {
                            innerHTML("rePwdCaption", "비밀번호가 일치하지 않습니다. 다시 확번 확인해주세요.");
                        }
                    } else {
                        alert(comment.insert_password);
                        innerValue("chkChangeUserPwd", "");
                        focusInputText("changeUserPwd");
                        return false;
                    }
                }
            }else{
                innerHTML("rePwdCaption", "변경할 비밀번호를 입력해주세요.");
                return  false;
            }
        });


    });

    function goChangePwd() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var currentUserPwd = getInputTextValue("currentUserPwd");
        var changeUserPwd = getInputTextValue("changeUserPwd");
        var chkChangeUserPwd = getInputTextValue("chkChangeUserPwd");
        if(currentUserPwd == "" || changeUserPwd == "" ||  chkChangeUserPwd == ""){
            alert("비밀번호를 입력해 주세요.");
            return false;
        }
        var pwdValidation =  getInputTextValue("pwdValidation");
        if(pwdValidation == 1) {
            var data = {
                userKey: sessionUserInfo.userKey,
                currentUserPwd: currentUserPwd,
                changeUserPwd: changeUserPwd
            };
            var result = modifyPwd(data);
            if (result.resultCode == 200) {
                alert("비밀번호가 변경되었습니다.");
                goPageNoSubmit('myPage', 'memberMain');
            } else if (result.resultCode == 904) {
                alert("현재 비밀번호가 일치하지 않습니다.");
                return false;
            }
        }else{
            alert("변경할 비밀번호를 확인해 주세요.");
            innerHTML("pwdCaption","비밀번호는 특수문자+영문+숫자 8자 이상으로 조합이여야 합니다.");
            innerHTML("rePwdCaption", "");
            return false;
        }
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="pwdValidation">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->

        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->

                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage userinfo">
                    <div class="tabBox review coupon">
                        <ul>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'pwdMain');">회원정보수정<span></span></a></li>
                            <li class="active"><a href="javascript:void(0);">비밀번호변경<span></span></a></li>
                        </ul>
                    </div>

                    <!--비밀번호변경-->
                    <div class="reviewBoard">
                        <div class="tbd_03 tbd_05">
                            <table>
                                <colgroup>
                                    <col width="200px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>기존비밀번호</th>
                                    <td><input type="password" id="currentUserPwd" class="w300"></td>
                                </tr>
                                <tr>
                                    <th>변경비밀번호</th>
                                    <td>
                                        <input type="password" id="changeUserPwd" class="w300">&nbsp;
                                        <span id="pwdCaption" style="color: red"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>변경비밀번호확인</th>
                                    <td>
                                        <input type="password" id="chkChangeUserPwd" value="" class="w300">&nbsp;
                                        <span id="rePwdCaption" onkeypress="if(event.keyCode==13) {goChangePwd(); return false;}"  style="color: red"></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goChangePwd();" class="btn_m radius bdblue w110 ">확인</a>
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
