<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        $('#writeContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
        $("#attachFile").on("change", addFiles);
    });

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

    function saveEvent() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if($('textarea[name="writeContent"]').val() == ''){
            alert('서브제목을 입력해 주세요.');
            return false;
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            if (filesTempArr.length == 0) { //파일 없을때
                var title = getInputTextValue("title");
                var content = $('textarea[name="writeContent"]').val();
                var result = saveBoard(11046, sessionUserInfo.userKey, title, content, 0, 0, '');
                if (result.resultCode == 200) {
                    alert("성공적으로 등록 완료되었습니다");
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
                            var title = getInputTextValue("title");
                            var content = $('textarea[name="writeContent"]').val();
                            var result = saveBoard(11046, sessionUserInfo.userKey, title, content, 0, 0, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                            if (result.resultCode == 200) {
                                alert("성공적으로 등록 완료되었습니다");
                                return false;
                            }
                        }
                    }
                });
            }
        }else{
            alert("로그인을 해주세요.");
            goLoginPage();
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

                <div class="tabBox">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','winList');">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--담청자발표-->
                <div class="boardWrap eventBoard">
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
                                <td><input type="text" id="title" placeholder="제목을 입력해주세요." class="w100p"></td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td><textarea id="writeContent" name="writeContent" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td class="">
                                    <label for="attachFile">업로드</label>
                                    <input type="file" name="attachFile[]" id="attachFile" class=""  multiple/>
                                    <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPageNoSubmit('event','winList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:saveEvent();" class="btn_m radius w110">등록</a>
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