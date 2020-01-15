<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = <%=bbsKey%>;
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            if(sessionUserInfo.authority != 0){
                $("#modifyBtn").hide();
            }
        }else{
            $("#modifyBtn").hide();
        }

        var result = getBoardDetailInfo(10059, bbsKey);
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

            innerHTML("content", contents);
            innerHTML("indate", detailInfo.indate);
            innerHTML("userName", detailInfo.userName);
            innerHTML("userId", detailInfo.userId);
            innerHTML("title", detailInfo.title);
            innerHTML("readCount", detailInfo.readCount);
            innerHTML("fileName", detailInfo.fileName);
            if(detailInfo.fileInfo != null) {
                if (detailInfo.fileInfo.length > 0) {
                    for (var i = 0; i < detailInfo.fileInfo.length; i++) {
                        var fileList = detailInfo.fileInfo[i];
                        // var retrunHtml = "<a href='" + fileList.fileUrl + "' download>" + fileList.fileName + "</a>";
                        var retrunHtml = "<li><a href=\'"+ fileList.fileUrl +"'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> "+ fileList.fileName +"</a></li>";
                        $("#fileList").append(retrunHtml);
                    }
                }
            }
            var prevNextInfo = result.prevNextInfo;
            console.log(prevNextInfo);
            if(prevNextInfo.prevBbsKey != null){
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
            }
            innerHTML("nextTitle", prevNextInfo.nextTitle);
            innerHTML("nextCreateDate", prevNextInfo.nextCreateDate);
            innerValue("nextNum", prevNextInfo.nextBbsKey);
        }
    });

    function goPrev() {
        var prevKey = getInputTextValue("prevNum");
        innerValue("bbsKey", prevKey);
        goPage("bookStore", "detailErrata");
    }

    function goNext() {
        var nextKey = getInputTextValue("nextNum");
        innerValue("bbsKey", nextKey);
        goPage("bookStore", "detailErrata");
    }

    //댓글 저장
    function commentSave() {
        var commentContent = getInputTextValue("commentContent");
        var bbsKey = getInputTextValue("bbsKey");
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        var result = saveBoardComment(bbsKey, userKey, commentContent);
        if(result.resultCode == 200){
            alert("댓글이 등록 되었습니다.");
            isReloadPage();
        }
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" name="bbsKey" id="bbsKey" value="<%=bbsKey%>">
    <input type="hidden" id="sPage">
    <input type="hidden" id="prevNum">
    <input type="hidden" id="nextNum">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="shop">
            <div class="inner">
                <!--서브 컨텐츠-->

                <!--서브상단공통배너-->
                <div class="submainBanner">
                    <img src="/common/zian/images/content/subBanner_bg.jpg">
                    <div class="Banner_txt">
                        <p class="title"><img src="/common/zian/images/content/submain_img06.png" alt="정오표 안내"></p>
                        <span class="txt">불편을 드려 죄송합니다. <br> 더 좋은 교재를 만들기 위해 노력하겠습니다</span>
                    </div>
                </div>
                <div class="boardWrap">
                    <div class="boardWrap_inner">
                        <div class="btnArea right mgr20">
                            <a href="javascript:goPage('bookStore','modifyErrata')" class="btn_m w120" id="modifyBtn">수정</a>
                        </div>
                        <div class="tableBox">
                            <table class="view">
                                <caption></caption>
                                <colgroup>
                                    <col class="w110">
                                    <col>
                                    <col width="300px">
                                    <col class="w110">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th colspan="2" id="title"></th>
                                    <th colspan="2" style="text-align:right" id="indate"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="4">작성자 : <span id="userName"></span>  (<span id="userId"></span>)  |   조회수 : <span id="readCount"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div class="fileWrap">
                                            <span class="label">첨부파일 : </span>
                                            <ul class="fileList" id="fileList">
                                                <%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 필기시험 합격선(제1회공채)-배포용(0).hwp</a></li>--%>
                                                <%--                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 필기시험 합격선(제1회공채).hwp</a></li>--%>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="tdEditorContent">
                                        <div class="" id="content">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" >
                                        <div class="btnArea right">
                                            <a href="javascript:goPageNoSubmit('bookStore','errataList')" class="btn_m w120">목록으로</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div class="comment">
                                            <div class="cm_write">
                                                <form id="" name="">
                                                    <fieldset>
                                                        <legend>댓글작성</legend>
                                                        <div class="inner">
                                                            <p class="cm_title">댓글</p>
                                                            <div class="write">
                                                                <textarea id="commentContent" placeholder=""></textarea>
                                                            </div>
                                                            <a href="javascript:commentSave();" class="single">댓글</a>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="prev">
                                    <td class="center">이전글 ▲</td>
                                    <td colspan="2" class="left"><a href="javascript:goPrev();"><span id="prevTitle"></span></a></td>
                                    <td class="center"><span id="prevCreateDate"></span></td>
                                </tr>
                                <tr>
                                    <td class="center">다음글 ▼</td>
                                    <td colspan="2" class="left"><a href="javascript:goNext();"><span id="nextTitle"></span></a></td>
                                    <td class="center"><span id="nextCreateDate"></span></td>
                                </tr>
                                </tbody>
                            </table>
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