//모의고사 상품 리스트 > 직렬선택
function getMockExamClassCtgSelectBoxList(onOffKey, tagId) {
    if (onOffKey == null || onOffKey == undefined) return;

    var infoList = getApi("/exam/getMockExamClassCtgSelectBoxList/", onOffKey, '');

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#"+tagId).append(returnHtml);
        }
    }
}

//빅모의고사 > 주간모의고사 직렬선택 셀렉트박스
function getWeekMockExamClassCtgSelectBoxList() {
    var infoList = getApi("/exam/getWeekMockExamClassCtgSelectBoxList/", '', '');

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#onSel").append(returnHtml);
        }
    }
}

function getWeekMockExamClassCtgSelectBoxList2() {
    var infoList = getApi("/exam/getWeekMockExamClassCtgSelectBoxList/", '', '');

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#weekSel").append(returnHtml);
        }
    }
}

//빅모의고사 > 기출문제 직렬선택 셀렉트박스
function getGichulSelectBoxList(selectBoxType, tagId) {
    var infoList = getApi("/exam/getGichulSelectBoxList/", selectBoxType, '');

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#"+tagId).append(returnHtml);
        }
    }
}

//모의고사 학원 상품 리스트 > 직렬선택
function getMockExamBuyClassCtgSelectBoxList(userKey, onOffKey, tagId) {
    if (onOffKey == null || onOffKey == undefined) return;
    var data = {
        onOffKey : onOffKey
    };

    var infoList = getApi("/exam/getMockExamBuyClassCtgSelectBoxList/", userKey, data);

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#"+tagId).append(returnHtml);
        }
    }
}


//모의고사 상품 리스트 > 직렬선택
function getMockExamListAtBuy(userKey, onOffKey, sPage, listLimit, ctgKey, searchType, searchText, tagId) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    if(tagId == 'dataList'){
        dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    }else{
        dwr.util.removeAllRows("dataList2"); //테이블 리스트 초기화
    }
    var data = {
        onOffKey : onOffKey,
        sPage : sPage,
        listLimit : listLimit,
        ctgKey : ctgKey,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/exam/getMockExamListAtBuy/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        if(tagId == 'dataList'){
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        }else{
            paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
        }
        for(var  i=0; i < selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<tr>";
                    returnHtml += "<td>"+ cmpList.className +"</td>";
                    returnHtml += "<td>"+ cmpList.goodsName +"</td>";
                    returnHtml += "<td>"+ cmpList.acceptStartDate +"<br>~"+ cmpList.acceptEndDate +"</td>";
                    if(cmpList.acceptType == 0){//응시마감
                        returnHtml += "<td><span class=''>응시마감</span></td>";
                    }else if(cmpList.acceptType == 1){//응시가능
                        //returnHtml += "<td><a href='' class='small blue'>응시가능</a></td>";
                        returnHtml += "<td><span class='small blue' onclick='goBigExamPopup("+ cmpList.examUserKey +");'>응시가능</span></td>";
                    }else{//응시완료
                        returnHtml += "<td><span class=''>응시완료</span></td>";
                    }
                    if(tagId == "dataList"){
                            returnHtml += "<td>";
                        if(cmpList.acceptType != 1){
                            returnHtml += "<ul class=\"fileList\">";
                            if(cmpList.printQuestionFile != null) {
                                returnHtml += "<li><a href='"+ cmpList.printQuestionFileUrl +"' target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 문제지</a></li>";
                            }
                            if(cmpList.printCommentaryFile != null) {
                                returnHtml += "<li><a href='"+ cmpList.printCommentaryFileUrl +"'  target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 해설지</a></li>";
                            }
                            returnHtml += "</ul>";
                        }
                            returnHtml += "</td>";
                    }
            returnHtml += "</tr>";
            $("#"+tagId).append(returnHtml);
        }
    }
}

