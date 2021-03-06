<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", 'bookStore');
        getNewBookList();
        getBestBookList();
        getBannerNoticeList('bookInfo', 1, 4, 10057);//온라인서점안내
        bookStoreReviewBoard(5, 'BOOK', 1, 4, '', '');
        innerValue('orderType', 'date');
        innerHTML("selCount", 0);
        fn_search('new');
        fn_search2('new');
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selCount", count);
        });
    });
    
    function goList(orderType) {
        innerValue('orderType', orderType);
        fn_search('new');
    }

    function goList2(orderType) {
        innerValue('orderType', orderType);
        fn_search2('new');
    }

    function fn_search(val) {
        innerHTML("selCount", 0);
        var orderType = getInputTextValue('orderType');
        var sPage = getInputTextValue("sPage");
        var searchText = getInputTextValue("searchText");
        var searchType = getSelectboxValue("searchType");
        if(searchText == undefined) searchText = "";
        if(searchType == undefined) searchType = "";

        if(val == "new") sPage = "1";
        getSalesBookList(searchType, searchText, orderType, sPage, 5);
    }

    function fn_search2(val) {
        innerHTML("selCount", 0);
        var orderType = getInputTextValue('orderType');
        var sPage = getInputTextValue("sPage2");
        var searchText = getInputTextValue("searchText");
        var searchType = getSelectboxValue("searchType");
        if(searchText == undefined) searchText = "";
        if(searchType == undefined) searchType = "";

        if(val == "new") sPage = "1";
        getSalesBookList2(searchType, searchText, orderType, sPage, 5);
    }

    function searchBookList() {
        var orderType = getInputTextValue('orderType');
        if(orderType == 'date'){
            fn_search('new');
        }else{
            fn_search2('new');
        }
    }

    function goDetailBook(gkey) {
        innerValue('bbsKey', gkey);
        goPage('bookStore', 'detail');
    }

    function goDetailbookType(type) {
        innerValue('bookType', type);
        $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
        $("#bookTypePage").submit();
    }

    function goOnlineNoticeList() {
        sessionStorage.setItem("noticeHeader", "onlineStore");
        goPageNoSubmit('notice', 'list');
    }
    //공지사항 > 시험공고 > 상세보기
    function goDetailNotice(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage("notice", "detail");
    }
    function goBookReviewList() {
        goPageNoSubmit('review','bookList');
    }
    
    function goBookReviewDetail(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage('review','detailBook');
    }
</script>
<style>
    #wrap #container .mainProduct2 .slick-dots {display: none !important}
</style>
<form id="bookTypePage" method="post" name="bookTypePage">
    <input type="hidden" id="bookType" name="bookType">
</form>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="orderType">
    <input type="hidden" id="bbsKey" name="bbsKey">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
