<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<div id="wrap">
    <!--좌측사이트메뉴-->
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--//좌측사이트메뉴-->

    <!--최상단배너-->
    <!--//최상단배너-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--상단-->
    <!--//상단-->

    <!--본문-->
    <script>
        function init() {
            getMainBigBanner("bigBanner", "visualPager", 5);//메인 대 배너
            getTeacherBannerList("teacherList", 228, 0);//공통과목 교수진
            getMajorTeacherBannerList("majorTeacherList", 228, 1);//전공과목 교수진
            getPassReviewList("passReviewList", "PASS", 10);//합격후기
            getLecReviewList("lecReviewList", "SIGN", 10);//수강후기
            getMainMiniBanner("mainMiniBanner", 224, 3);//미니배너
        }
    </script>
    <div id="container">
        <div id="mainVisual">
            <div class="inner" id="inner">
                <ul id="bigBanner" class="visualSlider"> <!--메인 대 배너-->
                </ul>
                <ul id="visualPager" class="visualPager"></ul>
            </div>
        </div>
        <div class="inner">
            <div class="mainBanner">
                <a href="#"><img src="/common/zian/images/content/img_banner1.jpg" alt=""></a>
            </div>
            <div class="divGroup cols2">
                <div class="mainLatest">
                    <div>
                        <div>
                            <div class="titleBar">
                                <h5>합격수기</h5>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                            <div id="passLatestList" class="latestList">
                                <ul id="passReviewList"></ul>
                            </div>
                        </div>
                        <div>
                            <div class="titleBar">
                                <h5>수강후기</h5>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                            <div id="lecLatestList" class="latestList">
                                <ul id="lecReviewList"></ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mainBanner">
                    <div>
                        <a href="#"><img src="/common/zian/images/content/img_banner2.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="mainTaecher">
                <div class="titleBar">
                    <h5>지안에듀 교수진</h5>
                    <a href="#" class="btn_more">전체보기</a>
                </div>
                <div>
                    <h6>공통과목</h6>
                    <ul id='teacherList' class="teacherList">
                    </ul>
                </div>
                <div>
                    <h6>전공과목</h6>
                    <ul id="majorTeacherList" class="teacherList">
                    </ul>
                </div>
            </div>
            <div class="mainBanner divGroup cols3">
                <div><a href="#"><img id="mainBanner0" src="" alt=""></a></div>
                <div><a href="#"><img id="mainBanner1" src="" alt=""></a></div>
                <div><a href="#"><img id="mainBanner2" src="" alt=""></a></div>
            </div>
            <div class="divGroup cols2">
                <div class="mainApply">
                    <div>
                        <p>
                            <b>초시생<br />맞춤컨설팅 & 상담</b>
                            공무원 준비가 처음이신가요?<br />
                            수험생 여러분이 궁금해 하는 공무원  시험에 관한 궁금증과 고민을 지안에듀 전문 컨설턴트가 해결 해 드립니다
                        </p>
                        <a href="#" class="btn_apply1">1:1컨설팅 <br />상담 예약</a>
                        <a href="#" class="btn_apply2">전화상담 <br />예약</a>
                    </div>
                </div>
                <div class="mainGuide">
                    <div>
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
            <div class="divGroup">
                <div class="mainInfo">
                    <div>
                        <div class="titleBar">
                            <h5>안내</h5>
                        </div>
                        <div class="divGroup cols3">
                            <div>
                                <a href="#" class="item1">시험공공</a>
                                <a href="#" class="item2">모바일 문의</a>
                            </div>
                            <div>
                                <a href="#" class="item3">개강안내</a>
                                <a href="#" class="item4">교재배송</a>
                            </div>
                            <div>
                                <a href="#" class="item5">자주하는<br />질문 FAQ</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mainCustomer">
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
    <%@include file="/common/jsp/footerBanner.jsp" %>
    <!--//하단고정식배너-->
</div>
<div id="overlay"></div>
</body>
</html>
