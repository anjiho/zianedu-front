<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('noticeHeader');
        //getNoticeList(1, 10, '10001', "", "");
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
                                <td><input type="text" name="" value="" class="w100p"></td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td><textarea name="" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td class="">
                                    <input type="file" id="file1" class="fileBtn noline nobg">
                                    <ul class="fileList">
                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.jpg</a></li>
                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일002.jpg</a></li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="#" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="#" class="btn_m blue radius w110">등록</a>
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
