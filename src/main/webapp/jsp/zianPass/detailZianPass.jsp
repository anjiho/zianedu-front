<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String lecKey = request.getParameter("lecKey");
%>
<script>
    $( document ).ready(function() {

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
            <div class="inner ">
                <div class="zianPass">
                    <!--서브 컨텐츠-->
                    <div class="soundOnly">365 지안PASS</div>
                    <span class="soundOnly">행정직 X 기술직 공통과목</span>
                    <div class="tabContent">
                        <ul class="tabBar">
                            <li><a href="#">150<br>PASS</a></li>
                            <li class="active"><a href="#">365<br>PASS</a></li>
                            <li><a href="#">180<br>PASS</a></li>
                            <li><a href="#">240<br>PASS</a></li>
                        </ul>
                        <!-- 150 PASS -->
                        <div class="tabPage">
                        </div>
                        <!-- 365 PASS -->
                        <div class="tabPage active">
                            <div class="txtBox1">
                                365 지안패스는 PC 1대와 모바일기기 1대(고정)로<br>
                                365일 동안 무제한 시청이 가능한 특별패키지 상품입니다.<br>
                                <br>
                                <span>본 지안패스는 2019년 07월~부터 촬영된 최신촬영분으로 구성되었습니다.</span>
                            </div>
                            <div class="txtBox2">
                                <b>수강 참조사항</b>
                                <ul>
                                    <li>지안패스는 처음 강의를 실행한 <b>기기(PC1대+모바일1대)가 자동 등록되어 365일 동안 사용이 가능</b> 합니다.(등록기기 변경불가)</li>
                                    <li>본 지안패스 패키지 상품은 365일 동안 연간회원제에 제공되는 강의를 온라인으로 제공해 드립니다.</li>
                                    <li>연간프로세스가 진행되며 순차적으로 과정이 업로드 되므로 초반 수강하실 경우 참조 부탁드립니다.</li>
                                    <li>처음부터 문제풀이, 모의고사 강좌가 제공되지 않고 <b>단과개설이 맞춰 순차 업로드</b> 됩니다.</li>
                                    <li>2020년 기초이론부터 <b>학원실강 그대로 온라인 강좌 촬영하여 제공</b>됩니다.</li>
                                    <li>지안패스 회원등릅시 <b>합격지원시스템 바로 이용</b> 가능(맨 하단의 이용메뉴얼 참조)</li>
                                    <li>2019년 강좌컨텐츠는 강좌등록일로 부터 2019년 7월 까지 유지됩니다.(결제 및 재수강 유지 등)</li>
                                    <li>수강료에 교재는 포함되지 않으며 하단에 안내된 내용이나 온라인서점에서 별도 구매하셔야 합니다.</li>
                                </ul>
                            </div>

                            <dl>
                                <dt>365 <em>지안PASS</em><br><b>수강료 안내</b></dt>
                                <dd>
                                    <ul class="cols3">
                                        <li class="col1">1,100,000<span class="unit">원</span></li>
                                        <li class="col2">350,000<span class="unit">원</span></li>
                                        <li class="col3"><a href="#" class="btn_click">수강신청하기<br>Click</a></li>
                                    </ul>
                                </dd>
                            </dl>

                            <dl>
                                <dt>365 <em>지안PASS</em><br><b>공통과목 커리큘럼</b></dt>
                                <dd>
                                    <ul class="cols4">
                                        <li class="col1">
                                            <b>기본+심화 이론강의</b>
                                            <ul>
                                                <li>기초부터 심화 이론까지 한번에 개념 파악과 정리가 가능한 체계화된 All in One 강의</li>
                                                <li>방대한 이론 분량의 암기 부담을 최소화하고, 이해중심의 필수 내용 정리</li>
                                            </ul>
                                        </li>
                                        <li class="col2">
                                            <b>기출문제풀이</b>
                                            <ul>
                                                <li>최근 출제된 기출문제 분석</li>
                                                <li>시험에 꼭 출제될 핵심이론을 접목한 문제로 유형에 적응</li>
                                                <li>연도별 다양한 유형의 기출문제를 통해 핵심 내용을 파악</li>
                                            </ul>
                                        </li>
                                        <li class="col3">
                                            <b>단원예상 문제풀이</b>
                                            <ul>
                                                <li>빈출 유형을 변형한 예상문제 풀이를 통해 고득점을 위한 초석을 마련</li>
                                                <li>출제 가능한 유형의 난이도를 적용해 실력 체크</li>
                                            </ul>
                                        </li>
                                        <li class="col4">
                                            <b>동형모의고사</b>
                                            <ul>
                                                <li>과목별 약점 파악과 해결</li>
                                                <li>엄선된 문제를 통한 실제 시험 완벽대비</li>
                                                <li>전범의 문제로 구성된 동형모의고사로 실력 점검</li>
                                            </ul>
                                        </li>
                                    </ul>

                                    <a href="#" class="btn_link">제공강좌 상세목록 확인 Click</a>
                                </dd>
                            </dl>

                        </div>
                        <!-- 180 PASS -->
                        <div class="tabPage">
                        </div>
                        <!-- 240 PASS -->
                        <div class="tabPage">
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
