<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#modifyBtn").hide();
            }
        }else{
            $("#modifyBtn").hide();
        }
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','winList');">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 진행중이벤트-->
                <div class="boardWrap eventBoard">
                    <div class="imgbox">
                        <p class="title">리뷰쓰고 포인트 받자!
                            <span>2019.06.10 ~ 2019.08.30</span>
                        </p>
                        <img src="../images/content/img01.jpg">
                    </div>

                    <div class="btnArea divGroup bdtop20">
                        <div class="left">
                            <a href="javascript:goPage('event','modifyWin');" class="btn_inline w110" id="modifyBtn">수정</a>
                        </div>
                        <div class="right">
                            <a href="javascript:goPageNoSubmit('event','winList');" class="btn_inline bdblue w110">목록</a>
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