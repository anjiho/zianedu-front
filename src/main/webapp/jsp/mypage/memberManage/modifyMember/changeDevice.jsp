<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<script>
    $(document).ready(function(){
        var AuthTimer = new $ComTimer();
        AuthTimer.comSecond = 300;
        AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
        AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
        AuthTimer.domId = document.getElementById("timer");
    });

    function $ComTimer(){
        //prototype extend
    }

    $ComTimer.prototype = {
        comSecond : ""
        , fnCallback : function(){}
        , timer : ""
        , domId : ""
        , fnTimer : function(){
            //debugger;
            var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
            this.comSecond--;					// 1초씩 감소
            this.domId.innerText = m;
            if (this.comSecond < 0) {			// 시간이 종료 되었으면..
                clearInterval(this.timer);		// 타이머 해제
                alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
                goPageNoSubmit('myPage', 'memberMain');
            }
        }
        ,fnStop : function(){
            clearInterval(this.timer);
        }
    };
    
    function goCheckDuplicate() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var code = getInputTextValue("code");
        if(code == ""){
            alert("인증번호를 입력해 주세요.");
            return false;
        }
        var result = confirmChangeDeviceCode(sessionUserInfo.userKey, code);
        if(result.resultCode == 200){
            alert("기기 변경이 완료되었습니다.");
            goPageNoSubmit('myPage', 'memberMain');
        }else if(result.resultCode == 909){
            alert("기기변경 코드가 일치하지 않습니다.");
        }else if(result.resultCode == 910){
            alert("인증시간이 초과 되었습니다.");
            goPageNoSubmit('myPage', 'memberMain');
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
                        <ul>
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
                                    <th>인증번호</th>
                                    <td style="    display: inline-flex;">
                                        <input type="text" id="code" class="w400">&nbsp;
                                        <span id="timer" style="color: red"></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goCheckDuplicate();" class="btn_m radius bdblue w110 ">확인</a>
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
