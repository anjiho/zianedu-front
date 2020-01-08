<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = '<%=bbsKey%>';
    $( document ).ready(function() {
        $('#writeContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
        $("#attachFile").on("change", addFiles);
        var bbsMasterKey = getReviewMasterKey();
        var result = getBoardDetailInfo(bbsMasterKey, bbsKey);
        console.log(result);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;
            console.log(result);
            $("#writeContent").summernote("code", detailInfo.contents);
            innerValue("title", detailInfo.title);
            innerValue("codeUrl", detailInfo.youtubeHtml);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        var retrunHtml = "<li><a href='javascript:void(0);'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> "+ fileList.fileName +"</a></li>";
                        $("#fileList").append(retrunHtml);
                    }
                }
            }
        }
    });

    var filesTempArr = [];
    function addFiles(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr.length;
        if(filesTempArrLen > 0){
            alert("첨부파일은 1개 이상 등록할 수 없습니다.");
            return false;
        }
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

    function modifyReview() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if (check.input("codeUrl", comment.codeUrl_info) == false) return;
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            var title = getInputTextValue("title");
            var codeUrl = getInputTextValue("codeUrl");
            var content = $('textarea[name="writeContent"]').val();
            if (filesTempArr.length == 0) { //파일 없을때
                var result = updateBoardReview(bbsKey, title, content, 0, '', codeUrl, '', '', '');
                if (result.resultCode == 200) {
                    //$("#modal9").show();
                    alert("성공적으로 등록 완료되었습니다.");
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
                            var codeUrl = getInputTextValue("codeUrl");
                            var result = updateBoardReview(bbsKey, title, content, 0, fileName, codeUrl, '', '', '');
                            var str = toStrFileName(fileName);
                            saveBoardFileList(result.keyValue, str);
                            if (result.resultCode == 200) {
                                alert("성공적으로 수정이 완료되었습니다");
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
                        <li class="active"><a href="javascript:goPageNoSubmit('review','videoList');">합격자영상</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','passList');">합격수기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','lectureList');">수강후기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','bookList');">도서후기</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 합격자영상-->
                <div class="boardWrap reviewBoard">
                    <div class="review_txt">
                        <p>수강색분들의 합격을 축하드립니다.</p>
                        <span>총<b>5</b>개의 합격자 영상이 있습니다. <br> 지안에듀에서만 가능한 합격비법을 확인해 보세요</span>
                    </div>
                    <!--review_point : 합격수기 포인트-->
                    <div class="review_point">
                        <p><span class="ico"></span>합격수기 포인트 지급안내</p>
                        <ul>
                            <li>1. 작성 시 무조건 <b>200P</b> 지급 (월 1회까지만 지급되며, 매달 추가 작성 가능)</li>
                            <li>2. BEST 선정 시 무려 <b>1000P </b>추가 지급!</li>
                            <li>3. 매월 연속 작성 시 마다 추가 100P 지급 (단, 연속 6회까지는 추가 지급 )</li>
                        </ul>
                    </div>
                    <!--//review_point : 합격수기 포인트-->

                    <div class="boardWrap">
                        <h5>영상 수정하기</h5>
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
                                    <td><input type="text" id="title" value="제목을 입력해주세요." class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td><textarea name="writeContent" id="writeContent" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">첨부파일</th>
                                    <td class="">
                                        <label for="attachFile">업로드</label>
                                        <input type="file" name="attachFile[]" id="attachFile" class=""  multiple/>
                                        <ul id='fileList' class="fileList"></ul>
                                        <!--
                                         <input type="file" name="files[]" id="attachFile" class="fileBtn noline"  multiple/>
                                        <ul id='fileList' class="fileList"></ul>
                                        -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Html코드</th>
                                    <td><input type="text" id="codeUrl" value="영상주소를 입력해주세요." class="w100p"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('review','videoList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:modifyReview();" class="btn_m radius w110">수정</a>
                        </div>
                    </div>
                </div>
                <!--//reviewBoard -->
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
    <!--팝업 등록안내 modal9-->
    <div id="modal9" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>알림</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle"></p>
                    <span class="txtBox">성공적으로 등록 완료되었습니다.</span>
                </div>
            </div>
        </div>
    </div>
    <!--//팝업-->
</form>
</body>
</html>
