<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenuQuestion"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenuConsult"){
                // $("#tabHeader li:eq(0)").removeClass('active');
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }else if(tabMenuInfo == "tabMenuMyBoard"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(2)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenuQuestion");
                goPageNoSubmit('myPage', 'questionList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenuConsult");
                goPageNoSubmit('myPage', 'consult');
            }else if($(this).index() == 2){
                sessionStorage.setItem("tabHeader", "tabMenuMyBoard");
                goPageNoSubmit('myPage', 'boardList');
            }
        });
        fn_search('new');
        fn_search2('new');
        fn_search3('new');
        fn_search4('new');
        fn_search5('new');
    });

    //합격자 영상 불러오기
    function fn_search(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        getPasserVideoList(sPage, 10, searchType, searchText);
    }
    /*
    PASS:합격수기, LECTURE:수강후기, BOOK:도서후기, EXAM:응시후기
     */
    function fn_search2(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage1 = getInputTextValue("sPage2");
        var searchType1 = getSelectboxValue("searchType1");
        var searchText1 = getInputTextValue("searchText1");
        if(searchType1 == undefined) searchType1 = "";
        if(searchText1 == undefined) searchText1 = "";

        if(val == "new") sPage1 = "1";
        getMyWriteBoard(sessionUserInfo.userKey, 'PASS', sPage1, 5, searchType1, searchText1);
    }

    //수강후기
    function fn_search3(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage3");
        var searchType = getSelectboxValue("searchType3");
        var searchText = getInputTextValue("searchText3");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        getMyWriteLectureBoard(sessionUserInfo.userKey, 'LECTURE', sPage, 5, searchType, searchText);
    }

    //도서후기
    function fn_search4(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage4");
        var searchType = getSelectboxValue("searchType4");
        var searchText = getInputTextValue("searchText4");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        getMyWriteBookBoard(sessionUserInfo.userKey, 'BOOK', sPage, 5, searchType, searchText);
    }

    //응시후기
    function fn_search5(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage5");
        var searchType = getSelectboxValue("searchType5");
        var searchText = getInputTextValue("searchText5");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        getMyWriteExamBoard(sessionUserInfo.userKey, 'EXAM', sPage, 5, searchType, searchText);
    }

    function detailReview(bbsKey, val) {
        innerValue('bbsKey', bbsKey);
        if(val == 'detailLecture'){
            goPage('review','detailVideo');
        }else if(val == 'detailPass'){
            goPage('review','detailPass');
        }else if(val == 'detailLec'){
            goPage('review','detailLecture');
        }else if(val == 'detailBook'){
            goPage('review','detailBook');
        }
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey" name="bbsKey">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
    <input type="hidden" id="sPage3">
    <input type="hidden" id="sPage4">
    <input type="hidden" id="sPage5">
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
                    <div class="tabBox review wid30p">
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'questionList')">1:1 문의내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'consult')">상담예약내역<span></span></a></li>
                            <li class="active"><a href="javascript:void(0);">내게시글<span></span></a></li>
                        </ul>
                    </div>
                    <div class="reviewBoard view">
                        <div class="tab_topContent tabContent">
                            <ul class="tabBar tbw25p">
                                <li class="active"><a href="#">합격자영상</a></li>
                                <li><a href="#">합격수기</a></li>
                                <li ><a href="#">수강후기</a></li>
                                <li><a href="#">도서후기</a></li>
                                <li><a href="#">응시후기</a></li>
                            </ul>
                            <!--합격자 영상 -->
                            <div class="tabPage active">
                                <form>
                                    <ul class="searchArea">
                                        <!--추가 -->
                                        <li class="left">
                                            <select id="searchType">
                                                <option value="title">제목</option>
                                                <option value="content">내용</option>
                                            </select>
                                            <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" >
                                            <a href="javascript:fn_search('new');" class="btn_m on w140">검색</a>
                                        </li>
                                        <li class="right"></li>
                                    </ul>
                                </form>
                                <!--review_movie_search : 합격자영상 검색-->
                                <div class="review_movie_search">
                                    <div class="list">
                                        <ul id="dataList">
                                        </ul>
                                    </div>
                                    <!-- paging -->
                                    <%@ include file="/common/inc/com_pageNavi.inc" %>
                                    <!-- //paging -->
                                </div>
                                <!--//review_movie_search : 합격자영상 검색-->
                            </div>
                            <!-- //합격자 영상 -->

                            <div class="tabPage ">
                                <form>
                                    <ul class="searchArea">
                                        <li class="left">
                                            <select id="searchType1">
                                                <option value="title">제목</option>
                                                <option value="content">내용</option>
                                            </select>
                                            <input type="text" id="searchText1" onkeypress="if(event.keyCode==13) {fn_search2('new'); return false;}" >
                                            <a href="javascript:fn_search2('new');" class="btn_m on w140">검색</a>
                                        </li>
                                        <li class="right"><a href="" class="btn_m w140">합격수기작성하기</a></li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class=" disnoneM">
                                        <colgroup>
                                            <col>
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">작성자</th>
                                            <th style="text-align: center;">등록일</th>
                                            <th style="text-align: center;">조회</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList1">
                                        </tbody>
                                    </table>
                                </div>
                                <!-- paging -->
                                <%@ include file="/common/inc/com_pageNavi2.inc" %>
                                <!-- //paging -->
                            </div>
                            <div class="tabPage">
                                <form>
                                    <ul class="searchArea">
                                        <li class="left">
                                            <select id="searchType3">
                                                <option value="title">제목</option>
                                                <option value="content">내용</option>
                                            </select>
                                            <input type="text" id="searchText3" onkeypress="if(event.keyCode==13) {fn_search3('new'); return false;}">
                                            <a href="javascript:fn_search3('new');" class="btn_m on w140">검색</a>
                                        </li>
                                        <li class="right"><a href="./sub02010503.html" class="btn_m w140">수강수기작성하기</a></li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class=" disnoneM">
                                        <colgroup>
                                            <col>
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">작성자</th>
                                            <th style="text-align: center;">등록일</th>
                                            <th style="text-align: center;">조회</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList3">
                                        </tbody>
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
                                                <option value="title">제목</option>
                                                <option value="content">내용</option>
                                            </select>
                                            <input type="text" id="searchText4" onkeypress="if(event.keyCode==13) {fn_search4('new'); return false;}" >
                                            <a href="javascript:fn_search4('new');" class="btn_m on w140">검색</a>
                                        </li>
                                        <li class="right"><a href="" class="btn_m w140">도서수기작성하기</a></li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class=" disnoneM">
                                        <colgroup>
                                            <col>
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">작성자</th>
                                            <th style="text-align: center;">등록일</th>
                                            <th style="text-align: center;">조회</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList4">
                                        </tbody>
                                    </table>
                                </div>
                                <!-- paging -->
                                <%@ include file="/common/inc/com_pageNavi4.inc" %>
                                <!-- //paging -->
                            </div>
                            <div class="tabPage">
                                <form>
                                    <ul class="searchArea">
                                        <li class="left">
                                            <select id="searchType5">
                                                <option value="title">제목</option>
                                                <option value="content">내용</option>
                                            </select>
                                            <input type="text" id="searchText5" onkeypress="if(event.keyCode==13) {fn_search5('new'); return false;}" >
                                            <a href="javascript:fn_search5('new');" class="btn_m on w140">검색</a>
                                        </li>
                                        <li class="right"><a href="" class="btn_m w140">응시후기작성하기</a></li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class=" disnoneM">
                                        <colgroup>
                                            <col>
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">작성자</th>
                                            <th style="text-align: center;">등록일</th>
                                            <th style="text-align: center;">조회</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList5">
                                        </tbody>
                                    </table>
                                </div>
                                <!-- paging -->
                                <%@ include file="/common/inc/com_pageNavi5.inc" %>
                                <!-- //paging -->
                            </div>
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