<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>

<script>
    $( document ).ready(function() {
        sessionStorage.removeItem('cartNum');
        sessionStorage.removeItem('gKeys');
        sessionStorage.removeItem('goodsInfo');
        sessionStorage.removeItem('resultData');
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if (sessionUserInfo == null) {
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
        var userKey = sessionUserInfo.userKey;
        getUserCartInfo(userKey);
        $("#acaAll").click(function(){
            if($("#acaAll").prop("checked"))$("input[name=acaChk]").prop("checked",true);
            else $("input[name=acaChk]").prop("checked",false);
        });
        $("#playAll").click(function(){
            if($("#playAll").prop("checked"))$("input[name=playChk]").prop("checked",true);
            else $("input[name=playChk]").prop("checked",false);
        });
        $("#rePlayAll").click(function(){
            if($("#rePlayAll").prop("checked"))$("input[name=rePlayChk]").prop("checked",true);
            else $("input[name=rePlayChk]").prop("checked",false);
        });
        $("#promotionAll").click(function(){
            if($("#promotionAll").prop("checked"))$("input[name=promotionChk]").prop("checked",true);
            else $("input[name=promotionChk]").prop("checked",false);
        });
        $("#bookAll").click(function(){
            if($("#bookAll").prop("checked"))$("input[name=bookChk]").prop("checked",true);
            else $("input[name=bookChk]").prop("checked",false);
        });
    });
    
    function deleteCart() {
        if(confirm("삭제 하시겠습니까?")){
            var acaArr = new Array();
            $('input[name=acaChk]:checked').each(function() {
                var cartKey = $(this).attr('id');
                acaArr.push(cartKey);
            });
            var playArr = new Array();
            $('input[name=playChk]:checked').each(function() {
                var cartKey = $(this).attr('id');
                playArr.push(cartKey);
            });
            var rePlayArr = new Array();
            $('input[name=rePlayChk]:checked').each(function() {
                var cartKey = $(this).attr('id');
                rePlayArr.push(cartKey);
            });
            var promotionArr = new Array();
            $('input[name=promotionChk]:checked').each(function() {
                var cartKey = $(this).attr('id');
                promotionArr.push(cartKey);
            });
            var bookArr = new Array();
            $('input[name=bookChk]:checked').each(function() {
                var cartKey = $(this).attr('id');
                bookArr.push(cartKey);
            });
            var arr1 = acaArr.concat(playArr);
            var arr2 = arr1.concat(promotionArr);
            var arr3 = arr2.concat(bookArr);
            var allArr = arr3.concat(rePlayArr);
            var cartKeys = toStrFileName(allArr);
            var result = deleteCartInfo(cartKeys);
            if(result.resultCode == 200){
                alert("삭제가 완료 되었습니다.");
                isReloadPage(true);
            }
        }
    }

    //선택상품 주문
    function goOrder() {
        var acaArr = new Array();
        $('input[name=acaChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            acaArr.push(cartKey);
        });
        var playArr = new Array();
        $('input[name=playChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            playArr.push(cartKey);
        });
        var rePlayArr = new Array();
        $('input[name=rePlayChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            rePlayArr.push(cartKey);
        });
        var promotionArr = new Array();
        $('input[name=promotionChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            promotionArr.push(cartKey);
        });
        var bookArr = new Array();
        $('input[name=bookChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            bookArr.push(cartKey);
        });
        var arr1 = acaArr.concat(playArr);
        var arr2 = arr1.concat(promotionArr);
        var arr3 = arr2.concat(bookArr);
        var allArr = arr3.concat(rePlayArr);
        var cartKeys = toStrFileName(allArr);
        if(allArr != ''){
            innerValue("cartKeys", cartKeys);
            sessionStorage.setItem("cartNum", cartKeys);
            $("#id_frm_cartMypage").attr( "action", "/myPage?page_gbn=write");
            $("#id_frm_cartMypage").submit();
        }else{
            alert("선택한 상품이 없습니다.");
            return false;
        }
    }

    //전체주문
    function goAllOrder() {
        var acaArr = new Array();
        $('input[name=acaChk]').each(function() {
            var cartKey = $(this).attr('id');
            acaArr.push(cartKey);
        });
        var playArr = new Array();
        $('input[name=playChk]').each(function() {
            var cartKey = $(this).attr('id');
            playArr.push(cartKey);
        });
        var rePlayArr = new Array();
        $('input[name=rePlayChk]:checked').each(function() {
            var cartKey = $(this).attr('id');
            rePlayArr.push(cartKey);
        });
        var promotionArr = new Array();
        $('input[name=promotionChk]').each(function() {
            var cartKey = $(this).attr('id');
            promotionArr.push(cartKey);
        });
        var bookArr = new Array();
        $('input[name=bookChk]').each(function() {
            var cartKey = $(this).attr('id');
            bookArr.push(cartKey);
        });
        var arr1 = acaArr.concat(playArr);
        var arr2 = arr1.concat(promotionArr);
        var arr3 = arr2.concat(bookArr);
        var allArr = arr3.concat(rePlayArr);
        var cartKeys = toStrFileName(allArr);
        if(allArr.length > 0){
            innerValue("cartKeys", cartKeys);
            sessionStorage.setItem("cartNum", cartKeys);
            $("#id_frm_cartMypage").attr( "action", "/myPage?page_gbn=write");
            $("#id_frm_cartMypage").submit();
        }else{
            alert("장바구니 담긴 상품이 없습니다.");
            return false;
        }
    }
    
