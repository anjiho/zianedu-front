<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        fn_search('new');
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
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        if(val == "new") sPage = "1";
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
                        <ul>
                            <li class="active"><a href="#">1:1 문의내역<span></span></a></li>
                            <li><a href="#">상담예약내역<span></span></a></li>
                            <li><a href="#">내게시글<span></span></a></li>
                        </ul>
                    </div>

                    <!--1:1 문의내역 -->
                    <div class="reviewBoard">
                        <form>
                            <ul class="searchArea">
                                <!--수정 -->
                                <li class="left">
                                    <select id="searchType">
                                        <option value="title">제목</option>
                                    </select>
                                    <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                    <a href="javascript:fn_search('new');" class="btn_m on">검색</a>
                                </li>
                                <li class="right"><a href="javascript:goPageNoSubmit('customerCenter', 'saveQuestion');" class="btn_m w140">1:1 문의하기</a>
                                </li>
                            </ul>
                        </form>
                        <div class="tableBox">
                            <table class="list">
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
