<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String bbsKey = request.getParameter("bbsKey");
%>
<script>
    var bbsKey = '<%=bbsKey%>';
    innerValue("bbsKey", bbsKey);
    $( document ).ready(function() {
        var bbsmasterKey = '';
        var noticeHeaderInfo = sessionStorage.getItem('noticeHeader');
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo == "publicOnline" || leftMenuInfo == "publicAcademy"){//행정직 온라인, 행정직학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
            else bbsmasterKey = "10057";//온라인서점
        }else if(leftMenuInfo == "techOnline" || leftMenuInfo == "techAcademy"){//기술직 온라인. 기술직학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10026";
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10027";
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10030";
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
            else bbsmasterKey = "10057";
        }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){//계리직 온라인. 계리직 학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10041";
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10042";
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10044";
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
            else bbsmasterKey = "10057";
        }else{
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
            else bbsmasterKey = "10057";//온라인서점
        }
        var result = getBoardDetailInfo(bbsmasterKey, bbsKey);
        if(result != undefined){
            var detailInfo = result.boardDetailInfo;
            $("#content").text(detailInfo.contents);
            $("#indate").text(detailInfo.indate);
            $("#userName").text(detailInfo.userName);
            $("#userId").text(detailInfo.userId);
            $("#title").text(detailInfo.title);
            $("#readCount").text(detailInfo.readCount);
            //$("#readCount").text(detailInfo.readCount);
            var prevNextInfo = result.prevNextInfo;
            $("#prevTitle").html(prevNextInfo.prevTitle);
            $("#nextTitle").html(prevNextInfo.nextTitle);
            $("#prevCreateDate").html(prevNextInfo.prevCreateDate);
            $("#nextCreateDate").html(prevNextInfo.nextCreateDate);
        }
    });
    
    function goModify() {
        goPage("notice", "modify");
    }
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
                    <div class="tableBox">
                        <table class="view">
                            <input type="hidden" id="bbsKey" name="bbsKey" value="<%=bbsKey%>">
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
                                <td colspan="3">작성자 : <span id="userName"></span> <span id="userId"></span>  |   조회수 : <span id="readCount"></span></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    <div class="alignCenter" id="content"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이전글 ▲</td>
                                <td class="left"><a href="#"><span id="prevTitle"></span></a></td>
                                <td class="right"><span id="prevCreateDate"></span></td>
                            </tr>
                            <tr>
                                <td class="center">다음글 ▼</td>
                                <td class="left"><a href="#"><span id="nextTitle"></span></a></td>
                                <td class="right"><span id="nextCreateDate"></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea divGroup noMargin">
                        <div class="left">
                            <a href="javascript:goModify()" class="btn_inline gray w110">수정</a>
                        </div>
                        <div class="right">
                            <a href="javascript:goPage('notice', 'list')" class="btn_inline blue w110">목록</a>
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
