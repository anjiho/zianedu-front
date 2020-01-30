<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        //getMockExamClassCtgSelectBoxList(2, 'onSel');
        //getMockExamClassCtgSelectBoxList(3, 'offSel');
        //fn_search('new');

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
        var ctgKey = getSelectboxValue("onSel");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        getMockExamList(2, sPage, 10, ctgKey, searchType, searchText, 'dataList');
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
        <div id="container" class="bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="titleBar">
                    <h5>주간모의고사(온라인) 응시하기</h5>
                    <span>지안에듀는 1년 안에 합격을 목표로 합니다. 공통과목 모의고사를 온라인으로 만나보세요.</span>
                </div>
                <br>
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
                                <select>
                                    <option>제목</option>
                                </select>
                                <input type="text">
                                <input type="submit" value="검색" class="btn_m on">
                            </li>
                            <li class="right pdt10">
                                <select name="" class="w120">
                                    <option value="">직렬선택</option>
                                </select>
                                <select name="" class="w120">
                                    <option value="">급수선택</option>
                                </select>
                                <select name="" class="w120">
                                    <option value="">과목선택</option>
                                </select>
                            </li>
                        </ul>
                    </form>
                    <div class="tableBox3">
                        <table class="disnoneM">
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
                                <th style="text-align: center">직렬</th>
                                <th style="text-align: center">급수</th>
                                <th style="text-align: center">과목</th>
                                <th style="text-align: center">모의고사명</th>
                                <th style="text-align: center">응시</th>
                                <th style="text-align: center">시험지</th>
                            </tr>
                            </thead>
                            <tbody id="dataList">
<%--                            <tr>--%>
<%--                                <td>일반행정직</td>--%>
<%--                                <td>9급</td>--%>
<%--                                <td>영어</td>--%>
<%--                                <td class="left">2019 제3회 일반행정직 전과목 모의고사</td>--%>
<%--                                <td>--%>
<%--                                    <a href="" class="small blue" onclick="testPop()">응시하기</a>--%>
<%--                                    <!--<a href="" class="small bdgray">응시완료</a>     <a href="" class="">응시마감</a>-->--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <ul class="fileList">--%>
<%--                                        <li><a href="#"><img src="/common/zian/images/common/icon_file.png" alt=""> 문제지</a></li>--%>
<%--                                        <li><a href="#"><img src="/common/zian/images/common/icon_file.png" alt=""> 해설지</a></li>--%>
<%--                                    </ul>--%>
<%--                                </td>--%>
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