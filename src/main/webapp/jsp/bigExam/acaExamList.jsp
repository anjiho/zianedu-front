<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        getMockExamClassCtgSelectBoxList(2, 'onSel');
        getMockExamClassCtgSelectBoxList(3, 'offSel');
        fn_search('new');
        fn_search2('new');
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
        getMockExamListAtBuy(sessionUserInfo.userKey, 2, sPage, 5, ctgKey, searchType, searchText, 'dataList')
    }

    function fn_search2(val){
        var searchType = getSelectboxValue("searchType2");
        var searchText = getInputTextValue("searchText2");
        var ctgKey = getSelectboxValue("offSel");
        var sPage = getInputTextValue("sPage2");
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        getMockExamListAtBuy(sessionUserInfo.userKey, 3, sPage, 5, ctgKey, searchType, searchText, 'dataList2')
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
    <input type="hidden" name='bbsKey' id="bbsKey">
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
                    <h5>학원모의고사 (온·오프) 신청하기</h5>
                    <span>지안에듀는 1년 안에 합격을 목표로 합니다. 철저한 모의고사 준비로 성적을 올려드립니다!</span>
                </div>
                <br>
                <div class="imgbox">
                    <img src="/common/zian/images/bigimg/img02.png">
                </div>

                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 모의고사는 시험기간 내에 응시하셔야 하며 기간이 지난 후에는 응시할 수 없습니다.</li>
                        <li>· 선택과목 변경 시에는 응시하기 전 관리버튼을 클릭 후 선택과목을 변경할 수 있습니다.</li>
                        <li>· 오프라인 모의고사 신청 수강생은 시험날짜를 꼭 확인해주세요.</li>
                        <li>· 오프라인 모의고사 신청 수강생은 수험표를 꼭 발급받은 후 시험장으로 이동해주세요.</li>
                    </ul>
                </div>

                <div class="tabContent">
                    <ul class="tabBar">
                        <li class="active"><a href="#">온라인</a></li>
                        <li><a href="#">오프라인</a></li>
                    </ul>
                    <!-- 온라인 -->
                    <div class="tabPage active">
                        <form>
                            <!--추가 및 수정 -->
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
                                    <th style="text-align: center;">직렬</th>
                                    <th style="text-align: center;">모의고사명</th>
                                    <th style="text-align: center;">응시기간</th>
                                    <th style="text-align: center;">응시</th>
                                    <th style="text-align: center;">시험지</th>
                                </tr>
                                </thead>
                                <tbody id="dataList"></tbody>
                            </table>

                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                        <!-- //paging -->
                    </div>

                    <!-- 오프라인 -->
                    <div class="tabPage">
                        <form>
                            <!--추가 및 수정 -->
                            <ul class="searchArea">
                                <li class="left">
                                    <select id="searchType2">
                                        <option value="name">시험명</option>
                                    </select>
                                    <input type="text" id="searchText2" onkeypress="if(event.keyCode==13) {fn_search2('new'); return false;}">
                                    <a href="javascript:fn_search2('new');" class="btn_m on w140">검색</a>
                                </li>
                                <li class="right pdt0">
                                    <select id="offSel" class="w190" onchange="fn_search2('new');"></select>
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
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="text-align: center;">직렬</th>
                                    <th style="text-align: center;">모의고사명</th>
                                    <th style="text-align: center;">응시기간</th>
                                    <th style="text-align: center;">응시</th>
                                </tr>
                                </thead>
                                <tbody id="dataList2"></tbody>
<%--                                <tr>--%>
<%--                                    <td>전산직</td>--%>
<%--                                    <td class="left">2019 제2회 전산직 전과목 모의고사</td>--%>
<%--                                    <td>2019-06-22 10:00<br>--%>
<%--                                        ~ 2019-06-30 23:59--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <a href="" class="txt_gray2">응시완료</a>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
                            </table>

                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi2.inc" %>
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