<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<script>
    var pcMobile = divisionPcMobile();
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            /* 동영상 */
            var userKey = sessionUserInfo.userKey;
            getVideoSignUp(userKey, pcMobile);//수강중인강좌 - 동영상 -과목 불러오기
            $("#playSubject li:eq(0)").addClass('active');
            $("#playSubject li").click(function () { // 과목메뉴 클릭시 class active 기능
                $(this).addClass('active').siblings().removeClass('active');
            });
            $("#playType li:eq(0)").addClass('active');
            $("#playType li").click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            /* 지안패스 */
            getZianPassSignUpList(userKey);

            var zianJkey = getInputTextValue("zianPassjKey");
            if (zianJkey != '') {
                zianPassTypeList(zianJkey);
            }

            var zianPassCtgKey = getInputTextValue("zianPassCtgKey");
            if (zianPassCtgKey != '') {
                zianPassLecTitleList(zianPassCtgKey);
            }
            var zainJlecKey  = getInputTextValue("zianPassjLecKey");
            if (zainJlecKey != '') {
                zianPassDetail(zainJlecKey);
            }

            $("#zianPassList li:eq(0)").addClass('active');
            $("#zianPassList li").click(function () { // 과목메뉴 클릭시 class active 기능
                $(this).addClass('active').siblings().removeClass('active');
            });
            $("#zianPassType li:eq(0)").addClass('active');
            $("#zianPassType li").click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            /* 학원실강 */
            getSignUpAcademyTypeList(userKey);
            var acaCtgKey = getInputTextValue("acaCtgKey");
            if(acaCtgKey != ''){
                academyLecList(acaCtgKey);
            }
            var acaGkey = getInputTextValue("acaGkey");
            if(acaGkey != ''){
                academyLecDetail(acaGkey);
            }
            $("#academyType li:eq(0)").addClass('active');
            $("#academyType li").click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            /* 일시정지 */
            getSignUpVideoLecturePauseTypeList(userKey);
            var pauseCtgKey = getInputTextValue("pauseCtgKey");
            if(pauseCtgKey != ''){
                pauseLecTitleList(pauseCtgKey);
            }
            var pauseJlecKey = getInputTextValue("pauseJlecKey");
            if(pauseJlecKey != ''){
                pauseLecDetail(pauseJlecKey);
            }
            $("#pauseType li:eq(0)").addClass('active');
            $("#pauseType li").click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            /* 수강완료 단과*/
            getSignUpVideoLectureEndTypeList(userKey, divisionPcMobile());
            var lecEndCtgKey = getInputTextValue("lecEndCtgKey");
            if(lecEndCtgKey != ''){
                lecEndTitleList(lecEndCtgKey);
            }
            var lecEndJlecKey = getInputTextValue("lecEndJlecKey");
            if(lecEndJlecKey != ''){
                lecEndDetail(lecEndJlecKey);
            }
            $("#lecEndType li:eq(0)").addClass('active');
            $("#lecEndType li").click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            /*수강완료 지안패스*/
            getZianPassEndList(userKey);

        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
    });

    //동영상 - 유형 - 강좌명 리스트
    function getPlaySubjectList(stepCtgKey) {
        $("#typeLectureList li").remove();
        var subjectCtgKey = getInputTextValue("subjectCtgKey");
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        getVideoSignUpLectureNameList(userKey, pcMobile, subjectCtgKey, stepCtgKey);
    }
    
    function playDepthList(subjectCtgKey) {
        innerValue("subjectCtgKey", subjectCtgKey);
        $("#typeLectureList li").remove();
        $("#playLecListDiv").hide();
        $("#playType li").addClass('active').siblings().removeClass('active');
        $("#playType li:eq(0)").addClass('active');
        changePlayLectureList(86942, pcMobile);
    }

    //동영상 - 유형 - 강좌리스트 - 강좌상세보기
    function getTypeLectureDetail(gkey, jlecKey) {
        var pcMobile = divisionPcMobile();
        var infoList = getVideoSignUpDetailInfo(gkey, pcMobile, jlecKey, 'dataList');
        if(infoList == null){
            $("#playLecListDiv").hide();
        }else{
            $("#playLecListDiv").show();
            var result = infoList.result;
            var lectureReviewBtn = "<a href='/review?page_gbn=lectureList&gKey=" + result.gkey + "' class='blue small'>수강후기</a>";
            innerValue("stopJlecKey", result.jlecKey);
            innerHTML("l_lectureReviewBtn", lectureReviewBtn);
            innerHTML("playLecName", result.name);
            innerHTML("playLecStartDate", result.startDate);
            innerHTML("playLecEndDate", result.endDate);
            innerHTML("limitDay", result.limitDay);
            innerHTML("PlayProgressRate", result.progressRateName);
            innerHTML("ctgName", result.ctgName);
            if(result.kind == 100){
                $("#pc").show();
                $("#mobile").hide();
            }else if(result.kind == 101){
                $("#pc").hide();
                $("#mobile").show();
            }else{
                $("#pc").show();
                $("#mobile").show();
            }
        }
    }

    //지안패스 > 유형 불러오기
    function zianPassTypeList(jkey) {
        $("#zianPassType li").remove();
        $("#zianPassLecList li").remove();
        innerValue("zianPassjKey", jkey);
        getSignUpZianPassTypeList(jkey, pcMobile);
        $("#zianPassType li:eq(0)").addClass('active');
        //$("#zianPassType li").addClass('active').siblings().removeClass('active');
    }

    function zianPassLecTitleList(ctgKey) {
        $("#zianPassLecList li").remove();
        $("#zianPassType li").click(function () {
            $(this).addClass('active').siblings().removeClass('active');
        });
        var jKey =  getInputTextValue("zianPassjKey");
        getSignUpZianPassSubjectNameList(jKey, pcMobile, ctgKey);
    }
    
    function zianPassDetail(jlecKey) {
        var pcMobile = divisionPcMobile();
        var infoList = getVideoSignUpDetailInfo("", pcMobile, jlecKey, 'zianPassDataList');
        if(infoList != null){
            $("#zianPassListDiv").show();
            var result = infoList.result;
            innerValue("stopZianJlecKey", result.jlecKey);
            innerHTML("zianPassName", result.name);
            innerHTML("zianPassLecStartDate", result.startDate);
            innerHTML("zianPassLecEndDate", result.endDate);
            innerHTML("zianPassLimitDay", result.limitDay);
            innerHTML("zianPassProgressRate", result.progressRateName);
            innerHTML("zianPassCtgName", result.ctgName);
            if(result.kind == 100){
                $("#zianPc").show();
                $("#zianPcMobile").hide();
            }else if(result.kind == 101){
                $("#zianPc").hide();
                $("#zianPcMobile").show();
            }else{
                $("#zianPc").show();
                $("#zianPcMobile").show();
            }
        }
        else{
            $("#zianPassListDiv").hide();
        }
    }

    //학원실강 유형 > 강의리스트 불러오기
    function academyLecList(ctgKey) {
        $("#acaLecList li").remove();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        getSignUpAcademySubjectNameList(userKey, ctgKey);
    }
    
    function academyLecDetail(gKey) {
        var result = getAcademyProductDetail(gKey);
        if(result != null){
            innerHTML("acaCtgName", result.ctgName);
            innerHTML("acaGoodsName", result.goodsName);
            innerHTML("acaLectureDate", result.lectureDate);
            innerHTML("acaLimitDay", result.limitDay);
        }
    }

    //일시정지 강좌리스트 불러오기
    function pauseLecTitleList(ctgKey) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        $("#pauseLecNameList li").remove();
        getSignUpVideoLecturePauseSubjectList(userKey, ctgKey);
    }

    //일시정지 강좌상세설명
    function pauseLecDetail(jlecKey) {
        var detailInfo = getOnlineVideoPauseListByJLecKey(jlecKey);
        if(detailInfo != null) {
            for (var i = 0; i < detailInfo.result.length; i++) {
                var selList = detailInfo.result[i];
                innerValue("stopEndjLecKey", selList.jlecKey);
                innerHTML("pauseCtgName", selList.ctgName);
                innerHTML("pauseLecName", selList.name);
                innerHTML("pauseLectureDate", selList.lectureDate);//수강기간
                innerHTML("pauseLimitDay", selList.limitDay);//수강일수
                innerHTML("pauseProgressRate", selList.progressRateName);//진도율
                innerHTML("pauseLectureDate1", selList.lectureDate);//기존수강기간
                innerHTML("pauseLimitDay1", selList.limitDay);//기존수강일수
                innerHTML("pauseChangeLectureDate", selList.changeLectureDate);//변경된수강기간
                innerHTML("pauseChangeLimitDay", selList.changeLimitDay);//변경된수강일수
                innerHTML("pauseCnt", selList.pauseCnt);
                innerHTML("pauseCnt1", selList.pauseCnt);
                innerHTML("pauseDay", selList.pauseDay);
                innerHTML("pauseDay1", selList.pauseDay);
                if(selList.kind == 100){
                    $("#pausePc").show();
                    $("#pauseMobile").hide();
                }else if(selList.kind == 101){
                    $("#pausePc").hide();
                    $("#pauseMobile").show();
                }else{
                    $("#pausePc").show();
                    $("#pauseMobile").show();
                }
            }
        }else{
            $("#pauseLecDiv").hide();
        }
    }
    
    function lecEndTitleList(ctgKey) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var deviceType = divisionPcMobile();
        $("#lecEndNameList li").remove();
        getSignUpVideoLectureEndSubjectList(userKey, ctgKey, deviceType);
    }
    
    function lecEndDetail(jlecKey) {
        var detailInfo = getSignUpVideoLectureEndInfo(jlecKey);
        if(detailInfo != null) {
            var selList = detailInfo.result;
            innerHTML("lecEndCtgName", selList.ctgName);
            innerHTML("lecEndName", selList.name);
            innerHTML("lecEndStartDate", selList.startDate);//수강기간
            innerHTML("lecEndDate", selList.endDate);//수강일수
            innerValue("priceKey", selList.priceKey);
            innerValue("gkey1", selList.gkey);

            //재수강 Y,N
            if(selList.retakeYn == 'N') $("#retake").hide();

            var kind = selList.kind;
            if (kind == 100) {
                $("#lecEndPC").show();
                $("#lecEndMobile").hide();
            } else if (kind == 101) {
                $("#lecEndPC").hide();
                $("#lecEndMobile").show();
            } else if (kind == 102) {
                $("#lecEndPC").show();
                $("#lecEndMobile").show();
            }
        }else{
            $("#lecEndDiv").hide();
        }
    }

    function goStop(val) {
        if(val == 'stop'){
            if(confirm("일시정지 신청 하시겠습니까?")){
                var stopJlecKey = getInputTextValue("stopJlecKey");
                var result = requestVideoStartStop(stopJlecKey, 10, 'STOP');
                if(result.resultCode == 200){
                    alert("일시정지 신청 완료");
                    return false;
                }else if(result.resultCode == 905){
                    alert("일시정지 횟수가 초과 되었습니다\n운영자에게 문의하시기 바랍니다.");
                    return false;
                }
            }
        }else if(val == 'pass'){
            if(confirm("일시정지 신청 하시겠습니까?")) {
                var stopZianJlecKey = getInputTextValue("stopZianJlecKey");
                var result = requestVideoStartStop(stopZianJlecKey, 10, 'STOP');
                if (result.resultCode == 200) {
                    alert("일시정지 신청 완료");
                    return false;
                }else if(result.resultCode == 905){
                    alert("일시정지 횟수가 초과 되었습니다\n운영자에게 문의하시기 바랍니다.");
                    return false;
                }
            }
        }else if(val == 'stopEnd'){
            var stopEndjLecKey = getInputTextValue("stopEndjLecKey");
            var result =  requestVideoStartStop(stopEndjLecKey, 10, 'START');
            if(result.resultCode == 200){
                $('#modal4').hide();
                //$('#overlay').css("","");
            }else if(result.resultCode == 905){
                alert("일시정지 해제 횟수가 초과 되었습니다\n운영자에게 문의하시기 바랍니다.");
                return false;
            }
        }
    }

    //장바구니
    function goBasket() {
        var reLecSel = getSelectboxValue("reLecSel");
        if(reLecSel == ''){
            alert("재수강 일수를 선택해 주세요.");
            return false;
        }
        var priceKey = getInputTextValue("priceKey");
        var gKey = getInputTextValue("gkey1");
        var extendDay = getSelectboxValue("reLecSel");
        var arr = new Array();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != undefined){
            var userKey = sessionUserInfo.userKey;
            var data = {
                userKey : userKey,
                gKey : gKey,
                priceKey : priceKey,
                gCount : 1,
                extendDay : extendDay
            };
            arr.push(data);
            var saveCartInfo = JSON.stringify(arr);
            var result = saveCartAtRetake(saveCartInfo);
            if(result.resultCode == 200){
                alert("장바구니에 담겼습니다.");
                return false;
            }
        }else{
            alert("로그인을 해주세요");
            goLoginPage();
        }
    }

    function zianPassGoBasket(gkey, priceKey) {
        var reLecSel = getSelectboxValue("zianPassReSel_"+gkey);

        if(reLecSel == ''){
            alert("재수강 일수를 선택해 주세요.");
            return false;
        }else{
            var extendDay = reLecSel * 30;
        }
        var arr = new Array();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != undefined){
            var userKey = sessionUserInfo.userKey;
            var data = {
                userKey : userKey,
                gKey : gkey,
                priceKey : priceKey,
                gCount : 1,
                extendDay : extendDay
            };
            arr.push(data);
            var saveCartInfo = JSON.stringify(arr);
            var result = saveCartAtRetake(saveCartInfo);
            if(result.resultCode == 200){
                alert("장바구니에 담겼습니다.");
                return false;
            }
        }else{
            alert("로그인을 해주세요");
            goLoginPage();
        }
    }
    
    function zianPassGoProductBuy(gkey, priceKey) {
        var reLecSel = getSelectboxValue("zianPassReSel_"+gkey);
        if(reLecSel == ''){
            alert("재수강 일수를 선택해 주세요.");
            return false;
        }else{
            var extendDay = reLecSel * 30;
        }
        var arr = new Array();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != undefined){
            var userKey = sessionUserInfo.userKey;
            var data = {
                userKey : userKey,
                gKey : gkey,
                priceKey : priceKey,
                gCount : 1,
                extendDay : extendDay
            };
            arr.push(data);
            var retakeInfo = JSON.stringify(arr);
            innerValue("retakeInfo", retakeInfo);
            $("#id_frm_singleMypage").attr("action", "/myPage?page_gbn=write");
            $("#id_frm_singleMypage").submit();
        }else{
            alert("로그인을 해주세요");
            goLoginPage();
        }
    }

    //바로구매
    function goProductBuy() {
        var reLecSel = getSelectboxValue("reLecSel");
        if(reLecSel == ''){
            alert("재수강 일수를 선택해 주세요.");
            return false;
        }
        var priceKey = getInputTextValue("priceKey");
        var gKey = getInputTextValue("gkey1");
        var extendDay = getSelectboxValue("reLecSel");
        var arr = new Array();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != undefined){
            var userKey = sessionUserInfo.userKey;
            var data = {
                userKey : userKey,
                gKey : gKey,
                priceKey : priceKey,
                gCount : 1,
                extendDay : extendDay
            };
            arr.push(data);
            var retakeInfo = JSON.stringify(arr);
            innerValue("retakeInfo", retakeInfo);
            $("#id_frm_singleMypage").attr("action", "/myPage?page_gbn=write");
            $("#id_frm_singleMypage").submit();
        }else{
            alert("로그인을 해주세요");
            goLoginPage();
        }
    }
