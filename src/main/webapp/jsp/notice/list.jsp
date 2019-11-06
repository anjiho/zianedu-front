<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('noticeHeader');
        getNoticeList(1, 10, '10001', "", "");//리스트 불러오기
    });

    //상세보기
    function goDetailNotice(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage("notice", "detail");
    }

    //검색
    function fn_search(val) {
        var paging = new Paging();
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("optionSearchType");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";

        getNoticeList(sPage, 10, '10001', searchType, searchText);//리스트 불러오기

    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="cols7">
                        <li><a href="#">내강의실</a></li>
                        <li><a href="#">교수소개</a></li>
                        <li><a href="#">학원수강신청</a></li>
                        <li><a href="#">1:1 관리반</a></li>
                        <li><a href="#">무료강좌</a></li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a></li>
                    </ul>
                </div>
            </div>
            <!--//주메뉴-->
        </div>
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
                        <select id="searchType" class="w90">
                            <option value="">제목</option>
                            <option value="">내용</option>
                        </select>
                        <input type="text" id="searchText" value="" class="w240">
                        <a href="javascript:fn_search('new');" class="btn_inline on w140">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPage('notice','write')" class="btn_inline w140">글쓰기</a>
                        </div>
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
<%--                    <div class="paging">--%>
<%--                        <a href="#" class="btn_prev">이전</a>--%>
<%--                        <a href="#" class="active">1</a>--%>
<%--                        <a href="#" class="btn_next">다음</a>--%>
<%--                    </div>--%>
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
                </div>

                <!--//서브 컨텐츠-->
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
