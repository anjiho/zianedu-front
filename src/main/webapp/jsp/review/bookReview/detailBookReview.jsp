<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = '<%=bbsKey%>';
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#modifyBtn").hide();
            }
        }else{
            $("#modifyBtn").hide();
        }
        var bbsMasterKey = getBookReviewMasterKey();
        var result = getBoardDetailInfo(bbsMasterKey, bbsKey);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;

            if (sessionUserInfo != null) {
                if(detailInfo.writeUserKey == sessionUserInfo.userKey){
                    $("#modifyBtn").show();
                }
            }

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
            innerHTML("userName1", detailInfo.userName);
            innerHTML("userId", detailInfo.userId);
            innerHTML("title", detailInfo.title);
            innerHTML("readCount", detailInfo.readCount);
            innerHTML("fileName", detailInfo.fileName);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        var returnHtml = '<li><a href="javascript:download('+ "'" + fileList.fileName + "'" +')"><img src=\"/common/zian/images/common/icon_file.png\">'+ fileList.fileName +'</a></li>';
                        $("#fileList").append(returnHtml);
                    }
                }
            }else{
                gfn_display('fileContent', false);
            }
            var prevNextInfo = result.prevNextInfo;
            if(prevNextInfo != null){
                if(prevNextInfo.prevBbsKey == 0){
                    innerHTML("prevTitle", "");
                    innerHTML("prevCreateDate", "");
                    innerValue("prevNum", "");
                }else{
                    innerHTML("prevTitle", prevNextInfo.prevTitle);
                    innerHTML("prevCreateDate", prevNextInfo.prevCreateDate);
                    innerValue("prevNum", prevNextInfo.prevBbsKey);
                }
                if(prevNextInfo.nextBbsKey == 0){
                    innerHTML("nextTitle", "");
                    innerHTML("nextCreateDate", "");
                    innerValue("nextNum", "");
                }else{
                    innerHTML("nextTitle", prevNextInfo.nextTitle);
                    innerHTML("nextCreateDate", prevNextInfo.nextCreateDate);
                    innerValue("nextNum", prevNextInfo.nextBbsKey);
                }
            }

            var commentInfo = result.commentInfo;
            if(commentInfo.length > 0){
                for(var j =0; j<commentInfo.length;j++){
                    var commentHtml = "<td colspan=\"4\">";
                    commentHtml += " <div class='cm_list'>";
                    commentHtml += "<strong class='names'>"+ commentInfo[j].userName +"("+ commentInfo[j].userId +")</strong>";
                    commentHtml += "<span class='ctn'>"+ commentInfo[j].contents +"</span>";
                    commentHtml += "<span class='date'>"+ commentInfo[j].indate +"</span>";
                    commentHtml += "</div>";
                    commentHtml += "</td>";
                    $("#commentList").append(commentHtml);
                }
            }
        }
    });

    function goPrev() {
        var prevKey = getInputTextValue("prevNum");
        innerValue("bbsKey", prevKey);
        goPage('review','detailBook');
    }

    function goNext() {
        var nextKey = getInputTextValue("nextNum");
        innerValue("bbsKey", nextKey);
        goPage('review','detailBook');
    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey" name="bbsKey" value="<%=bbsKey%>">
    <input type="hidden" id="prevNum">
    <input type="hidden" id="nextNum">
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
                        <li><a href="javascript:goPageNoSubmit('review','videoList');">합격자영상</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','passList');">합격수기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','lectureList');">수강후기</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('review','bookList');">도서후기</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 도서후기 -->
                <div class="boardWrap reviewBoard">
                    <div class="tableBox">
                        <table class="tBoard acceptanceView">
                            <caption></caption>
                            <colgroup>
                                <col class="w110">
                                <col>
                                <col class="w140">
                            </colgroup>
                            <thead>
                            <tr>
                                <th colspan="2" id="title"></th>
                                <th id="indate"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="3">작성자 : <span id="userName1"></span> (<span id="userId"></span>)  |   조회수 : <span id="readCount"></span></td>
                            </tr>
                            <tr id="fileContent">
                                <td colspan="3">
                                    <div class="fileWrap">
                                        <span class="label">첨부파일 : </span>
                                        <ul class="fileList" id="fileList">
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    <div id="content1">
                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <table class="sentence">
                            <tbody>
                            <tr id="prev">
                                <td class="center">이전글 ▲</td>
                                <td class="left"><a href="javascript:goPrev();"><span id="prevTitle"></span></a></td>
                                <td class="right"><span id="prevCreateDate"></span></td>
                            </tr>
                            <tr>
                                <td class="center">다음글 ▼</td>
                                <td  class="left"><a href="javascript:goNext();"><span id="nextTitle"></span></a></td>
                                <td class="right"><span id="nextCreateDate"></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea divGroup noMargin">
                        <div class="left">
                            <a href="javascript:goPage('review','modifyBook')" class="btn_inline gray w110" id="modifyBtn">수정</a>
                        </div>
                        <div class="right">
                            <a href="javascript:goPage('review','bookList')" class="btn_inline bdblue w110">목록</a>
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
</form>
</body>
</html>