</script>
<form action="/Player/Axis" id="id_frm_player" method="post" name="name_frm_player">
    <input id="vodPath" name="vodPath" type="hidden" value="" />
    <input id="vodTitle" name="vodTitle" type="hidden" value="" />
    <input id="starPlayerUrl" name="starPlayerUrl" type="hidden" value="" />
</form>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="retakeInfo" name="retakeInfo">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="subjectCtgKey">
    <input type="hidden" id="gKey">
    <input type="hidden" id="zianPassjKey" value="">
    <input type="hidden" id="zianPassCtgKey">
    <input type="hidden" id="zianPassjLecKey">
    <input type="hidden" id="acaCtgKey">
    <input type="hidden" id="acaGkey">
    <input type="hidden" id="pauseCtgKey">
    <input type="hidden" id="pauseJlecKey">
    <input type="hidden" id="lecEndCtgKey">
    <input type="hidden" id="lecEndJlecKey">

    <input type="hidden" id="stopJlecKey">
    <input type="hidden" id="stopZianJlecKey">
    <input type="hidden" id="stopEndjLecKey">
    <input type="hidden" id="priceKey">
    <input type="hidden" id="gkey1">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <div class="Mclass">
                    <!--서브 컨텐츠-->
                    <!--상단탭메뉴 -->
                    <div class="toptab_ctn">

                        <div class="tab_topContent tabContent">
                            <ul class="tabBar">
                                <li class="active"><a href="#">수강중</a></li>
                                <li><a href="#">일시정지</a></li>
                                <li><a href="#">수강완료(단과)</a></li>
                                <li><a href="#">수강완료(지안패스)</a></li>
                            </ul>
                            <!-- 수강중 -->
                            <div class="tabPage  active">
                                <a href="#modal1" class="btn_info btn_modalOpen">수강안내사항</a>
                                <!-- tab_large-->
                                <div class="tab_large">
                                    <div class="tab_large_1depth tabContent">
                                        <ul class="tabBar">
                                            <li class="active"><a href="#">동영상</a></li>
                                            <li><a href="#">지안패스</a></li>
                                            <li><a href="#">학원실강</a></li>
                                        </ul>

                                        <!-- 동영상 -->
                                        <div class="tabPage active">
                                            <!-- 동영상 하단 메뉴 tab_large_2dept-->
                                            <div class="tab_large_2depth tabContent">
                                                <ul class="tabBar playSubject" id="playSubject"></ul> <!-- 과목리스트 -->
                                                <!-- 한국사 -->
                                                <div class="tabPage active">
                                                    <div class="tabContent_2depth">
                                                        <p class="title">수강중인강좌</p>

                                                        <!-- Dropmenu -->
                                                        <div class="Dropmenu">
                                                            <div class="lfloat">
                                                                <p class="tit">유형</p>
                                                                <ul class="Droptab_wrap" id="playType"></ul>
                                                            </div>
                                                            <div style="float: left;width: 828px;min-height: 346px; border: 1px solid #e5e5e5;overflow: hidden;">
                                                                <p class="tit">강좌명</p>
                                                                <ul class="1depth-1" id="typeLectureList">

                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <!--//Dropmenu -->

                                                        <!--Dropmenu_down 상단 메뉴 클릭시 내용 드롭다운 -->
                                                        <div class="Dropmenu_down" id="playLecListDiv">
                                                            <!--inner-->
                                                            <div class="inner">
