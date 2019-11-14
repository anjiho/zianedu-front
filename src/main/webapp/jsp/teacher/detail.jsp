<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String teacherKey = request.getParameter("teacherKey");
    String reqKey = request.getParameter("reqKey");
%>
<style>
    .video-container {position: relative;padding-bottom: 56.25%;height: 0;overflow: hidden;}
    .video-container iframe,.video-container object,.video-container embed{position: absolute; top:0; left:0; width:100%; height: 100%}
</style>
<script>
    var teacherKey = '<%=teacherKey%>';
    var menuCtgKey = '<%=reqKey%>';

    $( document ).ready(function() {
        var pcMobile = divisionPcMobile();
        if(pcMobile == 'pc') pcMobile = 1;
        else if(pcMobile == 'mobile') pcMobile = 3;

        getTeacherHomeInfo(teacherKey, pcMobile , menuCtgKey, 10);//홈정보
        getTeacherNameSubjectName(teacherKey, menuCtgKey);//과목, 선생님명 불러오기
        getTeacherCurriculum(teacherKey, pcMobile, menuCtgKey);//커리큘럼 불러오기
        getTeacherVideoLecture(teacherKey, pcMobile, 0);//강좌소개 (동영상) 리스트 불러오기
        getTeacherAcademyLecture(teacherKey, 0);//강좌소개 (학원) 리스트 불러오기


        fn_search1('new');//학습안내 (학습공지) 리스트 불러오기
        fn_search('new');//학습안내 (학습자료실) 리스트 불러오기

        $("#referenceList").show();
        //$("#noticeList").show();

        innerValue("divisionList", 0);

        innerHTML("selOnlineCount", 0);
        innerHTML("selAcaCount", 0);
        $("input[name=selProduct]").click(function(index){//체크박스 카운트 처리(학습자료실)
            var count = $("input[name=selProduct]:checkbox:checked").length;
            innerHTML("selOnlineCount", count);
        });
        $("input[name=selAcaProduct]").click(function(index){//체크박스 카운트 처리(학습공지)
            var count = $("input[name=selAcaProduct]:checkbox:checked").length;
            innerHTML("selAcaCount", count);
        });
        $("#noticeBtn").click(function () {
            $("#referenceDetail").hide();
            $("#referenceList").hide();
            $("#noticeList").show();
            innerValue("divisionList", 1);
        });
        $("#referBtn").click(function () {
            $("#referenceList").show();
            $("#noticeList").hide();
            $("#referenceDetail").hide();
            innerValue("divisionList", 0);
        });
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType1 = getSelectboxValue("searchType1");
        var searchText1 = getInputTextValue("searchText1");
        if(searchType1 == undefined) searchType1 = "";
        if(searchText1 == undefined) searchText1 = "";

        if(val == "new") sPage = "1";

        getTeacherReferenceRoom(teacherKey, sPage, 10, searchType1,  searchText1, 0, 'dataList');//학습안내 (학습자료실) 리스트 불러오기
    }

    function fn_search1(val) {
        var sPage2 = getInputTextValue("sPage2");
        var searchType2 = getSelectboxValue("searchType2");
        var searchText2 = getInputTextValue("searchText2");
        if(searchType2 == undefined) searchType2 = "";
        if(searchText2 == undefined) searchText2 = "";

        if(val == "new") sPage2 = "1";

        getTeacherReferenceRoom(teacherKey, sPage2, 10, searchType2,  searchText2, 1, 'dataList2');//학습안내 (학습자료실) 리스트 불러오기
    }

    //학습안내 - 학습자료실 상세보기
    function goDetailReference(bbsKey) {
        var detailInfo = getTeacherReferenceRoomDetail(teacherKey, bbsKey);
        $("#referenceDetail").show();
        $("#referenceList").hide();
        $("#noticeList").hide();
        if(detailInfo != undefined){
            var referenceInfo = detailInfo.result.referenceRoomDetailInfo;
            var prevNextBbsList = detailInfo.result.prevNextBbsList;
            innerHTML("referenceTitle",referenceInfo.title);
            innerHTML("referenceIndate",referenceInfo.indate);
            innerHTML("referenceCount",referenceInfo.readCount);
            innerHTML("referenceWriter",referenceInfo.userName);
            innerHTML("referenceUserId",referenceInfo.userId);

            var detailInfoStr = JSON.stringify(detailInfo);
            var detailInfoStrObj = JSON.parse(detailInfoStr);
            var contentsObj = detailInfoStrObj.result.referenceRoomDetailInfo.contents;
            var contentsStr = JSON.stringify(contentsObj);
            var contentsStrRep = contentsStr.replace(/['"]+/g, '');
            var contentsStrRep3 = contentsStrRep.replace(/\\n/g,'');   //역슬러쉬 제거하기
            var contentsStrRep4 = contentsStrRep3.replace(/\\r/g,'');   //역슬러쉬 제거하기
            var contentsStrRep5 = contentsStrRep4.replace(/\\/gi, "");   //역슬러쉬 제거하기
            var contentsHTML = $.parseHTML(contentsStrRep5);
            var contents = null;
            var findString = "&lt";
            //HTML 포함 여부 화인
            if(detailInfoStr.indexOf(findString) != -1) {
                contents = contentsHTML[0].data.replace("rn", "");
            } else {
                contents = contentsHTML;
            }
            //봄문 내용 파징작업 끝
            innerHTML("referenceContent", contents);


            for(var i = 0;  i < prevNextBbsList.length; i++){ /* 이전글 다음글 기능 */
                innerHTML("referenceNextTitle",prevNextBbsList[i].nextTitle);
                innerHTML("referencePrevTitle",prevNextBbsList[i].prevTitle);
                $("#referenceNextLink").attr("href", "javascript:goReferenceDetailPage("+ prevNextBbsList[i].nextBbsKey +");");
                $("#referencePrevLink").attr("href", "javascript:goReferenceDetailPage("+ prevNextBbsList[i].prevBbsKey +");");
            }
        }
    }

    function goReferenceDetailPage(bbskey) {
        //goDetailReference(bbsKey);
    }

    function goReferenceList(){
        var val = getInputTextValue("divisionList");

        if(val == 0){
            $("#referenceDetail").hide();
            $("#referenceList").show();
        }else {
            $("#referenceDetail").hide();
            $("#noticeList").show();
        }
    }

    //단일 장바구니 이동
    function goShopBasket(gkey, priceKey) {
        //체크박스 체크 안되어있을경우 예외처리 해야함
        var list = new Array();
        var data = {
            gkey : gkey,
            priceKey : priceKey
        };
       list.push(data);
       console.log(list);
    }

    //단일 바로구매
    function goBuy(gkey, priceKey) {

    }

    //체크박스 장바구니 담기
    function goCheckedShopBasket(val) {
        var chkId = '';
        if(val == 'online') chkId = 'selProduct';
        else if(val == 'aca') chkId = 'selAcaProduct';

        var arr = new Array();
        $('input[name="'+ chkId +'"]:checked').each(function() {
            var priceKey = $(this).attr('id');
            var gkey = $(this).val();
            var data = {
                gkey : gkey,
                priceKey : priceKey
            };
            arr.push(data);
        });
        console.log(arr);
    }

    function goCheckedBuy() {

    }


</script>
<form action="/Player/Axis" id="id_frm_player" method="post" name="name_frm_player">
<%--    <input id="a_lPlayer_JLecKey" name="a_lPlayer_JLecKey" type="hidden" value="" />--%>
<%--    <input id="a_lPlayer_CurriKey" name="a_lPlayer_CurriKey" type="hidden" value="" />--%>
<%--    <input id="a_strPlayer_FilePath" name="a_strPlayer_FilePath" type="hidden" value="" />--%>
<%--    <input id="a_strPlayer_Title" name="a_strPlayer_Title" type="hidden" value="" />--%>
<%--    <input id="a_bPlayer_High" name="a_bPlayer_High" type="hidden" value="" />--%>
    <input id="starPlayerUrl" name="starPlayerUrl" type="hidden" value="" />
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="divisionList">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="javascript:goPage('publicOnline', 'main')"><img src="/common/zian/images/common/logo01.png" alt="지안에듀 행정직"> 온라인</a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="deaph1 cols7">
                        <li><a href="#">내강의실</a>
                            <ul class="deaph2">
                                <li><a href="#">수강중</a></li>
                                <li><a href="#">일시정지</a></li>
                                <li><a href="#">수강완료</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">지안패스</a></li>
                        <li><a href="#">무료강좌</a>
                            <ul class="deaph2">
                                <li><a href="#">이론</a></li>
                                <li><a href="#">기출풀이</a></li>
                            </ul>
                        </li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a>
                            <ul class="deaph2">
                                <li><a href="#">합격영상</a></li>
                                <li><a href="#">합겨수기</a></li>
                                <li><a href="#">수강후기</a></li>
                                <li><a href="#">도서후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--//주메뉴-->
        </div>
        <!--//상단-->

        <!--본문-->
        <div id="container">

            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="teacherView">
                    <div class="teacherInfo">
                        <div class="thumb">
                            <img src="" alt="" id="teacherImg">
                            <a href="javascript:goPage('teacher','main')" class="btn_teacherThumb">교수님 리스트</a>
                        </div>
                        <div class="info">
                            <span class="category" id="subject"></span>
                            <span class="name"><b id="teacherName"></b> 교수님</span>
<%--                            <span class="infoText">쉽고 재미있는, 공무원 국어마스터</span>--%>
                            <dl class="profile">
                                <dt>약력</dt>
                                <dd id="history"></dd>
                            </dl>
                            <div class="teacherInfoTab tabContent">
                                <ul class="tabBar">
                                    <li class="active" style="width:340px;"><a href="#">OT영상</a></li>
                                </ul>
                                <div class="tabPage active">
                                    <div class="otMovie video-container" id="youtube"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="teacherContentsTab tabContent">
                        <ul class="tabBar">
                            <li><a href="#">커리큘럼</a></li>
                            <li><a href="#">강좌소개</a></li>
                            <li><a href="#">학습안내</a></li>
                            <li><a href="#">학습 Q&A</a></li>
                        </ul>
                        <div class="tabPage active"><!--커리큘럼 tab-->
                            <div class="tab_curriculum">
                                <span id="curriculum"></span>
                            </div>
                        </div>
                        <div class="tabPage"><!-- 강좌소개 tab -->
                            <div class="tab_lecture">
                                <div class="tabContent">
                                    <ul class="tabBar tabLecture">
                                        <li class="active"><a href="">동영상</a></li>
                                        <li><a href="">학원</a></li>
                                    </ul>
                                    <!-- 동영상 -->
                                    <div class="tabPage active">
                                        <div class="typeSelect"></div>
                                        <form>
                                            <div class="lectureWrap">
                                                <ul class="lectureTotal">
                                                    <li class="left"></li>
                                                    <li class="right">
                                                        선택한 항목 <span class="colorRed" id="selOnlineCount"></span>개를
                                                        <a href="javascript:goCheckedShopBasket('online');" class="btn_m">장바구니 담기</a>
                                                        <a href="javascript:goCheckedBuy();" class="btn_m on w120">바로구매</a>
                                                    </li>
                                                </ul>
                                                <ul class="lectureHead">
                                                    <li class="w15p">유형</li>
                                                    <li class="w45p">강좌명</li>
                                                    <li class="w40p">수강료</li>
                                                </ul>
                                                <div class="lectureBody" id="lecOnlineBody"></div> <!-- 동영상 강좌 리스트 -->
                                            </div>
                                        </form>
                                    </div>
                                    <!-- 학원 -->
                                    <div class="tabPage">
                                        <div class="typeSelect"></div>
                                        <form>
                                            <div class="lectureWrap">
                                                <ul class="lectureTotal">
                                                    <li class="left"></li>
                                                    <li class="right">
                                                        선택한 항목 <span class="colorRed" id="selAcaCount"></span>개를
                                                        <a href="javascript:goCheckedShopBasket('aca');" class="btn_m">장바구니 담기</a>
                                                        <a href="#" class="btn_m on w120">바로구매</a>
                                                    </li>
                                                </ul>
                                                <ul class="lectureHead">
                                                    <li class="w15p">유형</li>
                                                    <li class="w45p">강좌명</li>
                                                    <li class="w40p">수강료</li>
                                                </ul>
                                                <div class="lectureBody" id="lecAcaBody"></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tabPage"><!--학습안내-->
                            <div class="tab_learning">
                                <div class="tabContent">
                                    <ul class="tabBar tabLecture">
                                        <li class="active"><a href="#" id="referBtn">학습자료실</a></li>
                                        <li><a href="#" id="noticeBtn">학습공지</a></li>
                                    </ul>
                                    <!-- 학습자료실 -->
                                    <div class="tabPage" id="referenceList" style="display: none">
                                        <input type="hidden" id="sPage">
                                        <form>
                                            <ul class="searchArea">
                                                <li class="left">
                                                    <select id="searchType1">
                                                        <option value="title">제목</option>
                                                    </select>
                                                    <input type="text" id="searchText1" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" >
                                                    <a href="javascript:fn_search('new');" class="btn_m on">검색</a>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table class="list">
                                                <colgroup>
                                                    <col class="w10p">
                                                    <col class="w50p">
                                                    <col class="w10p">
                                                    <col class="w20p">
                                                    <col class="w10p">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="row" style="text-align:center">유형</th>
                                                    <th scope="row" style="text-align:center">제목</th>
                                                    <th scope="row" style="text-align:center">작성자</th>
                                                    <th scope="row" style="text-align:center">등록일</th>
                                                    <th scope="row" style="text-align:center">조회</th>
                                                </tr>
                                                </thead>
                                                <tbody id="dataList"></tbody>
                                            </table>
                                        </div>
                                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                                    </div>
                                    <!-- 학습공지 -->
                                    <div class="tabPage" id="noticeList" style="display: none">
                                        <form>
                                            <input type="hidden" id="sPage2">
                                            <ul class="searchArea">
                                                <li class="left">
                                                    <select  id="searchType2">
                                                        <option value="title">제목</option>
                                                    </select>
                                                    <input type="text"  id="searchText2" onkeypress="if(event.keyCode==13) {fn_search1('new'); return false;}">
                                                    <a href="javascript:fn_search1('new');" class="btn_m on">검색</a>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table class="list">
                                                <colgroup>
                                                    <col class="w10p">
                                                    <col class="w50p">
                                                    <col class="w10p">
                                                    <col class="w20p">
                                                    <col class="w10p">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="row" style="text-align:center">유형</th>
                                                    <th scope="row" style="text-align:center">제목</th>
                                                    <th scope="row" style="text-align:center">작성자</th>
                                                    <th scope="row" style="text-align:center">등록일</th>
                                                    <th scope="row" style="text-align:center">조회</th>
                                                </tr>
                                                </thead>
                                                <tbody id="dataList2"></tbody>
                                            </table>
                                        </div>
                                        <%@ include file="/common/inc/com_pageNavi2.inc" %>
                                    </div>

                                    <!-- 학습자료실 상세 시작-->
                                    <div class="" id="referenceDetail" style="display: none;">
                                        <br>
                                        <br>
                                        <div class="tableBox">
                                            <table class="view">
                                                <colgroup>
                                                    <col class="w80p">
                                                    <col class="w20p">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td class="bg_gray" id="referenceTitle"></td>
                                                    <td class="bg_gray alignRight" id="referenceIndate"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">작성자 : <span id="referenceWriter"></span> (<span id="referenceUserId"></span>) | 조회수 : <span id="referenceCount"></span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">첨부파일 : <a href="#" class="iconFile" target="_blank" title="새창열림">보충자료.pdf</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="textContent" id="referenceContent"></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="btnArea right">
                                            <a href="javascript:goReferenceList();" class="btn_m w140">목록으로</a>
                                        </div>
                                        <div class="tableBox">
                                            <table class="view">
                                                <colgroup>
                                                    <col class="w15p">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td class="linkPrev">윗글</td>
                                                    <td><a href="" class="subject" id="referenceNextLink"><span id="referenceNextTitle"></span></a></td>
                                                </tr>
                                                <tr>
                                                    <td class="linkNext">아랫글</td>
                                                    <td><a href="" class="subject" id="referencePrevLink"><span id="referencePrevTitle"></span></a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--//학습자료실 상세 끝-->




                                </div>
                            </div>
                        </div>
                        <div class="tabPage">
                            학습 Q&A
                        </div>
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

