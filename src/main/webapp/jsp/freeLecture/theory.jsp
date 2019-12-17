<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var ctgKey = getFreeLectureCtgKey();
        getFreeVideoLectureListFromCategoryMenu(ctgKey, 1, 10, 0, 'THEORY', 'allList');
    });
    //학원별 이론 상품 가져오기
    function getFreeVideoListForm(stepCtgKey) {
        gfn_display("allDiv", false);
        $("#typeVideoList").empty();
        $("#oneLecList").empty();
        $("#morning").empty();
        $("#examList").empty();
        var ctgKey = getFreeLectureCtgKey();
        var tagId = "";
        if(stepCtgKey == 203) tagId = 'typeVideoList';
        else if(stepCtgKey == 207) tagId = 'oneLecList';
        else if(stepCtgKey == 774) tagId = 'morning';
        else if(stepCtgKey == 4172) tagId = 'examList'; //필기대비 수정 필요
        getFreeVideoLectureListFromCategoryMenu(ctgKey, 1, 10, stepCtgKey, 'THEORY', tagId);
    }
    
    function goDetailVideo(lecKey) {
        innerValue("lecKey", lecKey);
        goPage("freeLecture", "detailTheory");
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="lecKey" id="lecKey">
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
                            <li><a href="javascript:goPage('freeLecture', 'examQuestion')">기출풀이</a></li>
                        </ul>
                        <!-- 이론 -->
                        <div class="tabPage">
                            <!-- 검색결과 나열 -->
                            <div class="tab_topContent tabContent">
                                <div class="search_result">
                                    <p>총 <span id="lecCnt"></span>의 무료강좌가 있습니다</p>
                                </div>

                                <ul class="tabBar freetab" id="typeList" style="width: 526px;">
                                    <li class="rgreen" onclick="getFreeVideoListForm(203)"><a href='javascript:void(0);'>이론</a></li>
                                    <li class="rsky" onclick="getFreeVideoListForm(207)"><a href="javascript:void(0);" >단과특강</a></li>
                                    <li class="rblue" onclick="getFreeVideoListForm(774)"><a href="javascript:void(0);">아침특강</a></li>
                                    <li class="rblue" onclick="getFreeVideoListForm(4172)"><a href="javascript:void(0);" >필기대비</a></li>
                                </ul>
                                <br><br>
                                <!-- 이론 -->
                                <div class="myarea_list_wrap" id="allDiv">
                                    <ul class="list" id="allList">
                                    </ul>
                                    <!-- paging -->
                                </div>
                                <div class="tabPage active">
                                    <div class="myarea_list_wrap">
                                        <ul class="list" id="typeVideoList">
                                        </ul>
                                        <!-- paging -->
                                    </div>
                                </div>
                                <!-- 단과특강 -->
                                <div class="tabPage">
                                    <div class="myarea_list_wrap">
                                        <ul class="list" id="oneLecList">
                                        </ul>
                                    </div>
                                </div>
                                <!-- 아침특강 -->
                                <div class="tabPage">
                                    <div class="myarea_list_wrap">
                                        <ul class="list" id="morning">
                                        </ul>
                                    </div>
                                </div>
                                <!-- 필기대비 -->
                                <div class="tabPage">
                                    <div class="myarea_list_wrap">
                                        <ul class="list" id="examList">
                                        </ul>
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
