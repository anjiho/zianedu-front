<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        fn_search('new');
    });

    //유형별 가져오기
    function fn_search2(val){
        gfn_display("allDiv", false);
        $("#typeVideoList").empty();
        var sPage = getInputTextValue("sPage2");
        var ctgKey = getFreeLectureCtgKey();
        if(val == "new") sPage = "1";

        var stepCtgKey = getInputTextValue("stepCtgKey");
        getFreeVideoLectureListFromCategoryMenu2(ctgKey, sPage, 9, stepCtgKey, 'THEORY', 'typeVideoList');
    }
    
    function setStepCtgKey(val) {
        innerValue("stepCtgKey", val);
        fn_search2('new');
    }

    //전체 가져오기
    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var ctgKey = getFreeLectureCtgKey();
        if(val == "new") sPage = "1";
        getFreeVideoLectureListFromCategoryMenu(ctgKey, sPage, 9, 0, 'THEORY', 'allList');
    }
    
    function goDetailVideo(lecKey) {
        innerValue("lecKey", lecKey);
        goPage("freeLecture", "detailTheory");
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="lecKey" id="lecKey">
    <input type="hidden" id="stepCtgKey">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="free">
                    <div class="tab_topContent tabContent">
                        <ul class="tabBox tBox2">
                            <li class="active"><a href="javascript:void(0);">이론</a></li>
                            <li><a href="javascript:goPageNoSubmit('freeLecture', 'examQuestion')">기출풀이</a></li>
                        </ul>
                        <!-- 이론 -->
                        <div class="tabPage">
                            <!-- 검색결과 나열 -->
                            <div class="tab_topContent tabContent">
                                <div class="search_result">
                                    <p>총 <span id="lecCnt"></span>의 무료강좌가 있습니다</p>
                                </div>

                                <ul class="tabBar freetab" id="typeList">
                                    <li class="rgreen" id="test" onclick="setStepCtgKey(203)"><a href='javascript:void(0);'>이론</a></li>
                                    <li class="rsky" id="207" onclick="setStepCtgKey(207)"><a href="javascript:void(0);" >단과특강</a></li>
                                    <li class="rblue" onclick="setStepCtgKey(774)"><a href="javascript:void(0);">아침특강</a></li>
                                    <li class="rblue" onclick="setStepCtgKey(4172)"><a href="javascript:void(0);" >필기대비</a></li>
                                </ul>
<%--                                <br><br>--%>
                                <!-- 이론 -->
                                <div class="tabPage active">
                                    <div class="myarea_list_wrap" id="allDiv">
                                        <ul class="list" id="allList">
                                        </ul>
                                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                                    </div>
                                </div>
                                <div class="active">
                                    <div class="myarea_list_wrap" id="typeVideoWrap">
                                        <ul class="list" id="typeVideoList">
                                        </ul>
                                        <%@ include file="/common/inc/com_pageNavi2.inc" %>
                                    </div>
                                </div>
                            </div>
                            <!-- //검색결과 나열 -->
                        </div>
                        <!--//이론 -->
                    </div>
                </div>
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <!--하단-->
        <%@include file="/common/jsp/footer.jsp" %>
        <!--//하단-->
        <!--우측따라다니는영역-->
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <!--//우측따라다니는영역-->
        <!--하단고정식배너-->
        <%@include file="/common/jsp/footerBanner.jsp" %>
        <!--//하단고정식배너-->
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
