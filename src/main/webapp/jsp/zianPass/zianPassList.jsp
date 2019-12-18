<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var ctgKey = getZianPassCtgKey();
        var parentKey = getZianPassMenu(ctgKey);
        if(parentKey != ""){
            getZianPassProductSubjectList(parentKey);
            getZianPassProductList(parentKey);
        }
        /* 지안패스 탭 선택시 스타일적용 */
        $('.selectArea dl dd ul li').each(function(){
            var $this = $(this);
            $this.find('a').click(function(){
                $this.parent().find('a').removeClass('active');
                $this.find('a').addClass('active');
            });
        });

        /* 스크롤시 스타일 변경 */
        var tabSel = $('#header').offset();
        $(window).scroll(function(){
            if($(document).scrollTop() > 160){
                $('.selectArea').addClass('selectAreaFixed');
                $('.lectureWrap').addClass('lectureWrapFixed');
                $('.selectArea dt').addClass('dtFixed');
            }else{
                $('.selectArea').removeClass('selectAreaFixed');
                $('.lectureWrap').removeClass('lectureWrapFixed');
                $('.selectArea dt').removeClass('dtFixed');
            }
        });

        /* 전체버튼 클릭시 맨위로 */
        $('li a.all').click(function(){
            $('html').stop().animate({scrollTop:0}, 400);
        });

        /* check된 박스 카운트하기 */
        $('input:checkbox').click(function(){
            var ind = $('input:checkbox:checked').length;
            $('span.colorRed').html(ind);
        });

        innerHTML("selCount", 0);
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selCount", count);
        });
    });
    /* 각 탭 버튼 클릭시 특정 위치로 스크롤 */
    function selTab(num){
        var offset = $("#vl_" + num).offset();
        $('html, body').stop().animate({scrollTop : offset.top - 192}, 400);
        return false;
    }

    function goDetailLec(targetUrl) {
        innerValue("targetUrl", targetUrl);
        goPage("zianPass", "detail");
    }
</script>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="targetUrl" name="targetUrl">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="selectArea sFx sb30">
                    <dl>
                        <dt>직렬</dt>
                        <dd>
                            <ul id="subjectList">
                                <li><a href="javascript:" class="all active">전체</a></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <!-- 국어 -->
                <div class="lectureWrap">
                    <ul class="lectureTotal">
                        <li class="left">지안패스 강좌목록</li>
                        <li class="right">
                            선택한 항목 <span class="colorRed" id='selCount'></span>개를
                            <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                            <a href="javascript:goCheckedBuy();" class="btn_m on w120">바로구매</a>
                        </li>
                    </ul>
                    <ul class="lectureHead">
                        <li class="w50p">강좌명</li>
                        <li class="w50p">수강료</li>
                    </ul>
                    <div id="lecList"></div>
                </div>
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <!--하단-->
        <%@include file="/common/jsp/footer.jsp" %>
        <!--//하단-->
        <!--우측따라다니는영역-->
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <!--//우측따라다니는영역-->
        <!--하단고정식배너-->
        <%@include file="/common/jsp/footerBanner.jsp" %>
        <!--//하단고정식배너-->
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