<%--                                                                <a href="" class="btn_modalClose">모달팝업닫기</a>--%>
                                                                <div class="btn_crud">
                                                                    <span class="black small" id="ctgName">단과특강</span>
                                                                    <a href="#modal3" class="btn_modalOpen">강좌설명</a>
                                                                    <span id="l_lectureReviewBtn"></span>
                                                                </div>

                                                                <div class="txt_area">
                                                                    <span class="bdbox" id="pc">PC</span>
                                                                    <span class="bdbox" id="mobile">모바일</span>
                                                                    <p class="thumb" id="playLecName"></p>
                                                                    <span class="date"><b>수강기간</b><span id="playLecStartDate"></span> ~ <span id="playLecEndDate"></span> (<span id="limitDay"></span>일)</span>
                                                                    <!--guide-->
                                                                    <div class="guide">
                                                                        <div class="play">
                                                                            <span>일시정지</span>
                                                                            <a href="javascript:goStop('stop');" class="replay off">신청</a>
                                                                        </div>
                                                                        <div class="prograss_wrap">
                                                                            <span class="text">진도율&nbsp;&nbsp; <span id="PlayProgressRate"></span></span>
                                                                        </div>
                                                                    </div>
                                                                    <!--//guide-->
                                                                </div>

                                                                <div class="tbd_02">
                                                                    <div class="crud_area">
                                                                        <span class="unit">강좌목차</span>
                                                                        <strong>총<span id="playLecTotalCnt"></span>강</strong>
                                                                    </div>
                                                                    <table>
                                                                        <caption>최근수강강좌</caption>
                                                                        <colgroup>
                                                                            <col></col>
                                                                            <col></col>
                                                                            <col></col>
                                                                            <col></col>
                                                                        </colgroup>
                                                                        <thead>
                                                                        <tr>
                                                                            <th>회차</th>
                                                                            <th>제목</th>
                                                                            <th>시간</th>
                                                                            <th>동영상</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody id="dataList"></tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <!--//inner-->
                                                        </div>
                                                        <!--//Dropmenu_down -->

                                                    </div>
                                                </div>
                                                <!-- //한국사 -->
                                            </div>
                                            <!-- //동영상 하단 메뉴tab_large_2dept -->
                                        </div>
                                        <!-- //동영상 -->

                                        <!-- 지안패스 -->
                                        <div class="tabPage">

                                            <!-- 지안패스 하단 메뉴 tab_large_2dept-->
                                            <div class="tab_large_2depth tabContent">
                                                <ul class="tabBar zian_mbtn" id="zianPassList">
