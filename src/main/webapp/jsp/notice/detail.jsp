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
                                <th colspan="2">[2관학원실강] 2020군무원 행정9급 대비 전과목(국어+행정법+행정학) 이론 종합반 [9월 접수중]</th>
                                <th>2019.08.09</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="3">작성자 : 지안에듀 (zian0103)  |   조회수 : 31</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    <div class="alignCenter"><img src="../images/content/img_sub00010101.jpg" alt=""></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이전글 ▲</td>
                                <td class="left"><a href="#">[2관 학원실강] 2020 행정직9급 전과목(공통3+선택2) 기본이론 종합반 [ 9월개강 접수중]</a></td>
                                <td class="right">2019.08.09</td>
                            </tr>
                            <tr>
                                <td class="center">다음글 ▼</td>
                                <td class="left"><a href="#">	[1관학원실강] 2020 공통과목(국어+영어+한국사) 드림팀 기본+심화 이론반 [9월개강 접수중]</a></td>
                                <td class="right">2019.08.09</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea divGroup noMargin">
                        <div class="left">
                            <a href="#" class="btn_inline gray w110">수정</a>
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