</script>
<form id="id_frm_cartMypage" method="post" name="cartMypage">
    <input type="hidden" id="cartKeys" name="cartKeys">
</form>
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
                        <div class="tbd_03 mgb60" id="acaDiv">
                            <p class="title"><span class="text_blue">학원실강</span> 장바구니 담긴상품</p>
                            <table class="cart01">
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="acaAll" value=""  class="check-all"></th>
                                    <th>상품명</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="acaList"></tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60" id="playDiv">
                            <p class="title"><span class="text_blue">동영상</span> 장바구니 담긴상품</p>
                            <table class="cart01">
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="">
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="playAll" id="playAll" class=""></th>
                                    <th>상품명</th>
                                    <th>강의수</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="playList">
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60" id="rePlayDiv">
                            <p class="title"><span class="text_blue">재수강</span> 장바구니 담긴상품</p>
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
                                    <th><input type="checkbox" name="rePlayAll" id="rePlayAll"  class=""></th>
                                    <th>상품명</th>
                                    <th>강의수</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="rePlayList">
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60" id="promotionDiv">
                            <p class="title"><span class="text_blue">프로모션</span> 장바구니 담긴상품</p>
                            <table class="cart01">
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="promotionAll" value=""  class="check-all3"></th>
                                    <th>상품명</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="promotionList"></tbody>
                            </table>
                        </div>
                        <div class="tbd_03 mgb60" id="bookDiv">
                            <p class="title"><span class="text_blue">도서</span> 장바구니 담긴상품</p>
                            <table class="cart01">
                                <colgroup>
                                    <col width="50px">
                                    <col>
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" name="bookAll" value=""  class="check-all4"></th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>판매가</th>
                                    <th>마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="bookList"></tbody>
                            </table>
                        </div>
                        <div class="pay_total">
                            <p>마일리지 :<span id="totalPoint"></span>점</p>
                            <div class="inner">
                                <ul>
                                    <li>
                                        <span class="txt1">주문금액</span>
                                        <span class="txt2"><b id="price"></b>원</span>
                                        <span class="plus"></span>
                                    </li>
                                    <li class="pay-item">
                                        <span class="txt1">배송비</span>
                                        <span class="txt2"><b id="deliveryPrice"></b>원</span>
                                        <span class="icoequal "></span>
                                    </li>
                                    <li class="pay-sum">
                                        <span class="txt1">총 주문금액</span>
                                        <span class="txt2"><b id="totalPrice"></b>원</span>
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
                                <a href="javascript:deleteCart();" class="bdgray">선택상품 삭제</a>
                                <a href="javascript:goOrder();" class="bggray">선택상품주문</a>
                            </div>
                            <div class="right">
                                <a href="javascript:goAllOrder();" class="blue">전체주문</a>
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

