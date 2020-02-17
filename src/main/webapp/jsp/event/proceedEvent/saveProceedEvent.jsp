<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        $("#searchStartDate").datepicker({
            dateFormat:'yyyy-mm-dd',
            monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin:['일','월','화','수','목','금','토'],
            changeMonth:true, // 월변경가능
            changeYear:true,  // 년변경가능
        });
        $("#searchEndDate").datepicker({
            dateFormat:'yyyy-mm-dd',
            monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin:['일','월','화','수','목','금','토'],
            changeMonth:true, // 월변경가능
            changeYear:true,  // 년변경가능
        });
    });
    //파일 선택시 파일명 보이게 하기
    $(document).on('change', '.input-file', function() {
        $(this).parent().find('.custom-file-control').html($(this).val().replace(/C:\\fakepath\\/i, ''));
    });

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
        var filechk = $("#attachFile").val();
        if(sessionUserInfo != null) {
            if (filechk == "") { //파일 없을때
                alert("썸네일 이미지를 등록해 주세요.");
                return false;
            } else {
                var filechk = $("#attachFile").val();
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
                        <li><a href="javascript:goPageNoSubmit('event','winList');">담청자발표</a></li>
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
								                             <input  id="searchStartDate" type="text" class="useDatepicker">
								                            <img src="/common/zian/images/content/btn_calendar.gif"> <span class="hyphen">~</span>
								                         		<input  class="useDatepicker" id="searchEndDate" type="text">
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
                                        <input type="file" id="attachFile" class="input-file" required/>
                                        <span class="custom-file-control custom-file-label"></span>
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