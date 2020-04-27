<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        fn_search('new');

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
    });

    //상세보기
    function goDetailQuestion(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage("myPage", "questionDetail");
    }

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        if(searchType == 'title') {
            if(searchText == ''){
                alert('검색값을 입력해 주세요.');
                focusInputText("searchText");
                return false;
            }
        }
        if(searchText == undefined) searchText = "";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;

        getOneByOneQuestionList(userKey, sPage, 10,  searchType, searchText);
    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" name="bbsKey" id="bbsKey">
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
                            <li class="active"><a href="javascript:goPageNoSubmit('myPage', 'questionList')">1:1 문의내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'consult')">상담예약내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'boardList')">내게시글<span></span></a></li>
                        </ul>
                    </div>

                    <!--1:1 문의내역 -->
                    <div class="reviewBoard">
                        <form>
                            <div class="boardSearch">
                                <ul class="searchArea">
                                    <!--수정 -->
                                    <li class="left">
                                        <select id="searchType">
                                            <option value="">선택</option>
                                            <option value="title">제목</option>
                                            <option value="contents">내용</option>
                                        </select>
                                        <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                        <a href="javascript:fn_search('new');" class="btn_m on">검색</a>
                                    </li>
                                    <li class="right"><a href="javascript:goPageNoSubmit('customerCenter', 'saveQuestion');" class="btn_m w140">1:1 문의하기</a>
                                    </li>
                                </ul>
                            </div>
                        </form>
                        <div class="tableBox">
                            <table class="mypage05">
                                <colgroup>
                                    <col width="10%">
                                    <col width="60%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="row" style="text-align: center;">유형</th>
                                    <th scope="row" style="text-align: center;">제목</th>
                                    <th scope="row" style="text-align: center;">작성자</th>
                                    <th scope="row" style="text-align: center;">등록일</th>
                                    <th scope="row" style="text-align: center;">조회</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                                </tbody>
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
