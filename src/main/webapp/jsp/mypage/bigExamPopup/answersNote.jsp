<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String examUserKey = request.getParameter("examUserKey");
%>
<%@include file="/common/jsp/exam_popup_common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <title></title>
    <style type="text/css">
        .st_exam_test
        {
            /*overflow:	initial !important;*/
            width:		100% !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            var examUserKey = '<%=examUserKey%>';
            var isScore = -1;
            var isInterest = -1;
            getWrongNote(examUserKey, isScore, isInterest);
            /* tab메뉴 */
            $('.st_questionnote_search_pannel > div').click(function(){
                var $this = $(this).attr('data-tab');
                var $th = $(this).attr('data-name');

                $('.st_questionnote_search_pannel > div').removeClass('st_on');
                $('.st_question_board').removeClass('current');
                $('.st_tAn').removeClass('current2');

                $(this).addClass('st_on');
                $('#'+$this).addClass('current');
                $('#'+$th).addClass('current2');
            });

            /* Switch */
            $('.st_question_board ul li').each(function(){
                var $th = $(this);
                var $si = $th.find('.st_switch_group');

                $si.click(function(){
                    if(!$si.hasClass('st_on')){
                        $si.addClass("st_on");
                        $th.attr('data-interest',1);
                        addFavoriteExamProblem($si.attr('id'), 1);
                    }else{
                        $si.removeClass("st_on");
                        $th.attr('data-interest',0);
                        addFavoriteExamProblem($si.attr('id'), 0);
                    }
                });
            });

            /* 틀린거만 보기 and 관심만 보기 */
            $('#id_bShowX').click(function(){
                if(!$('#id_bShowX').hasClass('st_on')){
                    $('#id_bShowX').addClass("st_on");
                }else{
                    $('#id_bShowX').removeClass("st_on");
                }
                if($('#id_bShowX').hasClass('st_on')){
                    $('[data-score="1"]').stop().slideUp(500);
                }else{
                    $('[data-score="1"]').stop().slideDown(500);
                }
            });
            $('#id_bShowInterest').click(function(){
                if(!$('#id_bShowInterest').hasClass('st_on')){
                    $('#id_bShowInterest').addClass("st_on");
                }else{
                    $('#id_bShowInterest').removeClass("st_on");
                }
                if($('#id_bShowInterest').hasClass('st_on')){
                    $('[data-interest=0]').stop().slideUp(500);
                }else{
                    $('[data-interest=0]').stop().slideDown(500);
                }
            });
            $("#t-1").addClass('current2');
        });
    </script>
</head>
<body>
<div class="st_exam">
    <form action="" id="frm" method="get" name="frm">
        <input type="hidden" name="page_gbn" id="page_gbn">
        <input id="examUserKey" name="examUserKey" type="hidden" value="<%=examUserKey%>" />
        <div class="st_exam_test">
            <div class="st_test_main" style="background-image:none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis">
                    <div class="st_title" id="examName"></div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b><span id="subjectName"></span>
                            </li>
                            <li><div></div><b>시험일: </b><span id="examDate"></span></li>
                            <li><div></div><b>응시번호: </b><span id="serial"></span></li>
                            <li><div></div><b>이름: </b><span id="userName"></span></li>
                        </ul>
                    </div>
                    <div class="st_analysis_tab">
                        <ul>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_left.png" alt="left" /></li>
                            <li class="sts_button" data-index="0">
                                <div>
                                    <a href="javascript:goPage('myPage','answerNote');"><img src="/common/zian/images/bigimg/img_tabmenu_03_on.png" alt="오답노트" title="오답노트" /></a>
                                </div>
                            </li>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>
                    <div class="st_analysis_main" style="border-bottom: 2px solid #1f2026; overflow: hidden;">
                        <div id="st_questionnote_search_pannel_Div"></div>
                        <div class="st_position" style="float:left">
                            <div id="st_position_div"></div>
                        </div>
                        <div class="st_answer_position" id="answerDiv"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <form action="/Player/Axis" id="id_frm_player" method="post" name="name_frm_player"><input id="a_lPlayer_JLecKey" name="a_lPlayer_JLecKey" type="hidden" value="" /><input id="a_lPlayer_CurriKey" name="a_lPlayer_CurriKey" type="hidden" value="" /><input id="a_strPlayer_FilePath" name="a_strPlayer_FilePath" type="hidden" value="" /><input id="a_strPlayer_Title" name="a_strPlayer_Title" type="hidden" value="" /><input id="a_bPlayer_High" name="a_bPlayer_High" type="hidden" value="" /></form>
</div>
</body>
</html>