<%--    <div id="wrap" class="shop">--%>
    <div id="wrap">
        <!--상단-->
        <%@include file="/common/jsp/bookStoreHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--컨텐츠-->
                <!-- 새로나온책 -->
                <div class="mainProduct2">
                    <div class="titleBar">
                        <h5>새로나온 책</h5>
                        <span>지안에듀 신규 도서를 확인 해 보세요!</span>
                    </div>
                    <div class="mainProductList2" id="newBookList"> </div>
                </div>

                <!-- 지안에듀 BEST도서 -->
                <div class="mainProduct2">
                    <div class="titleBar">
                        <h5 style="font-weight: bold;">지안에듀 BEST 도서</h5>
                    </div>
                    <div class="mainProductList2" id="bestBookList"></div>
                </div>

                <!-- 온라인서점 안내 -->
                <div class="divGroup cols2">
                    <div>
                        <div class="mainBoard">
                            <p class="stitle">온라인 서점안내</p>
                            <div class="list">
                                <ul id="bookInfo"> </ul>
                                <a href="javascript:goOnlineNoticeList();" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="mainBoard">
                            <p class="stitle">지안에듀 도서후기</p>
                            <div class="list">
                                <ul id="bookReview"></ul>
                                <a href="javascript:goBookReviewList();" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!--서브상단공통배너-->
                <div class="submainBanner">
                    <img src="/common/zian/images/ex/subBanner_bg.jpg">
                    <div class="Banner_txt">
                        <p class="title"><img src="/common/zian/images/ex/submain_img01.png" alt="공통과목도서후기보러가기"></p>
                        <span class="txt">부가설명을 써주세요써주세요써주세요</span>
                        <a href="javascript:goBookReviewList();" class="link">도서후기</a>
                    </div>
                </div>

                <form>
                    <div class="searchArea">
                        <input type="text" class="w400" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                        <input type="button" onclick="fn_search('new');" value="검색" class="btn_m on">
                        <a href="javascript:fn_search('new');" class="search_ico disnonepc">검색</a>
                    </div>
                </form>

                <div class="">
                    <form>
                        <div class="lectureWrap">
                            <div class="shoplist">
                                <div class="type_wrap">
                                    <select id="searchType" class="w140" onchange="searchBookList();">
                                        <option value="COMMON">공통과목</option>
                                        <option value="PUBLIC">행정직군</option>
                                        <option value="TECH">기술직군</option>
                                        <option value="POST">계리직군</option>
                                        <option value="CERT">자격증</option>
                                    </select>
                                </div>
                                <ul class="listtype" id="listtype">
                                    <li><a href="javascript:goList('date');">출간일순</a></li>
                                    <li class="last"><a href="javascript:goList2('name');">저자순</a></li>
                                </ul>

                                <ul class="lectureTotal">
                                    <li class="left"></li>
                                    <li class="right">
                                        선택한 항목 <span class="colorRed" id="selCount"></span>개를
                                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                                        <a href="javascript:goCheckedBuy();" class="btn_m on">바로구매</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="shopBoard">
                                <table class="lecturList">
                                    <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>도서명</th>
                                        <th>할인적립</th>
                                        <th>교재비</th>
                                    </tr>
                                    </thead>
                                    <tbody id="dataList"></tbody>
                                </table>
                                <%@ include file="/common/inc/com_pageNavi.inc" %>
                            </div>
                            <div class="shopBoard">
                                <table class="lecturList">
                                    <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>도서명</th>
                                        <th>할인적립</th>
                                        <th>교재비</th>
                                    </tr>
                                    </thead>
                                    <tbody id="dataList2"></tbody>
                                </table>
                                <%@ include file="/common/inc/com_pageNavi2.inc" %>
                            </div>


                            </div>
                    </form>
                </div>

                <!-- 지안에듀 고객센터 -->
                <div class="divGroup">
                    <div class="mainCustomer w45p">
                        <div>
                            <div class="titleBar">
                                <h5>고객센터</h5>
                            </div>
                            <ul>
                                <li>
                                    <span class="title">대표전화</span>
                                    <b class="phone">02-816-1724</b>
                                </li>
                                <li>
                                    <span class="title">2관학원</span>
                                    <b>070-4870-0634</b>
                                    <span class="desc">
									1번 학원동영상 상담 및 결재문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결재 및 환불문의
								</span>
                                    <span class="desc">
									운영시간 09:00~18:00 (주말,공휴일 제외)<br />
									점심시간 12:00~13:00
								</span>
                                </li>
                            </ul>
                            <a href="javascript:goPageNoSubmit('customerCenter','consult');" class="btn_apply">1:1문의</a>
                        </div>
                    </div>
                    <div class="mainInfo w55p">
                        <ul>
                            <li><a href="javascript:goExamNotice();" class="item1">시험공고</a></li>
                            <li><a href="javascript:goOpenMenu();" class="item2">개강안내</a></li>
                            <li><a href="javascript:goMyPage();" class="item3">교재배송</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');" class="item4">모바일 문의</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');" class="item5">자주하는 질문</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');" class="item6">1:1 고객상담</a></li>
                        </ul>
                    </div>
                </div>

                <!--//컨텐츠-->
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

