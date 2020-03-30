<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<%@include file="/common/jsp/common.jsp" %>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
        var pcMobile = divisionPcMobile();
        if(pcMobile == 'PC') {
            $('#title').summernote({
                height: 300,
                minHeight: null,
                maxHeight: null,
                focus: true
            });
        }
    });
    function saveOftenQuestion() {
        if($('textarea[name="content"]').val() == ''){
            alert('답변내용을 입력해 주세요.');
            return false;
        }
        if($('textarea[name="title"]').val() == ''){
            alert('질문을 입력해 주세요.');
            return false;
        }
        var type = getSelectboxValue('type');
        var content = $('textarea[name="Recontent"]').val();
        var title = $('textarea[name="title"]').val();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            var result = saveTeacherBoard(10018, type, sessionUserInfo.userKey, title, content, 0, 0, '');
           if(result.resultCode == 200){
               alert("등록이 완료 되었습니다.");
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
                                <td><textarea name="title" id="title" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
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
                        <a href="javascript:saveOftenQuestion();" class="btn_m radius w110">등록</a>
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