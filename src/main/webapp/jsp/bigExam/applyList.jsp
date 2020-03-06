<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            getMockExamClassCtgSelectBoxList(2, 'onSel');
            getMockExamClassCtgSelectBoxList(3, 'offSel');
            fn_search('new');
            fn_search2('new');
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
        getMockExamList(2, sPage, 10, ctgKey, searchType, searchText, 'dataList');
    }

    function fn_search2(val){
        var searchType = getSelectboxValue("searchType2");
        var searchText = getInputTextValue("searchText2");
        var ctgKey = getSelectboxValue("offSel");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        var sPage = getInputTextValue("sPage2");
        if(val == "new") sPage = "1";
        getMockExamList(3, sPage, 10, ctgKey, searchType, searchText, 'dataList2');
    }
</script>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
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
                    <span>지안에듀의 모의고사를 온라인/오프라인으로 만나보세요. 합격의 길로 안내합니다.</span>
                </div>
                <br>
                <div class="imgbox">
                    <img src="/common/zian/images/bigimg/img01.png">
                </div>

                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 모의고사는 각 과목별로 1회만 응시 가능합니다.</li>
                        <li>· 종합시험 신청을 하시면 전체 과목을 한 번에 응시하여야 합니다.</li>
                        <li>· 과목당 응시 시간은 20분이며, 종합시험으로 신청시 “전체 시간으로 개선되어 과목별 시간제한이 없습니다.</li>
                        <li>· 모의고사 응시 및 성적 확인은 (내 강의실 - 나의 모의고사)에서 확인하실 수 있습니다.</li>
                        <li>· 모의고사는 응시 후 취소 및 환불이 불가합니다.</li>
                    </ul>
                    <span class="text_blue">지안에듀 연간회원은 무료로 신청 가능한 서비스입니다.</span>
                    <a href="#modalb01" class="btn_modalOpen">오프라인 모의고사 유의사항 ></a>
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
                                    <input type="button" value="검색" onclick="fn_search('new');" class="btn_m on">
                                    <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                                </li>
                                <li class="right pdt0">
                                    <select id="onSel" class="w190" onchange="fn_search('new');"></select>
                                </li>
                            </ul>
                        </form>
                        <div class="tableBox">
                            <table class="bigList">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>시험명</th>
                                    <th>응시직렬/응시과목</th>
                                    <th>신청기간</th>
                                    <th>응시기간</th>
                                    <th>신청</th>
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
                                    <input type="button" value="검색" class="btn_m on" onclick="javascript:fn_search2('new');">
                                    <a href="javascript:fn_search2('new');" class="search_ico">검색</a>
                                </li>
                                <li class="right pdt0">
                                    <select id="offSel" class="w190" onchange="fn_search2('new');"></select>
                                </li>
                            </ul>
                        </form>
                        <div class="tableBox">
                            <table class="bigList">
                                <colgroup>
                                    <col width="200px">
                                    <col width="300px">
                                    <col width="200px">
                                    <col width="200px">
                                    <col width="100px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="text-align: center;">시험명</th>
                                    <th style="text-align: center;">응시직렬/응시과목</th>
                                    <th style="text-align: center;">신청기간</th>
                                    <th style="text-align: center;">응시기간</th>
                                    <th>신청</th>
                                </tr>
                                </thead>
                                <tbody id="dataList2"></tbody>
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
