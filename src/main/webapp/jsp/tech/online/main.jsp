<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap" class="skill">
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1><a href="javascript:goPage('techOnline', 'main')"><img src="/common/zian/images/common/logo02.png" alt="지안에듀 기술직"> 온라인</a></h1>
            <%@include file="/common/jsp/topHeader.jsp" %>
        </div>
        <!--주메뉴-->
        <div id="gnb">
            <div class="inner">
                <ul class="cols7">
                    <li><a href="#">내강의실</a></li>
                    <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
                    <li><a href="#">수강신청</a></li>
                    <li><a href="#">지안패스</a></li>
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
            <div id="mainVisual">
                <div class="left">
                    <ul id="mainVisualSlider1"></ul>
                </div>
                <div class="right">
                    <ul id="mainVisualSlider2"></ul>
                </div>
            </div>
            <div class="mainBannerReview">
                <div class="inner">
                    <ul id="reviewBanner"></ul>
                </div>
            </div>
            <!-- 지안에듀 합격자 영상 -->
            <div class="mainBanner">
                <div class="inner">
                    <div class="titleBar">
                        <h5>지안에듀 합격자 영상</h5>
                        <a href="#" class="btn_more">전체보기</a>
                    </div>
                    <div class="divGroup cols2">
                        <div>
                            <%--                            <a href="#"><img src="" id="movieBanner0" alt=""></a>--%>
                            <iframe width="500" height="280" src="https://www.youtube.com/embed/aeBl2GEuMdA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <div>
                            <%--                            <a href="#"><img src="" id="movieBanner1" alt=""></a>--%>
                            <iframe width="500" height="280" src="https://www.youtube.com/embed/q6Cu1LWNHmc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 지안에듀 합격자 STORY -->
            <div class="mainStory">
                <div class="inner">
                    <div class="titleBar">
                        <h5>지안에듀 합격자 STORY</h5>
                        <a href="#" class="btn_more">전체보기</a>
                    </div>
                    <div class="mainStoryList">
                        <div class="item"><div>
                            <span class="name">안성진</span>
                            <b>2018 지방직 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#">365 지안패스</a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">신예은</span>
                            <b>2018 임업직 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								항상 합격수기를 보면서 나도 빨리 합격하고 싶은 생각을 하였습니다. 정말 기쁩니다. 자격증없이 시작했기 때문에 먼저 자격증을 땄습니다. 기출문제를 풀고 주간 빅모의고사를 통해 약점을 보완하 …
							</span>
                            <span class="btnArea">
								<a href="#">9급 임업직</a>
								<a href="#">빅모의고사</a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">이재권</span>
                            <b>2018 토목직 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								꿈꾸던 합격수기를 쓰게되어 더욱 새롭네요. 최종적인 단어로 요약하자면 ‘꾸준함 ! 실력보단 꾸준함이 중요하고 지안공무원에서 꾸준하게 공부할 수 있도록 도와주셔서 새로운 인생을 맞이하게 되었습니다. 화이팅 하세요
							</span>
                            <span class="btnArea">
								<a href="#">9급 토목직</a>
								<a href="#">365 지안패스</a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">안성진</span>
                            <b>2018 지방직 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#">365 지안패스</a>
							</span>
                        </div></div>
                    </div>
                </div>
            </div>

            <!-- 지안에듀 교수진 -->
            <div class="mainTeacher">
                <div class="inner tabContent">
                    <ul class="tabBar">
                        <li class="active"><a href="#">공통과목</a></li>
                        <li><a href="#">전공과목</a></li>
                    </ul>
                    <div class="tabPage active" id="mainTeacherTab1">
                        <!-- Swiper -->
                        <div class="sliderWrap">
                            <div class="swiper-container mainTeacherTitle">
                                <div class="swiper-wrapper" id="teacherList1"></div><!--공통과목 선생님 리스트-->
                            </div>
                            <div class="swiper-container mainTeacherPage">
                                <div class="swiper-wrapper" id="teacherPage1"></div><!--공통과목 선생님 페이지 리스트-->
                                <!-- Add Arrows -->
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tabPage" id="mainTeacherTab2">
                        <!-- Swiper -->
                        <div class="sliderWrap">
                            <div class="swiper-container mainTeacherTitle">
                                <div class="swiper-wrapper" id="teacherList2"></div>
                            </div>
                            <div class="swiper-container mainTeacherPage">
                                <div class="swiper-wrapper" id="teacherPage2"></div>
                                <!-- Add Arrows -->
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 지안에듀 바로가기 -->
            <div class="mainQuickLink">
                <ul>
                    <li><a href="#"><img src="/common/zian/images/common/icon_quickLink1.png" alt=""> 1:1 학습컨설팅</a></li>
                    <li><a href="#"><img src="/common/zian/images/common/icon_quickLink2.png" alt=""> 학원실강접수</a></li>
                    <li ><a href="#"><img src="/common/zian/images/common/icon_quickLink3.png" alt=""> 학원개강안내</a></li>
                    <li><a href="#"><img src="/common/zian/images/common/icon_quickLink4.png" alt=""> 강의실배정표</a></li>
                    <li><a href="#"><img src="/common/zian/images/common/icon_quickLink5.png" alt=""> 모의고사신청</a></li>
                </ul>
            </div>

            <div class="divGroup cols2">
                <div>
                    <div class="mainBoard tabContent">
                        <ul class="tabBar">
                            <li class="active"><a href="#">기술직 시험공고</a></li>
                            <li><a href="#">개강안내</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="examNotice"></ul>
                            <a href="#" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="openInfo"></ul>
                            <a href="#" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="mainBoard tabContent yellow">
                        <ul class="tabBar">
                            <li class="active"><a href="#">기술직 수강후기</a></li>
                            <li><a href="#">기술직 합격수기</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="lecInfo"></ul>
                            <a href="#" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="passInfo"></ul>
                            <a href="#" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="mainBanner divGroup cols2">--%>
