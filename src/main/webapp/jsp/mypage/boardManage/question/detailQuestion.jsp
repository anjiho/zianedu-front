<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = '<%=bbsKey%>';
    innerValue("bbsKey", bbsKey);
    $(document).ready(function () {
        var resultInfo = getOneByOneQuestionDetailInfo(bbsKey);
        if(resultInfo != null){
            if(resultInfo.result.boardDetailInfo != null){
                var detailInfo = resultInfo.result.boardDetailInfo;
                //본문 내용 파싱작업 시작
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
                //봄문 내용 파징작업 끝
                innerHTML("content1", contents);
                innerHTML("indate", detailInfo.indate);
                innerHTML("writeUserName", detailInfo.userName);
                innerHTML("userId", detailInfo.userId);
                innerHTML("title", detailInfo.title);
                innerHTML("readCount", detailInfo.readCount);
            }
        }
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey" name="bbsKey" value="<%=bbsKey%>">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <div class="tabBox review wid30p">
                        <ul>
                            <li class="active"><a href="javascript:goPageNoSubmit('myPage', 'questionList')">1:1 문의내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'consult')">상담예약내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'boardList')">내게시글<span></span></a></li>
                        </ul>
                    </div>

                    <!--1:1 문의내역 -->
                    <div class="reviewBoard">
                        <div class="tableBox">
                            <table class="view">
                                <colgroup>
                                    <col class="w80p">
                                    <col class="w20p">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td class="bg_gray" id="title"></td>
                                    <td class="bg_gray ta_right" id="indate"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">작성자 : <span id="writeUserName"></span> (<span id="userId"></span>) | 조회수 : <span id="readCount"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="textContent">
                                        <div id="content1">
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea right">
                            <a href="javascript:goPageNoSubmit('myPage', 'questionList')" class="btn_m">목록으로</a>
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