function getWeekBigExamList(userKey, sPage, listLimit, ctgKey, searchType, searchText) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        ctgKey : ctgKey,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/exam/getWeekBigExamList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var  i=0; i < selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<tr>";
            returnHtml += "<td>"+ cmpList.classCtgName +"</td>";
            returnHtml += "<td>"+ cmpList.goodsName +"</td>";
            returnHtml += "<td>"+ cmpList.acceptStartDate +"<br>~"+ cmpList.acceptEndDate +"</td>";
            if(cmpList.iscomplete == 0){//응시가능
                returnHtml += "<td><span class='small blue' onclick='goBigExamPopup("+ cmpList.examKey +");'>응시가능</span></td>";
            }else if(cmpList.iscomplete == 1){//응시완료
                returnHtml += "<td><span class=''>응시완료</span></td>";
            }
                returnHtml += "<td>";
                //if(cmpList.iscomplete == 1){
                    returnHtml += "<ul class=\"fileList\">";
                    if(cmpList.printQuestionFile != null){
                        returnHtml += "<li><a href='"+ cmpList.printQuestionFileUrl +"' target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 문제지</a></li>";
                    }
                    if(cmpList.printCommentaryFile != null){
                        returnHtml += "<li><a href='"+ cmpList.printCommentaryFileUrl +"'  target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 해설지</a></li>";
                    }
                    returnHtml += "</ul>";
                //}
                returnHtml += "</td>";
            returnHtml += "</tr>";
            $("#dataList").append(returnHtml);
        }
        $('#dataList tr').each(function(){
            var tr = $(this);
            tr.children().eq(1).attr("class", "left");
        });
    }
}

function getGichulProblemList(userKey, sPage, listLimit, searchType, searchText, groupCtgKey, classCtgKey, subjectCtgKey) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText,
        groupCtgKey : groupCtgKey,
        classCtgKey : classCtgKey,
        subjectCtgKey : subjectCtgKey
    };

    var infoList = getPageApi("/exam/getGichulProblemList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var  i=0; i < selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<tr>";
            returnHtml += "<td>"+ cmpList.classCtgName +"</td>";
            returnHtml += "<td>"+ cmpList.groupCtgName +"</td>";
            returnHtml += "<td>"+ cmpList.subjectCtgName +"</td>";
            returnHtml += "<td>"+ cmpList.goodsName +"</td>";
            if(cmpList.iscomplete == 0){//응시가능
                returnHtml += "<td><span class='small blue' onclick='goBigExamPopup("+ cmpList.examKey +");'>응시가능</span></td>";
            }else if(cmpList.iscomplete == 1){//응시완료
                returnHtml += "<td><span class=''>응시완료</span></td>";
            }
            returnHtml += "<td>";
                returnHtml += "<ul class=\"fileList\">";
                if(cmpList.printQuestionFile != null){
                    returnHtml += "<li><a href='"+ cmpList.printQuestionFileUrl +"' target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 문제지</a></li>";
                }
                if(cmpList.printCommentaryFile != null){
                    returnHtml += "<li><a href='"+ cmpList.printCommentaryFileUrl +"'  target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 해설지</a></li>";
                }
                returnHtml += "</ul>";
            returnHtml += "</td>";
            returnHtml += "</tr>";
            $("#dataList").append(returnHtml);
        }
        $('#dataList tr').each(function(){
            var tr = $(this);
            tr.children().eq(1).attr("class", "left");
        });
    }
}

function getExamMasterGateInfo(examKey, userKey) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        userKey : userKey
    };
    var infoList = getPageApi("/exam/getExamMasterGateInfo/", examKey, data);
    return infoList;
}

