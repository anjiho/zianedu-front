<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            getGichulSelectBoxList('SERIAL', 'classCtgKey');//직렬
            getGichulSelectBoxList('RATING', 'groupCtgKey');//급수
            getGichulSelectBoxList('SUBJECT', 'subjectCtgKey');//과목
            fn_search('new');
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }

    });

    function testPop(){
        var popUrl = 'Start.html';
        var tarGet = "_blank";
        var popOption = "width=1000, height=775, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,tarGet,popOption);
    }

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        var groupCtgKey = getSelectboxValue("groupCtgKey");//급수
        var classCtgKey = getSelectboxValue("classCtgKey");//직렬
        var subjectCtgKey = getSelectboxValue("subjectCtgKey");//과목
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        getGichulProblemList(sessionUserInfo.userKey, sPage, 5, searchType, searchText, groupCtgKey, classCtgKey, subjectCtgKey);
    }

    function goBigExamPopup(examKey){
        var popUrl = '/bigExam?page_gbn=popupStart&examKey='+examKey;
        var tarGet = "_blank";
        var popOption = "width=1000, height=775, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,tarGet,popOption);
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/bigExamHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="big bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="titleBar">
                    <h5>기출문제 응시하기</h5>
                    <span>7급, 9급 공무원 기출문제를 온라인으로 실전처럼 풀어보세요.</span>
                </div>
                <br>
                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 국가직, 지방직, 서울시, 과목별로 제공해드리고 있으며 기출문제별로 1회만 응시가 가능합니다.</li>
                        <li>· 기출문제풀이 이후 성적관리 메뉴에서 응시한 인원의 성적과 나의 성적을 비교해볼 수 있습니다.</li>
                        <li>· 기출문제는 다운로드가 가능합니다. 문제풀이 이후 시험지 출력을 통해 기출문제를 반복해서 풀어볼 수 있습니다. </li>
<%--                        <li>· 진도별 모의고사의 경우 진도 범위는 누적됩니다. (누적 범위에서 20% 출제)</li>--%>
<%--                        <li>· 모의고사 성적은 [내강의실] - [나의 모의고사] - [성적관리]에서 확인할 수 있습니다.</li>--%>
                    </ul>
                </div>

                <div style="padding-top:50px">
                    <form>
                        <!--추가 -->
                        <ul class="searchArea">
                            <li class="left">
                                <select id="searchType">
                                    <option value="name">시험명</option>
                                </select>
                                <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                <input type="button" value="검색" class="btn_m on" onclick="javascript:fn_search('new');">
                                <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                            </li>
                            <li class="right pdt10">
                                <select id="classCtgKey" class="w120" onchange="fn_search('new');">
<%--                                    <option value="">급수선택</option>--%>
                                </select>
                                <select id="groupCtgKey" class="w120" onchange="fn_search('new');">
                                    <%--                                    <option value="">직렬선택</option>--%>
                                </select>
                                <select id="subjectCtgKey" class="w120" onchange="fn_search('new');">
<%--                                    <option value="">과목선택</option>--%>
                                </select>
                            </li>
                        </ul>
                    </form>
                    <div class="tableBox3">
                        <table class="bigList3">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>직렬</th>
                                <th>급수</th>
                                <th>과목</th>
                                <th>모의고사명</th>
                                <th>응시</th>
                                <th>시험지</th>
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
<!--팝업 알림 modalb01-->
<div id="modalb01" class="modalWrap">
    <div class="inner">
        <div class="modalTitle">
            <h2>오프라인 모의고사 유의사항</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                오프라인 모의고사 유의사항오프라인 모의고사 유의사항
            </div>
        </div>
    </div>
</div>
<!--//팝업-->