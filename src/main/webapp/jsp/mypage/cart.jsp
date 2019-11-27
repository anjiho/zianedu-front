<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>

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
                    <ul class="statusBar">
                        <li class="active"><label>01.<b>장바구니</b></label></li>
                        <li><label>02.<b>주문서작성</b></label></li>
                        <li><label>03.<b>결제하기</b></label></li>
                        <li class="last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <div class="tbd_03 mgb60">
                            <p class="title"><span class="text_blue">학원실강</span> 장바구니 담긴상품</p>
                            <table>
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" value=""  class="check-all"></th>
                                    <th>상품명</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" value="" name="" class="ck"></td>
                                    <td>
                                        [1관학원실강] 2020 시험대비 윤광덕 영어 기본이론반 [7월 10일 개강 접수중] <br>
                                        <span class="text_blue">판매가격 : </span>2개월<span class="thm text_blue pl30">100,000원</span>
                                    </td>
                                    <td>
                                        <span class="thm line">58,000원</span><span class="arrow">＞</span>
                                        <span class="thm text_blue">39,500원</span>
                                    </td>
                                    <td>5,000점</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60">
                            <p class="title"><span class="text_blue">동영상</span> 장바구니 담긴상품</p>
                            <table>
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="">
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" value=""  class="check-all2"></th>
                                    <th>상품명</th>
                                    <th>강의수</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" value="" class="ck2"></td>
                                    <td>
                                        2019 시험대비 안효선 올인원 이론 강의 [5%적립]<br>
                                        <span class="text_blue">판매가격 :</span><span class="bdbox">PC</span><span class="bdbox">모바일</span><span class="thm text_blue pl30">80,000원</span>
                                    </td>
                                    <td>65강</td>
                                    <td>
                                        <span class="thm line">160,000원</span><span class="arrow">＞</span>
                                        <span class="thm text_blue">80,000원</span>
                                    </td>
                                    <td>5,000점</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60">
                            <p class="title"><span class="text_blue">프로모션</span> 장바구니 담긴상품</p>
                            <table>
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" value=""  class="check-all3"></th>
                                    <th>상품명</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" value="" class="ck3"></td>
                                    <td>2020 공통과목 365지안패스</td>
                                    <td>
                                        <span class="thm line">1,100,000원</span><span class="arrow">＞</span>
                                        <span class="thm text_blue">350,000원</span>
                                    </td>
                                    <td>0점</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60">
                            <p class="title"><span class="text_blue">도서</span> 장바구니 담긴상품</p>
                            <table>
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" value=""  class="check-all4"></th>
                                    <th>상품명</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" value="" class="ck4"></td>
                                    <td>2020 지안한국사 기본서 (2권) [10%할인+5%적립]</td>
                                    <td>
                                        <span class="thm line">1,100,000원</span><span class="arrow">＞</span>
                                        <span class="thm text_blue">350,000원</span>
                                    </td>
                                    <td>0점</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pay_total">
                            <p>마일리지 :<span>10,710점</span></p>
                            <div class="inner">
                                <ul>
                                    <li>
                                        <span class="txt1">주문금액</span>
                                        <span class="txt2"><b>564,200</b>원</span>
                                        <span class="plus"></span>
                                    </li>
                                    <li class="pay-item">
                                        <span class="txt1">배송비</span>
                                        <span class="txt2"><b>0</b>원</span>
                                        <span class="icoequal "></span>
                                    </li>
                                    <li class="pay-sum">
                                        <span class="txt1">총 주문금액</span>
                                        <span class="txt2"><b>564,200</b>원</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--확인해주세요 -->
                        <div class="infoarea">
                            <p class="tit">꼭!! 확인해주세요!</p>
                            <ul>
                                <li>· 장바구니에 담겨진 상품을 7일 동안 보관됩니다.(7일 이후 자동 삭제) </li>
                                <li>· 동영상 강의 최초 신청시 수강기간은 정지된 상태로 [내 강의실-수강중인강좌]로 연결이 됩니다.</li>
                                <li>· 최초 대기시간은 30일이며, 30일 이내 자유롭게 시작일을 정해서 시작할 수 있고, 30일이 지나면 자동 시작됩니다.</li>
                            </ul>
                        </div>
                        <div class="btn_area">
                            <div class="left">
                                <a href="" class="bdgray">선택상품 삭제</a>
                                <a href="" class="bggray">선택상품주문</a>
                            </div>
                            <div class="right">
                                <a href="" class="blue">전체주문</a>
                                <a href="" class="gray">쇼핑계속하기</a>
                            </div>
                        </div>
                    </div>
                    <!--//cart -->
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

