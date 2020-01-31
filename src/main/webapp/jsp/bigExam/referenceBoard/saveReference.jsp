<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            $(".mainStoryList").each(function(){
                kiplayer.sliderSlick($(this));
            });
            $(".slick-dots").hide();
            $('#writeContent').summernote({
                height: 300,
                minHeight: null,
                maxHeight: null,
                focus: true
            });
            $("#attachFile").on("change", addFiles);
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

    function saveReview() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if($('textarea[name="writeContent"]').val() == ''){
            alert('서브제목을 입력해 주세요.');
            return false;
        }
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if (filesTempArr.length == 0) { //파일 없을때
            var title = getInputTextValue("title");
            var content = $('textarea[name="writeContent"]').val();
            var result = saveBoard(11030, sessionUserInfo.userKey, title, content, 0, 0, '');
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
                        var result = saveBoard(11030, sessionUserInfo.userKey, title, content, 0, 0, fileName);
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
        <div id="container" class="big bigSub">
            <div class="inner">
                <div class="titleBar">
                    <h5>자료실</h5>
                    <span>지안에듀 회원이라면 자유롭게 이용할 수 있는 모의고사 자료실 입니다.</span>
                </div>
                <br>
                <div class="infolist">
                    <ul>
                        <li><span class="tit">※안내사항</span></li>
                        <li>· 시험 해설, 계정 법률, 스터디 및 암기 자료를 업로드 할 수 있습니다.</li>
                        <li>· 관리자의 판단 하에 부적절한 게시물은 삭제 조치됩니다.</li>
                        <li>· 불법 자료 공유 및 무단 도용을 금지합니다.</li>
                    </ul>
                </div>
                <div class="boardWrap">
                    <h5>자료실 등록하기</h5>
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
                        <a href="javascript:goPageNoSubmit('bigExam','bigReviewList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:saveReview();" class="btn_m radius w110">등록</a>
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
