<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        fn_search('new');

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

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        getUserCouponList(userKey, sPage, 5);
    }

    function couponEnroll() {
        var couponNumber = $('#couponNumber').val();
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;

        if(couponNumber != ''){
            var result = saveCouponOffline(couponNumber,userKey);
            if (result.resultCode == 200) {
                alert("쿠폰 등록이 완료되었습니다");
                isReloadPage(true);
            }else if (result.resultCode == 900){
                alert("존재하지 않는 쿠폰 번호입니다.");
                isReloadPage(true);
            }else if (result.resultCode == 902){
                alert("이미 등록된 쿠폰 번호입니다.");
                isReloadPage(true);
            }
        }
    }
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
                    <div class="reviewBoard">
                        <div class="date_sort">
                            <div class="inner">
                                <div class="couponbox">
                                    <p>오프라인 쿠폰번호를 정확히 입력 후, [쿠폰교환]버튼을 클릭하세요.</p>
                                    <span class="input_txt">
			                            <input type="text"  id="couponNumber" name="couponNumber" value="">
			                        </span>
                                    <span class="btn_move">
		                                <input type="button" value="쿠폰교환" class="cpbtn" onclick="couponEnroll()">
		                            </span>
                                </div>
                            </div>
                        </div>

                        <div class="tbd_05">
                            <ul class="lectureTotal">
                                <li class="left"><a href="#" class="btn_m bgray">쿠폰 마일리지 사용안내</a></li>
<%--                                <li class="right"><span class="btn_m bdnone">사용가능 쿠폰:<span>2장</span></span></li>--%>
                            </ul>
                            <!-- 수정 및 추가-->
                            <table class="disnoneM">
                                <thead>
                                <tr>
                                    <th>발급일자</th>
                                    <th>내역</th>
                                    <th>할인금액</th>
                                    <th>사용조건</th>
                                    <th>유효기간</th>
                                    <th>발급사유</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                                </tbody>
                            </table>
                            <!-- //수정 및 추가-->
                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
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
