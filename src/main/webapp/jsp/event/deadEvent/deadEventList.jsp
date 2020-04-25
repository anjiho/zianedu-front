<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
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
        $("#eventDiv").empty();
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        eventList('DEAD', sPage, 10, searchType, searchText);
    }

    function detailEvent(idx) {
        innerValue('idx', idx);
        goPage('event','detailDead');
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="idx" id="idx">
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
                <div class="tabBox">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('event','proceedList');">진행 이벤트</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','deadList');">종료 이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','winList');">당첨자 발표</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 진행중이벤트-->
                <div class="boardWrap eventBoard">
                    <div class="boardSearch">
                        <span class="ingevent">총 <span class="text_red" id="evenCnt"></span> 의 이벤트가 마감되었습니다.</span>
                        <select name="" class="w90">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="" value="" class="w240">
                        <a href="#" class="btn_inline on w140 disnoneM">검색</a>
                        <!--html 추가 및 수정-->
                        <div class="btnArea">
                            <a href="#" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="colbox" id="eventDiv"></div>
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