<%--                                                    <li class="active"><a href="#">행정직9급 연간회원제용</a></li>--%>
<%--                                                    <li><a href="#">행정직9급 연간관리반용</a></li>--%>
                                                </ul>
                                                <!-- 2019 지안패스 행정직9급 연간회원제용 -->
                                                <div class="tabPage active">
                                                    <div class="tabContent_2depth">
                                                        <p class="title">수강중인강좌</p>
                                                        <!--Dropmenu -->
                                                        <div class="Dropmenu">
                                                            <div class="lfloat">
                                                                <p class="tit">유형</p>
                                                                <ul class="Droptab_wrap" id="zianPassType"></ul>
                                                            </div>
                                                            <div style="float: left;width: 828px;min-height: 346px; border: 1px solid #e5e5e5;overflow: hidden;">
                                                                <p class="tit">강좌명</p>
                                                                <ul class="2depth-1" id="zianPassLecList"></ul>
                                                            </div>
                                                        </div>
                                                        <!--//Dropmenu -->

                                                        <!--Dropmenu_down 상단 메뉴 클릭시 내용 드롭다운 -->
                                                        <div class="Dropmenu_down" id="zianPassListDiv">
                                                            <!--inner-->
                                                            <div class="inner">
<%--                                                                <a href="#" class="btn_modalClose">모달팝업닫기</a>--%>
                                                                <div class="btn_crud">
                                                                    <span class="black small" id="zianPassCtgName"></span>
                                                                    <a href="#modal3" class="btn_modalOpen">강좌설명</a>
                                                                </div>

                                                                <div class="txt_area">
                                                                    <span class="bdbox" id="zianPc">PC</span>
                                                                    <span class="bdbox" id="zianMobile">모바일</span>
                                                                    <p class="thumb" id="zianPassName"></p>
                                                                    <span class="date"><b>수강기간</b><span id="zianPassLecStartDate"></span> ~ <span id="zianPassLecEndDate"></span> (<span id="zianPassLimitDay"></span>일)</span>
                                                                    <!--guide-->
                                                                    <div class="guide">
                                                                        <div class="play">
                                                                            <span>일시정지</span>
                                                                            <a href="javascript:goStop('pass');" class="replay off">신청</a>
                                                                        </div>
                                                                        <div class="prograss_wrap">
                                                                            <span class="text">진도율&nbsp;<span id="zianPassProgressRate"></span></span>
							                   		    			</span>
                                                                        </div>
                                                                    </div>
                                                                    <!--//guide-->
                                                                </div>

                                                                <div class="tbd_02">
                                                                    <div class="crud_area">
                                                                        <span class="unit">강좌목차</span>
                                                                        <strong>총 <span id="zianPassTotalCnt"></span>강</strong>
                                                                    </div>
                                                                    <table>
                                                                        <caption>최근수강강좌</caption>
                                                                        <colgroup>
                                                                            <col></col>
                                                                            <col></col>
                                                                            <col></col>
                                                                            <col></col>
                                                                        </colgroup>
                                                                        <thead>
                                                                        <tr>
                                                                            <th>회차</th>
                                                                            <th>제목</th>
                                                                            <th>시간</th>
                                                                            <th>동영상</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody id="zianPassDataList"></tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <!--//inner-->
                                                        </div>
                                                        <!--//Dropmenu_down -->
                                                    </div>
                                                </div>
                                                <!-- //2019 지안패스 행정직9급 연간회원제용 -->

                                                <!-- 2020 지안패스 행정직9급 연간관리반용 -->
                                                <div class="tabPage">
                                                    <div class="tabContent_2depth">
                                                        <p class="title">2020 지안패스 행정직9급 연간관리반용</p>
                                                    </div>
                                                </div>
                                                <!-- //2020 지안패스 행정직9급 연간관리반용 -->

                                            </div>
                                            <!-- //지안패스 하단 메뉴tab_large_2dept -->

                                        </div>
                                        <!-- //지안패스 -->

                                        <!-- 학원실강 -->
                                        <div class="tabPage  ">
                                            <!-- 학원실강 하단 메뉴 tab_large_2dept-->
                                            <div class="tab_large_2depth tabContent">
                                                <div class="tabContent_2depth">
                                                    <p class="title etccpdt">수강중인강좌</p>

                                                    <!--Dropmenu -->
                                                    <div class="Dropmenu">
                                                        <div class="lfloat">
                                                            <p class="tit">유형</p>
                                                            <ul class="Droptab_wrap" id="academyType">
                                                            </ul>
                                                        </div>
                                                        <div style="float: left;width: 828px;min-height: 346px; border: 1px solid #e5e5e5;overflow: hidden;">
                                                            <p class="tit">강좌명</p>
                                                            <ul class="3depth-1" id="acaLecList">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!--//Dropmenu -->

                                                    <!--Dropmenu_down 상단 메뉴 클릭시 내용 드롭다운 -->
                                                    <div class="Dropmenu_down" id="acaDiv">
                                                        <!--inner-->
                                                        <div class="inner">
                                                            <div class="btn_crud">
                                                                <span class="black small" id="acaCtgName"></span>
                                                                <a href="#modal3" class="btn_modalOpen">강좌설명</a>
                                                            </div>

                                                            <div class="txt_area">
                                                                <p class="thumb" id="acaGoodsName"></p>
                                                                <span class="date"><b>수강기간</b><span id="acaLectureDate"></span> (<span id="acaLimitDay"></span>일)</span>
                                                            </div>
                                                        </div>
                                                        <!--//inner-->
                                                    </div>
                                                    <!--//Dropmenu_down -->
                                                </div>
                                            </div>
                                            <!-- //학원실강 하단 메뉴tab_large_2dept -->
                                        </div>
                                        <!-- //학원실강 -->

                                    </div>
                                </div>
                                <!-- //tab_large-->

                            </div>
                            <!-- // 수강중 -->

                            <!-- 일시정지 -->
                            <div class="tabPage">
                                <a href="#modal2" class="btn_info btn_modalOpen">일시정지안내</a>

                                <div class="tbd_01">
                                    <div class="tbd_top">
                                        <p class="stitle">일시정지 동영상 강좌</p>
                                        <span class="sub_text">원하시는 강의를 선택하여 일시정지 해제를 하시기 바랍니다.</span>
                                    </div>
                                </div>

                                <div class="tabContent_2depth mgt">
                                    <!--Dropmenu -->
                                    <div class="Dropmenu">
                                        <div class="lfloat">
                                            <p class="tit">유형</p>
                                            <ul class="Droptab_wrap" id="pauseType">
