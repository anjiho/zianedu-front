<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenuQuestion"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenuConsult"){
                // $("#tabHeader li:eq(0)").removeClass('active');
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }else if(tabMenuInfo == "tabMenuMyBoard"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(2)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenuQuestion");
                goPageNoSubmit('myPage', 'questionList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenuConsult");
                goPageNoSubmit('myPage', 'consult');
            }else if($(this).index() == 2){
                sessionStorage.setItem("tabHeader", "tabMenuMyBoard");
                goPageNoSubmit('myPage', 'boardList');
            }
        });
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
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <div class="tabBox review wid30p">
                        <ul id="tabHeader">
                            <li><a href="javascript:goPageNoSubmit('myPage', 'questionList')">1:1 문의내역<span></span></a></li>
                            <li class="active"><a href="javascript:void(0);">상담예약내역<span></span></a></li>
                            <li><a href="javascript:goPageNoSubmit('myPage', 'boardList')">내게시글<span></span></a></li>
                        </ul>
                    </div>
                    <div class="reviewBoard">
                        <div class="calendarWrap">
                            <ul class="lectureTotal">
                                <li class="left"><span>상담예약이 없습니다.</span></li>
                                <li class="right"><a href="#modal8" class="btn_m bgray btn_modalOpen">예약취소</a></li>
                            </ul>
                            <div class="calendarBox">
                                <div class="calendarHeader">
                                    <a href="#" class="btn_monthPrev">이전달</a>
                                    <h6>2019.08</h6>
                                    <a href="#" class="btn_monthNext">다음달</a>
                                </div>
                                <div class="calendarTable">
                                    <table>
                                        <caption>강의실배정표 달력</caption>
                                        <thead>
                                        <tr>
                                            <th class="sun">일</th>
                                            <th>월</th>
                                            <th>화</th>
                                            <th>수</th>
                                            <th>목</th>
                                            <th>금</th>
                                            <th class="sat">토</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="sun none">28</td>
                                            <td class="none">29</td>
                                            <td class="none">30</td>
                                            <td class="none">31</td>
                                            <td class="none">1</td>
                                            <td class="none">2</td>
                                            <td class="sat none">3</td>
                                        </tr>
                                        <tr>
                                            <td class="sun none">4</td>
                                            <td class="none">5</td>
                                            <td class="none">6</td>
                                            <td class="none">7</td>
                                            <td class="none">8</td>
                                            <td class="none">9</td>
                                            <td class="sat none">10</td>
                                        </tr>
                                        <tr>
                                            <td class="sun none">11</td>
                                            <td class="none">12</td>
                                            <td class="none">13</td>
                                            <td class="none">14</td>
                                            <td class="none">15</td>
                                            <td class="none">16</td>
                                            <td class="sat none">17</td>
                                        </tr>
                                        <tr>
                                            <td class="sun none">18</td>
                                            <td class="none">19</td>
                                            <td class="none">20</td>
                                            <td class="none">21</td>
                                            <td class="none">22</td>
                                            <td class="active"><a href="#">23</a></td>
                                            <td class="sat active"><a href="#">24</a></td>
                                        </tr>
                                        <tr>
                                            <td class="sun none">25</td>
                                            <td class="active"><a href="#">26</a></td>
                                            <td class="active"><a href="#">27</a></td>
                                            <td class="active"><a href="#">28</a></td>
                                            <td class="active"><a href="#">29</a></td>
                                            <td class="active"><a href="#">30</a></td>
                                            <td class="sat active"><a href="#">31</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="calendarLegend">
                                    <span class="active">선택</span>
                                    <span class="none">불가</span>
                                </div>
                            </div>
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
<!--팝업 예약취소  modal8-->
<div id="modal8" class="modalWrap">
    <div class="inner">
        <div class="modalTitle">
            <h2>알림</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                <p class="stitle"></p>
                <span class="txtBox">신청된 상담예약이 없습니다.</span>
            </div>
        </div>
    </div>
</div>
<!--//팝업-->