function getUserExamList(examKey, userKey) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        userKey : userKey
    };
    var infoList = getPageApi("/exam/getUserExamList/", examKey, data);
    if(infoList != null) {
        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++){
           //"examName":
            innerHTML('examName', selList[0].examHeaderInfo.examName);
            innerHTML('subjectNameList', selList[0].examHeaderInfo.subjectNameList);
            innerHTML('examDate', selList[0].examHeaderInfo.examDate);
            innerHTML('serial', selList[0].examHeaderInfo.serial);
            innerHTML('userName', selList[0].examHeaderInfo.userName);
            /*과목 탭 불러오기*/
            var returnHtml = "<li class=\"st_subject_tab\" data-name='t-"+ (i+1) +"' data-tab='tab-"+ (i+1) +"' data-index='"+ (i+1) +"' onclick='setTabNum("+ i +");'>"+selList[i].subjectName;
            returnHtml += "<div>"+ selList[i].subjectName +"</div>";
            returnHtml += "</li>";
            $("#subjectTab").append(returnHtml);

            /*시험 OMR 불러오기*/
            var omrChkHtml = "<div id='t-"+ (i+1) +"' class=\"st_omr_board\">";
            omrChkHtml += "<input type='hidden' id='SubjectKey-"+ (i+1) +"' value='"+ selList[i].examInfo[0].examSbjUserKey +"'>";
                for(var j = 0; j < selList[i].examInfo.length; j++) {
                    var examInfo = selList[i].examInfo[j];
                    omrChkHtml += "<ul>";
                    omrChkHtml += "<li value='"+ selList[i].examInfo[j].answer +"'></li>";
                    omrChkHtml += "<li class=\"st_number\" id='"+ examInfo.examQuestionBankKey +"'>";
                    omrChkHtml += j+1;
                    omrChkHtml += "</li>";
                    omrChkHtml += "<li class=\"st_answer\" value='1'>①</li>";
                    omrChkHtml += "<li class=\"st_answer\" value='2'>②</li>";
                    omrChkHtml += "<li class=\"st_answer\" value='3'>③</li>";
                    omrChkHtml += "<li class=\"st_answer\" value='4'>④</li>";
                    omrChkHtml += "</ul>";
                }
                omrChkHtml += "</div>";
                $(".st_position2").append(omrChkHtml);

            var examHtml = "<div id='tab-"+ (i+1) +"' class=\"st_question_board\">";
            examHtml += "<ul>";
                for(var k = 0; k < selList[i].examInfo.length; k++){
                    var examInfo = selList[i].examInfo[k];
                                examHtml += "<li id='id_question_"+ (k+1) +"'>";
                                    examHtml += " <div class=\"st_number\">"+ (k+1) +"</div>";
                                    examHtml += "<br>";
                                    examHtml += "<img src='"+ examInfo.questionImage +"' alt=\"\">";
                                examHtml += " </li>";
                }
            examHtml += "</ul>";
            examHtml += "</div>";
            $(".st_position").append(examHtml);
        }
    }
}

function saveExamResult(examResultInfo, playTime) {
    var data = {
        examResultInfo : examResultInfo,
        playTime : playTime
    };
    var result = postApi("/exam/saveExamResult", data);
    return result;
}

function getExamMasterGateInfoFromBuy(examUserKey) {
    if (examUserKey == null || examUserKey == undefined) return;
    var infoList = getApi("/exam/getExamMasterGateInfoFromBuy/", examUserKey, '');
    if(infoList != null) {
        return infoList;
    }
}

