<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String gkey = request.getParameter("gkey");
%>
<script>
    var gkey = <%=gkey%>;
    $( document ).ready(function() {
        var detailInfo = getBookDetailInfo(gkey);
        var bookDetailInfo = detailInfo.result.bookDetailInfo;
        var otherBookInfo = detailInfo.result.otherBookInfo;
        innerHTML('goodsName', bookDetailInfo.goodsName);
        innerHTML('goodName2', bookDetailInfo.goodsName);
        innerHTML('price', bookDetailInfo.price+"원");
        innerHTML('sellPrice', bookDetailInfo.sellPrice+"원");
        innerHTML('sellPrice2', bookDetailInfo.sellPrice);
        innerHTML('discountPercent', bookDetailInfo.discountPercent);
        innerHTML('discountPercent2', bookDetailInfo.discountPercent);
        innerHTML('point', bookDetailInfo.point);
        innerHTML('writer', bookDetailInfo.writer);
        innerHTML('writer2', bookDetailInfo.writer);
        innerHTML("writerName", bookDetailInfo.writer);
        innerHTML('publishName', bookDetailInfo.name);
        innerHTML('publishName2', bookDetailInfo.name);
        innerHTML('publishDate', bookDetailInfo.publishDate);
        innerHTML('pageCnt', bookDetailInfo.pageCnt);
        innerHTML('sellPrice1', bookDetailInfo.sellPrice+"원");
        innerHTML('discountPercent1', bookDetailInfo.discountPercent);
        innerHTML("content", bookDetailInfo.description);
        innerHTML("content1", bookDetailInfo.contentList);
        innerValue('priceKey', bookDetailInfo.priceKey);
        $("#bookImg").attr("src", bookDetailInfo.bookImageUrl);
        $("#bookImg2").attr("src", bookDetailInfo.bookImageUrl);
    });
    
    function goBookBasket() {
        var priceKey = getInputTextValue('priceKey');
        var gkey = getInputTextValue('gkey');
        goOneLecCheckedShopBasket(priceKey, gkey);
    }
    
    function goBookBuy() {
        var gkey = getInputTextValue('gkey');
        goOneLecCheckedBuy(gkey);
    }
</script>
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
                        <%--                        <span>--%>
                        <%--						이 책은, 기존의 수험서에서 다루지 못했던 부분을 보완하고 새로운 시험경향을 적극 반영하여 다음과 같은 특징으로 기술하였다. <br><br>--%>

                        <%--						1. 철저하게 최신출제경향을 따랐다.<br>--%>
                        <%--						최근의 출제경향은 문제 자체가 기본적인 이론에 관한 것으로, 학술적인 깊이가 있거나 복잡한 것은 아니다. 그러나 제대로 이해하지 않으면 절대로 풀 수 없는 문제들이며, 단순 암기문제는<br> 줄어들고 있는 추세이다. 따라서 이 경향을 철저하게 반영하여 구조기준을 단순정리식이 아닌 이해 위주로 서술하였다.<br><br>--%>

                        <%--						2. 대부분의 구조기준에 관하여 그림이나 사진을 통한 사례 및 부가설명을 덧붙였다.<br>--%>
                        <%--						구조기준은 기본적으로 추상적이다. 하나의 기준은 많은 경우를 내포하지 않을 수 없다. 따라서 필자는 건축구조 이론의 추상성을 '구체화'하는 작업에 중점을 두었다.<br><br>--%>

                        <%--						3. 엄격하게 정선한 예상문제를 실었다.<br>--%>
                        <%--						기출문제 이외에도 많은 예상문제를 실었다. 예상문제의 선별과 구성은 특히 심혈을 기울여 공무원, 군무원, 교육청시험, 공사시험, 건축기사시험, 건축사예비시험 등 각종 시험문제들을 모두 <br>검토하여 출제경향에 가장 적합하게 교체하거나 직접 구상하였으며, 출제 가능성에 주안점을 두어 지문 하나하나를 엄격하게 선정하였다.--%>
                        <%--					</span>--%>
                        <p class="stitle">목차</p>
                        <div class="" id="content1" style="margin-left: 0px;">
                        </div>
                        <%--                        <span>--%>
                        <%--						1권 이론편 세부 목차--%>
                        <%--						<br><br><br>--%>


                        <%--						제1편 일반구조<br><br>--%>

                        <%--						CHAPTER 01 구조개념<br><br>--%>

                        <%--						제1절 총 론<br><br>--%>

                        <%--						제2절 건축구조방식의 분류 및 특성<br><br>--%>

                        <%--						제3절 입체(장스팬)구조의 종류 및 특징<br><br>--%>

                        <%--						CHAPTER 02 기초구조<br><br>--%>

                        <%--						제1절 지 반<br><br>--%>

                        <%--						제2절 기초 및 지정<br><br>--%>

                        <%--						CHAPTER 03 목구조<br><br>--%>

                        <%--						제1절 재료의 특징<br><br>--%>

                        <%--						제2절 일반 목구조의 부재설계<br><br>--%>

                        <%--						제3절 경골목구조 및 목조건축물의 구조설계<br><br>--%>

                        <%--						CHAPTER 04 조적구조<br><br>--%>

                        <%--						제1절 벽돌구조<br><br>--%>

                        <%--						제2절 블록구조<br><br>--%>

                        <%--						제3절 돌구조<br><br>--%>

                        <%--						CHAPTER 05 기타구조<br><br>--%>

                        <%--						제1절 지붕 및 방수공사<br><br>--%>

                        <%--						제2절 수장공사<br><br>--%>

                        <%--						제3절 창호공사<br><br>--%>

                        <%--						제4절 마감공사--%>
                        <%--					</span>--%>
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
