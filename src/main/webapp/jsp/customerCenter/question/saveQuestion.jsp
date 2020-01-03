<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            innerHTML("userName", sessionUserInfo.name);
        }
        getLeftQuestionMenu(316);

        $("#questionSel").change(function () {
            getOftenQuestionDetailList(this.value);
        });

        /* 질문등록 */
        $("#attachFile").on("change", addFiles);

    });

    //질문답변보기
    function goQustionReplyDetail() {
        alert($("#reQuestionSel").val());
    }

    var filesTempArr = [];
    function addFiles(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr.length;
        for( var i=0; i<filesArrLen; i++ ) {
            filesTempArr.push(filesArr[i]);
            $("#fileList").append("<div>" + filesArr[i].name + "<img src=\"/common/zian/images/common/icon_file.png\" onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\"></div>");
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
        $("#fileList").html(innerHtmlTemp);
    }

    function saveQustion() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            var userKey = sessionUserInfo.userKey;
            var title = getInputTextValue("title");
            var ctgKey = getSelectboxValue("ctgKeySel");
            if (ctgKey == "") {
                alert("분류를 선택해 주세요");
                return false;
            }
            var content = $('textarea[name="writeContent"]').val();
            if (filesTempArr.length == 0) { //파일 없을때
                var result = saveBoard(10019, userKey, title, content, 0, ctgKey, '');
                if (result.resultCode == 200) {
                    alert("문의가 등록되었습니다");
                    return false;
                }
            } else {
                var formData = new FormData();
                for (var i = 0, filesTempArrLen = filesTempArr.length; i < filesTempArrLen; i++) {
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
                        if (data.resultCode == 200) {
                            var fileName = data.keyValue;
                            var result = saveBoard(10019, userKey, title, content, 0, ctgKey, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                            if (result.resultCode == 200) {
                                alert("성공적으로 등록 완료되었습니다");
                                goLoginPage();
                            }
                        }
                    }
                });
            }
        }else{
            alert("로그인을 해주세요.");
            return false;
        }
    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">

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
                        <li class="active"><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');">1:1문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');">상담예약</a></li>
                        <li><a href="#">모바일문의</a></li>
                        <li><a href="#">자주하는질문</a></li>
                    </ul>
                </div>
                <br/>
                <div class="customer">
                    <!-- 수강생 안내 -->
                    <div class="customer_inner">
                        <p><span id="userName"></span> 수강생님 무엇을 도와드릴까요?</p>
                        <select name="a_lecture" class="a_lecture" id="questionSel"></select>
                        <select name="a_request" class="a_request" id="reQuestionSel">
<%--                            <option value="" selected>-- 선택 --</option>--%>
<%--                            <option value="ss">아침무료특강은 어떻게 들으면 되나요?</option>--%>
<%--                            <option value="aa">기기변경은 어디서 하나요?</option>--%>
                        </select>
                        <a href="javascript:goQustionReplyDetail();" class="coment_btn">질문답변보기</a>
                    </div>
                    <!-- //수강생 안내 -->

                    <div class="boardWrap">
                        <h5>문의 등록하기</h5>
                        <div class="tableBox">
                            <table class="form" style="border-top:2px solid #000">
                                <caption></caption>
                                <colgroup>
                                    <col class="w130">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">분류</th>
                                    <td>
                                        <select id="ctgKeySel" style="width:200px;padding:0 8px;background:none">
                                            <option value="" selected>분류선택</option>
                                            <option value="569">학원강의문의</option>
                                            <option value="570">동영상강의문의</option>
                                            <option value="571">온라인서점문의</option>
                                            <option value="7230">결제문의</option>
                                            <option value="7231">동영상오류문의</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td>
                                        <textarea name="writeContent" id="writeContent"  class="w100p h240"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">첨부파일</th>
                                    <td class="">
<%--                                        <label for="ex_file">업로드</label>--%>
<%--                                        <input type="file" id="ex_file">--%>
                                        <input type="file" name="files[]" id="attachFile" class="fileBtn noline"  multiple/>
                                        <ul id='fileList' class="fileList"></ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="#" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:saveQustion();" class="btn_m onBlue radius w110">등록</a>
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
