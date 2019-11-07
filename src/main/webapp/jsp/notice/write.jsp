<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function() {
        $('#content').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
        });
    });
    $(document).on('change', '#attachFile', function() {
        var fileValue = $("#attachFile").val().split("\\");
        var fileName = fileValue[fileValue.length-1]; // 파일명
        $("#fileList").append("<li><a href=\"#\"><img src=\"../images/common/icon_file.png\" alt=\"\">"+ fileName +"</a></li>");
    });

    function save(){
        var content =  $('textarea[name="content"]').val();
        console.log(content);
        // var check = new isCheck();
        //
        // if (check.input("title", comment.input_title) == false) return;
        //
        // var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        // var noticeHeaderInfo = sessionStorage.getItem('noticeHeader');
        // var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        //
        // var bbsmasterKey = '';
        // if(leftMenuInfo == "publicOnline" || leftMenuInfo == "publicAcademy"){//행정직 온라인, 행정직학원
        //     if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
        //     else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
        //     else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
        //     else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
        //     else bbsmasterKey = "10057";//온라인서점
        // }else if(leftMenuInfo == "techOnline" || leftMenuInfo == "techAcademy"){//기술직 온라인. 기술직학원
        //     if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10026";
        //     else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10027";
        //     else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10030";
        //     else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
        //     else bbsmasterKey = "10057";
        // }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){//계리직 온라인. 계리직 학원
        //     if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10041";
        //     else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10042";
        //     else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10044";
        //     else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
        //     else bbsmasterKey = "10057";
        // }else{
        //     if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
        //     else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
        //     else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
        //     else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
        //     else bbsmasterKey = "10057";//온라인서점
        // }
        //
        // var userKey = sessionUserInfo.userKey;
        // var title   = getInputTextValue("title");
        // var content =  $('textarea[name="content"]').val();
        // var isSecret = 0;
        // var fileName = '';
        //
        // var result = saveBoard(bbsmasterKey, userKey, title, content, isSecret, fileName);
        // if(result.resultCode == 200){
        //     alert("글쓰기등록완료");
        // }else{
        //     alert("오류");
        // }
        var data = new FormData();
        $.each($('#attachFile')[0].files, function(i, file) {
            data.append('file_name', file);
        });
        $.ajax({
            url: "http://52.79.40.214:9090/fileUpload/boardFile",
            method: "post",
            dataType: "JSON",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (data) {
                if(data.result){
                    console.log(data.result);
                    // goPage('productManage', 'academyLectureList');
                }
            }
        });
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="cols7">
                        <li><a href="#">내강의실</a></li>
                        <li><a href="#">교수소개</a></li>
                        <li><a href="#">학원수강신청</a></li>
                        <li><a href="#">1:1 관리반</a></li>
                        <li><a href="#">무료강좌</a></li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a></li>
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
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="boardWrap">
                    <h5>글 등록하기</h5>
                    <div class="tableBox">
                        <table class="form">
                            <input type="hidden" id="menuInfoKey" value="">
                            <caption></caption>
                            <colgroup>
                                <col class="w130">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">제목</th>
                                <td><input type="text" id="title" value="" class="w100p"></td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td><textarea name="content" id="content" value=""></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td class="">
                                    <div class="inputWrapper"><input type="file" id="attachFile" class="fileBtn noline nobg"></div>
                                    <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPage('notice','list');" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:save();" class="btn_m blue radius w110">등록</a>
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
