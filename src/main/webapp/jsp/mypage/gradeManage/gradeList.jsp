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

        getMockExamClassCtgSelectBoxList(2, 'onSel');
        getMockExamClassCtgSelectBoxList(3, 'offSel');
        getWeekMockExamClassCtgSelectBoxList2();
        getGichulSelectBoxList('SERIAL', 'classCtgKey');//직렬
        getGichulSelectBoxList('RATING', 'groupCtgKey');//급수
        getGichulSelectBoxList('SUBJECT', 'subjectCtgKey');//과목

        fn_search('new');
        fn_search2('new');
        fn_search3('new');
        fn_search4('new');
    });

    function fn_search(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage");
        var ctgKey = getSelectboxValue("onSel");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        getUserMockExamResultListAtBuy(sessionUserInfo.userKey, 2, sPage, 10, ctgKey, searchType, searchText);
    }

    function fn_search2(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage2");
        var ctgKey = getSelectboxValue("onSel");
        var searchType = getSelectboxValue("searchType2");
        var searchText = getInputTextValue("searchText2");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        getUserMockExamResultListAtBuy2(sessionUserInfo.userKey, 3, sPage, 10, ctgKey, searchType, searchText);
    }

    function fn_search3(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage3");
        var classCtgKey = getSelectboxValue("weekSel");
        var searchType = getSelectboxValue("searchType3");
        var searchText = getInputTextValue("searchText3");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        getUserFreeExamResultList(sessionUserInfo.userKey, 'WEEK', sPage, 10, '', classCtgKey, '', searchType, searchText);
    }

    function fn_search4(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage4");
        var classCtgKey = getSelectboxValue("classCtgKey");//직렬
        var groupCtgKey = getSelectboxValue("groupCtgKey");//급수
        var subjectCtgKey = getSelectboxValue("subjectCtgKey");//과목
        var searchType = getSelectboxValue("searchType4");
        var searchText = getInputTextValue("searchText4");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        getUserFreeExamResultList2(sessionUserInfo.userKey, 'GICHUL', sPage, 10, groupCtgKey, classCtgKey, subjectCtgKey, searchType, searchText);
    }

    function goBigExamPopup(examUserKey){
        var popUrl = '/myPage?page_gbn=gradeAllList&examUserKey='+examUserKey;
        var tarGet = "_blank";
        var popOption = "width=1200, height=775, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,tarGet,popOption);
    }

    function goAnswersPopup(examUserKey){
        var popUrl = '/myPage?page_gbn=answerNote&examUserKey='+examUserKey;
        var tarGet = "_blank";
        var popOption = "width=1200, height=775, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,tarGet,popOption);
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
    <input type="hidden" id="sPage3">
    <input type="hidden" id="sPage4">
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

                        <!--성적관리 -->
                        <div class=" grade reviewBoard">
                            <div class="tab_topContent tabContent">
                                <ul class="tabBar">
                                    <li class="active"><a href="#">학원모의고사(온)</a></li>
                                    <li><a href="#">학원모의고사(오프)</a></li>
                                    <li><a href="#">주간모의고사</a></li>
                                    <li><a href="#">기출문제</a></li>
                                </ul>
                                <!-- 수강중 -->
                                <div class="tabPage  active">
                                    <form>
                                        <!--수정 및 추가 -->
                                        <ul class="searchArea floatnone">
                                            <li class="left">
                                                <select id="searchType">
                                                    <option value="name">시험명</option>
                                                </select>
                                                <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                                <input type="button" onclick="fn_search('new');" value="검색" class="btn_m on">
                                                <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                                            </li>
                                            <li class="right ">
                                                <select id="onSel" onchange="fn_search('new');" class="w120"></select>
                                            </li>
                                        </ul>
                                    </form>
                                    <div class="tableBox">
                                        <table class="mypage06">
                                            <colgroup>
                                                <col>
                                                <col width="380px">
                                                <col width="180px">
                                                <col>
                                                <col>
                                                <col width="100px">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th style="text-align: center;">직렬</th>
                                                <th style="text-align: center;">모의고사명</th>
                                                <th style="text-align: center;">응시기간</th>
                                                <th style="text-align: center;">성적보기</th>
                                                <th style="text-align: center;">오답노트</th>
                                                <th style="text-align: center;">시험지</th>
                                            </tr>
                                            </thead>
                                            <tbody id="dataList"></tbody>
                                        </table>
                                    </div>
                                    <!-- paging -->
                                    <%@ include file="/common/inc/com_pageNavi.inc" %>
                                    <!-- //paging -->
                                </div>
                                <div class="tabPage">
                                    <form>
                                        <ul class="searchArea">
                                            <li class="left">
                                                <select id="searchType2">
                                                    <option value="name">시험명</option>
                                                </select>
                                                <input type="text" id="searchText2" onkeypress="if(event.keyCode==13) {fn_search2('new'); return false;}">
                                                <input type="button" onclick="fn_search2('new');" value="검색" class="btn_m on">
                                                <a href="javascript:fn_search2('new');" class="search_ico">검색</a>
                                            </li>
                                            <li class="right ">
                                                <select id="offSel" onchange="fn_search2('new');" class="w190">
                                                    <option class="w190">직렬선택</option>
                                                </select>
                                            </li>
                                        </ul>
                                    </form>
                                    <div class="tableBox">
                                        <table class="mypage06">
                                            <colgroup>
                                                <col>
                                                <col width="380px">
                                                <col width="180px">
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th style="text-align: center;">직렬</th>
                                                <th style="text-align: center;">모의고사명</th>
                                                <th style="text-align: center;">응시기간</th>
                                                <th style="text-align: center;">성적보기</th>
                                                <th style="text-align: center;">오답노트</th>
                                                <th style="text-align: center;">시험지</th>
                                            </tr>
                                            </thead>
                                            <tbody id="dataList2"></tbody>
                                        </table>
                                    </div>
                                    <!-- paging -->
                                    <%@ include file="/common/inc/com_pageNavi2.inc" %>
                                    <!-- //paging -->
                                </div>
                                <!--주간모의고사-->
                                <div class="tabPage">
                                <form>
                                    <ul class="searchArea">
                                        <li class="left">
                                            <select id="searchType3">
                                                <option value="name">시험명</option>
                                            </select>
                                            <input type="text" id="searchText3" onkeypress="if(event.keyCode==13) {fn_search3('new'); return false;}">
                                            <input type="button" onclick="fn_search3('new');" value="검색" class="btn_m on">
                                            <a href="javascript:fn_search3('new');" class="search_ico">검색</a>
                                        </li>
                                        <li class="right ">
                                            <select id="weekSel" onchange="fn_search3('new');" class="w120"></select>
                                        </li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class="mypage06">
                                        <colgroup>
                                            <col>
                                            <col width="380px">
                                            <col width="180px">
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">직렬</th>
                                            <th style="text-align: center;">모의고사명</th>
                                            <th style="text-align: center;">응시기간</th>
                                            <th style="text-align: center;">성적보기</th>
                                            <th style="text-align: center;">오답노트</th>
                                            <th style="text-align: center;">시험지</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList3"></tbody>
                                    </table>
                                </div>
                                <!-- paging -->
                                <%@ include file="/common/inc/com_pageNavi3.inc" %>
                                <!-- //paging -->
                            </div>
                                <div class="tabPage">
                                    <form>
                                        <ul class="searchArea">
                                            <li class="left">
                                                <select id="searchType4">
                                                    <option value="name">시험명</option>
                                                </select>
                                                <input type="text" id="searchText4" onkeypress="if(event.keyCode==13) {fn_search4('new'); return false;}">
                                                <input type="button" onclick="fn_search4('new');" value="검색" class="btn_m on">
                                                <a href="javascript:fn_search4('new');" class="search_ico">검색</a>
                                            </li>
                                            <li class="right">
                                                <select id="classCtgKey" onchange="fn_search4('new');" class="w120"></select> <!--직렬-->
                                                <select id="groupCtgKey" onchange="fn_search4('new');" class="w120"></select><!--급수-->
                                                <select id="subjectCtgKey" onchange="fn_search4('new');" class="w120"></select><!--과목-->
                                            </li>
                                        </ul>
                                    </form>
                                    <div class="tableBox">
                                        <table class="mypage06">
                                            <colgroup>
                                                <col>
                                                <col width="380px">
                                                <col width="180px">
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th style="text-align: center;">직렬</th>
                                                <th style="text-align: center;">모의고사명</th>
                                                <th style="text-align: center;">응시기간</th>
                                                <th style="text-align: center;">성적보기</th>
                                                <th style="text-align: center;">오답노트</th>
                                                <th style="text-align: center;">시험지</th>
                                            </tr>
                                            </thead>
                                            <tbody id="dataList4"></tbody>
                                        </table>
                                    </div>
                                    <!-- paging -->
                                    <%@ include file="/common/inc/com_pageNavi4.inc" %>
                                    <!-- //paging -->
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

