<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    String bookType = Util.isNullValue(request.getParameter("bookType"), "");
%>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", 'bookStore');
        var bookType = '<%=bookType%>';
            innerValue('bookType',bookType);
            if(bookType == 'COMMON'){
                $("#subBanner").attr("src", "http://52.79.40.214/Upload/100/contents/0423_book_01.jpg");
                //innerHTML('subjectTitle', '공통과목');
                getBookStoreSelectBoxList('COMMON');
            }else if(bookType == 'PUBLIC'){
                $("#subBanner").attr("src", "http://52.79.40.214/Upload/100/contents/0423_book_02.jpg");
               // innerHTML('subjectTitle', '행정직군');
                getBookStoreSelectBoxList('PUBLIC');
            }else if(bookType == 'TECH'){
                $("#subBanner").attr("src", "http://52.79.40.214/Upload/100/contents/0423_book_03.jpg");
                //innerHTML('subjectTitle', '기술직군');
                getBookStoreSelectBoxList('TECH');
            }else if(bookType == 'POST'){
                $("#subBanner").attr("src", "http://52.79.40.214/Upload/100/contents/0423_book_04.jpg");
                //innerHTML('subjectTitle', '계리직군');
                getBookStoreSelectBoxList('POST');
            }else if(bookType == 'CERT'){
                $("#typeBannerImg").attr("src", "/common/zian/images/content/submain_img05.png");
                innerHTML('subjectTitle', '자격증');
                getBookStoreSelectBoxList('CERT');
            }
        innerValue('orderType', 'date');
        innerHTML("selCount", 0);
        fn_search('new');
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selCount", count);
        });
    });

    function goDetailBook(gkey) {
        innerValue('bbsKey', gkey);
        goPage('bookStore', 'detail');
    }

    function fn_search(val) {
        var bookType = '<%=bookType%>';
        innerHTML("selCount", 0);
        var orderType = getInputTextValue('orderType');
        var sPage = getInputTextValue("sPage");
        var searchText = getInputTextValue("searchText");
        var searchType = getSelectboxValue("searchType");
        if(searchText == undefined) searchText = "";
        if(searchType == undefined) searchType = "";

        if(val == "new") sPage = "1";
        getSalesBookList(bookType, searchText, orderType, sPage, 5, searchType);
    }

    function fn_search2(val) {
        var bookType = '<%=bookType%>';
        innerHTML("selCount", 0);
        var orderType = getInputTextValue('orderType');
        var sPage = getInputTextValue("sPage2");
        var searchText = getInputTextValue("searchText");
        var searchType = getSelectboxValue("searchType");
        if(searchText == undefined) searchText = "";
        if(searchType == undefined) searchType = "";

        if(val == "new") sPage = "1";
        getSalesBookList2(bookType, searchText, orderType, sPage, 5, searchType);
    }

    function searchBookList() {
        var orderType = getInputTextValue('orderType');
        if(orderType == 'date'){
            fn_search('new');
        }else{
            fn_search2('new');
        }
    }

    function goDetailbookType(type) {
        innerValue('bookType', type);
        $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
        $("#bookTypePage").submit();
    }

    function goList(orderType) {
        innerValue('orderType', orderType);
        fn_search('new');
    }

    function goList2(orderType) {
        innerValue('orderType', orderType);
        fn_search2('new');
    }
    
    function goBookReviewList() {
        var bookType = getInputTextValue('bookType');
        innerValue('bookType', bookType);
        $("#bookTypePage").attr("action", "/review?page_gbn=bookList");
        $("#bookTypePage").submit();

    }
</script>
<form id="bookTypePage" method="post" name="bookTypePage">
    <input type="hidden" id="bookType" name="bookType">
</form>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey" name="bbsKey">
    <input type="hidden" id="sPage">
    <input type="hidden" id="orderType">
    <%--    <div id="wrap" class="shop">--%>
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/bookStoreHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="shop">
            <div class="inner">
                <!--서브 컨텐츠-->

                <!--서브상단공통배너-->
                <div class="submainBanner">
                    <img id="subBanner" src="">
                    <div class="Banner_txt">
                        <p class="title"><img src="" alt="" id="typeBannerImg"></p>
<%--                        <span class="txt">부가설명을 써주세요써주세요써주세요</span>--%>
<%--                        <a href="javascript:goBookReviewList();" class="link">도서후기</a>--%>
                    </div>
                </div>

                <form>
                    <div class="searchArea">
                        <input type="text" class="w400" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                        <input type="button" onclick="fn_search('new');" value="검색" class="btn_m on">
                        <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                    </div>
                </form>

                <div class="">
                    <form>
                        <div class="lectureWrap">
                            <div class="shoplist">
                                <p class="stitle"><span id="subjectTitle"></span>도서목록</p>
                                <div class="type_wrap">
                                    <select id="searchType" class="w100p" onchange="searchBookList();">
                                        <option value="">전체</option>
                                    </select>
                                </div>
                                <ul class="listtype">
                                    <li><a href="javascript:goList('date');">출간일순</a></li>
                                    <li class="last"><a href="javascript:goList2('name');">저자순</a></li>
                                </ul>

                                <ul class="lectureTotal">
                                    <li class="left"></li>
                                    <li class="right">
                                        선택한 항목 <span class="colorRed"  id="selCount"></span>개를
                                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                                        <a href="javascript:goCheckedBuy();" class="btn_m on">바로구매</a>
                                    </li>
                                </ul>
                            </div>
                            <!--shopBoard-->
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
