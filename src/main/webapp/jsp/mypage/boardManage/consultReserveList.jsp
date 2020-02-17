<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenuQuestion"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenuConsult"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }else if(tabMenuInfo == "tabMenuMyBoard"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(2)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenuQuestion");
                goPageNoSubmit('myPage', 'questionList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenuConsult");
                goPageNoSubmit('myPage', 'consult');
            }else if($(this).index() == 2){
                sessionStorage.setItem("tabHeader", "tabMenuMyBoard");
                goPageNoSubmit('myPage', 'boardList');
            }
        });

        $("#searchStartDate").datepicker({
            format: "yyyy-mm-dd"
        });
        $("#searchEndDate").datepicker({
            format: "yyyy-mm-dd"
        });
        setSearchDate('3m', 'searchStartDate', 'searchEndDate');
        fn_search('new');
        $("#allChk").click(function(){
            if($("#allChk").prop("checked"))$("input[name=consultChk]").prop("checked",true);
            else $("input[name=consultChk]").prop("checked",false);
        });
    });

    function fn_search(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage");
        var reserveStartDate =  getInputTextValue('searchStartDate');
        var reserveEndDate =  getInputTextValue('searchEndDate');
        if(val == "new") sPage = "1";
        getConsultReserveList(sessionUserInfo.userKey, reserveStartDate, reserveEndDate, sPage, 10);
    }

    //예약취소
    function cancelConsult() {
        var arr = new Array();
        $('input[name=consultChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            arr.push(cartKey);
        });
        var idxs = toStrFileName(arr);
        if(arr.length > 0){
           var result  = changeConsultReserveStatus(idxs, 3);
           if(result.resultCode == 200){
               alert("예약취소가 완료되었습니다.");
               isReloadPage();
               return  false;
           }
        }else{
            alert("선택한 상담이 없습니다.");
            return false;
        }
    }

    //상담완료
    function saveConsult() {
        var arr = new Array();
        $('input[name=consultChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            arr.push(cartKey);
        });
        var idxs = toStrFileName(arr);
        if(arr.length > 0){
           var result  = changeConsultReserveStatus(idxs, 2);
            if(result.resultCode == 200){
                alert("상담완료가 완료되었습니다.");
                isReloadPage();
                return  false;
            }
        }else{
            alert("선택한 상담이 없습니다.");
            return false;
        }
    }

    function detailConsult(idx) {
        kiplayer.modalOpen('#modal1');
        var consultInfo = getCounselReserveDetailInfo(idx);
        if(consultInfo != null){
            if(consultInfo.result.userName != null){
                innerHTML('conusltName', consultInfo.result.userName);
            }else{
                innerHTML('conusltName', '-');
            }
            if(consultInfo.result.mobileNumber != null) {
                innerHTML('phoneNum', consultInfo.result.mobileNumber);
            }else{
                innerHTML('phoneNum', '-');
            }
            if(consultInfo.result.ctgNameStr != null) {
                innerHTML('ctgNameStr', consultInfo.result.ctgNameStr);
            }else{
                innerHTML('ctgNameStr', '-');
            }
            if(consultInfo.result.reserveContents != null) {
                innerHTML('consultContent', consultInfo.result.reserveContents);
            }else{
                innerHTML('consultContent', '-');
            }
        }
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
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <div class="tabBox review wid30p">
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'questionList')">1:1 문의내역<span></span></a></li>
                            <li class="active"><a href="javascript:void(0);">상담예약내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'boardList')">내게시글<span></span></a></li>
                        </ul>
                    </div>
                    <div class="date_sort" style="margin-top: 65px;">
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
                    </div>
                    <!--//날짜 검색 -->
                    <div class="tbd_03">
                        <div class="reBtn">
                            <span>선택시 항목</span>
                            <a href="javascript:cancelConsult();">예약취소</a>
                            <a href="javascript:saveConsult();">상담완료</a>
                        </div>
                        <table>
                            <colgroup>
                                <col>
                                <col width="200px">
                                <col width="200px">
                                <col width="150px">
                                <col  width="150px">
                                <col width="150px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="allChk"  value=""></th>
                                <th>장소</th>
                                <th>예약날짜</th>
                                <th>작성자</th>
                                <th>요청내용</th>
                                <th></th>
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
<!--팝업 수강안내사항 modal1-->
<div id="modal1" class="modalWrap" style="">
    <div class="inner">
        <div class="modalTitle">
            <h2>상세내용</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                <p class="pTxt"><b>이름</b> : <span id="conusltName"></span></p>
                <p class="pTxt"><b>연락처</b> : <span id="phoneNum"></span></p>
                <p class="pTxt"><b>상담요청직군</b> : <span id="ctgNameStr"></span></p>
                <p class="pTxt"><b>상담요청내용</b> : <span id="consultContent"></span></p>
            </div>
        </div>
    </div>
</div>
<!--//팝업-->
