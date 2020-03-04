<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
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
                goPageNoSubmit('myPage', 'coupon');
            }else{
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'mileage');
            }
        });
    });

function chkUserPwd() {
    var userPwd = getInputTextValue("userPwd");
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(userPwd == ""){
        alert("비밀번호를 입력해 주세요.");
        return false;
    }
    var result = confirmUserPassword(sessionUserInfo.userKey, userPwd);
    if(result.keyValue == true){
        goPage("myPage", "modifyPwd");
    }else{
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
}
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
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
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'memberMain');">회원정보수정<span></span></a></li>
                            <li><a href="javascript:void(0);">비밀번호변경<span></span></a></li>
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
                                    <th>현재비밀번호</th>
                                    <td><input type="password" id="userPwd" onkeypress="if(event.keyCode==13) {chkUserPwd(); return false;}" class="w400"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:chkUserPwd()" class="btn_m radius bdblue w110 ">확인</a>
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