<%--                                                <li class="tab" data-tab="4depth-1"><a href="#aa">이론</a></li>--%>
<%--                                                <li class="tab" data-tab="4depth-2"><a href="#aa">모의고사</a></li>--%>
                                            </ul>
                                        </div>
                                        <div style="float: left;width: 828px;min-height: 346px; border: 1px solid #e5e5e5;overflow: hidden;">
                                            <p class="tit">강좌명</p>
                                            <ul class="4depth-1" id="pauseLecNameList">
<%--                                                <li><a href="">2020 시험대비 임찬호 한국사 단원별 홀수문항 기출문제풀이 강의</a></li>--%>
<%--                                                <li><a href="">2020 행정직대비 행정학 모의고사 문제풀이 강의</a></li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--//Dropmenu -->

                                    <!--Dropmenu_down 상단 메뉴 클릭시 내용 드롭다운 -->
                                    <div class="Dropmenu_down" id="pauseLecDiv">
                                        <!--inner-->
                                        <div class="inner">
                                            <div class="btn_crud">
                                                <span class="black small" id="pauseCtgName"></span>
                                                <a href="#modal3" class="btn_modalOpen">강좌설명</a>
                                            </div>

                                            <div class="txt_area">
                                                <span class="bdbox" id="pausePc">PC</span>
                                                <span class="bdbox" id="pauseMobile">모바일</span>
                                                <p class="thumb" id="pauseLecName"></p>
                                                <span class="date"><b>수강기간</b><span id="pauseLectureDate"></span> (<span id="pauseLimitDay"></span>일)</span>
                                                <!--guide-->
                                                <div class="guide">
                                                    <div class="play">
                                                        <span>일시정지</span>
                                                        <a href="#modal4" class="btn_modalOpen replay on">해제</a>
                                                        <a href="" class="replay off hidden">신청</a>
                                                    </div>
                                                    <div class="prograss_wrap">
                                                        <span class="text">진도율&nbsp;&nbsp; <span id="pauseProgressRate"></span></span>
			                   		    			</span>
                                                    </div>
                                                    <ul class="total_date">
                                                        <li><span>기존 수강기간</span><span id="pauseLectureDate1"></span> (<span id="pauseLimitDay1"></span>일)</li>
                                                        <li><span>변경된 수강기간</span><span id="pauseChangeLectureDate"></span> (<span id="pauseChangeLimitDay"></span>일)</li>
                                                    </ul>
                                                    <div class="total_count">
                                                        <p>중지신청수 : <span><span id="pauseCnt"></span>회사용 / 총 3회중</span></p>
                                                        <p>중지신청일수 : <span><span id="pauseDay"></span>일사용 / 총 60일중</span></p>
                                                    </div>
                                                </div>
                                                <!--//guide-->
                                            </div>
                                        </div>
                                        <!--//inner-->
                                    </div>
                                    <!--//Dropmenu_down -->

                                </div>

                            </div>
                            <!--// 일시정지 -->

                            <!-- 수강완료 -->
                            <div class="tabPage">
                                <a href="#modal5" class="btn_modalOpen btn_info">수강완료안내</a>

                                <div class="tbd_01">
                                    <div class="tbd_top">
                                        <p class="stitle">수강완료 동영상 강좌</p>
                                        <span class="sub_text">원하시는 강의를 선택하여 일시정지 해제를 하시기 바랍니다.</span>
                                    </div>
                                </div>

                                <div class="tabContent_2depth mgt">
                                    <!--Dropmenu -->
                                    <div class="Dropmenu">
                                        <div class="lfloat">
                                            <p class="tit">유형</p>
                                            <ul class="Droptab_wrap" id="lecEndType">
