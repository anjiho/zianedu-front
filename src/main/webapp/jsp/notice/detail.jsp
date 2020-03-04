<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%--    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">--%>
<%--    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>--%>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    // 특수 문자가 있나 없나 체크
    function checkSpecial(str) {
        var special_pattern = /(?:\\[rn]|[\r\n]+)+/g;
        if(special_pattern.test(str) == true) {
            return true;
        } else {
            return false;
        }
    }

    var bbsKey = '<%=bbsKey%>';
    innerValue("bbsKey", bbsKey);
    $( document ).ready(function() {
        //modifyBtn
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#modifyBtn").hide();
            }
        }else{
            $("#modifyBtn").hide();getMainBottomBanner
        }
        var bbsmasterKey =  getBbsMasterKey();

        var result = getBoardDetailInfo(bbsmasterKey, bbsKey);

        if(result != undefined){
            var detailInfo = result.boardDetailInfo;

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

            innerHTML("contentInfo", contents);
            innerHTML("indate", detailInfo.indate);
            innerHTML("writeUserName", detailInfo.userName);
            innerHTML("userId", "(" + detailInfo.userId +")");
            innerHTML("title", detailInfo.title);
            innerHTML("readCount", detailInfo.readCount);
            innerHTML("fileName", detailInfo.fileName);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        var retrunHtml = "<li><a href=\'"+ fileList.fileUrl +"'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> "+ fileList.fileName +"</a></li>";
                        $("#fileList").append(retrunHtml);
                    }
                }
            }else{
                $("#fileContent").hide();
            }


            var prevNextInfo = result.prevNextInfo;
            if(prevNextInfo != null){
                if(prevNextInfo.prevBbsKey == 0){
                    $("#prev").hide();
                    innerHTML("prevTitle", "");
                    innerHTML("prevCreateDate", "");
                    innerValue("prevNum", "");
                }else{
                    $("#prev").show();
                    innerHTML("prevTitle", prevNextInfo.prevTitle);
                    innerHTML("prevCreateDate", prevNextInfo.prevCreateDate);
                    innerValue("prevNum", prevNextInfo.prevBbsKey);
                }

                innerHTML("nextTitle", prevNextInfo.nextTitle);
                innerHTML("nextCreateDate", prevNextInfo.nextCreateDate);
                innerValue("nextNum", prevNextInfo.nextBbsKey);
            }

        }
    });

    function goModify() {
        goPage("notice", "modify");
    }

    function goPrev() {
        var prevKey = getInputTextValue("prevNum");
        innerValue("bbsKey", prevKey);
        goPage("notice", "detail");
    }

    function goNext() {
        var nextKey = getInputTextValue("nextNum");
        innerValue("bbsKey", nextKey);
        goPage("notice", "detail");
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="boardWrap">
                    <div class="tableWrap">
                        <table class="tBoard noticeView">
                            <input type="hidden" id="bbsKey" name="bbsKey" value="<%=bbsKey%>">
                            <input type="hidden" id="prevNum">
                            <input type="hidden" id="nextNum">
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
                                <td colspan="3">작성자 : <span id="writeUserName"></span> <span id="userId"></span>  |   조회수 : <span id="readCount"></span></td>
                            </tr>
                            <tr id="fileContent">
                                <td colspan="3">
                                    <div class="fileWrap">
                                        <span class="label">첨부파일 : </span>
                                        <ul class="fileList" id="fileList"></ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    <div id="contentInfo"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이전글 ▲</td>
                                <td class="left"><a href="javascript:goPrev();"><span id="prevTitle"></span></a></td>
                                <td class="right"><span id="prevCreateDate"></span></td>
                            </tr>
                            <tr>
                                <td class="center">다음글 ▼</td>
                                <td class="left"><a href="javascript:goNext();"><span id="nextTitle"></span></a></td>
                                <td class="right"><span id="nextCreateDate"></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea divGroup noMargin">
                        <div class="left">
                            <a href="javascript:goModify()" class="btn_inline gray w110" id="modifyBtn">수정</a>
                        </div>
                        <div class="right">
                            <a href="javascript:goPage('notice', 'list')" class="btn_inline w110">목록</a>
                        </div>
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
