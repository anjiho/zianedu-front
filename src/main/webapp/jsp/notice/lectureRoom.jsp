<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {

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
                <div class="calendarWrap">
                    <p>날짜를 선택하시면 강의실배정표를 확인하실 수 있습니다.</p>
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
