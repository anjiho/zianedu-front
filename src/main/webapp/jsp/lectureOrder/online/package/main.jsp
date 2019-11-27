<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        $("#selDivision li a:eq(1)").addClass('active');
        $("#subject li a:eq(0)").addClass('active'); //전체로 default
        $("#teacher li a:eq(0)").addClass('active');
        $("#type li a:eq(0)").addClass('active');

        var menuCtgKey = getLecOrderCtgKey(); // 직렬별 ctgkey 가져오기

        var goodsType = getOnlineAcaType();
        if(menuCtgKey != '') {
            getLectureApplySubjectList(menuCtgKey, goodsType); //과목 리스트 불러오기
            getLectureApplyTeacherList(menuCtgKey, goodsType); //교수 리스트 불러오기
            getLectureApplyTeacherTypeList(menuCtgKey, "", "", "", goodsType); //강의정보 불러오기
        }

        $("#subject li a").click(function () {
            $(this).toggleClass("active");
            $("#subject li a:eq(0)").removeClass('active');
        });
        $("#teacher li a").click(function () {
            $(this).toggleClass("active");
            $("#teacher li a:eq(0)").removeClass('active');
        });
        $("#type li a").click(function () {
            $(this).toggleClass("active");
            $("#type li a:eq(0)").removeClass('active');
        });

        innerHTML("selCount", 0);
        $("input[name=lecChk]").click(function(index){//체크박스 카운트 처리
            var count = $("input[name=lecChk]:checkbox:checked").length;
            innerHTML("selCount", count);
        });
    });

    function search() {
        $("#resultList").empty();
        var subjectMenuKeys = new Array();
        var teacherKeys = new Array();
        var stepCtgKeys = new Array();
        $("#subject").find(".active").each(function () {
            subjectMenuKeys.push($(this).attr("id"));
        });
        $("#teacher").find(".active").each(function () {
            teacherKeys.push($(this).attr("id"));
        });
        $("#type").find(".active").each(function () {
            stepCtgKeys.push($(this).attr("id"));
        });
        var menuCtgKey = getLecOrderCtgKey();
        var goodsType = getOnlineAcaType();
        getLectureApplyTeacherTypeList(menuCtgKey, subjectMenuKeys, teacherKeys, stepCtgKeys, goodsType);
    }

    //체크박스 장바구니 담기
    function goCheckedShopBasket() {
        var arr = new Array();
        $('input[name=lecChk]:checked').each(function() {
            var priceKey = $(this).attr('id');
            var gkey = $(this).val();
            var data = {
                gkey : gkey,
                priceKey : priceKey
            };
            arr.push(data);
        });
        console.log(arr);
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
                <div class="selectArea">
                    <dl>
                        <dt>분류</dt>
                        <dd>
                            <ul id="selDivision">
                                <li><a href="javascript:goPage('lectureOrder','single')" class="chk">단과</a></li>
                                <li><a href="" class="chk">패키지</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>과목</dt>
                        <dd>
                            <ul id="subject">
                                <li><a href="javascript:void(0);">전체</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>교수</dt>
                        <dd>
                            <ul id="teacher">
                                <li><a href="javascript:void(0);">전체</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>유형</dt>
                        <dd>
                            <ul id="type">
                                <li><a href="javascript:void(0);">전체</a></li>
                                <li><a href="javascript:void(0);" id="203">이론</a></li>
                                <li><a href="javascript:void(0);" id="205">문제풀이</a></li>
                                <li><a href="javascript:void(0);" id="207">단과특강</a></li>
                                <li><a href="javascript:void(0);" id="4172">필기대비</a></li>
                                <li><a href="javascript:void(0);" id="4266">모의고사</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <div class="btnArea">
                        <div class="btnArea_inner">
                            <a href="javascript:search();" class="btn_m left btnSerch">검색</a>
                            <a href="#" class="btn_m btn_release right" id="uncheck">전체해제</a>
                        </div>
                    </div>
                </div>
                <div class="lectureTotal leTotal">
                    <div class="right">
                        선택한 항목 <span class="colorRed"  id='selCount'></span>개를
                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                        <a href="#" class="btn_m on">바로구매</a>
                    </div>
                </div>
                <!--검색결과 리스트-->
                <div id="resultList">
                </div>
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

