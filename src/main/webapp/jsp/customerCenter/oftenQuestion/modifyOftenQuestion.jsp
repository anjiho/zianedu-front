<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<%@include file="/common/jsp/common.jsp" %>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = <%=bbsKey%>;
    $(document).ready(function () {
        if(divisionPcMobile() == 'PC') {
            $('#Recontent').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
            });
        } else {
            $('#replyContent').attr("cols", 40);
            $('#replyContent').attr("rows", 15);
        }

        var result = getBoardDetailInfo(10018, bbsKey);
        if(result != null){
            var detailInfo = result.boardDetailInfo;

            var detailInfoStr = JSON.stringify(detailInfo);
            var detailInfoStrObj = JSON.parse(detailInfoStr);
            var contentsObj = detailInfoStrObj.contents;
            var contentsStr = JSON.stringify(contentsObj);
            var contentsStrRep = contentsStr.replace(/['"]+/g, '');
            var contentsStrRep3 = contentsStrRep.replace(/\\n/g,'');   //역슬러쉬 제거하기
            var contentsStrRep4 = contentsStrRep3.replace(/\\r/g,'');   //역슬러쉬 제거하기
            var contentsStrRep5 = contentsStrRep4.replace(/\\/gi, "");   //역슬러쉬 제거하기
            var contentsHTML = $.parseHTML(contentsStrRep5);
            var contents = null;
            var findString = "&lt";
            //HTML 포함 여부 화인
            if(detailInfoStr.indexOf(findString) != -1) {
                contents = contentsHTML[0].data.replace("rn", "");
            } else {
                contents = contentsHTML;
            }

            $("#title").val(detailInfo.title);
            $("#Recontent").summernote("code", contents);
            //$("#Recontent").val(detailInfo.contents);
            $("#type").val(detailInfo.ctgKey);
        }
    });

    function modifyEvnet() {
        if($('textarea[name="content"]').val() == ''){
            alert('답변내용을 입력해 주세요.');
            return false;
        }
        if($('textarea[name="title"]').val() == ''){
            alert('질문을 입력해 주세요.');
            return false;
        }
        var type = getSelectboxValue('type');
        var bbsKey = getInputTextValue('bbsKey');
        var content = $('textarea[name="Recontent"]').val();
        var title = getInputTextValue("title");
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            var result = updateFaqBoard(bbsKey, type, title, content);
            if(result.resultCode == 200){
                alert("수정이 완료 되었습니다.");
                goPageNoSubmit('customerCenter','oftenList');
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
                <div class="tabBox tBox4">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');">1:1문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');">상담예약</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');">모바일문의</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('customerCenter','oftenList');">자주하는질문</a></li>
                    </ul>
                </div>
                <br />
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
                                    <th scope="row">카테고리</th>
                                    <td><select id="type">
                                        <option value="317">회원관련</option>
                                        <option value="318">수강신청관련</option>
                                        <option value="319">동영상관련</option>
                                        <option value="320">모바일관련</option>
                                        <option value="321">결제·환불관련</option>
                                        <option value="322">교재·배송교환</option>
                                        <option value="322">기타문의</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">질문</th>
                                    <td><input type="text" name="title" id="title" placeholder="내용을 입력해주세요." class="w100p h240"></input></td>
                                </tr>
                                <tr>
                                    <th scope="row">답변내용</th>
                                    <td class="">
                                        <textarea class="w100p" name="Recontent" id="Recontent" placeholder="답변내용을 입력해주세요."></textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('customerCenter','oftenList')" class="btn_m gray radius w110">취소</a>
                            <a href="javascript:modifyEvnet();" class="btn_m radius w110">수정</a>
                        </div>
                    </div>
                    <!--//서브 컨텐츠-->
                </div>
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