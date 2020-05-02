<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        $("#selDivision li a:eq(1)").addClass('active');

        var menuCtgKey = getPackageCtgKey();
        var pcMobile = divisionPcMobile();
        getSpecialPackageList(menuCtgKey, "", "", "", pcMobile); //강의정보 불러오기

        innerHTML("selCount", 0);
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selCount", count);
        });

        $('.selectArea ul li a').each(function(){
            var $this = $(this);
            var $text = $this.text();

            if($text.length > 8){
                $this.css({fontSize:'14px',lineHeight:'18px'});
                $this.html($text.substr(0,9)+'<br>'+$text.substr(9,18));
            }
        })
    });

</script>
<form id="id_frm_pacakgeMypage" method="post" name="id_frm_pacakgeMypage">
    <input type="hidden" name="goodsInfo" id="goodsInfo">
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
                <div class="selectArea pb40">
                    <dl>
                        <dt>분류</dt>
                        <dd>
                            <ul id="selDivision">
                                <li><a href="javascript:goPage('lectureOrder','single')" class="chk">단과</a></li>
                                <li><a href="javascript:goPage('lectureOrder','package')" class="chk">패키지</a></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <!--검색결과 리스트-->
                <div id="resultList"></div>
                <!--//검색결과 리스트-->
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

