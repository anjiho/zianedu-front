<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
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
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="big bigSub">
            <div class="inner">
                <div class="titleBar">
                    <h5>자료실</h5>
                    <span>지안에듀 회원이라면 자유롭게 이용할 수 있는 모의고사 자료실 입니다.</span>
                </div>
                <br>
                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 시험 해설, 계정 법률, 스터디 및 암기 자료를 업로드 할 수 있습니다.</li>
                        <li>· 관리자의 판단 하에 부적절한 게시물은 삭제 조치됩니다.</li>
                        <li>· 불법 자료 공유 및 무단 도용을 금지합니다.</li>
                    </ul>
                </div>

                <div class="review_movie_search">
                    <div class="boardSearch">
                        <select id="searchType" class="w100">
                            <option value="title">제목</option>
                            <option value="content">제목</option>
                        </select>
                        <!--html 추가 및 수정-->
                        <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                        <a href="javascript:fn_search('new');" class="btn_m on w140">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('bigExam','saveReference');" class="btn_inline w140 write_ico">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="tableBox2">
                        <table class="disnoneM">
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
                            <%--                            <tr>--%>
                            <%--                                <td>5</td>--%>
                            <%--                                <td class="left"><a href="#">모의고사 사용후기입니다.</a></td>--%>
                            <%--                                <td>지안에듀</td>--%>
                            <%--                                <td>2019.08.09</td>--%>
                            <%--                                <td>31</td>--%>
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
