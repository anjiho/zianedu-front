//내 강의실 > 학원수강내역
function getAcademySignUp(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getAcademySignUp/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보 > 회원리뷰
function getGoodsReview(jLecKey, sPage, listLimit, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;

    var data = {
        sPage : sPage,
        listLimit : listLimit
    };

    var InfoList = getApi("/myPage/getGoodsReview/", jLecKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보
function getOnlineLectureDetail(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineLectureDetail/", jLecKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보 > 강좌목차
function getOnlineLectureSubjectList(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineLectureSubjectList/", jLecKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강완료강좌 리스트
function getOnlineVideoEndList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineVideoEndList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 일시정지강좌 리스트
function getOnlineVideoPauseList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineVideoPauseList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌(프로모션)
function getPromotionSignUp(userKey, deviceType, tagId) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var InfoList = getApi("/myPage/getPromotionSignUp/", userKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌 > 동영상 수강중인강좌 > 일시정지 버튼 클릭 팝업 데이터
function getVideoPauseRequestPopup(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getVideoPauseRequestPopup/", jLecKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//내 강의실 > 수강중인강좌(동영상)
function getVideoSignUp(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUp/", userKey, data);
    var selList = infoList.result;
    if(selList.subjectInfo.length > 0){
        var result = infoList.result.subjectInfo;
        innerValue("subjectCtgKey", result[0].subjectCtgKey);
        dwr.util.addOptions('playSubject', result, function (data) {
            return "<a href='javascript:playDepthList("+ data.subjectCtgKey +");' id='"+ data.subjectCtgKey +"'>"+ data.subjectName +"</a>"
        }, {escapeHtml: false});
    }else{
        $("#playLecListDiv").hide();
        return false;
    }

    if(selList.typeInfo.length > 0){
        var result = infoList.result.typeInfo;
            getPlaySubjectList(result[0].ctgKey); // 강좌 리스트 불러오기
            dwr.util.addOptions('playType', result, function (data) {
                return "<a href='javascript:getPlaySubjectList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
            }, {escapeHtml: false});
    }else{
        return false;
    }
}

function changePlayLectureList(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUp/", userKey, data);
    if(infoList != null){ // 유형 리스트
        var result = infoList.result.typeInfo;
        getPlaySubjectList(result[0].ctgKey); // 강좌 리스트 불러오기
    }
}

//내강의실 > 동영상 > 유형 > 강좌명 리스트 불러오기
function getVideoSignUpLectureNameList(userKey, deviceType, subjectCtgKey, stepCtgKey) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType,
        subjectCtgKey : subjectCtgKey,
        stepCtgKey : stepCtgKey
    };

    var infoList = getApi("/myPage/getVideoSignUpLectureNameList/", userKey, data);

    if (infoList.result.length > 0 ) {
        var result = infoList.result;
        if(result.length > 0) {
            innerValue("gKey", result[0].gkey);
            var gKey = getInputTextValue("gKey");
            getTypeLectureDetail(gKey, result[0].jlecKey); //강좌상세설명
            var pcMobile = divisionPcMobile();
            getVideoSignUpDetailInfo(gKey, pcMobile, result[0].jlecKey, 'dataList'); //강좌 리스트
            dwr.util.addOptions('typeLectureList', result, function (data) {
                return "<a href='javascript:getTypeLectureDetail(" + data.gkey + ","+ data.jlecKey +");'>" + data.name + "</a>"
            }, {escapeHtml: false});
        }
    }else{
        $("#playLecListDiv").hide();
    }
}

function getVideoSignUpDetailInfo(gkey, device, jlecKey, tagId) {
    if (gkey == null || gkey == undefined) return;

    var detailInfo = getApi("/myPage/getVideoSignUpDetailInfo/", jlecKey);

    var data = {
        device : device
    };
    var infoList = getApi("/product/getLectureListByJLecKey/", jlecKey, data);
    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화
    if (infoList != null) {
        var selList = infoList.result.lectureList;
        var countId = '';
        if(tagId == 'dataList') countId = 'playLecTotalCnt';
        else countId = 'zianPassTotalCnt';
        innerHTML(countId, infoList.result.totalCnt);
        dwr.util.addRows(tagId, selList, [
            function(data) {return data.numStr;},
            function(data) {return data.name;},
            function(data) {return data.vodTime;},
            function(data) {return "<a href='' class='black small'>일반화질</a>&nbsp;&nbsp;<a href='' class='blue small'>고화질</a>";},

        ], {escapeHtml:false});
    }

    return detailInfo;
}


//강좌 일시정지 요청, 일시정지 해제
function requestVideoStartStop(jLecKey, pauseDay, requestType) {
    var data = {
        jLecKey : jLecKey,
        pauseDay : pauseDay,
        requestType : requestType
    };
    
}

//지안패스 분류 리스트
function getZianPassSignUpList(userKey) {
    if (userKey == null || userKey == undefined) return;

    var infoList = getApi("/myPage/getZianPassSignUpList/", userKey, "");

    if (infoList == null || Number(infoList.result.length) == 0) {
        $("#zianPassListDiv").hide();
        return false;
    } else if (infoList != null || infoList.result.length > 0) { //과목 리스트
        innerValue("zianPassjKey", infoList.result[0].jkey);
        dwr.util.addOptions('zianPassList', infoList.result, function (data) {
            return "<a href='javascript:zianPassTypeList("+ data.jkey +");'>"+ data.gname +"</a>"
        }, {escapeHtml: false});
    }
}

//지안패스 > 유형 불러오기
function getSignUpZianPassTypeList(jKey, deviceType) {
    if (jKey == null || jKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getSignUpZianPassTypeList/", jKey, data);
    if (infoList.result.length > 0) { //과목 리스트
        innerValue("zianPassCtgKey", infoList.result[0].ctgKey);
        var pcMobile = divisionPcMobile();
        getSignUpZianPassSubjectNameList(jKey, pcMobile, infoList.result[0].ctgKey);
        dwr.util.addOptions('zianPassType', infoList.result, function (data) {
            return "<a href='javascript:zianPassLecTitleList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }else{
        $("#zianPassListDiv").hide();
        return false;
    }
}

function getSignUpZianPassSubjectNameList(jKey, deviceType, stepCtgKey) {
    if (jKey == null || jKey == undefined) return;
    var data = {
        deviceType : deviceType,
        stepCtgKey : stepCtgKey
    };

    var infoList = getApi("/myPage/getSignUpZianPassSubjectNameList/", jKey, data);
    if (infoList != null) { //과목 리스트
        innerValue("zianPassjLecKey", infoList.result[0].jlecKey);
        zianPassDetail(infoList.result[0].jlecKey);
        dwr.util.addOptions('zianPassLecList', infoList.result, function (data) {
            return "<a href='javascript:zianPassDetail("+ data.jlecKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}

//학원 실강 > 유형 불러오기
function getSignUpAcademyTypeList(userKey) {
    if (userKey == null || userKey == undefined) return;

    var infoList = getApi("/myPage/getSignUpAcademyTypeList/", userKey, "");
    if (infoList == null || Number(infoList.result.length) == 0) {
        $("#acaDiv").hide();
        return false;
    } else if (infoList != null || infoList.result.length > 0) { //과목 리스트
        innerValue("acaCtgKey", infoList.result[0].ctgKey);
        dwr.util.addOptions('academyType', infoList.result, function (data) {
            return "<a href='javascript:academyLecList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }
}

//학원 실강 > 강의리스트 불러오기
function getSignUpAcademySubjectNameList(userKey, stepCtgKey) {
    if (userKey == null || userKey == undefined) return;
    if (stepCtgKey == null || stepCtgKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey
    };
    var infoList = getApi("/myPage/getSignUpAcademySubjectNameList/", userKey, data);
    if (infoList != null) { //과목 리스트
        innerValue("acaGkey", infoList.result[0].gkey);
        academyLecDetail(infoList.result[0].gkey);
        dwr.util.addOptions('acaLecList', infoList.result, function (data) {
            return "<a href='javascript:academyLecDetail("+ data.gkey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
    
}

//수강중 > 학원 실강 > 강의상세 불러오기
function getAcademyProductDetail(gKey) {
    if (gKey == null || gKey == undefined) return;
    var infoList = getApi("/product/getAcademyProductDetail/", gKey, "");
    if(infoList != null){
        return infoList.result.academyLectureDetailInfo;
    }
}

//수강중 > 일시정지 유형 불러오기
function getSignUpVideoLecturePauseTypeList (userKey) {
    if (userKey == null || userKey == undefined) return;
    var infoList = getApi("/myPage/getSignUpVideoLecturePauseTypeList/", userKey, "");
    var selList = infoList.result;
    if(selList.length > 0){
        innerValue("pauseCtgKey", selList[0].ctgKey);
        dwr.util.addOptions('pauseType', selList, function (data) {
            return "<a href='javascript:pauseLecTitleList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }else{
        $("#pauseLecDiv").hide();
        return false;
    }
}

//수강중 > 일시정지 강좌명 리스트 불러오기
function getSignUpVideoLecturePauseSubjectList (userKey, stepCtgKey) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey
    };
    var infoList = getApi("/myPage/getSignUpVideoLecturePauseSubjectList/", userKey, data);
    var selList = infoList.result;
    if(selList.length > 0){
        innerValue("pauseJlecKey", selList[0].jlecKey);
        dwr.util.addOptions('pauseLecNameList', selList, function (data) {
            return "<a href='javascript:pauseLecDetail("+ data.jlecKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}


//수강중 > 일시정지 강좌 상세
function getOnlineVideoPauseListByJLecKey(jLecKey) {
    if (jLecKey == null || jLecKey == undefined) return;
    var infoList = getApi("/myPage/getOnlineVideoPauseListByJLecKey/", jLecKey, "");
    if(infoList != null){
       return infoList;
    }
}

//수강중 > 수강완료
function getSignUpVideoLectureEndTypeList(userKey) {
    if (userKey == null || userKey == undefined) return;
    var infoList = getApi("/myPage/getSignUpVideoLectureEndTypeList/", userKey, "");

    if(infoList != null){
        var selList = infoList.result;
        if(selList.length > 0){
            innerValue("lecEndCtgKey", selList[0].ctgKey);
            dwr.util.addOptions('lecEndType', selList, function (data) {
                return "<a href='javascript:lecEndTitleList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
            }, {escapeHtml: false});
        }else{
            $("#lecEndDiv").hide();
            return false;
        }
    }
}

//수강중 > 수강완료 > 과목리스트
function getSignUpVideoLectureEndSubjectList(userKey, stepCtgKey) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey
    };
    var infoList = getApi("/myPage/getSignUpVideoLectureEndSubjectList/", userKey, data);

    var selList = infoList.result;
    if(selList.length > 0){
        innerValue("lecEndJlecKey", selList[0].jlecKey);
        lecEndDetail(selList[0].jlecKey);
        dwr.util.addOptions('lecEndNameList', selList, function (data) {
            return "<a href='javascript:lecEndDetail("+ data.jlecKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}

function getSignUpVideoLectureEndInfo(jlecKey) {
    if (jlecKey == null || jlecKey == undefined) return;
    var infoList = getApi("/myPage/getSignUpVideoLectureEndInfo/", jlecKey, "");
    if(infoList != null){
        return infoList;
    }
}

//일시정지 신청
function requestVideoStartStop(jLecKey, pauseDay, requestType) {
    if(jLecKey == null || jLecKey == undefined) return;
    var data = {
        jLecKey: jLecKey,
        pauseDay: pauseDay,
        requestType: requestType
    };
    var result = postApi("/myPage/requestVideoStartStop", data);
    return result;
}

function getUserOrderList(userKey, startDate, endDate, sPage, listLimit) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        startDate: startDate,
        endDate: endDate,
        sPage: sPage,
        listLimit:listLimit
    };
    var infoList = getPageApi("/myPage/getUserOrderList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        if (infoList.result.length > 0) {
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return cmpList.indate +"<br><a href='javascript:goDetailOrder("+ cmpList.jkey +");'>"+cmpList.jid;+"<a>"},
                        function(data) {return cmpList.orderGoodsName;},
                        function(data) {return cmpList.sellPriceName;},
                        function(data) {return '결제완료';},
                        function(data) {return cmpList.deliveryStatusName;}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}

function getUserOrderDetail(jKey) {
    if(jKey == null || jKey == undefined) return;
    var infoList = getApi("/myPage/getUserOrderDetail/", jKey, '');
    if(infoList != null){
        if(infoList.result.orderList != null){
            var orderInfo = infoList.result.orderList;
            for(var i=0; i < orderInfo.length; i++){
                if (orderInfo != undefined) {
                    var cellData = [
                        function(data) {return orderInfo[i].goodsName;},
                        function(data) {return orderInfo[i].typeName;},
                        function(data) {return orderInfo[i].reviewYn==true ?"<a href='javascript:goReview("+ orderInfo[i].jlecKey +");' class=\"re_btn\">후기작성<span ></span></a>": "-" ;}
                    ];
                    dwr.util.addRows("productList", [0], cellData, {escapeHtml: false});
                }
            }
        }
        if(infoList.result.paymentInfo != null){
            var paymentInfo = infoList.result.paymentInfo;
            innerHTML("priceName", paymentInfo.priceName);
            innerHTML("pricePayName", paymentInfo.pricePayName);
            innerHTML("payTypeName", paymentInfo.payTypeName);
            innerHTML("payStatusName", paymentInfo.payStatusName);
        }else{
            innerHTML("address", "-");
        }

        if(infoList.result.orderUserInfo != null){
            var orderUserInfo = infoList.result.orderUserInfo;
            innerHTML("orderName", orderUserInfo.name);
            innerHTML("telephoneMobile", orderUserInfo.telephoneMobile);
            innerHTML("telephone", orderUserInfo.telephone);
            innerHTML("email", orderUserInfo.email);
        }else{
            innerHTML("address", "-");
        }

        if(infoList.result.deliveryAddressInfo != null){
            var deliveryAddressInfo = infoList.result.deliveryAddressInfo;
            innerHTML("address", deliveryAddressInfo.deliveryAddress);
        }else{
            innerHTML("address", "-");
        }
    }
}

//마일리지 리스트
function getUserPointList(userKey, sPage, listLimit) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var infoList = getPageApi("/myPage/getUserPointList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        if (infoList.result.length > 0) {
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            var selList = infoList.result;
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return cmpList.createDate},
                        function(data) {return cmpList.pointDesc;},
                        function(data) {return cmpList.type == 1 ? cmpList.point : "-";},
                        function(data) {return  cmpList.type == 0 ? cmpList.point : "-";},
                        function(data) {return cmpList.seqPoint;}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}

//마일리지 정보
function getUserPointInfo(userKey) {
    if (userKey == null || userKey == undefined) return;
    var infoList = getPayApi("/myPage/getUserPointInfo/", userKey, '');
    if(infoList != null){
        if(infoList.result != null){
            innerHTML("earnedPoint",infoList.result.earnedPoint+" 점");
            innerHTML("usedPoint", infoList.result.usedPoint+" 점");
            innerHTML("usefulPoint", infoList.result.usefulPoint+" 점");
            innerHTML("expirePoint", infoList.result.expirePoint+" 점");
        }
    }
}

function getOneByOneQuestionList(userKey, sPage, listLimit, searchType, searchText) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getOneByOneQuestionList/", userKey, data);
    var cnt = infoList.cnt;
    paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
    console.log(infoList);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList.level == 1) {//본문
                    var returnHtml = '<tr>';
                    returnHtml += '<td>' + listNum-- + '</td>';
                    var lock = '';
                    if (cmpList.pwd == 1) lock = 'lock';
                    else if (cmpList.pwd == null) lock = '';
                    returnHtml += '<td><a href="javascript:void(0);" class="subject ' + lock + '" onclick="goDetailQuestion('+  cmpList.bbsKey +');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                    returnHtml += '<td>' + cmpList.writeUserName + '</td>';
                    returnHtml += '<td>' + cmpList.indate2 + '</td>';
                    returnHtml += '<td>' + cmpList.readCount + '</td>';
                    returnHtml += '</tr>';
                    $("#dataList").append(returnHtml);
                } else {//답글
                    var returnHtml = '<tr>';
                    returnHtml += '<td>' + listNum-- + '</td>';
                    var lock = '';
                    if (cmpList.pwd == 1) lock = 'lock';
                    else if (cmpList.pwd == null) lock = '';
                    returnHtml += '<td><a href="javascript:void(0);" class="subject reply" onclick="goDetailQuestion(' + cmpList.bbsKey + ');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                    returnHtml += '<td>' + cmpList.writeUserName + '</td>';
                    returnHtml += '<td>' + cmpList.indate2 + '</td>';
                    returnHtml += '<td>' + cmpList.readCount + '</td>';
                    returnHtml += '</tr>';
                    $("#dataList").append(returnHtml);
                }
            }
        }
    }
}

function getOneByOneQuestionDetailInfo(bbsKey) {
    if (bbsKey == null || bbsKey == undefined) return;
    var detailInfo = getApi("/myPage/getOneByOneQuestionDetailInfo/", bbsKey, '');
    return detailInfo;
}