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
                        returnHtml += "<td><span class='small bdgray'>응시완료</span></td>";
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
                returnHtml += "<td><a href='' class='small bdgray'>응시완료</a></td>";
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
                returnHtml += "<td><span class='small bdgray'>응시완료</span></td>";
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