<%--                <div><a href="#"><img src="" id="eventBanner0" alt=""></a></div>--%>
<%--                <div><a href="#"><img src="" id="eventBanner1" alt=""></a></div>--%>
<%--            </div>--%>
            <!-- 지안에듀 배너 -->
            <div class="mainBanner">
                <div class="inner">
                    <a href="#"><img src="/common/zian/images/content/img_banner0001.jpg" alt=""></a>
                </div>
            </div>

            <div class="mainProduct">
                <div class="titleBar">
                    <h5>기술직 온라인 서점</h5>
                </div>
                <div class="mainProductList">
                    <ul class="productList" id="productList1"></ul>
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
    <!--//하단고정식배너-->
    <%@include file="/common/jsp/footer.jsp" %>
    <%@include file="/common/jsp/rightMenu.jsp" %>
    <%@include file="/common/jsp/footerBanner.jsp" %>
</div>
<div id="overlay"></div>
</form>
</body>
</html>
<script>
$( document ).ready(function() {
    activeHeaderBtn("publicHeaderLi_1");
    activeLeftMenu(sessionStorage.getItem("leftMenu"));
    getMainBigBanner("mainVisualSlider1", 827, 5);//메인 대 배너
    getMainMiniBanner("mainVisualSlider2", 828, 5);//대배너 옆 미니 배너
    getTeacherPageList("teacherPage1", 829, 0);//공통과목 교수진 페이지 리스트
    getTeacherBannerList("teacherList1", 829, 0);//공통과목 교수진 리스트
    getMajorTeacherPageList("teacherPage2", 829, 1);//전공과목 교수진 페이지 리스트
    getMajorTeacherBannerList("teacherList2", 829, 1);//전공과목 교수진 리스트
    getEventMiniBanner("", 6287, 5);//이벤트 배너
    getBannerNoticeList("examNotice", 1, 4, 10030);//시험공고 리스트
    getBannerNoticeList("openInfo", 1, 4, 10026);//개강안내 리스트
    getBannerNoticeList("lecInfo", 1, 4, 10033);//수강후기 리스트
    getBannerNoticeList("passInfo", 1, 4, 10032);//합격후기 리스트
    getBookList("productList1", 844, 1, 10);//온라인 서점 배너
    getCommunityList(830, 1, 2);//중앙 소 배너
    getMainreviewBanner("reviewBanner", 830, 1);//중앙 소 배너
    getCommunityList(10970, 1, 2);//합격자 영상
});
</script>
