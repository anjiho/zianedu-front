<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<style>
    .tab-content{
        display: none;
        padding: 15px;
    }

    .tab-content.active{
        display: inherit;
    }
</style>
<script>
    $(document).ready(function(){
        $('#writeContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
        $('#writeContent1').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('active');
            $('.tab-content').removeClass('active');

            $(this).addClass('active');
            $("#"+tab_id).addClass('active');
        });

        fn_search('new'); //강사모집 리스트 불러오기
        fn_search1('new'); //제휴문의 리스트 불러오기

        $("#companyHeader li").click(function () {
            if($(this).index() == 1){
                $("#teacherList").show();
                $("#teacherWrite").hide();
                $("#teacherDetail").hide();
            }else if($(this).index() == 2){
                $("#questionList").show();
                $("#questionWrite").hide();
                $("#questionDetail").hide();
            }
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

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";
        //함수호출
    }

    function fn_search1(val) {
        var sPage2 = getInputTextValue("sPage2");
        var searchType2 = getSelectboxValue("searchType2");
        var searchText2 = getInputTextValue("searchText2");
        if(searchType2 == undefined) searchType2 = "";
        if(searchText2 == undefined) searchText2 = "";

        if(val == "new") sPage2 = "1";
        //함수호출
    }

    //강사모집 글쓰기
    function goWrite(val) {
        if(val == 'teacher'){
            $("#teacherList").hide();
            $("#teacherWrite").show();
            $("#teacherDetail").hide();
        }else if(val == 'question'){
            $("#questionList").hide();
            $("#questionWrite").show();
            $("#questionDetail").hide();
        }
    }
    
    function goBackList(val) {
        if(val == 'teacher'){
            $("#teacherList").show();
            $("#teacherWrite").hide();
            $("#teacherDetail").hide();
        }else if(val == 'question'){
            $("#questionList").show();
            $("#questionWrite").hide();
            $("#questionDetail").hide();
        }
    }
    
    function goDetail(bbskey, val) {
        if(val == 'teacher'){
            $("#teacherList").hide();
            $("#teacherWrite").hide();
            $("#teacherDetail").show();
        }else if(val == 'question'){
            $("#questionList").hide();
            $("#questionWrite").hide();
            $("#questionDetail").show();
        }
    }
    
    function goSave(val) {
        var check = new isCheck();
        if(val == 'teacher'){ //강사모집 글쓰기 저장
            if (check.input("teacherTitle", comment.input_title) == false) return;

            var title = getInputTextValue("teacherTitle");
            var content = $('textarea[name="writeContent"]').val();
            var bbsKey  = getInputTextValue("bbsKey");
            if(filesTempArr.length == 0) {
                if(bbsKey == ""){ //등록
                   //var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, "");
                }else{ //수정
                    //var result = updateBoard(bbsKey, title, content, isSecret, "");
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
                                //var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, fileName);
                                //var str = toStrFileName(fileName);
                                //saveBoardFileList(result.keyValue, str);
                            }else{ //수정
                                //var result = updateBoard(bbsKey, title, content, isSecret, fileName);
                                //var str = toStrFileName(fileName);
                                //saveBoardFileList(result.keyValue, str);
                            }
                            if(result.resultCode == 200){
                                alert("성공적으로 등록 완료되었습니다");
                            }
                        }
                    }
                });
            }
        }else if(val == 'question'){ //제휴문의 글쓰기 저장
            if (check.input("teacherTitle", comment.input_title) == false) return;

            var title = getInputTextValue("questionTitle");
            var content = $('textarea[name="writeContent1"]').val();
            var bbsKey  = getInputTextValue("bbsKey");
            if(filesTempArr.length == 0) {
                if(bbsKey == ""){ //등록
                    //var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, "");
                }else{ //수정
                    //var result = updateBoard(bbsKey, title, content, isSecret, "");
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
                                //var result = saveTeacherBoard(10025, teacherKey, userKey, title, content, 0, isSecret, fileName);
                                //var str = toStrFileName(fileName);
                                //saveBoardFileList(result.keyValue, str);
                            }else{ //수정
                                //var result = updateBoard(bbsKey, title, content, isSecret, fileName);
                                //var str = toStrFileName(fileName);
                                //saveBoardFileList(result.keyValue, str);
                            }
                            if(result.resultCode == 200){
                                alert("성공적으로 등록 완료되었습니다");
                            }
                        }
                    }
                });
            }
        }
    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <%@include file="/common/jsp/headerMenu.jsp" %>
            <!--//주메뉴-->
        </div>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox tBox4">
                    <ul class="tabs" id="companyHeader">
                        <li class="tab-link active" data-tab="tab-1"><a href="javascript:void(0);">회사소개</a></li>
                        <li class="tab-link" data-tab="tab-2"><a href="javascript:void(0);">강사모집</a></li>
                        <li class="tab-link" data-tab="tab-3"><a href="javascript:void(0);">제휴문의</a></li>
                        <li class="tab-link" data-tab="tab-4"><a href="javascript:void(0);">학원둘러보기</a></li>
                    </ul>
                </div>
                <br />
                <!--회사소개-->
                <div id="tab-1" class="tab-content active">
                        <div class="companyInfo">
                            <!-- 인사말 -->
                            <div class="greetingInner">
                                <div class="greeting_img">
                                    <h3>“지금 지안을 선택하십시오. 공무원 합격은 꿈이 아닌 현실이 됩니다.”</h3>
                                </div>
                                <div class="greeting_txt">
                                    <p>지난 10년여 동안 노량진 공무원 양성학원에서 강의한 경험과 공무원 수험서를 전문으로 출판하는 도서출판 탑스팟(http://www.topspot.co.kr)을<br>
                                        경영해 오면서 쌓은 노하우를 바탕으로 지안공무원 학원을 오픈하게 되었습니다. 지안의 목표는 하나입니다. 여러분들을 1년안에 합격하도록 하는 것입니다.<br>
                                        최근 3년동안 데카르트고시학원에서 연간회원제반을 운영해 오면서 1년안에 많은 학생들이 합격해서 현재 공직생활을 하고 있습니다.
                                        <br>
                                        <br>
                                        수험생 여러분! 공부를 열심히만 한다고 해서 시험에 합격한는 것은 아닙니다. 합격을 위한 공부 방법은 분명히 있습니다.
                                        <br>
                                        <br>
                                        여러분들의 합격을 위해 최선을 다하겠습니다.<br>
                                        감사합니다.</p>
                                </div>
                            </div>
                            <!-- //인사말 -->

                            <!-- 회사연혁 -->
                            <div class="history">
                                <h2>회사연혁</h2>
                                <img src="/common/zian/images/content/history.jpg" alt="회사연혁">
                            </div>
                            <!-- //회사연혁 -->

                            <!-- 찾아오시늘 길 -->
                            <div class="location">
                                <h2>찾아오시는 길</h2>
                                <div class="company1">
                                    <div class="mApi">api</div>
                                    <h3>1관 찾아오시는 길</h3>
                                    <table>
                                        <colgroup>
                                            <col width="10%">
                                            <col width="40%">
                                            <col width="10%">
                                            <col width="40%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>주소</th>
                                            <td colspan="3">서울시 동작구 노량진동 117-2 영빌딩 2층 (올리브영 맞은편 다이소건물 2층)</td>
                                        </tr>
                                        <tr>
                                            <th>지하철</th>
                                            <td colspan="3">1호선 노량진역 1번출구, 9호선 노량진역 3번출구</td>
                                        </tr>
                                        <tr>
                                            <th>버스</th>
                                            <td colspan="3">파랑(간선버스) : 152, 500, 504, 654, 751, 752 / 초록(지선버스) : 5535,
                                                5536, 5516, 5517</td>
                                        </tr>
                                        <tr>
                                            <th>TEL</th>
                                            <td>02-6080-1725</td>
                                            <th>FAX</th>
                                            <td>02-816-1720</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="company2">
                                    <div class="mApi">api</div>
                                    <h3>2관 찾아오시는 길</h3>
                                    <table>
                                        <colgroup>
                                            <col width="10%">
                                            <col width="40%">
                                            <col width="10%">
                                            <col width="40%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>주소</th>
                                            <td colspan="3">서울시 동작구 노량진동 117-2 영빌딩 2층 (올리브영 맞은편 다이소건물 2층)</td>
                                        </tr>
                                        <tr>
                                            <th>지하철</th>
                                            <td colspan="3">1호선 노량진역 1번출구, 9호선 노량진역 3번출구</td>
                                        </tr>
                                        <tr>
                                            <th>버스</th>
                                            <td colspan="3">파랑(간선버스) : 152, 500, 504, 654, 751, 752 / 초록(지선버스) : 5535,
                                                5536, 5516, 5517</td>
                                        </tr>
                                        <tr>
                                            <th>TEL</th>
                                            <td>02-6080-1725</td>
                                            <th>FAX</th>
                                            <td>02-816-1720</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- //찾아오시는 길 -->
                        </div>
                </div>
                <!--강사모집-->
                <div id="tab-2" class="tab-content">
                    <input type="hidden" id="sPage">
                    <div class="boardWrap" id="teacherList">
                        <div class="boardSearch">
                            <select id="searchType" class="w90">
                                <option value="title">제목</option>
                            </select>
                            <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" class="w240">
                            <a href="javascript:fn_search('new');" class="btn_inline on w140">검색</a>
                            <div class="btnArea">
                                <a href="javascript:goWrite('teacher');" class="btn_inline w140">글쓰기</a>
                            </div>
                        </div>
                        <div class="tableBox">
                            <table class="list">
                                <caption></caption>
                                <colgroup>
                                    <col class="w100">
                                    <col>
                                    <col class="w140">
                                    <col class="w140">
                                    <col class="w100">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">조회</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                                <tr class="notice">
                                    <td><img src="/common/zian/images/common/icon_notice.png" alt=""></td>
                                    <td class="left"><a href="javascript:goTeacherDetail('123', 'teacher')">공무원임용시험령 개정</a></td>
                                    <td>지안에듀</td>
                                    <td>2019.08.09</td>
                                    <td>31</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                    </div>

                    <div class="boardWrap" id="teacherWrite" style="display: none">
                        <h5>글 등록하기</h5>
                        <div class="tableBox">
                            <table class="form">
                                <caption></caption>
                                <colgroup>
                                    <col class="w130">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" id="teacherTitle" placeholder="제목을 입력해주세요." class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td><textarea name="writeContent" id="writeContent" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">첨부파일</th>
                                    <td class="">
                                        <label for="attachFile">업로드</label>
<%--                                        <input type="file" id="ex_file">--%>
                                        <input type="file" name="files[]" id="attachFile" multiple/>
                                        <ul class="fileList">
<%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.jpg</a></li>--%>
<%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일002.jpg</a></li>--%>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goBackList('teacher')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:goSave('teacher');" class="btn_m blue radius w110">등록</a>
                        </div>
                    </div>
                    <!--강사모집 상세보기 -->
                    <div class="boardWrap" id="teacherDetail" style="display: none;">
                        <div class="tableBox">
                            <table class="view">
                                <caption></caption>
                                <colgroup>
                                    <col class="w110">
                                    <col>
                                    <col class="w140">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th colspan="2">지안에듀에서 국가기술 전문강사님을 모십니다.</th>
                                    <th>2019.08.09</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="3">작성자 : 지안에듀 (zian0103)  |   조회수 : 31</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="tdEditorContent">
                                        <div class="alignCenter"><img src="../images/content/img_sub00010101.jpg" alt=""></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">이전글 ▲</td>
                                    <td class="left"><a href="#">[2관 학원실강] 2020 행정직9급 전과목(공통3+선택2) 기본이론 종합반 [ 9월개강 접수중]</a></td>
                                    <td class="right">2019.08.09</td>
                                </tr>
                                <tr>
                                    <td class="center">다음글 ▼</td>
                                    <td class="left"><a href="#">	[1관학원실강] 2020 공통과목(국어+영어+한국사) 드림팀 기본+심화 이론반 [9월개강 접수중]</a></td>
                                    <td class="right">2019.08.09</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea divGroup noMargin">
                            <div class="left">
                                <a href="#" class="btn_inline gray w110">수정</a>
                            </div>
                            <div class="right">
                                <a href="#" class="btn_inline blue w110">목록</a>
                            </div>
                        </div>
                    </div>
                    <!--강사모집 상세보기 끝-->
                </div>
                <div id="tab-3" class="tab-content">
                <!--제휴문의-->
                    <div class="boardWrap" id="questionList">
                        <div class="boardSearch">
                            <select id="searchType2" class="w90">
                                <option value="title">제목</option>
                            </select>
                            <input type="text" id="searchText2" onkeypress="if(event.keyCode==13) {fn_search1('new'); return false;}" class="w240">
                            <a href="javascript:fn_search1('new');" class="btn_inline on w140">검색</a>
                            <div class="btnArea">
                                <a href="javascript:goWrite('question')" class="btn_inline w140">글쓰기</a>
                            </div>
                        </div>
                        <div class="tableBox">
                            <table class="list">
                                <input type="hidden" id="sPage2">
                                <caption></caption>
                                <colgroup>
                                    <col class="w100">
                                    <col>
                                    <col class="w140">
                                    <col class="w140">
                                    <col class="w100">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">조회</th>
                                </tr>
                                </thead>
                                <tbody id="dataList2">
                                <tr>
                                    <td>1</td>
                                    <td class="left"><a href="javascript:goDetail('123','question');">안녕하세요 교육전문 플랫폼 단골닷컴에서 입점제휴드립니다.</a></td>
                                    <td>지안에듀</td>
                                    <td>2019.08.09</td>
                                    <td>31</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <%@ include file="/common/inc/com_pageNavi2.inc" %>
                    </div>

                    <div class="boardWrap" id="questionWrite" style="display: none">
                        <h5>제휴 문의하기</h5>
                        <div class="tableBox">
                            <table class="form">
                                <caption></caption>
                                <colgroup>
                                    <col class="w130">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" id="questionTitle" placeholder="제목을 입력해주세요." class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td><textarea name="writeContent1" id="writeContent1" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">첨부파일</th>
                                    <td class="">
                                        <label for="attachFile1">업로드</label>
                                        <input type="file" name="files[]" id="attachFile1" multiple/>
                                        <ul class="fileList1">
<%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.jpg</a></li>--%>
<%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일002.jpg</a></li>--%>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goBackList('question')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:goSave('question');" class="btn_m blue radius w110">등록</a>
                        </div>
                    </div>
                    <!--제휴문의 상세보기 -->
                    <div class="boardWrap" id="questionDetail" style="display: none;">
                        <div class="tableBox">
                            <table class="view">
                                <caption></caption>
                                <colgroup>
                                    <col class="w110">
                                    <col>
                                    <col class="w140">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th colspan="2">지안에듀에서 국가기술 전문강사님을 모십니다.</th>
                                    <th>2019.08.09</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="3">작성자 : 지안에듀 (zian0103)  |   조회수 : 31</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="tdEditorContent">
                                        <div class="alignCenter"><img src="../images/content/img_sub00010101.jpg" alt=""></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">이전글 ▲</td>
                                    <td class="left"><a href="#">[2관 학원실강] 2020 행정직9급 전과목(공통3+선택2) 기본이론 종합반 [ 9월개강 접수중]</a></td>
                                    <td class="right">2019.08.09</td>
                                </tr>
                                <tr>
                                    <td class="center">다음글 ▼</td>
                                    <td class="left"><a href="#">	[1관학원실강] 2020 공통과목(국어+영어+한국사) 드림팀 기본+심화 이론반 [9월개강 접수중]</a></td>
                                    <td class="right">2019.08.09</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea divGroup noMargin">
                            <div class="left">
                                <a href="#" class="btn_inline gray w110">수정</a>
                            </div>
                            <div class="right">
                                <a href="#" class="btn_inline blue w110">목록</a>
                            </div>
                        </div>
                    </div>
                    <!--강사모집 상세보기 끝-->

                </div>

                <div id="tab-4" class="tab-content">
                    <div class="companyInfo">
                        <!-- 지안에듀 1관 -->
                        <div class="gallery station1">
                            <h2>지안에듀 1관</h2>
<%--                            <a href="javascript:upLoadPop2()"><img src="/common/zian/images/common/t_upload.jpg" alt=""></a>--%>
                            <ul class="img-list">
                                <li><a href="javascript:#myModal"><img class="myImg" src="http://52.79.40.214/Upload/100/company/info_gallery00.jpg" alt="이미지1"></a></li>
                                <li><a href="javascript:#myModal"><img class="myImg" src="http://52.79.40.214/Upload/100/company/info_gallery01.jpg" alt="이미지2"></a></li>
                                <li><a href="javascript:#myModal"><img class="myImg" src="http://52.79.40.214/Upload/100/company/info_gallery02.jpg" alt=""></a></li>
                                <li><a href="javascript:#myModal"><img class="myImg" src="http://52.79.40.214/Upload/100/company/info_gallery03.jpg" alt=""></a></li>
                                <li><a href="javascript:#myModal"><img class="myImg" src="http://52.79.40.214/Upload/100/company/info_gallery04.jpg" alt=""></a></li>
                                <li><a href="javascript:openLayer('.gList01')"><p>전체보기<br>(총 <span class="cTit"></span>장)</p></a></li>
                            </ul>
                        </div>
                        <!-- //지안에듀 1관 -->

                        <!-- 지안에듀 2관 -->
                        <div class="gallery station2">
                            <h2>지안에듀 2관</h2>
<%--                            <a href="javascript:upLoadPop2()"><img src="/common/zian/images/common/t_upload.jpg" alt=""></a>--%>
                            <ul>
                                <li><a href="javascript:openLayer('.gList02')"></a></li>
                                <li><a href="javascript:openLayer('.gList02')"></a></li>
                            </ul>
                        </div>
                        <!-- //지안에듀 1관 -->
                    </div>
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
</form>
</body>
</html>
<script>
    var modal = $("#myModal");
    var imgUrl;

    $('.img-list li > a').on('click',function(){
        var _index = $(this).parent().index();
        var _indexTar = $('.img-list li').eq(_index);

        $('.img-list li').removeClass('open');
        _indexTar.addClass('open');
        imgUrl = _indexTar.find('.myImg').attr('src');

        modal.find(".modal-content").attr('src', imgUrl);
        modal.find('.modal-content').attr('id', '');
        modal.find('.modal-content').attr('id', 'imgs_' + _index);

        modal.css('display','block');
    });

    var cnt=0;
    function openLayer(idName){
        if(cnt==0){
            cnt++;
            var pop = $(idName);
            pop.css('display','block');
        }
    }

    function closelayer(idName){
        var pop = $(idName);
        pop.css('display','none');
        cnt = 0;
    }


    //current position
    var pos = 0;
    //number of slides
    var totalSlides = $('#slider-wrap ul li').length;
    //get the slide width
    var sliderWidth = $('#slider-wrap').width();


    $(document).ready(function(){
        //set width to be 'x' times the number of slides
        $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);

        //next slide
        $('#next').click(function(){
            slideRight();
        });

        //previous slide
        $('#previous').click(function(){
            slideLeft();
        });


        //for each slide
        $.each($('#slider-wrap ul li'), function() {

            //create a pagination
            var li = document.createElement('li');
            $('#pagination-wrap ul').append(li);
        });

        //counter
        countSlides();

        //pagination
        pagination();

    });//DOCUMENT READY



    /***********
     SLIDE LEFT
     ************/
    function slideLeft(){
        pos--;
        if(pos==-1){ pos = totalSlides-1; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));

        //*> optional
        countSlides();
        pagination();
    }


    /************
     SLIDE RIGHT
     *************/
    function slideRight(){
        pos++;
        if(pos==totalSlides){ pos = 0; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));

        //*> 실행
        countSlides();
        pagination();
    }

    function countSlides(){
        $('#counter').html(pos+1 + ' / ' + totalSlides);
        $('.cTit').html(totalSlides);
    }

    function pagination(){
        $('#pagination-wrap ul li').removeClass('active');
        $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
    }
</script>
