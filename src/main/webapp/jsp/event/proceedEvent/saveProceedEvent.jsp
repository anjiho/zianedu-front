<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
        $("#attachFile").on("change", addFiles);
        $("#searchStartDate").datepicker({
            format: "yyyy-mm-dd"
        });
        $("#searchEndDate").datepicker({
            format: "yyyy-mm-dd"
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
            if(filesTempArrLen > 0){
                alert("썸네일은 한개만 등록 가능합니다.");
                return false;
            }
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
        if (check.input("searchStartDate", comment.searchDate_info) == false) return;
        if (check.input("searchEndDate", comment.searchDate_info) == false) return;
        if (check.input("objectStr", comment.targetName_info) == false) return;
        if (check.input("detailUrl", comment.url_info) == false) return;
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            if (filesTempArr.length == 0) { //파일 없을때
                alert("썸네일 이미지를 등록해 주세요.");
                return false;
                // var result = saveBoardReview(bbsMasterKey, userKey, title, content, 0, 0, '', '', '', '', bookName);
                // if (result.resultCode == 200) {
                //     //$("#modal9").show();
                //     alert("성공적으로 등록 완료되었습니다.");
                //     return false;
                // }
            } else {
                // var formData = new FormData();
                // for (var i = 0, filesTempArrLen = filesTempArr.length; i < filesTempArrLen; i++) {
                //     formData.append("files", filesTempArr[i]);
                // }

                var data = new FormData();
                $.each($('#attachFile')[0].files, function(i, file) {
                    alert("1")
                    console.log(file);
                    data.append('file', file);
                });
                console.log(data);
                $.ajax({
                    //url: "http://52.79.40.214:9090/fileUpload/boardFile",
                    url: "http://localhost:9090/fileUpload/boardFile",
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
                            var searchStartDate = getInputTextValue("searchStartDate");
                            var searchEndDate = getInputTextValue("searchEndDate");
                            var detailUrl = getInputTextValue("detailUrl");
                            var targetName = getInputTextValue("objectStr");
                            var result = saveEventInfo(title, content, searchStartDate, searchEndDate, targetName, fileName, detailUrl);
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
                        <li class="active"><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li><a href="#">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 진행중이벤트-->
                <div class="boardWrap eventBoard">
                    <div class="boardWrap">
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
                                    <th scope="row">서브제목</th>
                                    <td><textarea name="writeContent" id="writeContent" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">기간</th>
                                    <td>
                                        <div class="date_pick">
                                            <form name="form_reserve" id="form_reserve" action="/shop/mypage.html" method="GET">
                                                <input name="mypage_type" type="hidden" value="myreserve">
                                                <fieldset>
                                                    <legend>적립금 기간 검색 폼</legend>
                                                    <span class="key-wrap">
								                             <input  id="searchStartDate" type="text">
								                            <img src="/common/zian/images/content/btn_calendar.gif"> <span class="hyphen">~</span>
								                         		<input  class="" id="searchEndDate" type="text">
								                        	<img src="/common/zian/images/content/btn_calendar.gif">
							                            </span>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">대상</th>
                                    <td><input type="text" id="objectStr" class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">상세URL</th>
                                    <td><input type="text" id="detailUrl" placeholder="http://" class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">썸네일</th>
                                    <td class="">
                                        <label for="attachFile">업로드</label>
                                        <input type="file" id="attachFile" class="input-file"/>
                                        <ul id='fileList' class="fileList"></ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="#" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="javascript:saveEvent();" class="btn_m radius w110">등록</a>
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