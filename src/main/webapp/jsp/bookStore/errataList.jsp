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
        getCommunityList2(10059, sPage, 10, searchType, searchText);
    }

    function detailEvent(bbsKey) {
        innerValue('bbsKey', bbsKey);
        goPage('bookStore','detailErrata');
    }
</script>
<form id="bookTypePage" method="post" name="bookTypePage">
    <input type="hidden" id="bookType" name="bookType">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="bbsKey" name="bbsKey">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/bookStoreHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="shop">
            <div class="inner">
                <!--서브 컨텐츠-->

                <!--서브상단공통배너-->
                <div class="submainBanner">
                    <img src="/common/zian/images/content/subBanner_bg.jpg">
                    <div class="Banner_txt">
                        <p class="title"><img src="/common/zian/images/content/submain_img06.png" alt="정오표 안내"></p>
                        <span class="txt">불편을 드려 죄송합니다. <br> 더 좋은 교재를 만들기 위해 노력하겠습니다</span>
                    </div>
                </div>
                <div class="boardWrap">
                    <div class="boardWrap_inner">
                        <div class="boardSearch">
                            <select id="searchType" class="w90">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                            </select>
                            <input type="text" id="searchText" class="w240" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" >
                            <a href="javascript:fn_search('new');" class="btn_inline on w140 disnoneM">검색</a>
                            <div class="btnArea">
                                <a href="javascript:goPageNoSubmit('bookStore','saveErrata')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                            </div>
                        </div>

                        <div class="skin">
                            <table class="noticeList">
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
                                <tbody id="dataList"></tbody>
                            </table>
                        </div>
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