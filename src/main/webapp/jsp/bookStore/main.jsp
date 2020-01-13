<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
    });

    $(function(){
        $(".mainProductList2").each(function(){
            kiplayer.sliderSlickNew($(this));
        });
        $(".mainProductList3").each(function(){
            kiplayer.sliderSlickNew2($(this));
        });
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<%--    <div id="wrap" class="shop">--%>
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="shop">
            <div class="inner">
                <!--컨텐츠-->
                <!-- 새로나온책 -->
                <div class="mainProduct2">
                    <div class="titleBar">
                        <h5>새로나온 책</h5>
                        <span>지안에듀 신규 도서를 확인 해 보세요!</span>
                    </div>
                    <div class="mainProductList2">
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book2.jpg" alt="">
                            <span class="name">2019 정보보안기사&산업기사</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book3.jpg" alt="">
                            <span class="name">토목설계</span>
                            <span class="writer">이학민 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book4.jpg" alt="">
                            <span class="name">지안영어기출문제집</span>
                            <span class="writer">조경훈 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                    </div>
                </div>

                <!-- 지안에듀 BEST도서 -->
                <div class="mainProduct3">
                    <div class="titleBar">
                        <h5>지안에듀 BEST 도서</h5>
                    </div>
                    <div class="mainProductList3 disnoneM">
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book2.jpg" alt="">
                            <span class="name">2019 정보보안기사&산업기사</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book3.jpg" alt="">
                            <span class="name">토목설계</span>
                            <span class="writer">이학민 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book4.jpg" alt="">
                            <span class="name">지안영어기출문제집</span>
                            <span class="writer">조경훈 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book2.jpg" alt="">
                            <span class="name">2019 정보보안기사&산업기사</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book3.jpg" alt="">
                            <span class="name">토목설계</span>
                            <span class="writer">이학민 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book4.jpg" alt="">
                            <span class="name">지안영어기출문제집</span>
                            <span class="writer">조경훈 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                        <div class="item"><div>
                            <img src="/common/zian/images/content/img_book1.jpg" alt="">
                            <span class="name">건축사공학</span>
                            <span class="writer">김설 | 탑스팟</span>
                            <span class="price"><b>24,000</b>원 <span>(10% off)</span></span>
                        </div></div>
                    </div>

                </div>

                <!-- 온라인서점 안내 -->
                <div class="divGroup cols2">
                    <div>
                        <div class="mainBoard">
                            <p class="stitle">온라인 서점안내</p>
                            <div class="list">
                                <ul>
                                    <li><a href="#">2019 추석 교재배송지연 안내입니다.<span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">2019 8월 교재배송 지연 안내입니다.<span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">2019 5월 교재배송 지연 안내입니다.<span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">설연휴 교재배송지연 안내입니다.<span class="date">2019.07.06</span></a></li>
                                </ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="mainBoard">
                            <p class="stitle">지안에듀 도서후기</p>
                            <div class="list">
                                <ul>
                                    <li><a href="#">지안 공통과목 책 후기입니다.<span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">이학민 응용역학 책 구입후기 <span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">2019 토목설계 이론책 샀습니다.<span class="date">2019.07.06</span></a></li>
                                    <li><a href="#">임찬호 한국사 예상문제집 구매 후기 입니다.<span class="date">2019.07.06</span></a></li>
                                </ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!--서브상단공통배너-->
                <div class="submainBanner">
                    <img src="/common/zian/images/ex/subBanner_bg.jpg">
                    <div class="Banner_txt">
                        <p class="title"><img src="/common/zian/images/ex/submain_img01.png" alt="공통과목도서후기보러가기"></p>
                        <span class="txt">부가설명을 써주세요써주세요써주세요</span>
                        <a href="" class="link">도서후기</a>
                    </div>
                </div>

                <form>
                    <div class="searchArea">
                        <input type="text" class="w400">
                        <input type="submit" value="검색" class="btn_m on">
                    </div>
                </form>

                <div class="">
                    <form>
                        <div class="lectureWrap">
                            <div class="shoplist">
                                <div class="type_wrap">
                                    <div class="type_btn">전체</div>
                                    <ul class="typedrop">
                                        <li><a href="">전체</a></li>
                                        <li><a href="">공통과목</a></li>
                                        <li><a href="">행정직군</a></li>
                                        <li><a href="">기술직군</a></li>
                                        <li><a href="">계리직군</a></li>
                                        <li><a href="">자격중</a></li>
                                    </ul>
                                </div>
                                <ul class="listtype">
                                    <li><a href="#">출간일순</a></li>
                                    <li class="last"><a href="#">저자순</a></li>
                                </ul>

                                <ul class="lectureTotal">
                                    <li class="left"></li>
                                    <li class="right">
                                        선택한 항목 <span class="colorRed">3</span>개를
                                        <a href="#" class="btn_m">장바구니 담기</a>
                                        <a href="#" class="btn_m on">바로구매</a>
                                    </li>
                                </ul>
                            </div>
                            <!--shopBoard-->
                            <div class="shopBoard">
                                <ul class="lectureHead">
                                    <li class="">이미지</li>
                                    <li class="w35p">도서명</li>
                                    <li>할인적립</li>
                                    <li class="w40p">교재비</li>
                                </ul>
                                <div class="lectureBody">
                                    <div class="lectureRow">
                                        <ul class="lectureList">
                                            <li class="lectureList_img">
                                                <img src="/common/zian/images/content/img_book4.jpg">
                                            </li>
                                            <li class="w35p">
                                                <span class="black small">영어</span>
                                                <a href="#" class="learnName">지안영어 기출문제집</a>
                                                <span class="learnNum">조재권 | 탑스팟 |  <b class="">2019.06.28</b></span>
                                            </li>
                                            <li>
                                                <ul>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                </ul>
                                            </li>
                                            <li class="w40p ta_right">
                                                <ul class="costList">
                                                    <li>
                                                        <b class="cost">20,000원</b> <input type="checkbox" name="" value="">
                                                        <a href="#" class="btn_s">장바구니</a>
                                                        <a href="#" class="btn_s on">바로구매</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="lectureRow">
                                        <ul class="lectureList">
                                            <li class="">
                                                <img src="/common/zian/images/content/img_book6.jpg">
                                            </li>
                                            <li class="w35p">
                                                <span class="black small">영어</span>
                                                <a href="#" class="learnName">윤광덕 영어</a>
                                                <span class="learnNum">조재권 | 탑스팟 |  <b class="">2019.06.28</b></span>
                                            </li>
                                            <li>
                                                <ul>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                </ul>
                                            </li>
                                            <li class="w40p ta_right">
                                                <ul class="costList">
                                                    <li>
                                                        <b class="cost">20,000원</b> <input type="checkbox" name="" value="">
                                                        <a href="#" class="btn_s">장바구니</a>
                                                        <a href="#" class="btn_s on">바로구매</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="lectureRow">
                                        <ul class="lectureList">
                                            <li class="">
                                                <img src="/common/zian/images/content/img_book7.jpg">
                                            </li>
                                            <li class="w35p">
                                                <span class="black small">한국사</span>
                                                <a href="#" class="learnName">윤광덕 영어</a>
                                                <span class="learnNum">조재권 | 탑스팟 |  <b class="">2019.06.28</b></span>
                                            </li>
                                            <li>
                                                <ul>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                </ul>
                                            </li>
                                            <li class="w40p ta_right">
                                                <ul class="costList">
                                                    <li>
                                                        <b class="cost">20,000원</b> <input type="checkbox" name="" value="">
                                                        <a href="#" class="btn_s">장바구니</a>
                                                        <a href="#" class="btn_s on">바로구매</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="lectureRow">
                                        <ul class="lectureList">
                                            <li class="">
                                                <img src="/common/zian/images/content/img_book21.jpg">
                                            </li>
                                            <li class="w35p">
                                                <span class="black small">국어</span>
                                                <a href="#" class="learnName">윤광덕 영어</a>
                                                <span class="learnNum">조재권 | 탑스팟 |  <b class="">2019.06.28</b></span>
                                            </li>
                                            <li>
                                                <ul>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                </ul>
                                            </li>
                                            <li class="w40p ta_right">
                                                <ul class="costList">
                                                    <li>
                                                        <b class="cost">20,000원</b> <input type="checkbox" name="" value="">
                                                        <a href="#" class="btn_s">장바구니</a>
                                                        <a href="#" class="btn_s on">바로구매</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="lectureRow">
                                        <ul class="lectureList">
                                            <li class="">
                                                <img src="/common/zian/images/content/img_book22.jpg">
                                            </li>
                                            <li class="w35p">
                                                <span class="black small">국어</span>
                                                <a href="#" class="learnName">윤광덕 영어</a>
                                                <span class="learnNum">조재권 | 탑스팟 |  <b class="">2019.06.28</b></span>
                                            </li>
                                            <li>
                                                <ul>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                    <li class="txt14"><span class="text_red">20%</span>할인</li>
                                                </ul>
                                            </li>
                                            <li class="w40p ta_right">
                                                <ul class="costList">
                                                    <li>
                                                        <b class="cost">20,000원</b> <input type="checkbox" name="" value="">
                                                        <a href="#" class="btn_s">장바구니</a>
                                                        <a href="#" class="btn_s on">바로구매</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- paging -->
                                <div class="paging">
                                    <div class="boardnavi">
                                        <a class="prev" href="#">이전 목록이동</a>
                                        <span>
										<strong class="selected">1</strong>
										<a href="#">2</a>
										<a href="#">3</a>
									</span>
                                        <a class="next" href="#">다음 목록이동</a>
                                    </div>
                                </div>
                                <!-- //paging -->
                            </div>

                            <div class="shopBoard">저자순</div>
                        </div>
                    </form>
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

                <!--//컨텐츠-->
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
