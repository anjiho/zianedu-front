<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<%@include file="/common/jsp/common.jsp" %>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<%
    String teacherKey = request.getParameter("teacherKey");
    String reqKey = request.getParameter("reqKey");
%>
<style>
    .video-container {position: relative;padding-bottom: 56.25%;height: 0;overflow: hidden;}
    .video-container iframe,.video-container object,.video-container embed{position: absolute; top:0; left:0; width:100%; height: 100%}
</style>
<form action="/Player/Axis" id="id_frm_player" method="post" name="name_frm_player">
    <input id="vodPath" name="vodPath" type="hidden" value="" />
    <input id="vodTitle" name="vodTitle" type="hidden" value="" />
    <input id="starPlayerUrl" name="starPlayerUrl" type="hidden" value="" />
</form>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="divisionList">
    <input type="hidden" id="bbsKey">
    <input type="hidden" id="bbsKey1">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
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
                        <ul class="tabBar" id="teacherHeader">
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
                                                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
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
                                                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                                                        <a href="javascript:goCheckedBuy();" class="btn_m on w120">바로구매</a>
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
                                    <ul class="tabBar tabLecture" id="tab2">
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
                                                    <input type="button" class="btn_m on" value="검색" onclick="fn_search('new');">
                                                    <a href="fn_search('new');" class="search_ico">검색</a>
                                                </li>
                                                <li class="right">
                                                    <a href="javascript:referenceWrite();" class="btn_inline w140 writeBtn">글쓰기</a>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table class="noticeList">
                                                <colgroup>
                                                    <col class="w10p">
                                                    <col class="w60p">
                                                    <col class="w10p">
                                                    <col class="w10p">
                                                    <col class="w10p">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="row">유형</th>
                                                    <th scope="row">제목</th>
                                                    <th scope="row">작성자</th>
                                                    <th scope="row">등록일</th>
                                                    <th scope="row">조회</th>
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
                                                    <select id="searchType2">
                                                        <option value="title">제목</option>
                                                    </select>
                                                    <input type="text"  id="searchText2" onkeypress="if(event.keyCode==13) {fn_search1('new'); return false;}">
                                                    <input type="button" class="btn_m on" value="검색" onclick="fn_search1('new');">
                                                    <a href="fn_search1('new');" class="search_ico">검색</a>
                                                </li>
                                                <li class="right">
                                                    <a href="javascript:referenceWrite();" class="btn_inline w140 writeBtn">글쓰기</a>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table class="noticeList">
                                                <colgroup>
                                                    <col class="w10p">
                                                    <col class="w60p">
                                                    <col class="w10p">
                                                    <col class="w10p">
                                                    <col class="w10p">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="row" >유형</th>
                                                    <th scope="row">제목</th>
                                                    <th scope="row">작성자</th>
                                                    <th scope="row">등록일</th>
                                                    <th scope="row">조회</th>
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
                                        <ul class="searchArea">
                                            <li class="right">
                                                <a href="javascript:getModifyDetail();" class="btn_m w140 writeBtn">수정</a>
                                            </li>
                                        </ul>
                                        <div class="tableBox">
                                            <table class="tBoard noticeView">
                                                <colgroup>
                                                    <col class="w110">
                                                    <col>
                                                    <col class="w140">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th colspan="2" id="referenceTitle"></th>
                                                        <th id="referenceIndate"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td colspan="3">작성자 : <span id="referenceWriter"></span> (<span id="referenceUserId"></span>) | 조회수 : <span id="referenceCount"></span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <div class="fileWrap">
                                                            <span class="label">첨부파일 : </span>
                                                            <ul class="fileList" id="fileDetailList"></ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" class="tdEditorContent" id="referenceContent"></td>
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
                                                    <td><a href="" class="subject" id="referencePrevLink"><span id="referencePrevTitle"></span></a></td>
                                                </tr>
                                                <tr>
                                                    <td class="linkNext">아랫글</td>
                                                    <td><a href="" class="subject" id="referenceNextLink"><span id="referenceNextTitle"></span></a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--//학습자료실 상세 끝-->
                                    <!--학습자료실 글쓰기-->
                                    <div class="" id="referenceWriteDiv" style="display: none;">
                                        <div class="tabPage active">
                                        <form>
                                            <ul class="searchArea">
                                                <li class="left"><b>글 등록하기</b></li>
                                            </ul>
                                            <div class="tableBox">
                                                <table class="form">
                                                    <colgroup>
                                                        <col class="w15p">
                                                        <col>
                                                    </colgroup>
                                                    <tbody>
                                                    <tr>
                                                        <td>제목</td>
                                                        <td><input type="text" placeholder="제목을 입력하세요" class="w100p" id="writeTitle"></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">내용</th>
                                                        <td><textarea name="writeContent" id="writeContent" value=""></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">첨부파일</th>
                                                        <td class="">
                                                            <input type="file" name="files[]" id="attachFile" class="fileBtn noline"  multiple/>
                                                            <ul id='fileList' class="fileList"></ul>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="btnArea">
                                                <a href="javascript:goReferenceList();" class="btn_m gray radius w110">취소</a>
                                                <a href="javascript:goWriteSave();" class="btn_m bg_blue radius w110">등록</a>
                                            </div>
                                        </form>
                                        </div>
                                    </div>
                                    <!--//학습자료실 글쓰기 끝-->
                                </div>
                            </div>
                        </div>
                        <!-- 학습 Q&A -->
                        <div class="tabPage" id="qnaDiv">
                            <!-- 학습Q&A -->
                            <div class="tab_qna">
                                <form>
                                    <input type="hidden" id="sPage3">
                                    <ul class="searchArea">
                                        <li class="left">
                                            <select id="searchType3">
                                                <option value="title">제목</option>
                                            </select>
                                            <input type="text"  id="searchText3" onkeypress="if(event.keyCode==13) {fn_search3('new'); return false;}">
                                            <a href="javascript:fn_search3('new');" class="btn_m on">검색</a>
                                        </li>
                                        <li class="right">
                                            학습에 관련된 질문을 올려주세요&nbsp; <a href="javascript:qnaWrite();" class="btn_m w140 writeBtn">글쓰기</a>
                                        </li>
                                    </ul>
                                </form>
                                <div class="tableBox">
                                    <table class="mypage05">
                                        <colgroup>
                                            <col width="10%">
                                            <col width="60%">
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="row" >유형</th>
                                            <th scope="row">제목</th>
                                            <th scope="row">작성자</th>
                                            <th scope="row">등록일</th>
                                            <th scope="row">조회</th>
                                        </tr>
                                        </thead>
                                        <tbody id="dataList3">
                                        </tbody>
                                    </table>
                                </div>
                                <%@ include file="/common/inc/com_pageNavi3.inc" %>
                            </div>
                        </div>
                        <!-- 학습 Q&A 상세 시작-->
                        <div class="" id="qnaDetail" style="display: none;">
                            <ul class="searchArea">
                                <li class="right">
                                    <a href="javascript:getModifyDetailqna();" class="btn_m w140 writeBtn">수정</a>
                                    <a href="javascript:goReplayWrite();" class="btn_m w140 writeBtn">답변등록</a>
                                </li>
                            </ul>
                            <div class="tableBox">
                                <table class="tBoard noticeView">
                                    <colgroup>
                                        <col class="w110">
                                        <col>
                                        <col class="w140">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th colspan="2" id="qnaTitle"></th>
                                            <th id="qnaIndate"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">작성자 : <span id="qnaWriter"></span> (<span id="qnaUserId"></span>) | 조회수 : <span id="qnaCount"></span></td>
                                        <td class="ta_right" ><span class="iconLock" id="iconLock" style="display: none;">비밀글</span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="fileWrap">
                                                <span class="label">첨부파일 : </span>
                                                <ul class="fileList" id="fileDetailList1">

                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="tdEditorContent" id="qnaContent"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="commentsList" id="commentList"></div>
                            </div>
                            <div style="display: none;" id="replyDiv">
                                <div class="tabPage active">
                                    <form>
                                        <ul class="searchArea" style="border-top: 1px #e5e5e5 solid;background-color: #a3a3a3;">
                                            <li class="left"><b>답변등록하기</b></li>
                                            <li class="right">
                                                <input type="checkbox" name="replyPwd" value="1"> 비공개
                                            </li>
                                        </ul>

                                        <div class="tableBox">
                                            <table class="form">
                                                <colgroup>
                                                    <col class="w15p">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td>제목</td>
                                                    <td><input type="text" placeholder="제목을 입력하세요" class="w100p" id="replyTitle"></td>
                                                </tr>
                                                <tr>
                                                    <td>내용</td>
                                                    <td><textarea placeholder="내용을 입력하세요" name="replyContent" id="replyContent"></textarea></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                                <div class="btnArea">
                                    <a href="javascript:goReplyCancel();" class="btn_l w200">취소</a>
                                    <a href="javascript:goReplySave();" class="btn_l onBlue w200">답변등록</a>
                                </div>
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
                                        <td><a href="" class="subject" id="qnaPrevLink"><span id="qnaPrevTitle"></span></a></td>
                                    </tr>
                                    <tr>
                                        <td class="linkNext">아랫글</td>
                                        <td><a href="" class="subject" id="qnaNextLink"><span id="qnaNextTitle"></span></a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--//학습 qna 상세 끝-->

                        <!--학습qna 등록 -->
                        <div class="" id="qnaWriteDiv" style="display: none;">
                                <div class="tabPage active">
                                    <form>
                                        <ul class="searchArea">
                                            <li class="left"><b>글 등록하기</b></li>
                                            <li class="right">
                                                <input type="checkbox" name="chkPwd" value="1"> 비공개
                                            </li>
                                        </ul>

                                        <div class="tableBox">
                                            <table class="form">
                                                <colgroup>
                                                    <col class="w15p">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td>제목</td>
                                                    <td><input type="text" placeholder="제목을 입력하세요" class="w100p" id="qnaWriteTitle"></td>
                                                </tr>
                                                <tr>
                                                    <td>내용</td>
                                                    <td><textarea placeholder="내용을 입력하세요" name="qnaWriteContent" id="qnaWriteContent" ></textarea></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">첨부파일</th>
                                                    <td>
                                                        <input type="file" name="files[]" id="attachFile1" class="fileBtn noline" multiple/>
                                                        <ul id='fileList1' class="fileList"></ul>
                                                    </td>

                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="btnArea">
                                            <a href="javascript:goReferenceList();" class="btn_m gray radius w110">취소</a>
                                            <a href="javascript:goWriteQnaSave();" class="btn_m bg_blue radius w110">등록</a>
                                        </div>
                                    </form>
                                </div>
                        </div>
                        <!--//학습qna 등록 끝-->
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
<script>
    var teacherKey = '<%=teacherKey%>';
    var menuCtgKey = '<%=reqKey%>';

    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $(".writeBtn").hide();
            }
        }else{
            $(".writeBtn").hide();
        }

        $("#attachFile1").on("change", addFiles);
        $("#attachFile").on("change", addFiles1);
        var pcMobile = divisionPcMobile();
        if(pcMobile == 'PC') {
            $('#writeContent').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
            });
            $('#qnaWriteContent').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
            });
            $('#replyContent').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
            });
        } else {
            $('#writeContent').attr("cols", 40);
            $('#writeContent').attr("rows", 15);

            $('#qnaWriteContent').attr("cols", 40);
            $('#qnaWriteContent').attr("rows", 15);

            $('#replyContent').attr("cols", 40);
            $('#replyContent').attr("rows", 15);
        }

        $("#teacherHeader li").click(function() {
            if($(this).index() == 0 || $(this).index() == 1){
                $("#qnaDiv").hide();
                $("#qnaDetail").hide();
                $("#qnaWriteDiv").hide();
                $("#noticeList").hide();
            }else if($(this).index() == 2){
                innerValue("divisionList", 0);
                $("#tab2 li:eq(0)").addClass('active');
                $("#tab2 li:eq(1)").removeClass('active');
                $("#qnaDiv").hide();
                $("#qnaDetail").hide();
                $("#qnaWriteDiv").hide();
                $("#referenceList").show();
                $("#referenceWriteDiv").hide();
                $("#noticeList").hide();
            }else if($(this).index() == 3){
                $("#qnaDiv").show();
                innerValue("divisionList", 2);
            }
        });

        var pcMobile = divisionPcMobile();
        if(pcMobile == 'PC') pcMobile = 1;
        else if(pcMobile == 'MOBILE') pcMobile = 3;

        getTeacherHomeInfo(teacherKey, pcMobile , menuCtgKey, 10);//홈정보
        getTeacherNameSubjectName(teacherKey, menuCtgKey);//과목, 선생님명 불러오기
        getTeacherCurriculum(teacherKey, pcMobile, menuCtgKey);//커리큘럼 불러오기
        getTeacherVideoLecture(teacherKey, pcMobile, 0);//강좌소개 (동영상) 리스트 불러오기
        getTeacherAcademyLecture(teacherKey, 0);//강좌소개 (학원) 리스트 불러오기

        fn_search1('new');//학습안내 (학습공지) 리스트 불러오기
        fn_search('new');//학습안내 (학습자료실) 리스트 불러오기
        fn_search3('new');//학습Q&A리스트 불러오기

        $("#referenceList").show();

        innerValue("divisionList", 0);

        innerHTML("selOnlineCount", 0);
        innerHTML("selAcaCount", 0);
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리(학습자료실)
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selOnlineCount", count);
        });
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리(학습공지)
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selAcaCount", count);
        });
        $("#noticeBtn").click(function () {
            $("#referenceDetail").hide();
            $("#referenceList").hide();
            $("#referenceWriteDiv").hide();
            $("#noticeList").show();
            innerValue("divisionList", 1);
        });
        $("#referBtn").click(function () {
            $("#referenceDetail").hide();
            $("#referenceList").show();
            $("#referenceWriteDiv").hide();
            $("#noticeList").hide();
            innerValue("divisionList", 0);
        });
    });

    var filesTempArr = [];
    function addFiles(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr.length;
        for( var i=0; i<filesArrLen; i++ ) {
            filesTempArr.push(filesArr[i]);
            $("#fileList1").append("<div>" + filesArr[i].name + "<img src=\"/common/zian/images/common/icon_file.png\" onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\"></div>");
        }
        $(this).val('');
    }
    function deleteFile (eventParam, orderParam) {
        filesTempArr.splice(orderParam, 1);
        var innerHtmlTemp = "";
        var filesTempArrLen = filesTempArr.length;
        for(var i=0; i<filesTempArrLen; i++) {
            innerHtmlTemp += "<div>" + filesTempArr[i].name + "<img src=\"/images/deleteImage.png\" onclick=\"deleteFile(event, " + i + ");\"></div>"
        }
        $("#fileList1").html(innerHtmlTemp);
    }

    var filesTempArr1 = [];
    function addFiles1(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr1.length;
        for( var i=0; i<filesArrLen; i++ ) {
            filesTempArr1.push(filesArr[i]);
            $("#fileList").append("<div>" + filesArr[i].name + "<img src=\"/common/zian/images/common/icon_file.png\" onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\"></div>");
        }
        $(this).val('');
    }
    function deleteFile1 (eventParam, orderParam) {
        filesTempArr1.splice(orderParam, 1);
        var innerHtmlTemp = "";
        var filesTempArrLen = filesTempArr1.length;
        for(var i=0; i<filesTempArrLen; i++) {
            innerHtmlTemp += "<div>" + filesTempArr1[i].name + "<img src=\"/images/deleteImage.png\" onclick=\"deleteFile(event, " + i + ");\"></div>"
        }
        $("#fileList").html(innerHtmlTemp);
    }

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

        getTeacherReferenceRoom2(teacherKey, sPage2, 10, searchType2,  searchText2, 1, 'dataList2');//학습안내 (학습자료실) 리스트 불러오기
    }

    function fn_search3(val) {
        var sPage3 = getInputTextValue("sPage3");
        var searchType3 = getSelectboxValue("searchType3");
        var searchText3 = getInputTextValue("searchText3");
        if(searchType3 == undefined) searchType3 = "";
        if(searchText3 == undefined) searchText3 = "";

        if(val == "new") sPage3 = "1";

        getTeacherLearningQna(teacherKey, sPage3, 20, searchType3,  searchText3, 'dataList3');//학습안내 (학습자료실) 리스트 불러오기
        $(".nonBoard").css({ 'pointer-events': 'none' });
    }

    //학습Q&A 답변등록하기
    function goReplySave() {
        var title = getInputTextValue("replyTitle");
        var content = $('textarea[name="replyContent"]').val();
        var isSecret = "";
        if($('input[name="replyPwd"]').is(":checked") == true) isSecret = 1;
        else isSecret = 0;
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var bbsKey = getInputTextValue("bbsKey1");

        var result = saveBoardReply(10025, bbsKey, userKey, title, content, isSecret);
        if(result.resultCode == 200){
            alert("답변이 등록 되었습니다.");
        }
    }

    //답변등록 버튼
    function goReplayWrite() {
        $("#replyDiv").show();
    }

    //답변취소
    function goReplyCancel() {
        $("#replyDiv").hide();
    }

    //댓글 저장
    function commentSave() {
        var commentContent = getInputTextValue("commentContent");
        var bbsKey = getInputTextValue("bbsKey1");
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var result = saveBoardComment(bbsKey, userKey, commentContent);
        if(result.resultCode == 200){
            alert("댓글이 등록 되었습니다.");
        }
    }

    //학습안내 - 학습자료실 상세보기
    function goDetailReference(bbsKey) {
        innerValue("bbsKey", bbsKey);
        $("#fileDetailList").children().remove();
        var detailInfo = getTeacherReferenceRoomDetail(teacherKey, bbsKey);
        $("#referenceDetail").show();
        $("#referenceList").hide();
        $("#noticeList").hide();
        $("#referenceWriteDiv").hide();
        if(detailInfo != undefined){
            var referenceInfo   = detailInfo.result.referenceRoomDetailInfo;
            var prevNextBbsList = detailInfo.result.prevNextBbsList;
            innerHTML("referenceTitle",referenceInfo.title);
            innerHTML("referenceIndate",referenceInfo.indate);
            innerHTML("referenceCount",referenceInfo.readCount);
            innerHTML("referenceWriter",referenceInfo.userName);
            innerHTML("referenceUserId",referenceInfo.userId);

            if(referenceInfo.fileInfo != null){
                for(var i = 0; i < referenceInfo.fileInfo.length; i++){
                    $("#fileDetailList").append('<li><a href="javascript:download('+ "'" + referenceInfo.fileInfo[i].fileName + "'" +')"><img src="/common/zian/images/common/icon_file.png" alt="">'+ referenceInfo.fileInfo[i].fileName +'</a></li>');
                }
            }

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

            for(var j = 0;  j < prevNextBbsList.length; j++){ /* 이전글 다음글 기능 */
                if(prevNextBbsList[j].prevBbsKey == 0){
                    innerHTML("referencePrevTitle", "");
                } else {
                    innerHTML("referencePrevTitle", prevNextBbsList[j].prevTitle);
                    $("#referencePrevLink").attr("href", "javascript:goDetailReference("+ prevNextBbsList[j].prevBbsKey +");");
                }

                if(prevNextBbsList[j].nextBbsKey == 0) {
                    innerHTML("referencePrevTitle", "");
                } else {
                    innerHTML("referenceNextTitle", prevNextBbsList[j].nextTitle);
                    $("#referenceNextLink").attr("href", "javascript:goDetailReference("+ prevNextBbsList[j].nextBbsKey +");");
                }
            }
        }
    }

    //학습 Q&A 상세보기
    function goDetailqna(bbskey) {
        if(bbskey == 0){
            alert("비밀글 입니다.");
            return false;
        }
        $("#commentDiv").hide();
        $("#qnaDiv").hide();
        $("#qnaDetail").show();
        $("#fileDetailList1").children().remove();
        innerValue("bbsKey1", bbskey);
        //var bbsKey = getInputTextValue("bbsKey");
        var detailInfo = getTeacherLearningQnaDetail(teacherKey, bbskey);

        if(detailInfo != null){
            var referenceInfo   = detailInfo.result.referenceRoomDetailInfo;
            var prevNextBbsList = detailInfo.result.prevNextBbsList;
            var commentInfo = detailInfo.result.commentInfo;

            if(referenceInfo.pwd == 1){
                $("#iconLock").show();
            }else{
                $("#iconLock").hide();
            }

            innerHTML("qnaTitle",referenceInfo.title);
            innerHTML("qnaIndate",referenceInfo.indate);
            innerHTML("qnaCount",referenceInfo.readCount);
            innerHTML("qnaWriter",referenceInfo.userName);
            innerHTML("qnaUserId",referenceInfo.userId);

            if(referenceInfo.fileInfo != null){
                for(var i = 0; i < referenceInfo.fileInfo.length; i++){
                    $("#fileDetailList1").append("<li><a href='"+ referenceInfo.fileInfo[i].fileUrl +"'>"+ referenceInfo.fileInfo[i].fileName +"</a>"+" "+"<img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"></li>");
                }
            }

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
            innerHTML("qnaContent", contents);

            //댓글 시작
            $('#commentList ul').remove();  //댓글 영역 초기화
            var commentHtml = "<ul>";
            if(commentInfo.length > 0){
                for(var j =0; j<commentInfo.length;j++){
                    commentHtml += "<li>";
                    commentHtml += "<div>";
                    commentHtml += "<span class='cName'>" + commentInfo[j].userName + '('+ commentInfo[j].userId +')' + '</span>';
                    commentHtml += "<span class='cDate'>" + commentInfo[j].indate + "</span>";
                    commentHtml += "<p class='cComment'>" + commentInfo[j].contents + "</p>";
                    /** 추후 본사 유지보수건으로 주석처리 **/
                    // commentHtml += "<div>";
                    // commentHtml += "<a class='cUdate'>수정</a>";
                    // commentHtml += "<a class='cDel'>삭제</a>";
                    // commentHtml += "</div>";
                }
            }
            commentHtml += "<li class='cm_write'>";
            commentHtml += "<div class='inner'>";
            commentHtml += "<textarea id='commentContent'></textarea>";
            commentHtml += "<a class='single' onclick='commentSave();'>댓글</a>";
            commentHtml += "</div>";
            commentHtml += "</li>";
            commentHtml += "</ul>";
            $("#commentList").append(commentHtml);
            //댓글 끝

            /** 이전 다음글 조건 수정 2020.03.26  안지호 **/
            for(var i = 0;  i < prevNextBbsList.length; i++){ /* 이전글 다음글 기능 */
                if(prevNextBbsList[i].prevBbsKey == 0){
                    innerHTML("qnaPrevTitle", "");
                } else {
                    innerHTML("qnaPrevTitle", prevNextBbsList[i].prevTitle);
                    $("#qnaPrevLink").attr("href", "javascript:goDetailqna("+ prevNextBbsList[i].prevBbsKey +");");
                }

                if(prevNextBbsList[i].nextBbsKey == 0) {
                    innerHTML("qnaPrevTitle", "");
                } else {
                    innerHTML("qnaNextTitle", prevNextBbsList[i].nextTitle);
                    $("#qnaNextLink").attr("href", "javascript:goDetailqna("+ prevNextBbsList[i].nextBbsKey +");");
                }
            }
        }
    }

    //목록으로 이동 버튼 함수
    function goReferenceList(){
        var val = getInputTextValue("divisionList");
        if(val == 0){
            $("#referenceDetail").hide();
            $("#referenceWriteDiv").hide();
            $("#qnaDiv").hide();
            $("#referenceList").show();
        }else if(val == 1) {
            $("#referenceWriteDiv").hide();
            $("#referenceDetail").hide();
            $("#qnaDiv").hide();
            $("#noticeList").show();
        }else if(val == 2) {
            $("#qnaDiv").show();
            $("#qnaDetail").hide();
            $("#qnaWriteDiv").hide();
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
    }

    //학습안내 - 학습자료실 - 글쓰기
    function referenceWrite() {
        $("#fileList li").remove();
        $("#referenceDetail").hide();
        $("#referenceList").hide();
        $("#noticeList").hide();
        $("#referenceWriteDiv").show();
        $("#writeTitle").val("");
        $("#writeContent").val("");
        $("#fileList").empty();

    }

    function qnaWrite() {
        $("#fileList1 li").remove();
        $("#qnaDiv").hide();
        $("#qnaDetail").hide();
        $("#qnaWriteDiv").show();
    }

    //수정버튼 클릭시 상세정보 가져오기
    function getModifyDetail() {
        $("#referenceDetail").hide();
        $("#referenceWriteDiv").show();
        var bbsKey = getInputTextValue("bbsKey");
        var result = getBoardDetailInfo(10023, bbsKey);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;

            var detailInfoStr = JSON.stringify(detailInfo);
            var detailInfoStrObj = JSON.parse(detailInfoStr);
            var contentsObj = detailInfoStrObj.contents;
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
            $("#writeContent").summernote("code", contents);
            innerValue("writeTitle", detailInfo.title);
            //innerHTML("fileList", detailInfo.fileName);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        var returnHtml = "<li id='"+fileList.bbsFileKey+"'><a href='javascript:void(0);'>"+ fileList.fileName +"</a>"+" "+"<a href='javascript:deleteFileList("+ fileList.bbsFileKey +");' >X</a></li>";
                        $("#fileList").append(returnHtml);
                    }
                }
            }
        }
    }

    function getModifyDetailqna() {
        $("#qnaDiv").hide();
        $("#qnaDetail").hide();
        $("#qnaWriteDiv").show();
        var bbsKey = getInputTextValue("bbsKey1");
        var result = getBoardDetailInfo(10023, bbsKey);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;
            $("#qnaWriteContent").summernote("code", detailInfo.contents);
            innerValue("qnaWriteTitle", detailInfo.title);
            // innerHTML("fileList1", detailInfo.fileName);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        var returnHtml = "<li id='"+fileList.bbsFileKey+"'><a href='javascript:void(0);'>"+ fileList.fileName +"</a>"+" "+"<a href='javascript:deleteFileList("+ fileList.bbsFileKey +");' >X</a></li>";
                        $("#fileList1").append(returnHtml);
                    }
                }
            }
        }
    }

    //qna 저장 및 수정
    function goWriteQnaSave() {
        var check = new isCheck();
        if (check.input("qnaWriteTitle ", comment.input_title) == false) return;

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var title   = getInputTextValue("qnaWriteTitle");
        var content = $('textarea[name="qnaWriteContent"]').val();
        var bbsKey  = getInputTextValue("bbsKey1");

        var isSecret = "";
        if($('input[name="chkPwd"]').is(":checked") == true) isSecret = 1;
        else isSecret = 0;

        if(filesTempArr.length == 0) { //파일 없을때
            if(bbsKey == ""){ //등록
                var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, "");
            }else{ //수정
                var result = updateBoard(bbsKey, title, content, isSecret, "");
            }
            if(result.resultCode == 200){
                alert("성공적으로 등록 완료되었습니다");
            }
        }else{
            var data = new FormData();
            var formData = new FormData();
            for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
                formData.append("files", filesTempArr[i]);
            }
            $.ajax({
                url: "http://52.79.40.214:9090/fileUpload/boardFileList",
                method: "post",
                dataType: "JSON",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    if(data.resultCode == 200){
                        var fileName = data.keyValue;
                        if(bbsKey == ""){ //등록
                            var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                        }else{ //수정
                            var result = updateBoard(bbsKey, title, content, isSecret, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                        }
                        if(result.resultCode == 200){
                            alert("성공적으로 등록 완료되었습니다");
                        }
                    }
                }
            });
        }
    }

    //학습자료실 글쓰기 저장 & 수정
    function goWriteSave() {
        var check = new isCheck();
        if (check.input("writeTitle", comment.input_title) == false) return;

        var isNotice = getInputTextValue("divisionList"); // 학습자료실 : 0  , 학습공지 : 1

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var title   = getInputTextValue("writeTitle");
        var content = $('textarea[name="writeContent"]').val();
        var bbsKey  = getInputTextValue("bbsKey");

        if(filesTempArr1.length == 0) { //파일 없을때
            if(bbsKey == ""){ //등록
                var result = saveTeacherBoard(10023, teacherKey, userKey, title, content, isNotice, 0, "");
            }else{ //수정
                var result = updateBoard(bbsKey, title, content, isNotice, "");
            }
            if(result.resultCode == 200){
                alert("성공적으로 등록 완료되었습니다");
            }
        }else{
            //var data = new FormData();
            var formData = new FormData();
            for(var i=0, filesTempArrLen = filesTempArr1.length; i<filesTempArrLen; i++) {
                formData.append("files", filesTempArr1[i]);
            }
            $.ajax({
                url: "http://52.79.40.214:9090/fileUpload/boardFileList",
                method: "post",
                dataType: "JSON",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    if(data.resultCode == 200){
                        var fileName = data.keyValue;
                        if(bbsKey == ""){ //등록
                            var result = saveTeacherBoard(10023, teacherKey, userKey, title, content, isNotice, 0, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                        }else{ //수정
                            var result = updateBoard(bbsKey, title, content, isNotice, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                        }
                        if(result.resultCode == 200){
                            alert("성공적으로 등록 완료되었습니다");
                        }
                    }
                }
            });
        }
    }
</script>
