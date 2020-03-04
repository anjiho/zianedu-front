<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenu2"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'gradeList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'examUseList');
            }
        });
        fn_search('new');
    });

    function fn_search(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage");
        if(val == "new") sPage = "1";
        getUserExamLogList(sessionUserInfo.userKey, sPage, 10);
    }
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
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <div class="tabBox review coupon">
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage','gradeList');">성적관리<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage','examUseList');">최근사용내역<span></span></a></li>
                        </ul>
                    </div>
                    <!--최근사용내역-->
                    <div class=" grade reviewBoard">
                        <form>
                            <ul class="searchArea">
                                <li class="left">최근 3개월간 응시한 내역입니다.</li>
                                <li class="right"></li>
                            </ul>
                        </form>
                        <div class="tableBox">
                            <table class="mypage06_2">
                                <colgroup>
                                    <col>
                                    <col width="550">
                                    <col width="250px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="text-align: center;">구분</th>
                                    <th style="text-align: center;">모의고사명</th>
                                    <th style="text-align: center;">응시일</th>
                                </tr>
                                </thead>
                                <tbody id="dataList"></tbody>
                            </table>

                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                        <!-- //paging -->
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
