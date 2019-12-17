<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String lecKey = request.getParameter("lecKey");
%>
<script>
    $( document ).ready(function() {
        var lecKey = <%=lecKey%>;
        var pcMobile = divisionPcMobile();
        getFreeVideoLectureDetailInfo(lecKey, pcMobile);
    });
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
                <div class="free">
                    <div class="tab_topContent tabContent">
                        <ul class="tabBox tBox2">
                            <li><a href="javascript:goPage('freeLecture', 'theory')">이론</a></li>
                            <li class="active"><a href="javascript:void(0);">기출풀이</a></li>
                        </ul>
                        <!-- 이론 -->
                        <div class="tabPage">
                            <!--선택-->
                            <div class="direct_view">
                                <a href="javascript:goPage('freeLecture', 'theory')" class="btn_inline w140">목록으로</a>
                                <div class="item">
                                    <div class="inner">
                                        <div class="thumb">
                                            <img class="myarea_poster" src="" id="lecImg">
                                        </div>
                                        <div class="desc">
                                            <div>
                                                <span class="rblack" id="subjectName">국어</span>
                                                <span class="rgreen" id="ctgName">이론</span>
                                            </div>
                                            <p class="tit" id="goodsName"></p>
                                            <span><span id="teacherName"></span> 교수님</span>
                                            <div class="utill">
                                                <a href="" class="home">교수홈</a>
                                                <a href="" class="class">수강신청</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--목록-->
                            <div class="tbd_02">
                                <div class="crud_area">
                                    <span class="unit">강좌목차</span>
                                    <strong>총<span id="lecCount"></span>강</strong>
                                </div>
                                <!--class 추가 a및 코드 추가  -->
                                <table class="bd disnoneM">
                                    <caption>최근수강강좌</caption>
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>회차</th>
                                        <th>제목</th>
                                        <th>시간</th>
                                        <th>동영상</th>
                                    </tr>
                                    </thead>
                                </table>
                                <div class="scroll">
                                    <table class="disnoneM">
                                        <tbody id="dataList">
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>01</td>--%>
                                        <%--                                            <td>01강 180509_어문규정표준 발음법</td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>02</td>--%>
                                        <%--                                            <td>02강 180509_어휘_테마 어휘: 나이와 한자</td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>03</td>--%>
                                        <%--                                            <td>03강 180509_한자와 한자성어_육서 및 테마 한자 문제풀이</td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>04</td>--%>
                                        <%--                                            <td>04강 어문규정_표준 발음법_필수 문법</td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>05</td>--%>
                                        <%--                                            <td>어문규정_표준 발음법_제10항~제16항</td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>06</td>--%>
                                        <%--                                            <td><a href="javascript:">어휘_단위어1_한자干,各,古</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>07</td>--%>
                                        <%--                                            <td><a href="javascript:">어문규정_표준 발음법_제10~16항 복습</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>08</td>--%>
                                        <%--                                            <td><a href="javascript:">한자와 한자성어_京, 交, 其_문제풀이</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>09</td>--%>
                                        <%--                                            <td><a href="javascript:">어휘_신체와 관련된 관용구_ 한자와 한자성어 雨, 同, 里</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>10</td>--%>
                                        <%--                                            <td><a href="javascript:">속담_기출학습_한자와 한자성어 不, 莫, 亡</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>11</td>--%>
                                        <%--                                            <td><a href="javascript:">어문규정_표준어 사정 원칙_제1항~제19항</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        <%--                                        <tr>--%>
                                        <%--                                            <td>12</td>--%>
                                        <%--                                            <td><a href="javascript:">어휘_주제별어휘_한자어와 한자성어_言, 方, 常, 目, 牛</a></td>--%>
                                        <%--                                            <td>56</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <a href="" class="black small">일반화질</a>--%>
                                        <%--                                                <a href="" class="blue small">고화질</a>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--//이론 -->
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
