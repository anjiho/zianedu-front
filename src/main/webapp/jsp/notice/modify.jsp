<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = '<%=bbsKey%>';
    $(document).ready(function() {
        var bbsmasterKey =  getBbsMasterKey();
        var result = getBoardDetailInfo(bbsmasterKey, bbsKey);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;
            $("#content").summernote("code", detailInfo.contents);
            innerValue("title", detailInfo.title);
        }
        $('#content').summernote({
            height: 400,
            minHeight: 400,
            maxHeight: 600,
            focus: true
        });
    });

    function modify(){
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;

        var filechk = $("#attachFile").val();

        if(filechk == "") { //파일 없을때
            var bbsKey   = getInputTextValue("bbsKey");
            var title    = getInputTextValue("title");
            var content  =  $('textarea[name="content"]').val();
            var isSecret = 0;

            console.log($("#content").val());
            console.log($("#content").html());

            return false;

            var result = updateBoard(bbsKey, title, content, isSecret, "");

            if(result.resultCode == 200){
                alert("성공적으로 수정 완료되었습니다");
            }
        }else{
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
                    if(data.resultCode == 200){
                        var bbsKey   = getInputTextValue("bbsKey");
                        var title    = getInputTextValue("title");
                        var content  =  $('textarea[name="content"]').val();
                        var isSecret = 0;
                        var fileName = data.keyValue;

                        var result = updateBoard(bbsKey, title, content, isSecret, fileName);

                        if(result.resultCode == 200){
                            alert("성공적으로 수정 완료되었습니다");
                        }
                    }
                }
            });
        }
    }

    $(document).on('change', '#attachFile', function() {
        var fileValue = $("#attachFile").val().split("\\");
        var fileName = fileValue[fileValue.length-1]; // 파일명
        $("#fileList").append("<li><a href=\"#\"><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\">"+  fileName  +"</a></li>");
    });
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
                    <h5>글 수정하기</h5>
                    <div class="tableBox">
                        <table class="form">
                            <input type="hidden" id="bbsKey" name="bbsKey" value="<%=bbsKey%>">
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
                        <a href="javascript:modify();" class="btn_m blue radius w110">수정</a>
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