<%--                                                <li class="tab" data-tab="5depth-1" ><a href="#aa">이론</a></li>--%>
<%--                                                <li class="tab" data-tab="5depth-1"><a href="#aa">모의고사</a></li>--%>
                                            </ul>
                                        </div>
                                        <div style="float: left;width: 828px;min-height: 346px; border: 1px solid #e5e5e5;overflow: hidden;">
                                            <p class="tit">강좌명</p>
                                            <ul class="5depth-1" id="lecEndNameList"></ul>
                                        </div>
                                    </div>
                                    <!--//Dropmenu -->

                                    <!--Dropmenu_down 상단 메뉴 클릭시 내용 드롭다운 -->
                                    <div class="Dropmenu_down" id="lecEndDiv">
                                        <!--inner-->
                                        <div class="inner">
                                            <div class="btn_crud">
                                                <span class="black small" id="lecEndCtgName"></span>
                                                <a href="#modal3" class="btn_modalOpen">강좌설명</a>
                                            </div>

                                            <div class="txt_area">
                                                <span class="bdbox" id="lecEndPC">PC</span>
                                                <span class="bdbox" id="lecEndMobile">모바일</span>
<%--                                                <span class="bdbox" id="lecEndPcMobile">PC 모바일</span>--%>
                                                <p class="thumb" id="lecEndName"></p>
                                                <span class="date"><b>수강기간</b><span id="lecEndStartDate"></span><b>종료기간</b><span id="lecEndDate"></span></span>
                                                <div id="retake">
                                                    <!--guide-->
                                                    <div class="guide">
                                                        <span class="re_date">재수강신청</span>
                                                        <!-- edusup_multi -->
                                                        <div class="edusup_multi">
                                                            <select style="width: 100px;" id="reLecSel">
                                                                <option value="">선택</option>
                                                                <option value="0">전체</option>
                                                                <option value="10">10일</option>
                                                                <option value="20">20일</option>
                                                                <option value="30">30일</option>
                                                            </select>
                                                        </div>
                                                        <!-- //edusup_multi -->
                                                    </div>
                                                    <!--//guide-->
                                                    <div class="btn_cart_wrap">
                                                        <a href="javascript:goBasket();"  class="cart">장바구니</a>
                                                        <a href="javascript:goProductBuy();"  class="buying">바로구매</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--//inner-->
                                    </div>
                                    <!--//Dropmenu_down -->
                                </div>
                            </div>
                            <!-- //수강완료 단과 -->
                            <!--수강완료 지안패스-->
                            <div class="tabPage">
                                <a href="#modal5" class="btn_modalOpen btn_info">수강완료안내</a>
                                <div class="tabContent_2depth mgt" id="zianPassEndDiv"></div>
                            </div>
                            <!--수강완료 지안패스-->
                        </div>
                    </div>
                    <!--//상단탭메뉴 -->
                    <!--//서브 컨텐츠-->
                </div>
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
    <!--팝업 수강안내사항 modal1-->
    <div id="modal1" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>수강안내사항</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle">동영상 수강안내</p>
                    <span class="txtBox">최초 신청시 강의대기 기간은 30일 이내 자유롭게 수강 시작할 수 있습니다 (지안패스 제외) </span>
                </div>
                <div class="pop_cont">
                    <p class="stitle">동영상 상품 환불을 원하실 경우 다음과 같이 환불 처리됩니다</p>
                    <span class="txtBox">
           			이용 시간 기준의 원격 학습에 의한 수강의 경우 (기간제 정액상품, 지안패스, 패키지 강좌 등의 경우)<br>
					총 강좌금액 - (강좌 정가 금액의 1일 이용대금 X 기 이용일 수 (강좌 구매일 기준))
					<br><br>
					학습회차 기준의 원격학습에 의한 수강의 경우 (회사는 학습회차 기준의 원격학습인 경우) <br>
					전체 강좌 수에서 실제수강(다운로드)한 강좌수를 공제<br>
					(강좌정가금액 / 강의구성수 X 학습강의수<br>
					365지안패스 상품의 교재 환불은 유무선을 통하여 환불요청하시고 교재를 반송, 도착하면 <br>상태확인 후 훼손시 교재비 차감 후 환불처리 됩니다
					<br><br>
					수강후기 (강좌수강중일때 목차 내 하단회원리뷰)를 남기시면 1회에 한해 수강기간이 3일 연장됩니다.<br>
					(단, 종강후 리뷰 / 같은과목 리뷰 / 일시정지 상태에서 리뷰 / 지안패스 는 연장되지 않습니다)
					<br><br>
					일시정지 (휴강)는 총 3회 가능하며, 일시정지일 수 총합은 60일을 넘지 못합니다.<br>(지안패스 제외)<br>
					재수강 및 기간연장은 수강종료일로부터 90일 이내에만 가능하며, 폐강된 동영상 강좌의 <br>경우 수강이 불가하오니 참고해 주시기 바랍니다.<br>
					지안패스 상품은 기간제 상품으로 수강일시정지가 불가능합니다
           		</span>
                </div>
                <div class="pop_cont">
                    <p class="stitle">학원 수강안내</p>
                    <span class="txtBox">
           			온라인으로 결제하신 학원실강 수강내역을 확인가능합니다.<br>
					복습강의는 학원 수강증을 지참하신 후 학원 데스크에서 신청이 가능합니다.
           		</span>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->

    <!--팝업 일시정지안내 modal2-->
    <div id="modal2" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>일시정지안내</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle">일시정지 강좌 안내</p>
                    <span class="txtBox">회원님의 일시정지 강좌내역 입니다.<br>
				일시정지를 미리 해제하시려면 [일시정지] 해제버튼을 클릭하세요. <br>
				일시정지는 최대 3회까지 할 수 있으며, 중지일수는 총 합이 60일을 초과할 수 없습니다.<br>
				이시정지 기간이 지나면 별도로 일시정지 해제를 하지 않아도 자동으로 해제됩니다.
				</span>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->

    <!--팝업 강좌설명 modal3-->
    <div id="modal3" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>강좌설명</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
	            <span class="txtBox">
	            지안에듀 동영상 강의는 실강을 촬영하여 편집 후 처리되는 시간이 있어<br>
				실강이후 2~3일 뒤에  동영상 강의가 업데이트 됩니다.<br>
				(휴일 공휴일 제외하고 2~3일 소요)
				<br><br>
				메뉴 패키지 > 자유패키지 에서 결제하실 경우 10% 추가할인이 가능합니다<br>
				두개 이상의 단과를 들으실 회원분들께서는 참고 하시길 바립니다.
				<br><br>
				PC (VOD) 강의는 2.2배수로 제한되며 강의시간 X 2.2 =  재생시간 으로 제한됩니다.<br>
				모바일은 무제한 시청이 가능하지만 1대 고정으로 이용이 제한됩니다.<br>
				VOD 배수 시스템에 대해서는 <a href="" class="text_red">이곳</a>을 클릭하셔서 자세한 사항을 확인하시길 바립니다.
				<br><br>
				지안패스 상품의 경우는 PC 1 + 모바일 1 대로 무제한 시청이 가능합니다.
				<br><br>
				<a href="" class="text_red">2.2 배수 시스템 안내 바로가기 클릭 ▶</a>
				<br><br><br>
				※ 단 사용자가 불법내역이 있다고 판달될때 지안에듀 배수시스템을 1회 초기화 해드리고 있습니다.<br>
				정상 이용자분들 께서는 2.2배수 이외 복습이 더 필요할 경우 지안에듀 1:1 문의 또는 연락을 주시면<br> 1회 초기화가 가능합니다.
				<br><br>
				PC본체에 캡쳐보드가 설치
               되어 있거나 빔프로젝터를 활용하시는 회원분들<br>
				노트북을 사용하시는 회원분 중 화면을 그래픽포트(HDMI등)로 출력되는 모니터나 TV 화면을<br> 사용하시는 경우 현재 플레이어 보안문제로 차단되시게 되니 참고부탁드립니다.

				</span>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->


    <!--팝업 알림 modal4-->
    <div id="modal4" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>알림</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle">일시정지를 해제 하시겠습니까?</p>
                    <div class="btn_crud">
                        <a href="javascript:goStop('stopEnd')" class="btn_confirm">확인</a>
                        <a href="" class="btn_cancel">취소</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->

    <!--팝업수강완료안내  modal5-->
    <div id="modal5" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>수강완료안내</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle">수강완료 강좌 안내</p>
                    <span class="txtBox">원님의 수강 완료된 강좌내역 입니다.<br>
				재수강은 재수강이 가능한 상품만 선택 기간이 출력됩니다. (신청당시 판매중인 상품만 가능)<br>
				재수강은 단과 상품만 가능합니다.<br>
				재수강은 강의 종료일부터 90이내 신청 가능 하십니다.
			    </span>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->


    <!--수강중인강좌 : 강좌 일시 정지안내  modal6-->
    <div id="modal6" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>수강중인 강좌</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont bggray">
                    <p class="stitle">강좌 일시 정지안내</p>
                    <span class="txtBox">일시정지의 경우 강좌당 3회만 신청가능하며<br>
				일시정지 기간은 최소 1일에서 최대 60일까지 선택 가능합니다<br>
				일시정지는 신청 후 바로 적용됩니다.<br>
				강의 종료일에는 신청하실 수 없습니다.<br>
				일시정지를 신청하시면 신청하신 기간동안 강의 수강이 불가능 합니다.
				</span>
                </div>
                <div class="pop_cont">
                    <table>
                        <tbody>
                        <tr>
                            <th>강좌명</th>
                            <td><span style="font-weight:bold">2020 시험대비 얼리버드 조재권 기초영어 특강 [5%적립]</span></td>
                        </tr>
                        <tr>
                            <th>현재 수강기간</th>
                            <td>2019.05.15 ~ 2091.08.25</td>
                        </tr>
                        <tr>
                            <th>일시정지 일수 선택</th>
                            <td><span>회원님의 일시정지 가능일 수는 [<strong></strong>] 입니다</span>
                                <!-- edusup_multi -->
                                <div class="edusup_multi">
                                    <ul>
                                        <li class="sub_cont">
                                            <a href="#" class="normal">
                                                <span>정지일수 선택</span>
                                            </a>
                                            <select>
                                                <option value="">전체</option>
                                                <option value="">10일</option>
                                                <option value="">20일</option>
                                                <option value="">30일</option>
                                            </select>
<%--                                            <ul class="edusup_multi_layer">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#">전체</a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="#">10일</a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="#">20일</a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="#">30일</a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
                                        </li>
                                    </ul>
                                </div>
                                <!-- //edusup_multi -->
                            </td>
                        </tr>
                        <tr>
                            <th>일시정지 일수 선택</th>
                            <td>
                                <span class="date">2019.05.15 ~ 2091.08.25</span>
                                <span>(정지일수를 선택하시면 자동으로 일시정지 기간이 표시 됩니다)</span>
                            </td>
                        </tr>
                        <tr>
                            <th>변경 수강기간</th>
                            <td>
                                <span class="date">2019.05.15 ~ 2091.08.25</span>
                                <span>(정지일수를 선택하시면 자동으로 일시정지 기간이 표시 됩니다)</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal_btn_box">
                    <a href="" class="confirm_btn">확인</a>
                    <a href="" class="caencel_btn">취소</a>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->
</form>
</body>
</html>
