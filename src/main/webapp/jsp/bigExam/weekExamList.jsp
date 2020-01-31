<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            getWeekMockExamClassCtgSelectBoxList();
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
        var ctgKey = getSelectboxValue("onSel");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        getWeekBigExamList(sessionUserInfo.userKey, sPage, 5, ctgKey, searchType, searchText);
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="big bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="titleBar">
                    <h5>주간모의고사(온라인) 응시하기</h5>
                    <span>지안에듀는 1년 안에 합격을 목표로 합니다. 공통과목 모의고사를 온라인으로 만나보세요.</span>
                </div>
                <br>
                <div class="imgbox">
                    <img src="/common/zian/images/bigimg/img03.png">
                </div>

                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 주간 모의고사는 매주 월요일 07시에 오픈됩니다.</li>
                        <li>· 응시 제한 시간은 과목당 20분입니다.</li>
                        <li>· 응시 후 성적은 바로 확인 가능합니다.</li>
                        <li>· 진도별 모의고사의 경우 진도 범위는 누적됩니다. (누적 범위에서 20% 출제)</li>
                        <li>· 모의고사 성적은 [내강의실] - [나의 모의고사] - [성적관리]에서 확인할 수 있습니다.</li>
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
                                <a href="javascript:fn_search('new');" class="btn_m on w140">검색</a>
                            </li>
                            <li class="right pdt0">
                                <select id="onSel" class="w190" onchange="fn_search('new');"></select>
                            </li>
                        </ul>
                    </form>
                    <div class="tableBox2">
                        <table class="disnoneM">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th style="text-align: center">직렬</th>
                                <th style="text-align: center">모의고사명</th>
                                <th style="text-align: center">응시기간</th>
                                <th style="text-align: center">응시</th>
                                <th style="text-align: center">시험지</th>
                            </tr>
                            </thead>
                            <tbody id="dataList">
                            </tbody>
                        </table>
                    </div>
                <!--//서브 컨텐츠-->
                    <!-- paging -->
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
                    <!-- //paging -->
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