<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function(){
        $('.inquiry_tab ul li').each(function(){
            var $this = $(this);
            $this.click(function(){
                $this.parent().find('li').removeClass('active');
                $this.addClass('active');
            });
        });

        $("#questionType li").click(function () {
            if($(this).index() == 0) { //전체클릭햇을때
                innerValue('type', 0);
            }else if($(this).index() == 1){
                innerValue('type', 317);
            }else if($(this).index() == 2){
                innerValue('type', 318);
            }else if($(this).index() == 3){
                innerValue('type', 319);
            }else if($(this).index() == 4){
                innerValue('type', 320);
            }else if($(this).index() == 5){
                innerValue('type', 321);
            }else if($(this).index() == 6){
                innerValue('type', 322);
            }else if($(this).index() == 7){
                innerValue('type', 323);
            }
            fn_search('new');
        });

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#writeBtn").hide();
            }
        }else{
            $("#writeBtn").hide();
        }
        fn_search('new');
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        var faqTypeKey = getInputTextValue('type');
        if(val == "new") sPage = "1";
        getFaQList(faqTypeKey, sPage, 10, searchType, searchText);
    }

    function detailOften(bbsKey) {
        innerValue('bbsKey', bbsKey);
        goPage('customerCenter','detailOften');
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="bbsKey" id="bbsKey">
    <input type="hidden" id="sPage">
    <input type="hidden" id="type" value="0">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox tBox4">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');">1:1문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');">상담예약</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');">모바일문의</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('customerCenter','oftenList');">자주하는질문</a></li>
                    </ul>
                </div>
                <br />
                <div class="inquiry_lnfo">
                    <img src="/common/zian/images/content/inquiry_img.jpg">
                    <ul>
                        <li>· 수강신청/결제</li>
                        <li>· 사이트이용</li>
                        <li>· 모바일이용</li>
                        <li>· 동영상재수강</li>
                        <li>· 모의고사</li>
                    </ul>
                </div>
                <div class="inquiry_tab">
                    <ul id="questionType">
                        <li class="active ml-n"><a href="#">전체</a></li>
                        <li><a href="#">회원관련</a></li>
                        <li><a href="#">수강신청관련</a></li>
                        <li><a href="#">동영상관련</a></li>
                        <li class="ml-n mb-n"><a href="#">모바일관련</a></li>
                        <li class="mb-n"><a href="#">결제·환불관련</a></li>
                        <li class="mb-n"><a href="#">교재·배송교환</a></li>
                        <li class="mb-n"><a href="#">기타문의</a></li>
                    </ul>
                </div>
                <div class="boardWrap">
                    <div class="boardSearch">
                        <select id="searchType" class="w90">
                            <option value="">선택</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <!--html 추가 및 수정-->
                        <input type="text" id="searchText" class="w240" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" >
                        <a href="javascript:fn_search('new');" class="btn_inline on w140 disnoneM">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('customerCenter','saveOften')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="tableBox">
                        <table class="list">
                            <caption></caption>
                            <colgroup>
                                <col class="w100">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                            </tr>
                            </thead>
                            <tbody id="dataList"></tbody>
                        </table>

                    </div>
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
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

