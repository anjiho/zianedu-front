<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String gkey = request.getParameter("bbsKey");
%>
<script>
    var gkey = <%=gkey%>;
    $( document ).ready(function() {
        var detailInfo = getBookDetailInfo(gkey);
        var bookDetailInfo = detailInfo.result.bookDetailInfo;
        innerHTML('goodsName', bookDetailInfo.goodsName);
        innerHTML('price', bookDetailInfo.price+"원");
        innerHTML('sellPrice', bookDetailInfo.sellPrice+"원");
        innerHTML('discountPercent', bookDetailInfo.discountPercent);
        innerHTML('point', bookDetailInfo.point);
        innerHTML('writer', bookDetailInfo.writer);
        innerHTML('publishName', bookDetailInfo.name);
        innerHTML('publishDate', bookDetailInfo.publishDate);
        innerHTML('pageCnt', bookDetailInfo.pageCnt);
        innerHTML('sellPrice1', bookDetailInfo.sellPrice+"원");
        innerHTML('discountPercent1', bookDetailInfo.discountPercent);
        innerHTML("content", bookDetailInfo.description);
        innerHTML("content1", bookDetailInfo.contentList);
        innerValue('priceKey', bookDetailInfo.priceKey);
        $("#bookImg").attr("src", bookDetailInfo.bookImageUrl);

        var otherBookInfo = detailInfo.result.otherBookInfo;
        if(otherBookInfo != null){
            innerHTML("writerName", otherBookInfo.writer);
            $("#bookImg2").attr("src", otherBookInfo.bookImageUrl);
            innerHTML('goodName2', otherBookInfo.goodsName);
            innerHTML('writer2', otherBookInfo.writer);
            innerHTML('publishName2', otherBookInfo.name);
            innerHTML('sellPrice2', otherBookInfo.sellPrice);
            innerHTML('discountPercent2', otherBookInfo.discountPercent);
        }else{
            $(".book_etc").hide();
        }
    });

    function goDetailbookType(type) {
        innerValue('bookType', type);
        $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
        $("#bookTypePage").submit();
    }

    function goBookBasket() {
        var priceKey = getInputTextValue('priceKey');
        var gkey = getInputTextValue('gkey');
        goOneLecCheckedShopBasket(priceKey, gkey);
    }
    
    function goBookBuy() {
        var priceKey = getInputTextValue('priceKey');
        goOneLecCheckedBuy(priceKey);
    }
</script>
<form id="bookTypePage" method="post" name="bookTypePage">
    <input type="hidden" id="bookType" name="bookType">
</form>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="priceKey">
    <input type="hidden" id="gkey" value="<%=gkey%>">

    <%--    <div id="wrap" class="shop">--%>
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="shop">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="online">
                    <div class="btnArea">
                        <a href="javascript:goPageNoSubmit('bookStore','main')" class="btn_inline w140">목록으로</a>
                    </div>
                    <div class="infoT_book">
                        <div class="book_img">
                            <img src="" id="bookImg"  style="width: 120px;height: 170px;">
                        </div>
                        <div class="book_info">
                            <p class="stitle" id="goodsName"></p>
                            <table>
                                <tbody>
                                <tr>
                                    <th>정가</th>
                                    <td id="price"></td>
                                </tr>
                                <tr>
                                    <th>판매가</th>
                                    <td><b id="sellPrice"></b>원<span class="text_red">(<span id="discountPercent"></span>할인)</span></td>
                                </tr>
                                <tr>
                                    <th>마일리지</th>
                                    <td><span id='point'></span>원<span class="">(5%할인)</span></td>
                                </tr>
                                <tr>
                                    <th>저자</th>
                                    <td id="writer"></td>
                                </tr>
                                <tr>
                                    <th>출판사</th>
                                    <td id="publishName"></td>
                                </tr>
                                <tr>
                                    <th>발행일</th>
                                    <td id="publishDate"></td>
                                </tr>
                                <tr>
                                    <th>페이지</th>
                                    <td id="pageCnt"></td>
                                </tr>
                                <tr>
                                    <th>주문수량</th>
                                    <td>
                                        <div class="number_wrap">
                                            <a href="" class="dec">수량내림</a>
                                            <span class="updown">1</span>
                                            <a href="" class="inc">수량올림</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>구매금액계산</th>
                                    <td><b>총금액 <span id="sellPrice1"></span></b>원<span class="text_red">(<span id="discountPercent1"></span>할인)</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="book_etc">
                            <p class="stitle">저자의 책 “<span id="writerName"></span>”</p>
                            <img src="" id="bookImg2" style="width: 120px;height: 200px;">
                            <span><span id="goodName2"></span><br>
                                <span id="writer2"></span> I <span id="publishName2"></span> </span>
                            <span><b id="sellPrice2"></b>원<span class="text_red">(<span id="discountPercent2"></span>할인)</span></span>
                            <a href="" class="btn_inline">자세히 보기</a>
                        </div>
                    </div>

                    <div class="btnArea ta_center">
                        <a href="javascript:goBookBasket();" class="btn_m ">장바구니</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:goBookBuy();" class="btn_m black">바로구매</a>
                    </div>

                    <div class="infoB_book">
                        <p class="stitle">도서설명</p>
                        <div class="" id="content" style="margin-left: 0px;">
                        </div>
                        <p class="stitle">목차</p>
                        <div class="" id="content1" style="margin-left: 0px;"></div>
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
