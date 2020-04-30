<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#writeBtn").hide();
            }
        }else{
            $("#writeBtn").hide();
        }
        fn_search('new');
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        getCommunityList2(11046, sPage, 10, searchType, searchText);
    }

    function detailEvent(bbsKey) {
        innerValue('bbsKey', bbsKey);
        goPage('event','detailWin');
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="bbsKey" name="bbsKey">
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
                        <li><a href="javascript:goPageNoSubmit('event','proceedList');">진행 이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">종료 이벤트</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','winList');">당첨자 발표</a></li>
                    </ul>
                </div>
                <br />
                <!--담청자발표-->
                <div class="boardWrap eventBoard">
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
                                <a href="javascript:goPageNoSubmit('event','saveWin')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
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
                                <th scope="col" style="text-align: center">번호</th>
                                <th scope="col" style="text-align: center">제목</th>
                                <th scope="col" style="text-align: center">작성자</th>
                                <th scope="col" style="text-align: center">등록일</th>
                                <th scope="col" style="text-align: center">조회</th>
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