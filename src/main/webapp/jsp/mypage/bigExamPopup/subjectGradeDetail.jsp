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
        #id_chart{
            display:		none;
            position:		absolute;
            width:			400px;
            height:			200px;
            left:			0px;
            top:			0px;
            background:		#ffffff;
            border:			1px solid #999999;
            padding-top:	10px;
        }

        .st_exam_test
        {
            overflow-x:	hidden !important;
            overflow-y:	auto !important;
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
    </script>
</head>
<body>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">
        <input id="exam_user_key" name="exam_user_key" type="hidden" value="42902" />
        <div class="st_exam_test">
            <div class="st_test_main" style="background-image: none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis">
                    <div class="st_title">빅주간(전범위)모의고사_공통과목_16회</div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b>국어, 영어, 한국사</li>
                            <li><div></div><b>시험일: </b>2020년 01월 07일</li>
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
                                    <a href="javascript:goPageNoSubmit('myPage','subjectGradeDetail');"><img src="/common/zian/images/bigimg/img_tabmenu_02_on.png" alt="과목별 성적 상세분석" title="과목별 성적 상세분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="2">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','answerNote');"><img src="/common/zian/images/bigimg/img_tabmenu_03_off.png" alt="오답노트" title="오답노트" /></a>
                                </div>
                            </li>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>
                    <div id="id_chart"></div>
                    <div class="st_analysis_main">
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 국어 상세체점표
                            </div>
                            <table>
                                <colgroup>
                                    <col style="width: 50px" />
                                    <col style="width: 60px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 250px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 200px;" />
                                    <col />
                                </colgroup>
                                <thead>
                                <tr>
                                    <td>문항</td>
                                    <td>정답</td>
                                    <td>본인답</td>
                                    <td>정답률</td>
                                    <td>보기별 정답률</td>
                                    <td>난도</td>
                                    <td>문제유형</td>
                                    <td>문제단원</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr tyle="position: relative;">
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">0</td>
                                    <td>42.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 48.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 33.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 13.6
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>한자</td>
                                    <td style="text-align: left;">
                                        한자와 한문 > 한자성어 > <b>한자성어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">
                                    </td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">3</td>
                                    <td>69.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 7.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 9.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 78.8
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 규범</td>
                                    <td style="text-align: left;">
                                        외래어 표기법 > 표기 세칙 > <b>표기 세칙</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">외래어 표기법을 정확히 몰라서 선택했다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">3</td>
                                    <td>44</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 15.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 51.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 20.3
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 문법</td>
                                    <td style="text-align: left;">
                                        의미론 > 의미의 이해-의미 관계 > <b>유의 관계</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">4</td>
                                    <td>54.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 63.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 18.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 9.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 9.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 문법</td>
                                    <td style="text-align: left;">
                                        형태론 > 품사 > <b>체언-명사</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">품사의 성격을 정확히 알지 못해 선택했다. &#39;검붉다&#39;는 형용사이다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">5</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">4</td>
                                    <td>58.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 20
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 67.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 6.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 6.2
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>비문학</td>
                                    <td style="text-align: left;">
                                        비문학 > 독해 실전 > <b>독해 실전</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">글에서 중심 내용을 찾지 못해 선택했다. (가)에서는 말이 가진 효용성에 대해 서술하고 있고, (나)에서는 우리나라에서 &#39;말&#39;이 가지는 상징적 의미에 대해 서술하고 있다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">6</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>68</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 6.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 1.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 79.7
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 문법</td>
                                    <td style="text-align: left;">
                                        형태론 > 형태소와 단어 > <b>형태소와 단어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">7</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2"></td>
                                    <td>54.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 6.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 64.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 26.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 3.1
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 주제별 어휘 > <b>사람 </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">8</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td>72</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 3.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 84.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 9.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 3.1
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>비문학</td>
                                    <td style="text-align: left;">
                                        비문학 > 독해 실전 > <b>독해 실전</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">서술방식을 잘못 파악하였다. 지문에서는 학문에 관해 성현의 언행을 설명해주고 있을 뿐 그들 간 인과 관계를 밝히고 있진 않다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">9</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">2</td>
                                    <td>76</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 3.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 3.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 89.1
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>비문학</td>
                                    <td style="text-align: left;">
                                        비문학 > 독해 실전 > <b>독해 실전</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">글의 요지를 파악하지 못하였다. 윤동주가 기발한 생각을 했다는 사실은 지문에 나오지 않는다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">10</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>50.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 15.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 17.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 60.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 6.3
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>비문학</td>
                                    <td style="text-align: left;">
                                        비문학 > 독해 실전 > <b>독해 실전</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">11</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">3</td>
                                    <td>45.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 3.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 53.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 39.1
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 속담 > <b>속담</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">12</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>69.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 10.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 81.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 3.1
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>문법-국어 규범</td>
                                    <td style="text-align: left;">
                                        한글 맞춤법 > 자모 > <b>자모(제4항)</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">13</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">2</td>
                                    <td>33.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 39.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 10.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 45.3
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 문법</td>
                                    <td style="text-align: left;">
                                        형태론 > 단어의 형성 > <b>복합어-합성어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">14</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">1</td>
                                    <td>68</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 9.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 6.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 79.7
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>비문학</td>
                                    <td style="text-align: left;">
                                        비문학 > 독해 실전 > <b>독해 실전</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">글의 중심내용을 파악하지 못했거나 문맥의 흐름을 정확히 파악하지 못했다. 빈칸에는 &#39;쉽게 이해하고 즐길 수 있는 영화를 효과적으로 반복 대량 생산한다&#39;라는 말이 들어가야 어울린다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">15</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>60.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 74.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 7.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 15.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 1.6
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 규범</td>
                                    <td style="text-align: left;">
                                        한글 맞춤법 > 그 밖의 것 > <b>그 밖의 것(제51~57항)</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">16</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>26.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 31.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 19
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 3.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 46
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>한자</td>
                                    <td style="text-align: left;">
                                        한자와 한문 > 필수  한자 익히기 > <b>필수 한자 익히기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">17</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">4</td>
                                    <td>46.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 34.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 55.6
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-정서법</td>
                                    <td style="text-align: left;">
                                        올바른 표현 > 문장 다듬기 > <b>문장 다듬기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">18</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td>69.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 6.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 82.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 7.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 3.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-정서법</td>
                                    <td style="text-align: left;">
                                        올바른 표현 > 말 다듬기 > <b>말 다듬기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">조사 &#39;대로&#39;의 의미와 쓰임을 정확히 알지 못해서 선택했다. &#39;대로&#39;의 의미와 쓰임을 다시 공부하고, 문제에서 어떤 의미로 쓰였는지 정확히 파악하는 연습이 필요하다. 선택지는 맞는 설명이다., </td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">19</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">2</td>
                                    <td>60</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 18.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 70.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 6.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법-국어 규범</td>
                                    <td style="text-align: left;">
                                        표준 발음법 > 받침의 발음 > <b>받침의 발음(제8~16항)</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">20</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">2</td>
                                    <td>66.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 78.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 4.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 12.5
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문학</td>
                                    <td style="text-align: left;">
                                        현대 소설 이론과 감상 > 소설-주요 작품 감상 > <b>소설-기타 작품 감상</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="st_analysis_main">
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/Content/image/icon/icon_point_check_0001.png" alt="" /> 영어 상세체점표
                            </div>
                            <table>
                                <colgroup>
                                    <col style="width: 50px" />
                                    <col style="width: 60px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 250px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 200px;" />

                                    <col />
                                </colgroup>
                                <thead>
                                <tr>
                                    <td>문항</td>
                                    <td>정답</td>
                                    <td>본인답</td>
                                    <td>정답률</td>
                                    <td>보기별 정답률</td>
                                    <td>난도</td>
                                    <td>문제유형</td>
                                    <td>문제단원</td>

                                </tr>
                                </thead>
                                <tbody>
                                <tr style="position: relative;">
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>33.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 28.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 44.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 14.3
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 어휘 > <b>어휘</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>48</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 24.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 10.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 63.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 1.8
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 어휘 > <b>어휘</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>64</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 3.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 10.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 84.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 1.8
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 어휘 > <b>어휘</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>16</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 1.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 22.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 54.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 21.1
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>어휘</td>
                                    <td style="text-align: left;">
                                        어휘 > 어휘 > <b>어휘</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">5</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2"></td>
                                    <td>29.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 5.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 38.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 14
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 42.1
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>문법</td>
                                    <td style="text-align: left;">
                                        영어 > 동사의 종류 > <b>말하다의 뜻을 갖는 동사의 비교</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">6</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>20</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 10.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 46.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 16.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 26.8
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>문법</td>
                                    <td style="text-align: left;">
                                        명사 > 추상명사 > 전치사 + 추상명사 > <b> of 이외의 전치사</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">7</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>33.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 44.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 10.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 32.1
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>문법</td>
                                    <td style="text-align: left;">
                                        분사 > 분사구문 만드는 법 > <b>분사구문 만드는 법</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">
                                    </td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">8</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>44</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 19.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 8.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 58.9
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>생활영어</td>
                                    <td style="text-align: left;">
                                        생활영어 > 생활영어 > <b>생활영어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">9</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td>42.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 5.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 56.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 21.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 17.5
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>생활영어</td>
                                    <td style="text-align: left;">
                                        생활영어 > 생활영어 > <b>생활영어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">해석하지 못해 선택하였다. that would be telling : 그건 비밀이다, 말할 수 없다</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">10</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>42.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 14.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 16.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 57.1
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>생활영어</td>
                                    <td style="text-align: left;">
                                        생활영어 > 생활영어 > <b>생활영어</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">11</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>52</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 8.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 8.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 69.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 12.5
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>주제/제목/요지/목적 찾기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">12</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">3</td>
                                    <td>58.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 5.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 77.2
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>주제/제목/요지/목적 찾기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">전체적인 내용을 파악하지 못해 선택하였다. 빈곤한 국가들에게 통신의 발달이 가져다 주는 이점을 설명하는 내용인데 이러한 언급은 없으므로 알맞지 않다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">13</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>58.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 78.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 5.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 16.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 0
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>주제/제목/요지/목적 찾기</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">14</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>17.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 26.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 30.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 19.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 23.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>내용일치 / 불일치</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">15</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>6.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 35.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 41.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 9.4
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>내용일치 / 불일치</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">16</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>37.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 20.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 52.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 13.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>내용일치 / 불일치</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">17</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>37.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 50.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 27.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 12.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 9.1
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>문단 요약</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">18</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">2</td>
                                    <td>44</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 58.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 12.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 5.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 23.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>빈칸완성</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">해석하지 못해 선택하였다. 두번째 빈칸 뒤에 우리의 생활 방식에 익숙해져 있고 산업이 우리에게 주는 생필품과 제품들을 어떻게 여겨 많은 생각을 기울이지 않는다고 하였으므로 우리 어떤 생각을 갖고 있는지가 나와야하므로 알맞지 않다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">19</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">4</td>
                                    <td>54.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 3.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 5.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 17.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 73.2
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>빈칸완성</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">정답</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">20</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>32</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 14.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 29.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 43.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 12.7
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>독해</td>
                                    <td style="text-align: left;">
                                        독해 > 독해 > <b>연결사</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="st_analysis_main">
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/Content/image/icon/icon_point_check_0001.png" alt="" /> 한국사 상세체점표
                            </div>
                            <table>
                                <colgroup>
                                    <col style="width: 50px" />
                                    <col style="width: 60px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 250px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 200px;" />
                                    <col />
                                </colgroup>
                                <thead>
                                <tr>
                                    <td>문항</td>
                                    <td>정답</td>
                                    <td>본인답</td>
                                    <td>정답률</td>
                                    <td>보기별 정답률</td>
                                    <td>난도</td>
                                    <td>문제유형</td>
                                    <td>문제단원</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr style="position: relative;">
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>45.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 15.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 30.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 49.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 4.3
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>한국사의 이해와 선사시대</td>
                                    <td style="text-align: left;">
                                        선사시대 > 구석기 시대 > <b>유물과 유적지</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">
                                    </td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2"></td>
                                    <td>72</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 7.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 78.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 5.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 8.7
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>고대</td>
                                    <td style="text-align: left;">
                                        삼국시대 > 삼국시대의 정치 > <b>가야</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>65.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 11.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 13
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 71
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>고려시대</td>
                                    <td style="text-align: left;">
                                        중세의 경제 > 경제 정책 > <b>고려의 토지제도</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">

                                    </td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>73.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 79.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 10.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 8.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 1.4
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>조선 전기</td>
                                    <td style="text-align: left;">
                                        조선 전기의 문화 > 성리학의 발달 > <b>주리론과 주기론</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">5</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2"></td>
                                    <td>64</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 8.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 69.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 15.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 5.8
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>조선 후기</td>
                                    <td style="text-align: left;">
                                        조선 후기의 사회 > 신분제의 동요 > <b>양반층의 분화</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">6</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>77.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 84.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 11.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 0
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>근대 사회</td>
                                    <td style="text-align: left;">
                                        근대 사회의 전개 > 개화 정책에 대한 반발 > <b>위정척사 운동</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">7</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>69.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 5.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 76.5
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>일제강점기</td>
                                    <td style="text-align: left;">
                                        일제 강점기의 독립 운동 > 사회적 민족 운동 > <b>민족주의와 사회주의</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">8</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>60</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 2.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 1.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 29.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 66.2
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>현대사회</td>
                                    <td style="text-align: left;">
                                        대한민국의 전개 > 민주주의의 시련과 발전 > <b>이승만 정부의 수립</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">9</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>44</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 5.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 48.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 41.2
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>고려시대</td>
                                    <td style="text-align: left;">
                                        중세의 문화 > 과학 기술의 발달 > <b>인쇄술</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">10</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>61.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 14.7
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 67.6
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>조선 후기</td>
                                    <td style="text-align: left;">
                                        조선 후기의 정치 > 탕평책의 실시 > <b>정조의 정책</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">11</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>74.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 4.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 4.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 82.4
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>근대 사회</td>
                                    <td style="text-align: left;">
                                        근대 사회의 전개 > 개화당의 형성과 활동 > <b>갑신정변</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">12</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>29.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 29.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 22.1
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 32.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 16.2
                                        </div>
                                    </td>
                                    <td>중</td>
                                    <td>조선 전기</td>
                                    <td style="text-align: left;">
                                        조선 전기의 경제 > 수취 체제 > <b>조운제도</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">13</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">2</td>
                                    <td>60</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 5.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 5.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 65.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 23.2
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>고려시대</td>
                                    <td style="text-align: left;">
                                        중세의 정치 > 고려의 대외 관계 > <b>여진 정벌</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">집강소가 설치된 지역을 몰라서 선택했다. 동학군은 전라도에서 주로 활동하였으며 전주는 북진 정책과는 거리가 멀다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">14</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>56</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 17.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 7.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 61.8
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>조선 전기</td>
                                    <td style="text-align: left;">
                                        조선 전기의 문화 > 그림과 서예 >  음악 > <b>15세기의 그림</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">15</td>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2"></td>
                                    <td>57.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 10.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 63.2
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>조선 후기</td>
                                    <td style="text-align: left;">
                                        조선 후기의 경제 > 서민 경제의 발전 > <b>양반 지주와 농민의 경제 변화</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">16</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">4</td>
                                    <td>52</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 2.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 56.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 15.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 24.6
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>고려시대</td>
                                    <td style="text-align: left;">
                                        중세의 정치 > 고려 후기의 정치 변동 > <b>공민왕의 개혁정치</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">쌍성총관부 수복과 성균관 부흥의 시기를 헷갈렸다. 쌍성총관부 수복은 1356년에, 성균관 부흥은 1367년에 일어난 일이기 때문에 답이 될 수 없다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">17</td>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2"></td>
                                    <td>69.3</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 76.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 5.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 13.2
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 4.4
                                        </div>
                                    </td>
                                    <td>상</td>
                                    <td>고대</td>
                                    <td style="text-align: left;">
                                        삼국시대 > 삼국시대의 정치 > <b>고구려</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">18</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2"></td>
                                    <td>74.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 2.9
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 8.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 82.4
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 5.9
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>근대 사회</td>
                                    <td style="text-align: left;">
                                        근대 사회의 전개 > 개항과 불평등 조약 > <b>강화도 조약</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;"></td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">19</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td>78.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 0
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 85.5
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 5.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 8.7
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>일제강점기</td>
                                    <td style="text-align: left;">
                                        일제 강점기의 독립 운동 > 1920년대 무장 독립 전쟁 > <b>한인애국단</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">일왕에게 폭탄을 던진 사건이 의열단의 활동과 관련 있다고 생각했다. 2번은 신채호에 대한 설명이며, 이봉창 의사는 의열단이 아닌 한인애국단 소속이므로 답이 될 수 없다.</td>
                                </tr>
                                <tr style="position: relative;">
                                    <td rowspan="2">20</td>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">3</td>
                                    <td>58.7</td>
                                    <td>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ① 20.3
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ② 63.8
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ③ 11.6
                                        </div>
                                        <div style="float: left; text-align: left; width: 25%;">
                                            ④ 4.3
                                        </div>
                                    </td>
                                    <td>하</td>
                                    <td>현대사회</td>
                                    <td style="text-align: left;">
                                        대한민국의 전개 > 민주주의의 시련과 발전 > <b>유신 체제</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답안선택이유</td>
                                    <td colspan="4" style="text-align: left; padding-left: 10px; padding-right: 10px;">1960~1970년대에 경제개발이 한창이었기 때문에 선택했다. 그러나 OECD 가입은 김영삼 정부 때의 일이다.</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div style="height: 300px"></div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
