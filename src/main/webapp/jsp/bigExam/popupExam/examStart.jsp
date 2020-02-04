<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/big_layout.css">
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


    <script type="text/javascript">
        //오른쪽 클릭 방지 & 드래그 방지
        /*$(
            function()
            {
                document.onselectstart = eventControl;
                document.oncontextmenu = eventControl;
            }
        );

        function eventControl()
        {
            return false;
        }*/

        function onStart(){
            location.href = "/bigExam?page_gbn=popupExamList"
        }
    </script>

</head>


<body>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">	<input type="hidden" name="j_curri_key" value="0" />
        <div class="st_exam_test">
            <div class="st_start">
                <div class="st_title_box">
                    <div class="st_title_line"></div>
                    <div class="st_title">
                        <div class="st_text">
                            2010_국가직_9급_한국사기출문제
                        </div>
                    </div>
                </div>

                <div class="st_subjects">
                    <div class="st_tit_box">
                        <p class="st_subTit">영어, 한국사</p>
                        <p class="st_idx">각 <span>20</span>문항</p>
                        <p class="st_time">총 <span>100</span>분</p>
                    </div>
                </div>
                <div style="margin: 20px auto">
                    <img src="/common/zian/images/bigimg/button_start.png" alt="시험시작하기" title="시험시작하기" onclick="onStart();" style="cursor: pointer;" />
                </div>
                <div class="st_clip"></div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
