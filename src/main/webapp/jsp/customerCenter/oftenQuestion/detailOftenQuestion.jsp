<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_p.css">
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
        var result = getBoardDetailInfo(10018, bbsKey);
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
            var prevNextInfo = result.prevNextInfo;


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
    });

    function goPrev() {
        var prevKey = getInputTextValue("prevNum");
        innerValue("bbsKey", prevKey);
        goPage("customerCenter", "detailOften");
    }

    function goNext() {
        var nextKey = getInputTextValue("nextNum");
        innerValue("bbsKey", nextKey);
        goPage("customerCenter", "detailOften");
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
                <!--담청자발표-->
                <div class="boardWrap eventBoard">
                    <div class="tableBox">
                        <table class="view">
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
                                <td colspan="3">작성자 : <span id="userName"></span> (<span id="userId"></span>)  |   조회수 : <span id="readCount"></span></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    <div class="alignCenter" id="content">
                                    </div>
                                </td>
                            </tr>
                            <tr id="prev">
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
                            <a href="javascript:goPage('customerCenter','modifyOften')" class="btn_inline w110" id="modifyBtn">수정</a>
                        </div>
                        <div class="right">
                            <a href="javascript:goPage('customerCenter','oftenList')" class="btn_inline bdblue w110">목록</a>
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