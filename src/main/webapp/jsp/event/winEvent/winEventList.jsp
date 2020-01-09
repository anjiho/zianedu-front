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
                        <li><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','winList');">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--담청자발표-->
                <div class="boardWrap eventBoard">
                    <div class="boardSearch">
                        <select id="searchType" class="w90">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <!--html 추가 및 수정-->
                        <input type="text" id="searchText" class="w240" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" >
                        <a href="javascript:fn_search('new');" class="btn_inline on w140 disnoneM">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('event','saveWin')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="tableBox">
                        <table class="list">
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
<%--                            <tr id="dataList">--%>
<%--&lt;%&ndash;                                <td>5</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <td class="left"><a href="#">2019 지안에듀 리뷰작성 이벤트 당첨자</a></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <td>지안에듀</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <td>2019.08.09</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <td>31</td>&ndash;%&gt;--%>
<%--                            </tr>--%>
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