<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li:eq(0)").addClass('active');
            }else{
                $("#tabHeader li:eq(0)").removeClass('active');
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'coupon');
            }else{
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'mileage');
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
                    <div class="tab_topContent tabContent">
                    <div class="tabBox review coupon">
                        <ul id="tabHeader">
<%--                            <li class="active"><a href="javascript:void(0);">쿠폰<span></span></a></li>--%>
<%--                            <li><a href="javascript:goPageNoSubmit('myPage', 'mileage');">마일리지<span></span></a></li>--%>
                                <li><a href="javascript:void(0);">쿠폰<span></span></a></li>
                                <li class="active"><a href="javascript:void(0);">마일리지<span></span></a></li>
                        </ul>
                    </div>
                    </div>
                    <!--쿠폰 -->
<%--                    <div class="reviewBoard">--%>
<%--                        <div class="date_sort">--%>
<%--                            <div class="inner">--%>
<%--                                <div class="couponbox">--%>
<%--                                    <p>오프라인 쿠폰번호를 정확히 입력 후, [쿠폰교환]버튼을 클릭하세요.</p>--%>
<%--                                    <span class="input_txt">--%>
<%--			                            <input type="text"  id="" name="" value="">--%>
<%--			                        </span>--%>
<%--                                    <span class="btn_move">--%>
<%--		                                <input type="button" name="" id=""  value="쿠폰교환" class="cpbtn">--%>
<%--		                            </span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="tbd_05">--%>
<%--                            <ul class="lectureTotal">--%>
<%--                                <li class="left"><a href="#" class="btn_m bgray">쿠폰 마일리지 사용안내</a></li>--%>
<%--&lt;%&ndash;                                <li class="right"><span class="btn_m bdnone">사용가능 쿠폰:<span>2장</span></span></li>&ndash;%&gt;--%>
<%--                            </ul>--%>
<%--                            <!-- 수정 및 추가-->--%>
<%--                            <table class="disnoneM">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>발급일자</th>--%>
<%--                                    <th>내역</th>--%>
<%--                                    <th>할인금액</th>--%>
<%--                                    <th>사용조건</th>--%>
<%--                                    <th>유효기간</th>--%>
<%--                                    <th>발급사유</th>--%>
<%--                                    <th>사용가능여부</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td>2019-07-15</td>--%>
<%--                                    <td>행정직 특별 할인쿠폰 지급</td>--%>
<%--                                    <td>10,000원</td>--%>
<%--                                    <td>전체</td>--%>
<%--                                    <td>2019-07-15<br>--%>
<%--                                        2019-07-25</td>--%>
<%--                                    <td>수강</td>--%>
<%--                                    <td>관리자발급</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>2019-07-15</td>--%>
<%--                                    <td>행정직 특별 할인쿠폰 지급</td>--%>
<%--                                    <td>10,000원</td>--%>
<%--                                    <td>전체</td>--%>
<%--                                    <td>2019-07-15<br>--%>
<%--                                        2019-07-25</td>--%>
<%--                                    <td>수강</td>--%>
<%--                                    <td>관리자발급</td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                            <!-- //수정 및 추가-->--%>
<%--                        </div>--%>
<%--                        <!-- paging -->--%>
<%--                        <div class="paging">--%>
<%--                            <div class="boardnavi">--%>
<%--                                <a class="prev" href="#">이전 목록이동</a>--%>
<%--                                <span>--%>
<%--									<strong class="selected">1</strong>--%>
<%--								</span>--%>
<%--                                <a class="next" href="#">다음 목록이동</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- //paging -->--%>
<%--                    </div>--%>
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
