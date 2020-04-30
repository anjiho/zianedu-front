<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", "publicOnline");
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
            <div id="mainVisual">
                <div class="left">
                    <ul id="mainVisualSlider1"></ul>
                </div>
                <div class="right">
                    <ul id="mainVisualSlider2"></ul>
                </div>
                <div class="mainBannerReview disnonepc">
                    <div class="inner">
                        <a href="#"><img src="http://52.79.40.214/Upload/100/contents/0424_h_zianpass_mobile.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="mainBannerReview disnone">
                <div class="inner">
                    <a href="#"><img src="http://52.79.40.214/Upload/100/contents/0424_h_zianpass_pc.jpg" alt=""></a>
                </div>
            </div>

            <!-- 지안에듀 합격자 영상 -->
            <div class="mainBanner">
                <div class="inner">
                    <div class="titleBar">
                        <h5>지안에듀 합격자 영상</h5>
                        <a href="javascript:goPageNoSubmit('review','videoList');" class="btn_more">전체보기</a>
                    </div>
                    <div class="divGroup cols2">
                        <div>
                            <iframe width="500" height="280" src="https://www.youtube.com/embed/aeBl2GEuMdA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <div>
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
                        <a href="javascript:goPageNoSubmit('review','passList');" class="btn_more">전체보기</a>
                    </div>
                    <div class="mainStoryList">
                        <div class="item"><div>
                            <span class="name">송동욱</span>
                            <b>2019 서울시 7급, 9급 일반행정 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								2년만에 2019 서울시 7급 9급 일행직 모두 최종합격!
                                합격 후에 지급되는 장학금을 상상하면서 고난의 행군 기간을 극복할 수 있었습니다. 제가 아마 지안에듀에 등록하지 않았더라면 불안함 속에서 공부하다가 서울시 시험에서 떨어지고 수험기간이 더 길어졌을 것이라고 생각합니다.
							</span>
                            <span class="btnArea">
								<a href="#">7급, 9급 일반행정</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">윤지용</span>
                            <b>2019 국가직 경찰행정 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								공부라는 것이 쉬운 것은 아니지만 설명회에 참석하여 해볼 만하다는 생각을 하였습니다. 노량진은 열심히 하는 사람은 열심히 하고 노는 사람은 놉니다. 그만큼 허수도 많습니다. 엄청난 경쟁률은 숫자에 불과하다고 생각했습니다.
                                마침 지안 공무원 학원에서 장학생을 모집한다는 글을 보았고 지안 공무원 학원에 등록하여 공부하게 되었습니다.
							</span>
                            <span class="btnArea">
								<a href="#">2019 국가직 경찰행정</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">문재황</span>
                            <b>2019 국가직 병무청 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								지안에서 가장 좋았던 점을 뽑으라고 한다면 1:1 맞춤형 관리를 뽑고 싶어요.
                                스스로를 너무 과신하지 마세요. 본인의 의지가 아무리 강하다고 해도 1년 혹은 몇년 이상의 장기레이스를 뛰는데 혼자 아무 슬럼프 없이 공부해서 바로 합격하는 분들은 소수입니다.
                                그런데 그러한 장기레이스를 최대한 슬럼프 없이 뛸 수 있도록 만들어주는 시스템이 지안의 관리 시스템이에요.
							</span>
                            <span class="btnArea">
								<a href="#">2019 국가직 병무청</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">서은상</span>
                            <b>2019 국가직 9급 일반행정 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								나이와 스펙의 제한없이 시험 성적으로 합격의 당락이 결정되는 공무원이 저와 맞다고 생각해, 공무원 시험에 도전하게 되었습니다.
                                공부하는데 관리도 받고 선생님들이 항상 학원에 계셔서 모르는 것들을 수시로 질문할 수 있는 게 좋아서 지안공무원학원에 다니게 됐습니다.
							</span>
                            <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">유대호</span>
                            <b>2018 국가직 9급 군무원 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								국어 공부는 안효선 선생님이 시키는 대로 그대로 따라갔습니다. 안효선 선생님께서 수업 때 출제되었던 영역의 기출 문제를 모두 분석해서 시험에 나오는 부분 위주로 정리해서 주셨어요. 범위를 넓히지 말고 이것만 다 외우자고 생각해 반복해서 외웠습니다.
                                안효선선생님께서 고유어, 한자를 잘 정리해 주신 자료가 도움이 많이 되었습니다. 사실 어느 정도 문법에 자신이 생기고 문학과 비문학 문제도 잘 안 틀리게 되면 가장 어려운 건 어휘랑 한자잖아요.
                                안효선 선생님께서는 모양이 비슷한 한자를 다 묶어서 수업해주시는데요.
							</span>
                            <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">김하림</span>
                            <b>2018 지방직 7급, 서울시 9급 일반행정 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
							    쑥쓰러움보다는 아는 것이 더 중요했기 때문에 선생님들께 질문도 많이 드렸던 것 같습니다.학원 선생님들 다들 친절하시고 실력도 좋으시니 잘 활용하시기를 추천드립니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 7급, 서울시 9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">이하진</span>
                            <b>2019 직업상담직 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
							    수업에 빠지지 않고 출석해서 평소에 대비했습니다. 한달 전부터는 휘발성이 강한 암기사항 점검했습니다. 어릴 때부터 책 읽는 것을 좋아해, 항상 모의고사 1~2등급이 나왔어서 비문학, 문학은 공부하지 않고 문법을 집중적으로 했습니다. 학원 수업을 들으며 최소한의 감을 잡고 모의고사를 풀고 틀린 것은 한번 더 보는 식으로 했습니다. 시험 한달 전부터 암기가 필요한 것들을 대비했습니다.
							</span>
                            <span class="btnArea">
								<a href="#">2019 직업상담직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                    </div>
                </div>
            </div>

            <!-- 지안에듀 교수진 -->
            <div class="mainTeacher">
                <h2>지안에듀 교수진</h2>
                <div class="swiper-container">
                    <div class="swiper-wrapper" id="teacherList">
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            <!-- //지안에듀 교수진 -->

            <!-- 지안에듀 바로가기 -->
            <div class="mainQuickLink">
                <ul>
                    <li><a href="javascript:goPageNoSubmit('customerCenter','consult');"><img src="/common/zian/images/common/icon_quickLink1.png" alt=""> 1:1 학습컨설팅</a></li>
                    <li><a href="javascript:goPageNoSubmit('lectureOrder', 'single');"><img src="/common/zian/images/common/icon_quickLink2.png" alt=""> 학원실강접수</a></li>
                    <li ><a href="javascript:goOpenMenu();"><img src="/common/zian/images/common/icon_quickLink3.png" alt=""> 학원개강안내</a></li>
                    <li><a href="javascript:goLecRoom();"><img src="/common/zian/images/common/icon_quickLink4.png" alt=""> 강의실배정표</a></li>
                    <li><a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/common/icon_quickLink5.png" alt=""> 모의고사신청</a></li>
                </ul>
            </div>

            <div class="divGroup cols2">
                <div>
                    <div class="mainBoard tabContent">
                        <input type="hidden" id="bbsKey" name="bbsKey">
                        <ul class="tabBar">
                            <li class="active"><a href="#">행정직 시험공고</a></li>
                            <li><a href="#">개강안내</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="examNotice"></ul>
                            <a href="javascript:goExamNotice();" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="openInfo"></ul>
                            <a href="javascript:goOpenMenu();" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="mainBoard tabContent blue">
                        <ul class="tabBar">
                            <li class="active"><a href="#">행정직 수강후기</a></li>
                            <li><a href="#">행정직 합격수기</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="lecInfo"></ul>
                            <a href="javascript:goPageNoSubmit('review','lectureList');" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="passInfo"></ul>
                            <a href="javascript:goPageNoSubmit('review','passList');" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 지안에듀 배너 -->
            <div class="mainBanner">
                <div class="inner">
                    <a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="http://52.79.40.214/Upload/100/contents/0102_on_01.jpg" alt=""></a>
                </div>
            </div>
            <!-- 온라인서점 -->
            <div class="mainProduct">
                <div class="titleBar">
                    <h5>행정직 온라인 서점</h5>
                </div>
                <div class="mainProductList">
                    <ul class="product1" id="productList1"></ul>
                </div>
            </div>
            <!-- 온라인서점// -->

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
									1번 학원동영상 상담 및 결제문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결제 및 환불문의
								</span>
                                <span class="desc">
									운영시간 09:00~18:00 (주말,공휴일 제외)<br />
									점심시간 12:30~13:30
								</span>
                            </li>
                        </ul>
                        <a href="javascript:goPageNoSubmit('customerCenter','consult');" class="btn_apply">1:1문의</a>
                    </div>
                </div>
                <div class="mainInfo w55p">
                    <ul>
                        <li><a href="javascript:goExamNotice();" class="item1">시험공고</a></li>
                        <li><a href="javascript:goOpenMenu();" class="item2">개강안내</a></li>
                        <li><a href="javascript:goMyPage();" class="item3">교재배송</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');" class="item4">모바일 문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');" class="item5">자주하는 질문</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');" class="item6">1:1 고객상담</a></li>
                    </ul>
                </div>
            </div>
            <!-- 고객센터// -->
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
<script>
$( document ).ready(function() {
    activeHeaderBtn("publicHeaderLi_1");
    getMainBigBanner("mainVisualSlider1", 792, 5);//메인 대 배너
    getMainMiniBanner("mainVisualSlider2", 793, 5);//대배너 옆 미니 배너
    getMainreviewBanner("reviewBanner", 795, 1);//중앙 소 배너
    var teacherMenuCtgKey = getTeacherListCtgKey();
    getTeacherPageList("teacherPage1", 794, 0, teacherMenuCtgKey);//공통과목 교수진 페이지 리스트
    // getTeacherBannerList("teacherList1", 794, 0, teacherMenuCtgKey);//공통과목 교수진 리스트
    getMajorTeacherPageList("teacherPage2", 794, 1, teacherMenuCtgKey);//전공과목 교수진 페이지 리스트
    // getMajorTeacherBannerList("teacherList2", 794, 1, teacherMenuCtgKey);//전공과목 교수진 리스트
    getBannerNoticeList2("examNotice", 1, 4, 10010);//행정직 시험공고 리스트
    getBannerNoticeList2("openInfo", 1, 4, 10001);//행정직 개강안내 리스트
    getBannerNoticeList("lecInfo", 1, 4, 10015);//행정직 수강후기 리스트
    getBannerNoticeList("passInfo", 1, 4, 10013);//행정직 합격후기 리스트
    getEventMiniBanner("", 6284, 5);//이벤트 배너
    getBookList("productList1", 843, 1, 10);//행정직 온라인 서점
    getCommunityList(10970, 1, 2);//합격자 영상

});

</script>
