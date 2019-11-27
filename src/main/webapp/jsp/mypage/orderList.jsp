<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('myPageHeader');
        if(leftMenuInfo == null){
            $("#noticeMenu li:eq(0)").addClass('active');
            sessionStorage.setItem("myPageHeader", "orderList");
        }
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
                    <!--날짜 검색 -->
                    <div class="date_sort">
                        <div class="inner">
                            <div class="date_5ea">
                                <ul>
                                    <li><a href="">오늘</a></li>
                                    <li><a href="">1주일</a></li>
                                    <li><a href="">1개월</a></li>
                                    <li><a href="">3개월</a></li>
                                    <li><a href="">6개월</a></li>
                                </ul>
                            </div>
                            <div class="date_pick">
                                <form name="form_reserve" id="form_reserve" action="/shop/mypage.html" method="GET">
                                    <input name="mypage_type" type="hidden" value="myreserve">
                                    <fieldset>
                                        <legend>적립금 기간 검색 폼</legend>
                                        <span class="key-wrap">
				                            <input name="" class="" id="" onclick="" type="text"  readonly="" value="2019-09-21">
				                            <img align="abmiddle" class="" onclick="" src="../images/content/btn_calendar.gif"> <span class="hyphen">~</span>
				                         	<input name="" class="" id="" onclick="" type="text" readonly="" value="2019-10-21">
				                        	<img align="" class="" onclick="" src="../images/content/btn_calendar.gif">
			                            </span>
                                    </fieldset>
                                </form>
                            </div>
                            <a href="" class="search_btn">조회</a>
                        </div>
                        <ul>
                            <li>· 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                            <li>· 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                        </ul>
                    </div>
                    <!--//날짜 검색 -->

                    <div class="tbd_03">
                        <p class="title">주문 상품정보</p>
                        <table>
                            <thead>
                            <tr>
                                <th>주문일자<br>[주문번호]</th>
                                <th>상품명</th>
                                <th>결재금액</th>
                                <th>주문상태</th>
                                <th>배송상태</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>2019-06-18<br>[20190608-000332]</td>
                                <td>2019 시험대비 이학민 응용역학 기본+심화이론강의 [5% 적립]</td>
                                <td>340,000원</td>
                                <td>결재완료</td>
                                <td>배송준비</td>
                                <td>
                                    <a href="" class="re_btn">후기작성<span></span></a>
                                    <span>후기작성시<br>마일리지 지급</span>
                                </td>
                            </tr>
                            <tr>
                                <td>2019-06-18<br>[20190608-000332]</td>
                                <td>2019 시험대비 이학민 응용역학 기본+심화이론강의 [5% 적립]</td>
                                <td>340,000원</td>
                                <td>결재완료</td>
                                <td>배송준비</td>
                                <td>
                                    <a href="" class="re_btn">후기작성<span ></span></a>
                                    <span>후기작성시<br>마일리지 지급</span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- paging -->
                        <div class="paging">
                            <div class="boardnavi">
                                <a class="prev" href="#">이전 목록이동</a>
                                <span>
									<strong class="selected">1</strong>
								</span>
                                <a class="next" href="#">다음 목록이동</a>
                            </div>
                        </div>
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

