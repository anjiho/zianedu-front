<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
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
        //fn_search('new');
    });
    function fn_search(val) {
        // $("#eventDiv").empty();
        // var sPage = getInputTextValue("sPage");
        // var searchType = getSelectboxValue("searchType");
        // var searchText = getInputTextValue("searchText");
        // if(searchType == undefined) searchType = "";
        // if(searchText == undefined) searchText = "";
        //
        // if(val == "new") sPage = "1";
        // eventList('DEAD', sPage, 10, searchType, searchText);
    }

    function fn_search2(val){
        // gfn_display("allDiv", false);
        // $("#questionList").empty();

        var sPage = getInputTextValue("sPage2");
        if(val == "new") sPage = "1";

    }

    // function detailEvent(idx) {
    //     innerValue('idx', idx);
    //     goPage('event','detailDead');
    // }
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
                    <span>지안에듀의 모의고사를 온라인/오프라인으로 만나보세요. 합격의 길로 안내합니다.</span>
                </div>

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
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                    </select>
                                    <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                                    <a href="javascript:fn_search('new');" class="btn_m on w140">검색</a>
                                </li>
                                <li class="right pdt0"><select name="" class="w190">
                                    <option value="">직렬선택</option>
                                </select>
                                </li>
                            </ul>
                        </form>
                        <div class="tableBox">
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
                                    <th>구분</th>
                                    <th>응시직렬/응시과목</th>
                                    <th>신청기간</th>
                                    <th>응시기간</th>
                                    <th>결과확인</th>
                                    <th>신청</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="small bdblue">신청하기</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="small bdgray">신청완료</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="">신청마감</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <!-- paging -->
<%--                        <%@ include file="/common/inc/com_pageNavi.inc" %>--%>
                        <!-- //paging -->
                    </div>

                    <!-- 오프라인 -->
                    <div class="tabPage">
                        <form>
                            <!--추가 및 수정 -->
                            <ul class="searchArea">
                                <li class="left">
                                    <select id="searchType1">
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                    </select>
                                    <input type="text" id="searchText1" onkeypress="if(event.keyCode==13) {fn_search2('new'); return false;}">
                                    <a href="javascript:fn_search2('new');" class="btn_m on w140">검색</a>
                                </li>
                                <li class="right pdt0"><select name="" class="w190">
                                    <option value="">직렬선택</option>
                                </select>
                                </li>
                            </ul>
                        </form>
                        <div class="tableBox">
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
                                    <th>구분</th>
                                    <th>응시직렬/응시과목</th>
                                    <th>신청기간</th>
                                    <th>응시기간</th>
                                    <th>결과확인</th>
                                    <th>신청</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="small bdblue">신청하기</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="small bdgray">신청완료</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제3회</td>
                                    <td class="left">
                                        <span class="text_blue">일반행정직</span>
                                        <span>국어, 영어, 한국사, 행정법총론, 행정학개론</span>
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-06-22 10:00<br>
                                        ~ 2019-06-30 23:59
                                    </td>
                                    <td>2019-07-16<br>10:00</td>
                                    <td>
                                        <a href="" class="">신청마감</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <!-- paging -->
                        <%--                        <%@ include file="/common/inc/com_pageNavi2.inc" %>--%>
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