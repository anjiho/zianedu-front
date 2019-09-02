<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap">
    <!--좌측사이트메뉴-->
<%--    <%@include file="/common/jsp/leftMenu.jsp" %>--%>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
    <!--//최상단배너-->
<%--    <%@include file="/common/jsp/header.jsp" %>--%>
    <!--상단-->
    <!--//상단-->

    <!--본문-->
    <script>
        function init() {
            // getIndexMainBigBanner("bigBanner", "visualPager", 5);//메인 대 배너
            // getTeacherBannerList("teacherList", 228, 0);//공통과목 교수진
            // getMajorTeacherBannerList("majorTeacherList", 228, 1);//전공과목 교수진
            // getPassReviewList("passReviewList", "PASS", 10);//합격후기
            // getLecReviewList("lecReviewList", "SIGN", 10);//수강후기

            getEventMiniBanner("", 6283, 1);//이벤트 배너
            getMainMiniBanner("mainMiniBanner", 224, 3);//미니배너
        }
    </script>
    <div id="skipLink">
        <a href="#">본문바로가기</a>
        <a href="#">주메뉴바로가기</a>
    </div>
    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
            <!--최상단메뉴-->
            <div id="topNav">
                <ul>
                    <li><a href="javascript:goLoginPage();">로그인</a></li>
                    <li><a href="javascript:goPage('user', 'joinAgree');">회원가입</a></li>
                    <li><a href="#">합격수기</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>
            </div>
            <!--//최상단메뉴-->
        </div>
    </div>
    <!--본문-->
    <div id="container">
        <div class="inner">
            <div id="lendingVisual">
                <div class="lendingVisualText">
                    지안에듀 하나면 끝
                    <b>공무원 합격의 첫 걸음<br />여러분의 꿈이 이루어지는 곳</b>
                    <div class="btnArea">
                        <a href="#">수강후기</a>
                        <a href="#">합격수기</a>
                    </div>
                </div>
                <ul>
                    <li class="item1"><a href="javascript:goPage('publicOnline', 'main')"><b>지안에듀 행정직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item2"><a href="#"><b>지안에듀 기술직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item3"><a href="#"><b>지안에듀 계리직</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                    <li class="item4"><a href="#"><b>자격증/가산점</b>지안과 함께라면 합격의 길이 보입니다</a></li>
                </ul>
            </div>

            <!-- 랜딩페이지 배너 -->
            <div class="divGroup cols3 noMargin">
                <div class="w30p">
                    <a href="#" class="btn_lendingLink1"><b>온라인 서점</b></a>
                </div>
                <div class="w30p">
                    <a href="#" class="btn_lendingLink2"><b>빅모의고사</b></a>
                </div>
                <div class="w40p">
                    <div class="mainGuide">
                        <b>지안에듀<br />수험가이드</b>
                        <ul>
                            <li><a href="#">행정직</a></li>
                            <li><a href="#">계리직</a></li>
                            <li><a href="#">전산직</a></li>
                            <li><a href="#">토목직</a></li>
                            <li><a href="#">임업직</a></li>
                            <li><a href="#">농업직</a></li>
                            <li><a href="#">건축직</a></li>
                            <li><a href="#">환경직</a></li>
                            <li><a href="#">운전직</a></li>
                            <li><a href="#">통신직</a></li>
                            <li><a href="#">전기직</a></li>
                            <li><a href="#">군수직</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="lendingBanner">
                <div>
                    <!-- DB 배너 -->
                    <a href="#"><img id="eventBanner0" src="" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/common/zian/images/content/img_banner0003.jpg" alt=""></a>
                </div>
                <div class="divGroup cols3">
                    <div><a href="#"><img id="mainBanner0" src="" alt=""></a></div>
                    <div><a href="#"><img id="mainBanner1" src="" alt=""></a></div>
                    <div><a href="#"><img id="mainBanner2" src="" alt=""></a></div>
                </div>
            </div>

            <!-- 지안에듀 고객센터 -->
            <div class="divGroup">
                <div class="mainCustomer w45p">
                    <div>
                        <div class="titleBar">
                            <h5>고객센터</h5>
                        </div>
                        <ul>
                            <li>
                                <span class="title">대표전화</span>
                                <b class="phone">02-816-1724</b>
                            </li>
                            <li>
                                <span class="title">2관학원</span>
                                <b>070-4870-0634</b>
                                <span class="desc">
									1번 학원동영상 상담 및 결재문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결재 및 환불문의
								</span>
                                <span class="desc">
									운영시간 09:00~18:00 (주말,공휴일 제외)<br />
									점심시간 12:00~13:00
								</span>
                            </li>
                        </ul>
                        <a href="#" class="btn_apply">1:1문의</a>
                    </div>
                </div>
                <div class="mainInfo w55p">
                    <ul>
                        <li><a href="#" class="item1">시험공공</a></li>
                        <li><a href="#" class="item2">개강안내</a></li>
                        <li><a href="#" class="item3">교재배송</a></li>
                        <li><a href="#" class="item4">모바일 문의</a></li>
                        <li><a href="#" class="item5">자주하는 질문</a></li>
                        <li><a href="#" class="item6">1:1 고객상담</a></li>
                    </ul>
                </div>
            </div>
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
<%--    <%@include file="/common/jsp/footerBanner.jsp" %>--%>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</form>
</body>
</html>
