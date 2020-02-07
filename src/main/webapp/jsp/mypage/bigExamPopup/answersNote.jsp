<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/common/zian/css/big_layout.css">
<script src="/common/js/common.js"></script>
<script src="/common/zian/js/common.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <link type="text/css" rel="stylesheet" href="../css/big_layout.css">
    <script type="text/javascript" src="../js/kiplayer/jquery.min.js"></script>
    <title></title>
    <style type="text/css">
        .st_exam_test
        {
            /*overflow:	initial !important;*/
            width:		100% !important;
        }
    </style>
    <script type="text/javascript">
        /*$(
            function(){
                document.onselectstart = eventControl;
                document.oncontextmenu = eventControl;
            }
        );
        function eventControl(){
            return false;
        }

        function onStart(){
            location.href = "bigTest_pop.html"
        }*/




        $(document).ready(function(){
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
            })

            /* Switch */
            $('.st_question_board ul li').each(function(){
                var $th = $(this);
                var $si = $th.find('.st_switch_group');

                $si.click(function(){
                    if(!$si.hasClass('st_on')){
                        $si.addClass("st_on");
                        $th.attr('data-interest',1);
                    }else{
                        $si.removeClass("st_on");
                        $th.attr('data-interest',0);
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
            })
        })

        /*$('.st_controll_pannel').find('.st_switch_group').each(function(){
            var $th = $(this);

            $th.click(function(){
                if(!$th.hasClass('st_on')){
                    $th.addClass("st_on");
                }else{
                    $th.removeClass("st_on");
                }
                if($('#id_bShowInterest').hasClass('st_on')){
                    $('[data-interest=0]').css('display','none');
                }else{
                    $('[data-interest=0]').css('display','block');
                }
            });
        });*/
    </script>
</head>
<body>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">
        <input id="exam_user_key" name="exam_user_key" type="hidden" value="42902" />
        <input id="exam_sbj_user_key" name="exam_sbj_user_key" type="hidden" value="102800" />
        <div class="st_exam_test">
            <div class="st_test_main" style="background-image:none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis">
                    <div class="st_title">빅주간(전범위)모의고사_공통과목_16회</div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b>국어, 영어, 한국사
                            </li>
                            <li><div></div><b>시험일: </b>2020년 01월 08일</li>
                            <li><div></div><b>응시번호: </b>02042827</li>
                            <li><div></div><b>이름: </b>지안에듀</li>
                        </ul>
                    </div>
                    <div class="st_analysis_tab">
                        <ul>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_left.png" alt="left" /></li>
                            <li class="sts_button" data-index="0">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','gradeAllList');"><img src="/common/zian/images/bigimg/img_tabmenu_01_off.png" alt="성적 전체분석" title="성적 전체분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="1">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','subjectGradeDetail');"><img src="/common/zian/images/bigimg/img_tabmenu_02_off.png" alt="과목별 성적 상세분석" title="과목별 성적 상세분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="2">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','answerNote');"><img src="/common/zian/images/bigimg/img_tabmenu_03_on.png" alt="오답노트" title="오답노트" /></a>
                                </div>
                            </li>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>
                    <div class="st_analysis_main" style="border-bottom: 2px solid #1f2026; overflow: hidden;">
                        <div class="st_questionnote_search_pannel">
                            <div class="st_on" data-name="t-1" data-tab="tab-1">국어</div>
                            <div data-name="t-2" data-tab="tab-2">영어</div>
                            <span class="st_controll_pannel">
                                    틀린문제보기
                                    <div class="st_switch_group" id="id_bShowX">
                                        <div class="st_switch" for="bShowX">
                                            <div class="st_switch_text_on">
                                                <span>O</span>
                                            </div>
                                            <div class="st_switch_text_off">
                                                <span>X</span>
                                            </div>
                                            <div class="st_switch_controll"></div>
                                        </div>
                                        <input class="st_show_x" id="bShowX" name="bShowX" type="hidden" value="False" />
                                    </div>
                                    관심문제보기
                                    <div class="st_switch_group" id="id_bShowInterest">
                                        <div class="st_switch" for="bShowInterest">
                                            <div class="st_switch_text_on">
                                                <span>O</span>
                                            </div>
                                            <div class="st_switch_text_off">
                                                <span>X</span>
                                            </div>
                                            <div class="st_switch_controll"></div>
                                        </div>
                                        <input class="st_show_interest" id="bShowInterest" name="bShowInterest" type="hidden" value="False"/>
                                    </div>
                                </span>
                        </div>
                        <div class="st_position" style="float:left">
                            <div id="tab-1" class="st_question_board current" style="width: 800px; height: 480px;">
                                <ul>
                                    <li data-index="0" id="id_question_0" class="st_question" data-question-user-key="973282" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            1
                                            <span>
                                                <div class="st_off st_switch_group" id="id_cUserQuestion_is_interest">
                                                    <div class="st_switch" for="cUserQuestion_is_interest">
                                                        <div class="st_switch_text_on"><span>O</span></div>
                                                        <div class="st_switch_text_off"><span>X</span></div>
                                                        <div class="st_switch_controll"></div>
                                                    </div>
                                                    <input class="st_interest" data_exam_question_bank_key="11114" data_exam_question_user_key="984909" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="True" />
                                                </div>
                                                <span><b>[관심문제]</b>선택</span>
                                            </span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상603번_문제.jpg" alt="" title="" />
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상603번_해설.jpg" alt="" title="" />
                                        <div class="st_review">
                                            한자성어에 관한 문제이다. 자주 출제되는 한자어와 한자성어는 정확히 암기하고 있어야 한다.
                                        </div>
                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 42.7 %</span><br />
                                            * 문제유형 <span>: 한자</span><br />
                                            * 문제단원 <span>: 한자와 한문 > 한자성어 > <b>한자성어</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="1" id="id_question_1" class="st_question" data-question-user-key="973282" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            2
                                            <span>
                                                <div class="st_switch_group" id="id_cUserQuestion_is_interest">
                                                    <div class="st_switch" for="cUserQuestion_is_interest">
                                                        <div class="st_switch_text_on">
                                                            <span>O</span>
                                                        </div>
                                                        <div class="st_switch_text_off">
                                                            <span>X</span>
                                                        </div>
                                                        <div class="st_switch_controll"></div>
                                                    </div>
                                                    <input class="st_interest" data_exam_question_bank_key="11138" data_exam_question_user_key="973284" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="True" />
                                                </div>
                                                <span><b>[관심문제]</b>선택</span>
                                            </span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상627번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상627번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            외래어 표기법을 묻는 문제이다. 외래어 표기법의 표기 세칙을 숙지하고 있으면 쉽게 풀 수 있다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 69.3 %</span><br />
                                            * 문제유형 <span>: 문법-국어 규범</span><br />
                                            * 문제단원 <span>: 외래어 표기법 > 표기 세칙 > <b>표기 세칙</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 외래어 표기법을 정확히 몰라서 선택했다. </span>
                                        </div>
                                    </li>
                                    <li data-index="2" id="id_question_2" class="st_question" data-question-user-key="973282" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            3
                                            <span>
								                <div class="st_switch_group" id="id_cUserQuestion_is_interest">
								                    <div class="st_switch" for="cUserQuestion_is_interest">
								                        <div class="st_switch_text_on">
								                            <span>O</span>
                                                        </div>
                                                        <div class="st_switch_text_off">
                                                            <span>X</span>
                                                        </div>
                                                        <div class="st_switch_controll"></div>
                                                    </div>
                                                    <input class="st_interest" data_exam_question_bank_key="11132" data_exam_question_user_key="973283" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" />
                                                </div>
                                                <span><b>[관심문제]</b>선택</span>
                                            </span>
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상621번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상621번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            동음이의어와 다의어를 구별할 수 있는지 묻는 문제이다. 다의어는 소리가 같고 의미도 서로 밀접한 관계에 있는 단어를 말한다는 것을 기억하면 답을 찾는 데 도움이 된다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 44 %</span><br />
                                            * 문제유형 <span>: 문법-국어 문법</span><br />
                                            * 문제단원 <span>: 의미론 > 의미의 이해-의미 관계 > <b>유의 관계</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                    <li data-index="3" id="id_question_3" class="st_question" data-question-user-key="973282" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            4
                                            <span>
													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11899" data_exam_question_user_key="973282" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/명사.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_4.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어81번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어81번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            품사의 개념과 성격을 알고 있는지 묻는 문제이다. 특히 혼동하기 쉬운 관형사와 형용사를 변별할 수 있는지 묻고 있다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 54.7 %</span><br />
                                            * 문제유형 <span>: 문법-국어 문법</span><br />
                                            * 문제단원 <span>: 형태론 > 품사 > <b>체언-명사</b></span><br />
                                            * 제출답안 <span>: 4</span><br />
                                            * 답안선택이유 <span>: 품사의 성격을 정확히 알지 못해 선택했다. &#39;검붉다&#39;는 형용사이다. </span>
                                        </div>
                                    </li>
                                    <li data-index="4" id="id_question_4" class="st_question" data-question-user-key="973281" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            5

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11912" data_exam_question_user_key="973281" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(27).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_5.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어95번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어95번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            글에서 중심 내용을 찾는 문제이다. 글의 주제를 찾는 문제는 독해에서 가장 중요한 문제이다. 주제 찾기에 어려움을 겪는다면 평소 꾸준히 독해 연습을 하는 것이 좋다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 58.7 %</span><br />
                                            * 문제유형 <span>: 비문학</span><br />
                                            * 문제단원 <span>: 비문학 > 독해 실전 > <b>독해 실전</b></span><br />
                                            * 제출답안 <span>: 4</span><br />
                                            * 답안선택이유 <span>: 글에서 중심 내용을 찾지 못해 선택했다. (가)에서는 말이 가진 효용성에 대해 서술하고 있고, (나)에서는 우리나라에서 &#39;말&#39;이 가지는 상징적 의미에 대해 서술하고 있다. </span>
                                        </div>
                                    </li>
                                    <li data-index="5" id="id_question_5" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            6
                                            <span>
													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="9806" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/형태소_단어.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_6.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_문법35번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//국어_문법35번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            제시된 단어와 같은 구성을 나타내는 단어를 찾는 문제이다. 단어의 구성을 알려주지 않았으면 상당히 고난이도의 문제가 될 수 있었다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 68 %</span><br />
                                            * 문제유형 <span>: 문법-국어 문법</span><br />
                                            * 문제단원 <span>: 형태론 > 형태소와 단어 > <b>형태소와 단어</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="6" id="id_question_6" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            7

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10042" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(40).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_7.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_한자어휘16번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//국어_한자어휘16번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            나이에 관련되 한자어이다. 나이에 관련된 한자어는 암기해 두는 것이 좋다. 이립: 30세, 불혹: 40세, 희수: 77세, 백수: 99세
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 54.7 %</span><br />
                                            * 문제유형 <span>: 어휘</span><br />
                                            * 문제단원 <span>: 어휘 > 주제별 어휘 > <b>사람 </b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="7" id="id_question_7" class="st_question" data-question-user-key="973280" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            8

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10407" data_exam_question_user_key="973280" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(27).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_8.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_지안국어연습319번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//국어_지안국어연습319번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            서술 방식에 관한 문제이다. 설명, 논증, 묘사, 서사 등 여러 가지 서술 방식 중 지문에서 어떤 방식을 서술하였는지 파악해야 한다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 72 %</span><br />
                                            * 문제유형 <span>: 비문학</span><br />
                                            * 문제단원 <span>: 비문학 > 독해 실전 > <b>독해 실전</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 서술방식을 잘못 파악하였다. 지문에서는 학문에 관해 성현의 언행을 설명해주고 있을 뿐 그들 간 인과 관계를 밝히고 있진 않다.</span>
                                        </div>
                                    </li>
                                    <li data-index="8" id="id_question_8" class="st_question" data-question-user-key="973279" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            9
                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10432" data_exam_question_user_key="973279" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(27).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_9.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank/빅모의고사3_4월_문제수정.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//국어_지안국어연습347번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            주어진 지문의 중심주제를 파악하는 문제이다. 중심주제를 파악하는 것은 비문학을 풀 때 매우 중요한 것이므로 핵심단어를 찾는 것이 매우 중요하다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 76 %</span><br />
                                            * 문제유형 <span>: 비문학</span><br />
                                            * 문제단원 <span>: 비문학 > 독해 실전 > <b>독해 실전</b></span><br />
                                            * 제출답안 <span>: 2</span><br />
                                            * 답안선택이유 <span>: 글의 요지를 파악하지 못하였다. 윤동주가 기발한 생각을 했다는 사실은 지문에 나오지 않는다.</span>
                                        </div>
                                    </li>
                                    <li data-index="9" id="id_question_9" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            10
                                            <span>
													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11343" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(27).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_10.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상856번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상856번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            글을 읽고 주제를 파악할 수 있는지 묻는 문제이다. 독해의 가장 기본적인 문제이다. 독해에서는 주제를 찾는 것이 가장 중요하다. 주제는 글의 처음과 마지막에 있는 경우가 많으니, 그 부분을 자세히 읽는 것이 좋다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 50.7 %</span><br />
                                            * 문제유형 <span>: 비문학</span><br />
                                            * 문제단원 <span>: 비문학 > 독해 실전 > <b>독해 실전</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="10" id="id_question_10" class="st_question" data-question-user-key="973278" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            11
                                            <span>
                                                    <div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11676" data_exam_question_user_key="973278" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
                                                    <span><b>[관심문제]</b>선택</span>
												</span>


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(43).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_11.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2013지안모의고사_국어78번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2013지안모의고사_국어78번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            속담의 뜻을 알고 있는지 묻는 문제이다. 속담은 양이 많으므로 기출된 것을 중심으로 공부하는 것이 좋다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 하</span>

                                            * 정답률 <span>: 45.3 %</span><br />
                                            * 문제유형 <span>: 어휘</span><br />
                                            * 문제단원 <span>: 어휘 > 속담 > <b>속담</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                    <li data-index="11" id="id_question_11" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            12

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11611" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/한글_자모_제4항.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_12.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2012지안모의고사_국어82번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2012지안모의고사_국어82번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            자음의 이름을 알고 있는지 묻는 문제이다. 한글 맞춤법에서 가장 기본적인 내용이므로, 반드시 기억하고 있어야 한다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 하</span>

                                            * 정답률 <span>: 69.3 %</span><br />
                                            * 문제유형 <span>: 문법-국어 규범</span><br />
                                            * 문제단원 <span>: 한글 맞춤법 > 자모 > <b>자모(제4항)</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="12" id="id_question_12" class="st_question" data-question-user-key="973277" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            13

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11863" data_exam_question_user_key="973277" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/합성어.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_13.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어40번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어40번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            합성어의 개념과 종류룰 알고 있는지 묻는 문제이다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 33.3 %</span><br />
                                            * 문제유형 <span>: 문법-국어 문법</span><br />
                                            * 문제단원 <span>: 형태론 > 단어의 형성 > <b>복합어-합성어</b></span><br />
                                            * 제출답안 <span>: 2</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                    <li data-index="13" id="id_question_13" class="st_question" data-question-user-key="973097" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            14

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10076" data_exam_question_user_key="973097" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(27).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_14.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_모의고사일회19번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//국어_모의고사일회19번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            문맥을 파악한 후 빈칸을 채우는 문제이다. 빈칸은 주로 글의 중심내용과 관련된 내용이 나오니 중심내용을 우선 파악해야 한다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 68 %</span><br />
                                            * 문제유형 <span>: 비문학</span><br />
                                            * 문제단원 <span>: 비문학 > 독해 실전 > <b>독해 실전</b></span><br />
                                            * 제출답안 <span>: 1</span><br />
                                            * 답안선택이유 <span>: 글의 중심내용을 파악하지 못했거나 문맥의 흐름을 정확히 파악하지 못했다. 빈칸에는 &#39;쉽게 이해하고 즐길 수 있는 영화를 효과적으로 반복 대량 생산한다&#39;라는 말이 들어가야 어울린다.</span>
                                        </div>
                                    </li>
                                    <li data-index="14" id="id_question_14" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            15
                                            <span>
                                                <div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11829" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
                                                <span><b>[관심문제]</b>선택</span>
                                            </span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/한글_그밖의것_제51_57항.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_15.mp4', '' )">해설 강의</span>
                                        </div>
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어06번_문제.jpg" alt="" title="" />
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어06번_해설.jpg" alt="" title="" />
                                        <div class="st_review">
                                            &lt;한글 맞춤법&gt; 57항 형태, 발음이 비슷한 단어를 구분할 수 있어야 한다.
                                        </div>
                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 62.7 %</span><br />
                                            * 문제유형 <span>: 문법-국어 규범</span><br />
                                            * 문제단원 <span>: 한글 맞춤법 > 그 밖의 것 > <b>그 밖의 것(제51~57항)</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="15" id="id_question_15" class="st_question" data-question-user-key="0" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            16

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10350" data_exam_question_user_key="0" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(20).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_16.mp4', '' )">해설 강의</span>
                                        </div>
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_지안국어연습240번_문제.jpg" alt="" title="" />
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//국어_지안국어연습240번_해설.jpg" alt="" title="" />
                                        <div class="st_review">
                                            한자어휘를 모두 알아야 풀 수 있는 문제이다. 한자어휘는 문제를 풀면서 모르는 단어를 정리하는 식으로 공부하면 된다.
                                        </div>
                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 상</span>

                                            * 정답률 <span>: 26.7 %</span><br />
                                            * 문제유형 <span>: 한자</span><br />
                                            * 문제단원 <span>: 한자와 한문 > 필수  한자 익히기 > <b>필수 한자 익히기</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="16" id="id_question_16" class="st_question" data-question-user-key="973093" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            17
                                            <span>
                                                <div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10719" data_exam_question_user_key="973093" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
                                                <span><b>[관심문제]</b>선택</span>
                                            </span>
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/문장_다듬기.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_17.mp4', '' )">해설 강의</span>
                                        </div>
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상139번_문제.jpg" alt="" title="" />
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상139번_해설.jpg" alt="" title="" />
                                        <div class="st_review">
                                            중의성이 있는 문장을 찾는 문제이다. 중의성은 일상생활에서도 자주 범하는 오류이고 신경쓰지 않고 읽으면 찾기 힘들기 때문에 분석하면서 읽는 습관이 필요하다.
                                        </div>
                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 46.7 %</span><br />
                                            * 문제유형 <span>: 문법-정서법</span><br />
                                            * 문제단원 <span>: 올바른 표현 > 문장 다듬기 > <b>문장 다듬기</b></span><br />
                                            * 제출답안 <span>: 4</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                    <li data-index="17" id="id_question_17" class="st_question" data-question-user-key="973094" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            18

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="10812" data_exam_question_user_key="973094" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/말_다듬기.jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_18.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상268번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상268번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            의존명사와 조사의 개념과 쓰임을 알고 구별할 수 있는지 묻는 문제이다. 혼동하기 쉬우니 주의해서 풀어야 한다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 69.3 %</span><br />
                                            * 문제유형 <span>: 문법-정서법</span><br />
                                            * 문제단원 <span>: 올바른 표현 > 말 다듬기 > <b>말 다듬기</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 조사 &#39;대로&#39;의 의미와 쓰임을 정확히 알지 못해서 선택했다. &#39;대로&#39;의 의미와 쓰임을 다시 공부하고, 문제에서 어떤 의미로 쓰였는지 정확히 파악하는 연습이 필요하다. 선택지는 맞는 설명이다., </span>
                                        </div>
                                    </li>
                                    <li data-index="18" id="id_question_18" class="st_question" data-question-user-key="973095" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            19

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11846" data_exam_question_user_key="973095" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/표준발음법_받침의발음(0).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_19.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어23번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//2015지안모의고사_국어23번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            표준 발음법 전반적인 내용에 대해서 묻는 문제이다. 발음법 각 항의 예를 숙지한다면 시간 단축이 가능한 문제이다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 60 %</span><br />
                                            * 문제유형 <span>: 문법-국어 규범</span><br />
                                            * 문제단원 <span>: 표준 발음법 > 받침의 발음 > <b>받침의 발음(제8~16항)</b></span><br />
                                            * 제출답안 <span>: 2</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                    <li data-index="19" id="id_question_19" class="st_question" data-question-user-key="973096" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            20

                                            <span>

													<div class="st_switch_group" id="id_cUserQuestion_is_interest"><div class="st_switch" for="cUserQuestion_is_interest"><div class="st_switch_text_on"><span>O</span></div><div class="st_switch_text_off"><span>X</span></div><div class="st_switch_controll"></div></div><input class="st_interest" data_exam_question_bank_key="11469" data_exam_question_user_key="973096" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" /></div>
													<span><b>[관심문제]</b>선택</span>
												</span>


                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study" onclick="onShowImage( '/Upload/100/res/이미지미제공(0).jpg' )">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec" onclick="OpenSamplePlayer( 'topspot1/topspot/합격연구소해설강좌/국어/1803_05회_국어_20.mp4', '' )">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상1005번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상1005번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            현대 소설 분석 문제이다. 작품에 대한 배경지식을 가지고 있다면 시간을 절약할 수 있다. 평소 소설 작품 분석 연습을 해두었다면 모르더라도 어렵지 않게 풀 수 있을 것이다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 66.7 %</span><br />
                                            * 문제유형 <span>: 문학</span><br />
                                            * 문제단원 <span>: 현대 소설 이론과 감상 > 소설-주요 작품 감상 > <b>소설-기타 작품 감상</b></span><br />
                                            * 제출답안 <span>: 2</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div id="tab-2" class="st_question_board" style="width: 800px; height: 480px;">
                                <ul>
                                    <li data-index="0" id="id_question_0" class="st_question" data-question-user-key="973282" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            1t
                                            <span>
                                        <div class="st_off st_switch_group" id="id_cUserQuestion_is_interest">
                                            <div class="st_switch" for="cUserQuestion_is_interest">
                                                <div class="st_switch_text_on"><span>O</span></div>
                                                <div class="st_switch_text_off"><span>X</span></div>
                                                <div class="st_switch_controll"></div>
                                            </div>
                                            <input class="st_interest" data_exam_question_bank_key="11114" data_exam_question_user_key="984909" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="True" />
                                        </div>
                                        <span><b>[관심문제]</b>선택</span>
                                    </span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상603번_문제.jpg" alt="" title="" />
                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상603번_해설.jpg" alt="" title="" />
                                        <div class="st_review">
                                            한자성어에 관한 문제이다. 자주 출제되는 한자어와 한자성어는 정확히 암기하고 있어야 한다.
                                        </div>
                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 42.7 %</span><br />
                                            * 문제유형 <span>: 한자</span><br />
                                            * 문제단원 <span>: 한자와 한문 > 한자성어 > <b>한자성어</b></span><br />
                                            * 제출답안 <span>: 0</span><br />
                                            * 답안선택이유 <span>: </span>
                                        </div>
                                    </li>
                                    <li data-index="1" id="id_question_1" class="st_question" data-question-user-key="973282" data-score="0" data-interest="0">
                                        <div class="st_number">
                                            2
                                            <span>
                                        <div class="st_switch_group" id="id_cUserQuestion_is_interest">
                                            <div class="st_switch" for="cUserQuestion_is_interest">
                                                <div class="st_switch_text_on">
                                                    <span>O</span>
                                                </div>
                                                <div class="st_switch_text_off">
                                                    <span>X</span>
                                                </div>
                                                <div class="st_switch_controll"></div>
                                            </div>
                                            <input class="st_interest" data_exam_question_bank_key="11138" data_exam_question_user_key="973284" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="True" />
                                        </div>
                                        <span><b>[관심문제]</b>선택</span>
                                    </span>
                                            <img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_big.png" />
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상627번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상627번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            외래어 표기법을 묻는 문제이다. 외래어 표기법의 표기 세칙을 숙지하고 있으면 쉽게 풀 수 있다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 69.3 %</span><br />
                                            * 문제유형 <span>: 문법-국어 규범</span><br />
                                            * 문제단원 <span>: 외래어 표기법 > 표기 세칙 > <b>표기 세칙</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 외래어 표기법을 정확히 몰라서 선택했다. </span>
                                        </div>
                                    </li>
                                    <li data-index="2" id="id_question_2" class="st_question" data-question-user-key="973282" data-score="1" data-interest="0">
                                        <div class="st_number">
                                            3
                                            <span>
                                        <div class="st_switch_group" id="id_cUserQuestion_is_interest">
                                            <div class="st_switch" for="cUserQuestion_is_interest">
                                                <div class="st_switch_text_on">
                                                    <span>O</span>
                                                </div>
                                                <div class="st_switch_text_off">
                                                    <span>X</span>
                                                </div>
                                                <div class="st_switch_controll"></div>
                                            </div>
                                            <input class="st_interest" data_exam_question_bank_key="11132" data_exam_question_user_key="973283" data_exam_sbj_user_key="102800" data_exam_user_key="42902" data_user_key="5" id="cUserQuestion_is_interest" name="cUserQuestion.is_interest" type="hidden" value="False" />
                                        </div>
                                        <span><b>[관심문제]</b>선택</span>
                                    </span>
                                        </div>
                                        <div class="st_button_pannel">
                                            <span class="st_btn_0000 st_do_study">이론 학습 하기</span>

                                            <span class="st_btn_0000 st_do_lec">해설 강의</span>
                                        </div>

                                        <br />
                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상621번_문제.jpg" alt="" title="" />
                                        <br />


                                        <img src="/Upload/100/exam_question_bank//오경미국어_기출예상621번_해설.jpg" alt="" title="" />

                                        <div class="st_review">
                                            동음이의어와 다의어를 구별할 수 있는지 묻는 문제이다. 다의어는 소리가 같고 의미도 서로 밀접한 관계에 있는 단어를 말한다는 것을 기억하면 답을 찾는 데 도움이 된다.
                                        </div>

                                        <div class="st_total_review_icon">평가</div>
                                        <div class="st_total_review">
                                            * 난도 <span>: 중</span>

                                            * 정답률 <span>: 44 %</span><br />
                                            * 문제유형 <span>: 문법-국어 문법</span><br />
                                            * 문제단원 <span>: 의미론 > 의미의 이해-의미 관계 > <b>유의 관계</b></span><br />
                                            * 제출답안 <span>: 3</span><br />
                                            * 답안선택이유 <span>: 정답</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="st_answer_position">
                            <div id="t-1" class="st_answer_board st_tAn current2" style="float: right; width: 280px; margin-left: 20px;">
                                <table>
                                    <colgroup>
                                        <col style="width: 50px;" />
                                        <col style="width: 80px;" />
                                        <col style="width: 80px;" />
                                        <col />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <td>번호</td>
                                        <td>제출 답안</td>
                                        <td>정답</td>
                                        <td>난이도</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr data-index="0">
                                        <td>
                                            1<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">0</span>
                                        </td>
                                        <td>1</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="1">
                                        <td>
                                            2<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">3</span>
                                        </td>
                                        <td>4</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="2">
                                        <td>3</td>
                                        <td>3</td>
                                        <td>3</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="3">
                                        <td>
                                            4<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">4</span>
                                        </td>
                                        <td>1</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="4">
                                        <td>
                                            5<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">4</span>
                                        </td>
                                        <td>2</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="5">
                                        <td>
                                            6<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>

                                        </td>
                                        <td>4</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="6">
                                        <td>
                                            7<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>

                                        </td>
                                        <td>2</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="7">
                                        <td>
                                            8<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">3</span>
                                        </td>
                                        <td>2</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="8">
                                        <td>
                                            9<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">2</span>
                                        </td>
                                        <td>4</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="9">
                                        <td>
                                            10<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>

                                        </td>
                                        <td>3</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="10">
                                        <td>
                                            11
                                        </td>
                                        <td>
                                            3
                                        </td>
                                        <td>3</td>
                                        <td>하</td>
                                    </tr>
                                    <tr data-index="11">
                                        <td>
                                            12<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>

                                        </td>
                                        <td>3</td>
                                        <td>하</td>
                                    </tr>
                                    <tr data-index="12">
                                        <td>
                                            13
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>2</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="13">
                                        <td>
                                            14<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">1</span>
                                        </td>
                                        <td>4</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="14">
                                        <td>
                                            15<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td></td>
                                        <td>1</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="15">
                                        <td>
                                            16<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td></td>
                                        <td>1</td>
                                        <td>상</td>
                                    </tr>
                                    <tr data-index="16">
                                        <td>17</td>
                                        <td>4</td>
                                        <td></td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="17">
                                        <td>
                                            18<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">3</span>

                                        </td>
                                        <td>

                                            2
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="18">
                                        <td>
                                            19

                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>

                                            2
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="19">
                                        <td>
                                            20

                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>

                                            2
                                        <td>중</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="t-2" class="st_answer_board" style="float: right; width: 280px; margin-left: 20px;">
                                <table>
                                    <colgroup>
                                        <col style="width: 50px;" />
                                        <col style="width: 80px;" />
                                        <col style="width: 80px;" />
                                        <col />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <td>번호</td>
                                        <td>제출 답안</td>
                                        <td>정답</td>
                                        <td>난이도</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr data-index="0">
                                        <td>
                                            1<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">0</span>
                                        </td>
                                        <td>1</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="1">
                                        <td>
                                            2<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">3</span>
                                        </td>
                                        <td>4</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="2">
                                        <td>
                                            3
                                        </td>
                                        <td>3</td>
                                        <td>3</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="3">
                                        <td>
                                            4<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">4</span>
                                        </td>
                                        <td>1</td>
                                        <td>중</td>
                                    </tr>
                                    <tr data-index="4">
                                        <td>
                                            5<img class="st_user_answer_x" src="/common/zian/images/bigimg/icon_x_small.png" />
                                        </td>
                                        <td>
                                            <span class="st_wrong">4</span>
                                        </td>
                                        <td>2</td>
                                        <td>상</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <form action="/Player/Axis" id="id_frm_player" method="post" name="name_frm_player"><input id="a_lPlayer_JLecKey" name="a_lPlayer_JLecKey" type="hidden" value="" /><input id="a_lPlayer_CurriKey" name="a_lPlayer_CurriKey" type="hidden" value="" /><input id="a_strPlayer_FilePath" name="a_strPlayer_FilePath" type="hidden" value="" /><input id="a_strPlayer_Title" name="a_strPlayer_Title" type="hidden" value="" /><input id="a_bPlayer_High" name="a_bPlayer_High" type="hidden" value="" /></form>
</div>
</body>
</html>
