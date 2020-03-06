<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            $(".mainStoryList").each(function(){
                kiplayer.sliderSlick($(this));
            });
            $(".slick-dots").hide();
            fn_search('new');
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        getCommunityList3(11051,  sPage, 10, searchType, searchText);
    }

    function goDetailReview(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage('bigExam','detailReference');
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="bbsKey" name="bbsKey">
    <div id="wrap" class="big">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="bigSub">
            <div class="inner">
                <div class="titleBar">
                    <h5>자료실</h5>
                    <span>지안에듀 회원이라면 자유롭게 이용할 수 있는 모의고사 자료실 입니다.</span>
                </div>
                <br><br><br>
                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 시험 해설, 계정 법률, 스터디 및 암기 자료를 업로드 할 수 있습니다.</li>
                        <li>· 관리자의 판단 하에 부적절한 게시물은 삭제 조치됩니다.</li>
                        <li>· 불법 자료 공유 및 무단 도용을 금지합니다.</li>
                    </ul>
                </div>

                <div class="boardWrap">
                    <div class="boardSearch">
                        <ul class="searchArea">
                            <li class="left">
                                <select id="searchType" class="w100">
                                    <option value="title">제목</option>
                                    <option value="content">제목</option>
                                </select>
                                <!--html 추가 및 수정-->
                                <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                <input type="button" value="검색" class="btn_m on" onclick="javascript:fn_search('new');">
                                <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                            </li>
                            <li class="right">
                                <a href="javascript:goPageNoSubmit('bigExam','saveReference');" class="btn_inline w140 write_ico">글쓰기</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tableBox2">
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
