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
        $("#attachFile").on("change", addFiles);
    });
    // $(document).on('change', '#attachFile', function() {
    //     var fileValue = $("#attachFile").val().split("\\");
    //     var fileName = fileValue[fileValue.length-1]; // 파일명
    //     $("#fileList").append("<li><a href=\"#\"><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\">"+ fileName +"</a></li>");
    // });

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

    function save(){
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));

        var bbsmasterKey =  getBbsMasterKey();

        if(filesTempArr.length == 0) { //파일 없을때
            var userKey  = sessionUserInfo.userKey;
            var title    = getInputTextValue("title");
            var content  =  $('textarea[name="content"]').val();
            var isSecret = 0;

            var result = saveBoard(bbsmasterKey, userKey, title, content, isSecret, 0, "");
            if(result.resultCode == 200){
                alert("성공적으로 등록 완료되었습니다");
            }
        }else{
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
                    if(data.resultCode == 200){
                        var fileName = data.keyValue;
                        var userKey  = sessionUserInfo.userKey;
                        var title    = getInputTextValue("title");
                        var content  =  $('textarea[name="content"]').val();
                        var isSecret = 0;
                        var result = saveBoard(bbsmasterKey, userKey, title, content, isSecret, 0, fileName);
                        var str = toStrFileName(fileName);
                        saveBoardFileList(result.keyValue, str);
                        if (result.resultCode == 200) {
                            alert("성공적으로 등록 완료되었습니다");
                        }
                    }
                }
            });
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
<%--                                   <input type="file" id="attachFile" class="fileBtn noline nobg">--%>
<%--                                   <ul id='fileList' class="fileList"></ul>--%>
                                        <input type="file" name="files[]" id="attachFile" class="fileBtn noline"  multiple/>
                                        <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPage('notice','list');" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:save();" class="btn_m onBlue radius w110">등록</a>
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
