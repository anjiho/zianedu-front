<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = <%=bbsKey%>;
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            $(".mainStoryList").each(function(){
                kiplayer.sliderSlick($(this));
            });
            $(".slick-dots").hide();

            var pcMobile = divisionPcMobile();
            if(pcMobile == 'PC') {
                $('#writeContent').summernote({
                    height: 300,
                    minHeight: null,
                    maxHeight: null,
                    focus: true
                });
            } else {
                $('#content').attr("cols", 40);
                $('#content').attr("rows", 15);
            }
            $("#attachFile").on("change", addFiles);
            var result = getBoardDetailInfo(11051, bbsKey);
            if(result != null){
                var detailInfo = result.boardDetailInfo;
                $("#writeContent").summernote("code", detailInfo.contents);
                innerValue("title", detailInfo.title);
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
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
    });

    var filesTempArr = [];
    function addFiles(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr.length;
        for( var i=0; i<filesArrLen; i++ ) {
            filesTempArr.push(filesArr[i]);
            $("#fileList").append("<div>" + filesArr[i].name + "<a href='javascript:void(0);' onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\">X</a></div>");
        }
        $(this).val('');
    }
    function deleteFile (eventParam, orderParam) {
        filesTempArr.splice(orderParam, 1);
        var innerHtmlTemp = "";
        var filesTempArrLen = filesTempArr.length;
        for(var i=0; i<filesTempArrLen; i++) {
            innerHtmlTemp += "<div>" + filesTempArr[i].name + "<a  href='javascript:void(0);' onclick=\"deleteFile(event, " + i + ");\">X</a></div>"
        }
        $("#fileList").html(innerHtmlTemp);
    }

    function modifyReference() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if($('textarea[name="writeContent"]').val() == ''){
            alert('내용을 입력해 주세요.');
            return false;
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            if (filesTempArr.length == 0) { //파일 없을때
                var title = getInputTextValue("title");
                var content = $('textarea[name="writeContent"]').val();
                var bbsKey = getInputTextValue('bbsKey');
                var result = updateBoard(bbsKey, title, content, 0, '');
                if (result.resultCode == 200) {
                    alert("수정이 완료되었습니다.");
                    goPageNoSubmit('bigExam','referenceList');
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
                            var bbsKey = getInputTextValue('bbsKey');
                            var result = updateBoard(bbsKey, title, content, 0, fileName);
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                            if (result.resultCode == 200) {
                                alert("수정이 완료되었습니다.");
                                goPageNoSubmit('bigExam','referenceList');
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
    <input type="hidden" id="bbsKey" value="<%=bbsKey%>">
    <div id="wrap" class="big">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/bigExamHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="big bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->


                <!-- 지안에듀 모의고사 BEST 응시후기 -->
                <div class="mainStory mainStorysub">

                </div>

                <div class="boardWrap">
                    <h5>후기 수정하기</h5>
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
                                <%--                                <td class="">--%>
                                <%--                                    <a href="#" class="btn_m gray w110">파일 업로드</a>--%>
                                <%--                                    <ul class="fileList">--%>
                                <%--                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.png</a></li>--%>
                                <%--                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일002.png</a></li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </td>--%>
                                <td class="">
                                    <label for="attachFile">파일 업로드</label>
                                    <input type="file" name="attachFile[]" id="attachFile" class="btn_m gray w110"  multiple/>
                                    <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPageNoSubmit('bigExam','referenceList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:modifyReference();" class="btn_m radius w110">등록</a>
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
