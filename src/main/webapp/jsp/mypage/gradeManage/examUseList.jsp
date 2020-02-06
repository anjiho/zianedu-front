<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenu2"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'gradeList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'examUseList');
            }
        });
    });

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
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
                    <div class="tabBox review coupon">
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage','gradeList');">성적관리<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage','examUseList');">최근사용내역<span></span></a></li>
                        </ul>
                    </div>
                    <!--최근사용내역-->
                    <div class=" grade reviewBoard">
                        <form>
                            <ul class="searchArea">
                                <li class="left">최근 3개월간 응시한 내역입니다.</li>
                                <li class="right"></li>
                            </ul>
                        </form>
                        <div class="tableBox other">
                            <table class="disnoneM">
                                <colgroup>
                                    <col>
                                    <col width="550">
                                    <col width="250px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="text-align: center;">구분</th>
                                    <th style="text-align: center;">모의고사명</th>
                                    <th style="text-align: center;">응시일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>기출문제</td>
                                    <td>2014 국가직 9급 영어기출문제</td>
                                    <td>2019- 06- 22 10:00</td>
                                </tr>
                                <tr>
                                    <td>기출문제</td>
                                    <td>2019 제 3회 계리직 전과목 모의고사</td>
                                    <td>2019- 06- 22 10:00</td>
                                </tr>
                                <tr>
                                    <td>기출문제</td>
                                    <td>2014 국가직 9급 영어기출문제</td>
                                    <td>2019- 06- 22 10:00</td>
                                </tr>
                                <tr>
                                    <td>주간모의고사</td>
                                    <td>빅주간(전범위) 모의고사 – 공통과목 16회</td>
                                    <td>2019- 06- 22 10:00</td>
                                </tr>
                                <tr>
                                    <td>학원모의고사(온)</td>
                                    <td>2018 제 2회 전산직 전과목 모의고사</td>
                                    <td>2019- 06- 22 10:00</td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="disnonepc ltxt">
                                <tbody>
                                <tr>
                                    <td>
                                        <p>기출문제</p>
                                        <span>2014 국가직 9급 영어기출문제</span>
                                        <span><b>응시일 :</b>&nbsp;	2019- 06- 22 &nbsp;	&nbsp;	10:00</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>기출문제</p>
                                        <span>2014 국가직 9급 영어기출문제</span>
                                        <span><b>응시일 :</b>&nbsp;	2019- 06- 22&nbsp;	&nbsp;	 10:00</span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- paging -->

                        <!-- //paging -->
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
<!--팝업 수강안내사항 modal1-->
<div id="modal1" class="modalWrap" style="">
    <div class="inner">
        <div class="modalTitle">
            <h2>상세내용</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                <p class="pTxt"><b>이름</b> : <span id="conusltName"></span></p>
                <p class="pTxt"><b>연락처</b> : <span id="phoneNum"></span></p>
                <p class="pTxt"><b>상담요청직군</b> : <span id="ctgNameStr"></span></p>
                <p class="pTxt"><b>상담요청내용</b> : <span id="consultContent"></span></p>
            </div>
        </div>
    </div>
</div>
<!--//팝업-->
