<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = <%=bbsKey%>;
    $(document).ready(function () {
        $('#writeContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
        var result = getBoardDetailInfo(11046, bbsKey);
        console.log(result);
        if(result != null){
            var detailInfo = result.boardDetailInfo;
            $("#writeContent").summernote("code", detailInfo.contents);
            innerValue("title", detailInfo.title);
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

    //파일 선택시 파일명 보이게 하기
    $(document).on('change', '.input-file', function() {
        $(this).parent().find('.custom-file-control').html($(this).val().replace(/C:\\fakepath\\/i, ''));
    });

    function modifyEvnet() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if($('textarea[name="writeContent"]').val() == ''){
            alert('서브제목을 입력해 주세요.');
            return false;
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var filechk = $("#attachFile").val();
        if(sessionUserInfo != null) {
            if (filechk == "") { //파일 없을때
                var title = getInputTextValue("title");
                var content = $('textarea[name="writeContent"]').val();
                var bbsKey = getInputTextValue('bbsKey');
                var result = updateBoard(bbsKey, title, content, 0, '');
                if (result.resultCode == 200) {
                    alert("성공적으로 등록 완료되었습니다");
                    return false;
                }
            } else {
                var data = new FormData();
                $.each($('#attachFile')[0].files, function(i, file) {
                    data.append('file', file);
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
                        if (data.resultCode == 200) {
                            var fileName = data.keyValue;
                            var title = getInputTextValue("title");
                            var content = $('textarea[name="writeContent"]').val();
                            var bbsKey = getInputTextValue('bbsKey');
                            var result = updateBoard(bbsKey, title, content, 0, fileName);
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
    <input type="hidden" id="bbsKey" value="<%=bbsKey%>">
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
                                    <input type="file" name="attachFile" id="attachFile" class="input-file"  multiple/>
                                    <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPageNoSubmit('event','winList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:modifyEvnet();" class="btn_m radius w110 ">수정</a>
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