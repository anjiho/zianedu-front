<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if (sessionUserInfo == null) {
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
        // var leftMenuInfo = sessionStorage.getItem('myPageHeader');
        // if(leftMenuInfo == null){
        //     $("#noticeMenu li:eq(0)").addClass('active');
        //     sessionStorage.setItem("myPageHeader", "orderList");
        // }
        sessionStorage.removeItem('myPageHeader');
        sessionStorage.setItem("myPageHeader", "orderList");
        $("#noticeMenu li:eq(0)").addClass('active');

        $("#searchStartDate").datepicker({
            dateFormat:'yy-mm-dd',
            monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin:['일','월','화','수','목','금','토'],
            changeMonth:true, // 월변경가능
            changeYear:true,  // 년변경가능
            showMonthAfterYear: true// 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
        });
        $("#searchEndDate").datepicker({
            dateFormat:'yy-mm-dd',
            monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin:['일','월','화','수','목','금','토'],
            changeMonth:true, // 월변경가능
            changeYear:true,  // 년변경가능
            showMonthAfterYear: true// 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
        });
        setSearchDate('3m', 'searchStartDate', 'searchEndDate');
        fn_search('new');
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var startDate = getInputTextValue("searchStartDate");
        var endDate = getInputTextValue("searchEndDate");
        getUserOrderList(userKey, startDate, endDate, sPage, 5);
    }

    //주문상세내역
    function goDetailOrder(jkey) {
        innerValue("jkey", jkey);
        goPage("myPage", "detailOrder");
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="jkey" name="jkey">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->

        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <!--날짜 검색 -->
                    <div class="date_sort">
                        <div class="inner">
                            <div class="date_5ea">
                                <ul>
                                    <li><a href="javascript:setSearchDate('0d', 'searchStartDate', 'searchEndDate');">오늘</a></li>
                                    <li><a href="javascript:setSearchDate('1w', 'searchStartDate', 'searchEndDate');">1주일</a></li>
                                    <li><a href="javascript:setSearchDate('1m', 'searchStartDate', 'searchEndDate');">1개월</a></li>
                                    <li><a href="javascript:setSearchDate('3m', 'searchStartDate', 'searchEndDate');">3개월</a></li>
                                    <li><a href="javascript:setSearchDate('6m', 'searchStartDate', 'searchEndDate');">6개월</a></li>
                                </ul>
                            </div>
                            <div class="date_pick">
                                <form name="form_reserve" id="form_reserve" action="/shop/mypage.html" method="GET">
                                    <input type="hidden" value="myreserve">
                                    <fieldset>
                                        <legend>적립금 기간 검색 폼</legend>
                                        <span class="key-wrap">
				                            <input name=""  id="searchStartDate" type="text">
				                            <img align="abmiddle" class="datepicker" onclick="" src="/common/zian/images/content/btn_calendar.gif"> <span class="hyphen">~</span>
				                         	<input name="" class="" id="searchEndDate" type="text">
				                        	<img align="" class="datepicker" onclick="" src="/common/zian/images/content/btn_calendar.gif">
			                            </span>
                                    </fieldset>
                                </form>
                            </div>
                            <a href="javascript:fn_search('new');" class="search_btn">조회</a>
                        </div>
                        <ul>
                            <li>· 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                            <li>· 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                        </ul>
                    </div>
                    <!--//날짜 검색 -->

                    <div class="tbd_03">
                        <p class="title">주문 상품정보</p>
                        <table class="mypageOrderCheck">
                            <thead>
                            <tr>
                                <th style="text-align: center">주문일자<br>[주문번호]</th>
                                <th style="text-align: center">상품명</th>
                                <th style="text-align: center">결재금액</th>
                                <th style="text-align: center">주문상태</th>
                                <th style="text-align: center">배송상태</th>
                            </tr>
                            </thead>
                            <tbody id="dataList"></tbody>
                        </table>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
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
