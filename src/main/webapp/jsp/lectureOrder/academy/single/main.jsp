<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        $("#selDivision li a:eq(0)").addClass('active');
        $("#subject li a:eq(0)").addClass('active'); //전체로 default
        $("#teacher li a:eq(0)").addClass('active');
        $("#type li a:eq(0)").addClass('active');

        var menuCtgKey = getLecOrderCtgKey(); // 직렬별 ctgkey 가져오기
        var goodsType = getOnlineAcaType();
        if(menuCtgKey != '') {
            getLectureApplySubjectList(menuCtgKey, goodsType); //과목 리스트 불러오기
            getLectureApplyTeacherList(menuCtgKey, goodsType); //교수 리스트 불러오기
            getLectureAcademyTeacherList(menuCtgKey, "", "", "", goodsType); //강의정보 불러오기
        }

        $("#subject li").click(function () {
            if($(this).index() == 0){ //전체클릭햇을때
                $("#subject li a").each(function () {$(this).removeClass('active');});
                $("#subject li a:eq(0)").toggleClass("active");
            }else{
                $(this).find("a").toggleClass('active');
                $("#subject li a:eq(0)").removeClass('active');
            }
        });

        $("#teacher li").click(function () {
            if($(this).index() == 0){ //전체클릭햇을때
                $("#teacher li a").each(function () {$(this).removeClass('active');});
                $("#teacher li a:eq(0)").toggleClass("active");
            }else{
                $(this).find("a").toggleClass('active');
                $("#teacher li a:eq(0)").removeClass('active');
            }
        });

        $("#type li").click(function () {
            if($(this).index() == 0){ //전체클릭햇을때
                $("#type li a").each(function () {$(this).removeClass('active');});
                $("#type li a:eq(0)").toggleClass("active");
            }else{
                $(this).find("a").toggleClass('active');
                $("#type li a:eq(0)").removeClass('active');
            }
        });

        innerHTML("selCount", 0);
        // $("input[name=lecChk]").click(function(){//체크박스 카운트 처리
        //     var count = $("input[name=lecChk]:checkbox:checked").length;
        //     alert(111);
        //     innerHTML("selCount", count);
        // });

        $('.selectArea ul li a').each(function(){
            var $this = $(this);
            var $text = $this.text();

            if($text.length > 8){
                $this.css({fontSize:'14px',lineHeight:'18px'});
                $this.html($text.substr(0,9)+'<br>'+$text.substr(9,18));
            }
        })
    });

    function search() {
        $("#resultList").empty();
        innerHTML("selCount", 0);
        var subjectMenuKeys = new Array();
        var teacherKeys = new Array();
        var stepCtgKeys = new Array();
        $("#subject").find(".active").each(function () {
            if($(this).attr("id") == undefined){
                subjectMenuKeys = "";
            }else{
                subjectMenuKeys.push($(this).attr("id"));
            }
        });
        $("#teacher").find(".active").each(function () {
            if($(this).attr("id") == undefined){
                teacherKeys = "";
            }else{
                teacherKeys.push($(this).attr("id"));
            }
        });
        $("#type").find(".active").each(function () {
            if($(this).attr("id") == undefined){
                stepCtgKeys = "";
            }else{
                stepCtgKeys.push($(this).attr("id"));
            }
        });

        var menuCtgKey = getLecOrderCtgKey();
        var goodsType = getOnlineAcaType();

        var subjectMenuKeysString = toStrFileName(subjectMenuKeys);
        var teacherKeysString = toStrFileName(teacherKeys);
        var stepCtgKeysString = toStrFileName(stepCtgKeys);

        getLectureAcademyTeacherList(menuCtgKey, subjectMenuKeysString, teacherKeysString, stepCtgKeysString, goodsType);
    }

</script>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
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
                <div class="selectArea">
                    <dl>
                        <dt>분류</dt>
                        <dd>
                            <ul id="selDivision">
                                <li><a href="" class="chk">단과</a></li>
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
                <!--검색결과 리스트-->
                <div class="lectureTotal leTotal">
                    <div class="right">
                        선택한 항목 <span class="colorRed" id='selCount'></span>개를
                        <a href="javascript:goCheckedShopBasket();" class="btn_m">장바구니 담기</a>
                        <a href="javascript:goCheckedBuy();" class="btn_m on">바로구매</a>
                    </div>
                </div>
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