function getAchievementManagementDetailInfoBySubject(examUserKey) {
    if (examUserKey == null || examUserKey == undefined) return;
    var infoList = getApi("/exam/getAchievementManagementDetailInfoBySubject/", examUserKey, '');
    if (infoList != null) {
        var selList = infoList.result;
        innerHTML("examName", selList[0].examHeaderInfo.examName);
        innerHTML("examDate", selList[0].examHeaderInfo.examDate);
        innerHTML("serial", selList[0].examHeaderInfo.serial);
        innerHTML("userName", selList[0].examHeaderInfo.userName);
        innerHTML("subjectName", selList[0].subjectNameList);
        for (var i = 0; i < selList.length; i++){
            var returnHtml  = "<div class='st_analysis_main'>";
                returnHtml += "<div class=\"st_analysis_section\">";
                returnHtml +=  "<div class='st_sction_title'>";
                    returnHtml += "<img src='/Content/image/icon/icon_point_check_0001.png' alt='' />"+ selList[i].subjectName +" 상세체점표";
                 returnHtml += "</div>";
                returnHtml += "<table>";
                 returnHtml += "<colgroup>";
                    returnHtml +=  "<col style='width: 50px'/>";
                    returnHtml +=  "<col style='width: 60px;'/>";
                    returnHtml +=  "<col style='width: 50px;'/>";
                    returnHtml +=  "<col style='width: 100px;'/>";
                    returnHtml +=  "<col style='width: 250px;'/>";
                    returnHtml +=  "<col style='width: 50px;'/>";
                    returnHtml +=  "<col style='width: 200px;'/>";
                    returnHtml +=  "<col />";
                 returnHtml +=  "</colgroup>";
                 returnHtml +=  "<thead>";
                    returnHtml +=  "<tr>";
                    returnHtml +=  "<td>문항</td>";
                    returnHtml +=  "<td>정답</td>";
                    returnHtml +=  "<td>본인답</td>";
                    returnHtml +=  "<td>정답률</td>";
                    returnHtml +=  "<td>보기별 정답률</td>";
                    returnHtml +=  "<td>난도</td>";
                    returnHtml +=  "<td>문제유형</td>";
                    returnHtml +=  "<td>문제단원</td>";
                    returnHtml +=  "</tr>";
                 returnHtml +=  " </thead>";
                 returnHtml +=  "<tbody>";

                    for(var j=0; j < selList[i].resultList.length; j++){
                        var resultList = selList[i].resultList[j];
                        returnHtml +=  "<tr style='position: relative;'>";
                        returnHtml +=     "<td rowspan='2'>"+ gfn_isnull(resultList.num) +"</td>";
                        returnHtml +=     "<td rowspan='2'>"+ gfn_isnull(resultList.answer) +"</td>";
                        returnHtml +=     "<td rowspan='2'>"+ gfn_isnull(resultList.userAnswer)  +"</td>";
                        returnHtml +=     "<td>"+ gfn_isnull(resultList.scorePercent) +"</td>";
                        returnHtml +=     "<td>";
                            for(var k=0; k < resultList.problemScoreList.length; k++){
                                if(k == 0) var scoreNum = "①";
                                else if(k == 1) var scoreNum = "②";
                                else if(k == 2) var scoreNum = "③";
                                else var scoreNum = "④";

                                returnHtml += "<div style='float: left; text-align: left; width: 25%;'>";
                                   returnHtml += scoreNum+" "+resultList.problemScoreList[k].scorePercent;
                                returnHtml += "</div>";
                            }
                        returnHtml +=     "</td>";
                        returnHtml +=     "<td>"+ gfn_isnull(resultList.examLevelName) +"</td>";
                        returnHtml +=     "<td>"+ gfn_isnull(resultList.stepName) +"</td>";
                        returnHtml +=     "<td style='text-align: left;'>";
                                            var unitNameArray = new Array();
                                            if(resultList.unitName != null){
                                                var str = resultList.unitName;
                                                unitNameArray = str.split(">");
                                                for(var m =0; m < unitNameArray.length; m++){
                                                    if(m+1 == unitNameArray.length){
                                                        returnHtml += "<b>"+unitNameArray[m]+"</b>";
                                                    }else{
                                                        returnHtml += unitNameArray[m] + " > ";
                                                    }
                                                }
                                            }
                        returnHtml +=      "</td>";
                        returnHtml += "</tr>";
                        returnHtml += "<tr>";
                        returnHtml +=  "<td>답안선택이유</td>";
                        returnHtml +=  "<td colspan='4' style='text-align: left; padding-left: 10px; padding-right: 10px;'>"+ gfn_isnull(resultList.answerComment) +"</td>";
                        returnHtml += "</tr>";
                    }
                 returnHtml += "</tbody>";
        returnHtml += "</table>";
        returnHtml += "</div>";
        returnHtml += "</div>";
        $("#dataList").append(returnHtml);
        }
    }
}

