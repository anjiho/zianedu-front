<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>

<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#writeBtn").hide();
            }
        }else{
            $("#writeBtn").hide();
        }
        var leftMenuInfo = sessionStorage.getItem('noticeHeader');
        if(leftMenuInfo == null){
            $("#noticeMenu li:eq(0)").addClass('active');
            sessionStorage.setItem("noticeHeader", "openMenu");
        }
        fn_search('new');
    });

    //검색
    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        var bbsmasterKey =  getBbsMasterKey();
        getNoticeList(sPage, 5, bbsmasterKey, searchType, searchText);
    }
</script>
<style>
    /*달력 토,일 색변경*/
    .fc-sat { color: blue; }
    .fc-sun { color: red; }
</style>
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
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="boardWrap">
                    <input type="hidden" id="bbsKey" name="bbsKey">
                    <input type="hidden" id="sPage">
                    <div class="boardSearch">
                        <ul class="searchArea">
                            <li class="left">
                                <select id="searchType">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" class="w240">
                                <input type="button" value="검색" class="btn_m on" onclick="javascript:fn_search('new');">
                                <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                            </li>
                            <li class="right">
                                <a href="javascript:goPageNoSubmit('notice','write')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tableWrap">
                        <table class="tBoard noticeList">
                            <caption></caption>
                            <colgroup>
                                <col class="w100">
                                <col>
                                <col class="w140">
                                <col class="w140">
                                <col class="w100">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">등록일</th>
                                <th scope="col">조회</th>
                            </tr>
                            </thead>
                            <tbody id="dataList"></tbody>
                        </table>
                    </div>
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
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
