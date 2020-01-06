<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
alert(1);
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

                <div class="tabBox tBox4">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('review','videoList');">합격자영상</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('review','passList');">합격수기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','lectureList');">수강후기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','bookList');">도서후기</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 합격수기 -->
                <div class="boardWrap reviewBoard">
                    <div class="tableBox">
                        <table class="view disnone">
                            <caption></caption>
                            <colgroup>
                                <col class="w110">
                                <col>
                                <col width="300px">
                                <col class="w110">
                            </colgroup>
                            <thead>
                            <tr>
                                <th colspan="2">2019 지안패스 수강후기</th>
                                <th colspan="2" style="text-align:right">2019.08.09</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="2">작성자 : 지안에듀 (zian0103)  |   조회수 : 31</td>
                                <td style="text-align:right; padding-right:0">9급 국가직 | 365 지안패스</td>
                                <td style="padding-left:16px"><span class="star count5">별점</span></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="tdEditorContent">
                                    합격수기 <br>
                                    합격수기 <br>
                                    합격수기 <br>
                                    합격수기 <br>
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
                                                            <textarea id="" name="" placeholder=""></textarea>
                                                        </div>
                                                        <a href="" class="single">댓글</a>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="cm_list">
                                        <strong class="names">김철수(kim00)</strong>
                                        <span class="ctn">너무 부럽네요. 축하드립니다!!</span>
                                        <span class="date">2015.10.25  08:37:43</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이전글 ▲</td>
                                <td colspan="2" class="left"><a href="#">[2관 학원실강] 2020 행정직9급 전과목(공통3+선택2) 기본이론 종합반 [ 9월개강 접수중]</a></td>
                                <td class="right">2019.08.09</td>
                            </tr>
                            <tr>
                                <td class="center">다음글 ▼</td>
                                <td colspan="2" class="left"><a href="#">	[1관학원실강] 2020 공통과목(국어+영어+한국사) 드림팀 기본+심화 이론반 [9월개강 접수중]</a></td>
                                <td class="right">2019.08.09</td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- html 추가  -->
                        <table class="view viewM">
                            <thead>
                            <tr>
                                <th colspan="2" class="tit">2019 지안패스 수강후기</th>
                                <th class="date">2019.08.09</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="3" class="tb_ct">작성자 : 지안에듀 (zian0103)  |   조회수 : 31</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tdEditorContent">
                                    합격수기 <br>
                                    합격수기 <br>
                                    합격수기 <br>
                                    합격수기 <br>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="write">
                                        <textarea id="" name="" placeholder="">댓글입력</textarea>
                                        <a href="" class="single">등록</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="cm_list">
                                        <strong class="names">김철수(kim00)</strong>
                                        <span class="ctn">너무 부럽네요. 축하드립니다!!</span>
                                        <span class="date">2015.10.25  08:37:43</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="left" colspan="3"> 이전글 ▲<a href="#">[2관 학원실강] 2020 행정직9급 전과목(공통3+선택2) 기본이론 종합반 [ 9월개강 접수중]</a></td>
                            </tr>
                            <tr>
                                <td class="left" colspan="3"> 다음글 ▼<a href="#">[1관학원실강] 2020 공통과목(국어+영어+한국사) 드림팀 기본+심화 이론반 [9월개강 접수중]</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea divGroup noMargin">
                        <div class="left">
                            <a href="#" class="btn_inline gray w110">수정</a>
                        </div>
                        <div class="right">
                            <a href="#" class="btn_inline bdblue w110">목록</a>
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