function getWrongNote(examUserKey, isScore, isInterest) {
    if (examUserKey == null || examUserKey == undefined) return;
    var data = {
        isScore : isScore,
        isInterest : isInterest
    };
    var infoList = getApi("/exam/getWrongNote/", examUserKey, data);
    if (infoList != null) {
        var selList = infoList.result;
        innerHTML("examName", selList[0].examHeaderInfo.examName);
        innerHTML("examDate", selList[0].examHeaderInfo.examDate);
        innerHTML("serial", selList[0].examHeaderInfo.serial);
        innerHTML("userName", selList[0].examHeaderInfo.userName);
        innerHTML("subjectName", selList[0].subjectNameList);
        var returnHtml = "<div class='st_questionnote_search_pannel'>";
        for (var i = 0; i < selList.length; i++){
            if(i == 0) var classStr = "class='st_on'";
            else var classStr = "";
            returnHtml += "<div "+ classStr +" data-name='t-"+ (i+1) +"' data-tab='tab-"+ (i+1) +"'>"+  selList[i].subjectName +"</div>"
        }
        returnHtml += "<span class='st_controll_pannel'>";
        returnHtml += "틀린문제보기";
        returnHtml += "<div class='st_switch_group' id='id_bShowX'>";
        returnHtml += "<div class='st_switch' for='bShowX'>";
        returnHtml += "<div class='st_switch_text_on'>";
        returnHtml += "<span>O</span>";
        returnHtml += "</div>";
        returnHtml += "<div class='st_switch_text_off'>";
        returnHtml += "<span>X</span>";
        returnHtml += "</div>";
        returnHtml += "<div class='st_switch_controll'></div>";
        returnHtml += "</div>";
        returnHtml += "<input class='st_show_x' id='bShowX' name='bShowX' type='hidden' value='False' />";
        returnHtml += "</div>";
        returnHtml += "관심문제보기";
        returnHtml += "<div class='st_switch_group' id='id_bShowInterest'>";
        returnHtml += "<div class='st_switch' for='bShowInterest'>";
        returnHtml += "<div class='st_switch_text_on'>";
        returnHtml += "<span>O</span>";
        returnHtml += "</div>";
        returnHtml += "<div class='st_switch_text_off'>";
        returnHtml += "<span>X</span>";
        returnHtml += "</div>";
        returnHtml += "<div class='st_switch_controll'></div>";
        returnHtml += "</div>";
        returnHtml += "<input class='st_show_interest' id='bShowInterest' name='bShowInterest' type='hidden' value='False'/>";
        returnHtml += "</div>";
        returnHtml += "</span>";
        returnHtml += "</div>";
        $("#st_questionnote_search_pannel_Div").append(returnHtml);

        for (var j = 0; j < selList.length; j++){
            var returnHtml2 = "<div id='tab-"+ (j+1) +"' class=\"st_question_board current\" style=\"width: 800px; height: 530px;\">";
                returnHtml2 += "<ul>";
                for(var k = 0; k < selList[j].resultList.length; k++){
                    var resultList = selList[j].resultList[k];
                    if(resultList.score == 0){
                        var score = 0;
                    }else{
                        var score = 1;
                    }
                    returnHtml2 +=  "<li data-index='"+ k +"' id='id_question_"+ k +"' class='st_question' data-question-user-key='973282' data-score='" + score + "' data-interest='0'>";
                    returnHtml2 +=     "<div class='st_number'>";
                    returnHtml2 +=     resultList.num;
                    returnHtml2 +=     "<span>";
                    returnHtml2 +=    "<div class='st_off st_switch_group' id='id_cUserQuestion_is_interest'>";
                    returnHtml2 +=     "<div class='st_switch' for='cUserQuestion_is_interest'>";
                    returnHtml2 +=     "<div class='st_switch_text_on'><span>O</span></div>";
                    returnHtml2 += "<div class='st_switch_text_off'><span>X</span></div>";
                    returnHtml2 +=  "<div class='st_switch_controll'></div>";
                    returnHtml2 +=    "</div>";
                    returnHtml2 +=     "<input class='st_interest' data_exam_question_bank_key='11114' data_exam_question_user_key='984909' data_exam_sbj_user_key='102800' data_exam_user_key='42902' data_user_key='5' id='cUserQuestion_is_interest' name='cUserQuestion.is_interest' type='hidden' value='True' />";
                    returnHtml2 +=     "</div>";
                    returnHtml2 +=     "<span><b>[관심문제]</b>선택</span>";
                    returnHtml2 += "</span>";
                    if(resultList.score == 0){
                        returnHtml2 += "<img class='st_user_answer_x' src='/common/zian/images/bigimg/icon_x_big.png'/>";
                    }
                    returnHtml2 +=     "</div>";
                    returnHtml2 +=     "<div class='st_button_pannel'>";
                    returnHtml2 +=    "<a class='st_btn_0000 st_do_study' href='"+ resultList.theoryLearningUrl +"' target='_blank'>이론 학습 하기</a>&nbsp;&nbsp;";

                    returnHtml2 +=  "<span class='st_btn_0000 st_do_lec'>해설 강의</span>";
                    returnHtml2 +=  "</div>";
                    returnHtml2 += "<br />";
                    returnHtml2 += "<img src='"+ resultList.questionImage +"' alt='' title='' />";
                    returnHtml2 +=     "<br />";
                    returnHtml2 +=    "<img src='"+ resultList.commentaryImage +"' alt='' title='' />";
                    returnHtml2 +=    "<div class='st_review'>";
                    returnHtml2 +=    resultList.review;
                        returnHtml2 += "</div>";
                    returnHtml2 += "<div class='st_total_review_icon'>평가</div>";
                    returnHtml2 +=     "<div class='st_total_review'>";
                    returnHtml2 +=     "* 난도 <span>: "+ resultList.examLevelName +"</span>";

                    returnHtml2 += "* 정답률 <span>: "+ resultList.scorePercent +" %</span><br />";
                    returnHtml2 += "* 문제유형 <span>: "+ resultList.stepName +"</span><br />";
                    returnHtml2 += "* 문제단원 <span>: "+  resultList.unitName +"</span><br />";
                    returnHtml2 += " * 제출답안 <span>: "+ resultList.userAnswer +"</span><br />";
                    returnHtml2 += "* 답안선택이유 <span>: "+ resultList.answerComment +"</span>";
                    returnHtml2 +=  "</div>";
                    returnHtml2 +=  "</li>";
                }
                returnHtml2 += "</ul>";
            returnHtml2 += "</div>";
            $("#st_position_div").append(returnHtml2);
        }

        for (var l = 0; l < selList.length; l++){
            var returnHtml3 = " <div id='t-"+ (l+1) +"' class=\"st_answer_board st_tAn current2\" style=\"float: right; width: 280px; margin-left: 20px;\">";
            returnHtml3 += "<table>";
            returnHtml3 +="<colgroup>";
            returnHtml3 +="<col style=\"width: 50px;\" />";
            returnHtml3 +="<col style=\"width: 80px;\" />";
            returnHtml3 +="<col style=\"width: 80px;\" />";
            returnHtml3 +="</colgroup>";
            returnHtml3 += "<thead>";
            returnHtml3 += "<tr>";
                returnHtml3 += "<td>번호</td>";
                returnHtml3 += "<td>제출 답안</td>";
                returnHtml3 += "<td>정답</td>";
                returnHtml3 += "<td>난이도</td>";
            returnHtml3 += "</tr>";
            returnHtml3 += "</thead>";
            returnHtml3 += "<tbody>";
            for(var m = 0; m < selList[l].resultList.length; m++){
                var resultList = selList[l].resultList[m];
                returnHtml3 += "<tr data-index="+ m +">";
                returnHtml3 += "<td>";
                returnHtml3 += resultList.num;
                if(resultList.score == 0){
                    returnHtml3 += "<img class='st_user_answer_x' src='/common/zian/images/bigimg/icon_x_small.png'>";
                }
                returnHtml3 += "</td>";
                returnHtml3 += "<td>";
                returnHtml3 += "<span class='st_wrong'>"+ resultList.userAnswer +"</span>";
                returnHtml3 += "</td>";
                returnHtml3 += "<td>"+ resultList.answer +"</td>";
                returnHtml3 +=  "<td>"+ resultList.examLevelName +"</td>";
                returnHtml3 +=  "</tr>";
            }
            returnHtml3 += "</tbody>";
            returnHtml3 += "</table>";
            returnHtml3 += "</div>";
            $("#answerDiv").append(returnHtml3);
        }

    }
}