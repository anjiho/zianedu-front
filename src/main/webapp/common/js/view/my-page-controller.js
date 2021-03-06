
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
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var pcMobile = divisionPcMobile();
       getVideoSignUpTypeList(sessionUserInfo.userKey, result[0].subjectCtgKey, pcMobile);
        dwr.util.addOptions('playSubject', result, function (data) {
            return "<a href='javascript:playDepthList("+ data.subjectCtgKey +");' id='"+ data.subjectCtgKey +"'>"+ data.subjectName +"</a>"
        }, {escapeHtml: false});
    }else{
        $("#playLecListDiv").hide();
        return false;
    }
}

function getVideoSignUpTypeList(userKey, subjectCtgKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        subjectCtgKey : subjectCtgKey,
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUpTypeList/", userKey, data);
    var selList = infoList.result;
    if(selList.length > 0){
            getPlaySubjectList(selList[0].ctgKey); // 강좌 리스트 불러오기
            dwr.util.addOptions('playType', selList, function (data) {
                return "<a href='javascript:getPlaySubjectList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
            }, {escapeHtml: false});
    }else{
        return false;
    }
}

function changePlayLectureList(userKey, subjectCtgKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        subjectCtgKey : subjectCtgKey,
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUpTypeList/", userKey, data);
    if(infoList != null){ // 유형 리스트
        var result = infoList.result;
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
            innerValue("stopJlecKey", result[0].jlecKey);
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
    var goodsDevice = detailInfo.result.kind;
    var deviceCheck = 0;
    if(device == 'PC') deviceCheck = 100;
    else if(device == 'MOBILE') deviceCheck = 101;

    var data = {
        device : device
    };
    var infoList = getApi("/product/getLectureListByJLecKey/", jlecKey, data);

    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화
    if (infoList != null) {
        var selList = infoList.result.lectureList;
        var countId = '';
        if(tagId == 'dataList') countId = 'playLecTotalCnt';
        else if(tagId == 'zianPassDataList') countId = 'zianPassTotalCnt';
        else countId = 'packageTotalCnt';
        innerHTML(countId, infoList.result.totalCnt);
        for(var i=0; i<selList.length;i++){
            var num = i+1;
            var returnHtml = "<tr>";
                    returnHtml += "<td>"+selList[i].numStr+"강</td>";
                    returnHtml += "<td>"+selList[i].name+"</td>";
                    returnHtml += "<td>"+selList[i].vodTime+"</td>";
                    returnHtml += "<td>";
            if (goodsDevice == deviceCheck || goodsDevice == 102){
                        returnHtml += "<div class=\"myVideo\">";
                                        returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"black small\">일반화질</a>';
                                        returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');"  class=\"blue small\">고화질</a>';
                        returnHtml += "</div>";
                        returnHtml += "<div class=\"myVideoM\">";
                            returnHtml += '<a href="javascript:myPlay('+num+');" class="black small myPy">재생</a>&nbsp;';
                            returnHtml += "<div class='myPlay' data-index='"+ num +"'>";
                                returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"brBlack\">일반화질</a>';
                                returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"brBlue\">고화질</a>';
                            returnHtml += "</div>";
                            returnHtml += '<a href="javascript:myDownload('+num+');" class="blue small myDn">다운로드</a>';
                            returnHtml += '<div class="myDownload" data-index="'+ num +'">';
                                returnHtml += '<a href="javascript:void(0);" onclick="OpenDownloadPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +');" class=\"brBlack\">일반화질</a>';
                                returnHtml += '<a href="javascript:void(0);" onclick="OpenDownloadPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +');" class=\"brBlue\">고화질</a>';
                            returnHtml += "</div>";
                        returnHtml += "</div>";
            }
                    returnHtml += "</td>";
            returnHtml += "</tr>";
            $("#"+tagId).append(returnHtml);
        }
    }
    return detailInfo;
}

function getPromotionVideoSignUpDetailInfo(gkey, device, jlecKey, tagId) {
    if (gkey == null || gkey == undefined) return;

    var detailInfo = getApi("/myPage/getPromotionUserVideoOnlineSignUpLectureList/", jlecKey);


    var data = {
        device : device
    };
    var infoList = getApi("/product/getLectureListByJLecKey/", jlecKey, data);

    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화
    if (infoList != null) {
        var selList = infoList.result.lectureList;
        var countId = '';
        if(tagId == 'dataList') countId = 'playLecTotalCnt';
        else if(tagId == 'zianPassDataList') countId = 'zianPassTotalCnt';
        else countId = 'packageTotalCnt';
        innerHTML(countId, infoList.result.totalCnt);
        for(var i=0; i<selList.length;i++){
            var num = i+1;
            var returnHtml = "<tr>";
            returnHtml += "<td>"+selList[i].numStr+"강</td>";
            returnHtml += "<td>"+selList[i].name+"</td>";
            returnHtml += "<td>"+selList[i].vodTime+"</td>";
            returnHtml += "<td>";
            returnHtml += "<div class=\"myVideo\">";
            returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"black small\">일반화질</a>';
            returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');"  class=\"blue small\">고화질</a>';
            returnHtml += "</div>";
            returnHtml += "<div class=\"myVideoM\">";
            returnHtml += '<a href="javascript:myPlay('+num+');" class="black small myPy">재생</a>&nbsp;';
            returnHtml += "<div class='myPlay' data-index='"+ num +"'>";
            returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"brBlack\">일반화질</a>';
            returnHtml += '<a href="javascript:void(0);" onclick="OpenLecPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +','+ detailInfo.result.kind +');" class=\"brBlue\">고화질</a>';
            returnHtml += "</div>";
            returnHtml += '<a href="javascript:myDownload('+num+');" class="blue small myDn">다운로드</a>';
            returnHtml += '<div class="myDownload" data-index="'+ num +'">';
            returnHtml += '<a href="javascript:void(0);" onclick="OpenDownloadPlayer(' + "'"  + selList[i].vodFileLow + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +');" class=\"brBlack\">일반화질</a>';
            returnHtml += '<a href="javascript:void(0);" onclick="OpenDownloadPlayer(' + "'"  + selList[i].vodFileHigh + "'" + ',' + "'"  + selList[i].name + "'" + ','+ selList[i].curriKey +','+ jlecKey +');" class=\"brBlue\">고화질</a>';
            returnHtml += "</div>";
            returnHtml += "</div>";
            returnHtml += "</td>";
            returnHtml += "</tr>";
            $("#"+tagId).append(returnHtml);
        }
    }
    return detailInfo;
}

//패키지 분류 리스트
function getPackageSignUpList(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        deviceType : deviceType
    };
    var infoList = getApi("/myPage/getPackageSignUpList/", userKey, data);
    if (infoList == null || Number(infoList.result.length) == 0) {
        $("#packageListDiv").hide();
        return false;
    } else if (infoList != null || infoList.result.length > 0) { //과목 리스트

        innerValue("packageJKey", infoList.result[0].jgkey);
        dwr.util.addOptions('packageList', infoList.result, function (data) {
            return "<a href='javascript:packageTypeList("+ data.jgkey +");'>"+ data.gname +"</a>"
        }, {escapeHtml: false});
    }
}

//지안패스 분류 리스트
function getZianPassSignUpList(userKey) {
    if (userKey == null || userKey == undefined) return;

    var infoList = getApi("/myPage/getZianPassSignUpList/", userKey, "");

    if (infoList == null || Number(infoList.result.length) == 0) {
        $("#zianPassListDiv").hide();
        return false;
    } else if (infoList != null || infoList.result.length > 0) { //과목 리스트
        innerValue("zianPassjKey", infoList.result[0].jgkey);
        dwr.util.addOptions('zianPassList', infoList.result, function (data) {
            return "<a href='javascript:zianPassTypeList("+ data.jgkey +");'>"+ data.gname +"</a>"
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

//패키지 > 유형 불러오기
function getSignUpPackageTypeList(jKey, deviceType) {
    if (jKey == null || jKey == undefined) return;

    var data = {
        deviceType : deviceType
    };
    var infoList = getApi("/myPage/getSignUpPackageTypeList/", jKey, data);
    if (infoList.result.length > 0) { //과목 리스트
        innerValue("packageCtgKey", infoList.result[0].ctgKey);
        var pcMobile = divisionPcMobile();
        getSignUpPackageSubjectNameList(jKey, pcMobile, infoList.result[0].ctgKey);
        dwr.util.addOptions('packageType', infoList.result, function (data) {
            return "<a href='javascript:packageLecTitleList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }else{
        $("#packageListDiv").hide();
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

function getSignUpPackageSubjectNameList(jKey, deviceType, stepCtgKey) {

    if (jKey == null || jKey == undefined) return;
    var data = {
        deviceType : deviceType,
        stepCtgKey : stepCtgKey
    };

    var infoList = getApi("/myPage/getSignUpZianPassSubjectNameList/", jKey, data);
    if (infoList != null) { //과목 리스트
        innerValue("jLecKey", infoList.result[0].jlecKey);
        innerValue("stopPackageJlecKey", infoList.result[0].jlecKey);
        packageDetail(infoList.result[0].jlecKey);
        dwr.util.addOptions('packageLecList', infoList.result, function (data) {
            return "<a href='javascript:packageDetail("+ data.jlecKey +");'>"+ data.name +"</a>"
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
function getSignUpVideoLectureEndTypeList(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        deviceType : deviceType
    };
    var infoList = getApi("/myPage/getSignUpVideoLectureEndTypeList/", userKey, data);

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
function getSignUpVideoLectureEndSubjectList(userKey, stepCtgKey, deviceType) {
    if (userKey == null || userKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey,
        deviceType : deviceType
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
                        function(data) {return cmpList.payStatusName},
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

//쿠폰 리스트
function getUserCouponList(userKey, sPage, listLimit) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var infoList = getPageApi("/myPage/getUserCouponList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        if (infoList.result.length > 0) {
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            var selList = infoList.result;
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return split_minute_getDay(cmpList.indate)},
                        function(data) {return cmpList.description;},
                        function(data) {return cmpList.dcType == 0 ? cmpList.dcValue + "원" : cmpList.dcValue + "%";},
                        function(data) {return cmpList.device == 0 ? "MOBILE/PC에서 사용" : cmpList.device == 1?"PC에서 사용" : "MOBILE에서 사용";},
                        function(data) {return cmpList.periodType == 0? "발급일로 부터<br/>" + cmpList.limitDay + "일 안에 사용 가능" : split_minute_getDay(cmpList.startDate) + "에서<br/>" + split_minute_getDay(cmpList.endDate) + "까지";},
                        function(data) {return cmpList.name == ""? "-" : cmpList.name;}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}

function saveCouponOffline(couponNumber,userKey) {
    if(couponNumber == null || couponNumber == undefined) return;
    var data = {
        couponNumber : couponNumber,
        userKey : userKey
    };
    var result = postApi("/myPage/saveCouponOffline", data);
    return result;
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
            if(infoList.result.earnedPoint != null){
                innerHTML("earnedPoint",infoList.result.earnedPoint+" 점");
            }else{
                innerHTML("earnedPoint",'-');
            }
            if(infoList.result.usedPoint != null){
                innerHTML("usedPoint", infoList.result.usedPoint+" 점");
            }else{
                innerHTML("usedPoint",'-');
            }
            if(infoList.result.usefulPoint != null){
                innerHTML("usefulPoint", infoList.result.usefulPoint+" 점");
            }else{
                innerHTML("usefulPoint",'-');
            }
            if(infoList.result.expirePoint != null){
                innerHTML("expirePoint", infoList.result.expirePoint+" 점");
            }else{
                innerHTML("expirePoint",'-');
            }
        }
    }
}

function getOneByOneQuestionList(userKey, sPage, listLimit, searchType, searchText) {
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
    if(infoList != null){
       // if (infoList.result.length > 0) {
            var selList = infoList.result;
            paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
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
       // }
    }
}

function getOneByOneQuestionDetailInfo(bbsKey) {
    if (bbsKey == null || bbsKey == undefined) return;
    var detailInfo = getApi("/myPage/getOneByOneQuestionDetailInfo/", bbsKey, '');
    return detailInfo;
}

function getZianPassEndList(userKey) {
    if (userKey == null || userKey == undefined) return;
    var detailInfo = getApi("/myPage/getZianPassEndList/", userKey, '');
    if(detailInfo.result.length > 0){
        var selList = detailInfo.result;
        for(var i=0; i < selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<div class=\"Dropmenu_down\" id=\"\">";
                returnHtml += "<div class=\"inner\">";
                    returnHtml += "<div class=\"btn_crud\">";
                        returnHtml += "<span class=\"black small\" id=\"zianPassEndCtgName\">지안패스</span>";
                        returnHtml += "<a href=\"#modal3\" class=\"btn_modalOpen\">강좌설명</a>";
                    returnHtml += "</div>";//btn_crud
                returnHtml += "<div class=\"txt_area\">";
                    returnHtml += "<span class=\"bdbox\" id=\"zianPassPC\">PC</span>&nbsp;";
                    returnHtml += "<span class=\"bdbox\" id=\"zianPassMobile\">모바일</span>";
                    returnHtml += " <p class=\"thumb\" id=\"zianPassEndName\">"+ cmpList.goodsName +"</p>";
                    returnHtml += "<span class=\"date\"><b>수강기간</b>"+ cmpList.startDt +"<b> 종료기간</b>"+ cmpList.endDt +"</span>";
                    returnHtml += "<div id=\"zianPassRetake\">";

                if(cmpList.retakeYn == 'Y') {
                    returnHtml += "<div class=\"guide\">";
                            returnHtml += "<span class=\"re_date\">재수강신청</span>";
                                returnHtml += "<div class=\"edusup_multi\">";
                                    returnHtml += "<select style=\"width: 100px;\" id='zianPassReSel_"+ cmpList.gkey +"'>";
                                        returnHtml += "<option value=\"\">선택</option>";
                                        returnHtml += "<option value=\"1\">1개월</option>";
                                        returnHtml += "<option value=\"2\">2개월</option>";
                                        returnHtml += "<option value=\"3\">3개월</option>";
                                        returnHtml += "<option value=\"4\">4개월</option>";
                                        returnHtml += "<option value=\"5\">5개월</option>";
                                        returnHtml += "<option value=\"6\">6개월</option>";
                                    returnHtml += "</select>";
                                   returnHtml += "</div>";//edusup_multi
                            returnHtml += "</div>";

                            returnHtml += "<div class=\"btn_cart_wrap\">";
                                returnHtml += "<a href='javascript:zianPassGoBasket("+ cmpList.gkey +"," + cmpList.priceKey +");'  class='cart'>장바구니</a>";
                                returnHtml += "<a href=\"javascript:zianPassGoProductBuy("+ cmpList.gkey +"," + cmpList.priceKey +");\"  class=\"buying\">바로구매</a>";
                            returnHtml += "</div>";
                }
            returnHtml += "</div>";
            returnHtml += "</div>";
            returnHtml += "</div>";
            returnHtml += "</div>";

            $("#zianPassEndDiv").append(returnHtml);
        }
    }
}

//합격수기
function getMyWriteBoard(userKey, boardType, sPage, listLimit, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList1"); //테이블 리스트 초기화
    var data = {
        boardType : boardType,
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getMyWriteBoard/", userKey, data);
    var cnt = infoList.cnt;
    paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            //paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                var gopageName = '"detailPass"';
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return "<a href='javascript:detailReview("+ cmpList.bbsKey +","+ gopageName +")'><sapn class='thumb'>"+ cmpList.title +"</span></a>"},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList1", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}

function getMyWriteLectureBoard(userKey, boardType, sPage, listLimit, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList3"); //테이블 리스트 초기화
    var data = {
        boardType : boardType,
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getMyWriteBoard/", userKey, data);
    var cnt = infoList.cnt;
    paging.count3(sPage, cnt, '5', listLimit, comment.blank_list);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            //paging.count3(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                var gopageName = '"detailLec"';
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return "<a href='javascript:detailReview("+ cmpList.bbsKey +","+ gopageName +")'><sapn class='thumb'>"+ cmpList.title +"</span></a>"},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList3", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}

function getMyWriteBookBoard(userKey, boardType, sPage, listLimit, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList4"); //테이블 리스트 초기화
    var data = {
        boardType : boardType,
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getMyWriteBoard/", userKey, data);
    var cnt = infoList.cnt;
    paging.count4(sPage, cnt, '5', listLimit, comment.blank_list);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            //paging.count4(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                var gopageName = '"detailBook"';
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return "<a href='javascript:detailReview("+ cmpList.bbsKey +","+ gopageName +")'><sapn class='thumb'>"+ cmpList.title +"</span></a>"},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList4", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}


function getMyWriteExamBoard(userKey, boardType, sPage, listLimit, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList5"); //테이블 리스트 초기화
    var data = {
        boardType : boardType,
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getMyWriteBoard/", userKey, data);
    var cnt = infoList.cnt;
    paging.count4(sPage, cnt, '5', listLimit, comment.blank_list);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*listLimit); //리스트 넘버링
            var selList = infoList.result;
            //paging.count4(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                var gopageName = '"detailExam"';
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return "<a href='javascript:detailReview("+ cmpList.bbsKey +","+ gopageName +")'><sapn class='thumb'>"+ cmpList.title +"</span></a>"},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList5", [0], cellData, {escapeHtml: false});
                }
            }
        }
    }
}
//
// function getMyWriteExamBoard2(userKey, boardType, sPage, listLimit, searchType, searchText) {
//     if(userKey == null || userKey == undefined) return;
//     var paging = new Paging();
//     dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
//     var data = {
//         boardType : boardType,
//         sPage : sPage,
//         listLimit : listLimit,
//         searchType : searchType,
//         searchText : searchText
//     };
//     console.log(userKey);
//     var infoList = getPageApi("/board/getCommunityList2/", userKey, data);
//     console.log(infoList);
//     var cnt = infoList.cnt;
//     if(infoList != null){
//         //if (infoList.result.length > 0) {
//             var listNum = ((cnt-1)+1)-((sPage-1)*listLimit); //리스트 넘버링
//             var selList = infoList.result;
//             paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
//             for(var i=0; i < selList.length; i++){
//                 var cmpList = selList[i];
//
//                 if (cmpList != undefined) {
//                     var cellData = [
//                         function(data) {return listNum--;},
//                         function(data) {return "<a href='javascript:goDetailReview("+ cmpList.bbsKey +");'>"+ cmpList.title +"</a>";},
//                         function(data) {return cmpList.userName;},
//                         function(data) {return cmpList.indate;},
//                         function(data) {return cmpList.readCount;}
//                     ];
//                     dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
//                     $('#dataList tr').each(function(){
//                         var tr = $(this);
//                         tr.children().eq(1).attr("class", "left");
//                     });
//                 }
//             }
//         //}
//     }
// }

function bookStoreReviewBoard(userKey, boardType, sPage, listLimit, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;

    var data = {
        boardType : boardType,
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getMyWriteBoard/", userKey, data);
    if(infoList != null){
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            dwr.util.addOptions('bookReview', selList, function (data) {
                return "<a href='javascript:goBookReviewDetail("+ data.bbsKey +");'>"+ ellipsis(data.title,28) +"<span class='date'>" + data.indate + "</span></a>"
            }, {escapeHtml: false});
        }
    }
}

//마이페이지 > 성적관리 > 학원온오프라인
function getUserMockExamResultListAtBuy(userKey, onOffKey, sPage, listLimit, ctgKey, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        onOffKey : onOffKey,
        sPage : sPage,
        listLimit : listLimit,
        ctgKey : ctgKey,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getUserMockExamResultListAtBuy/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        console.log(selList);
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var printQuestionFileHTML = '';
                    var printCommentaryFileHTML = '';
                    if (cmpList.printQuestionFile != null) printQuestionFileHTML = '<a href="javascript:downloadExamFile('+ "'" + cmpList.printQuestionFile + "'" + ');" class="iconFile">문제지</a>';
                    if (cmpList.printCommentaryFile != null) printCommentaryFileHTML = '<a href="javascript:downloadExamFile('+ "'" + cmpList.printCommentaryFile + "'" + ');" class="iconFile">해설지</a>';

                    var cellData = [
                        function(data) {return cmpList.classCtgName;},
                        function(data) {return cmpList.goodsName;},
                        function(data) {return "~"+cmpList.acceptStartDate+"<br>~"+cmpList.acceptEndDate;},
                        function(data) {return "<a href='javascript:goBigExamPopup("+ cmpList.examUserKey +");' class='blue small'>성적보기</a>";},
                        function(data) {return "<a href='javascript:goAnswersPopup("+ cmpList.examUserKey +");' class='black small'>오답노트</a>";},
                        function(data) {return printQuestionFileHTML + printCommentaryFileHTML}
                        //function(data) {return '<a href="'+ cmpList.printQuestionFileUrl +'" class="iconFile" target="_blank" title="새창열림">문제지</a><a href="'+ cmpList.printCommentaryFileUrl +'" class="iconFile" target="_blank" title="새창열림">해설지</a>';}
                    ];
                    dwr.util.addRows('dataList', [0], cellData, {escapeHtml: false});
                    $('#dataList tr').each(function(){
                        var tr = $(this);
                        tr.children().eq(1).attr("class", "left");
                    });
                }
            }
    }
}

function getUserMockExamResultListAtBuy2(userKey, onOffKey, sPage, listLimit, ctgKey, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList2"); //테이블 리스트 초기화

    var data = {
        onOffKey : onOffKey,
        sPage : sPage,
        listLimit : listLimit,
        ctgKey : ctgKey,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getUserMockExamResultListAtBuy/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.classCtgName;},
                    function(data) {return cmpList.goodsName;},
                    function(data) {return "~"+cmpList.acceptStartDate+"<br>~"+cmpList.acceptEndDate;},
                    function(data) {return "<a href='javascript:goBigExamPopup("+ cmpList.examUserKey +");' class='blue small'>성적보기</a>";},
                    function(data) {return "<a href='javascript:goAnswersPopup("+ cmpList.examUserKey +");' class='black small'>오답노트</a>";},
                    function(data) {return '<a href="'+ cmpList.printQuestionFileUrl +'" class="iconFile" target="_blank" title="새창열림">문제지</a><a href="'+ cmpList.printCommentaryFileUrl +'" class="iconFile" target="_blank" title="새창열림">해설지</a>';}
                ];
                dwr.util.addRows('dataList2', [0], cellData, {escapeHtml: false});
                $('#dataList2 tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                });
            }
        }
    }
}
//마이페이지 > 성적관리 > 주간모의고사,기출문제
function getUserFreeExamResultList(userKey, examType, sPage, listLimit, groupCtgKey, classCtgKey, subjectCtgKey, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList3"); //테이블 리스트 초기화
    var data = {
        examType : examType,
        sPage : sPage,
        listLimit : listLimit,
        groupCtgKey : groupCtgKey,
        classCtgKey : classCtgKey,
        subjectCtgKey : subjectCtgKey,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getUserFreeExamResultList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        paging.count3(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.classCtgName;},
                    function(data) {return cmpList.goodsName;},
                    function(data) {return "~"+cmpList.acceptStartDate+"<br>~"+cmpList.acceptEndDate;},
                    function(data) {return "<a href='javascript:goBigExamPopup("+ cmpList.examUserKey +");' class='blue small'>성적보기</a>";},
                    function(data) {return "<a href='javascript:goAnswersPopup("+ cmpList.examUserKey +");' class='black small'>오답노트</a>";},
                    function(data) {return '<a href="'+ cmpList.printQuestionFileUrl +'" class="iconFile" target="_blank" title="새창열림">문제지</a><a href="'+ cmpList.printCommentaryFileUrl +'" class="iconFile" target="_blank" title="새창열림">해설지</a>';}
                ];
                dwr.util.addRows('dataList3', [0], cellData, {escapeHtml: false});
            }
        }
    }
}

//마이페이지 > 성적관리 > 주간모의고사,기출문제
function getUserFreeExamResultList2(userKey, examType, sPage, listLimit, groupCtgKey, classCtgKey, subjectCtgKey, searchType, searchText) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList4"); //테이블 리스트 초기화
    var data = {
        examType : examType,
        sPage : sPage,
        listLimit : listLimit,
        groupCtgKey : groupCtgKey,
        classCtgKey : classCtgKey,
        subjectCtgKey : subjectCtgKey,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/myPage/getUserFreeExamResultList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        paging.count4(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.classCtgName;},
                    function(data) {return cmpList.goodsName;},
                    function(data) {return "~"+cmpList.acceptStartDate+"<br>~"+cmpList.acceptEndDate;},
                    function(data) {return "<a href='javascript:goBigExamPopup("+ cmpList.examUserKey +");' class='blue small'>성적보기</a>";},
                    function(data) {return "<a href='javascript:goAnswersPopup("+ cmpList.examUserKey +");' class='black small'>오답노트</a>";},
                    function(data) {return '<a href="'+ cmpList.printQuestionFileUrl +'" class="iconFile" target="_blank" title="새창열림">문제지</a><a href="'+ cmpList.printCommentaryFileUrl +'" class="iconFile" target="_blank" title="새창열림">해설지</a>';}
                ];
                dwr.util.addRows('dataList4', [0], cellData, {escapeHtml: false});
            }
        }
    }
}

//마이페이지 > 성적관리 > 최근사용내역
function getUserExamLogList(userKey, sPage, listLimit) {
    if(userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var infoList = getPageApi("/myPage/getUserExamLogList/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null) {
        var selList = infoList.result;
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.examType;},
                    function(data) {return cmpList.goodsName;},
                    function(data) {return cmpList.examDate;}
                ];
                dwr.util.addRows('dataList', [0], cellData, {escapeHtml: false});
                $('#dataList tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(0).attr("class", "left");
                });
            }
        }
    }
}

function confirmVideoPlay(jLecKey, curriKey) {
    if (jLecKey == null || jLecKey == undefined) return;
    if (curriKey == null || curriKey == undefined) return;

    var data = {
        jLecKey : jLecKey,
        curriKey : curriKey
    };
    var result = getPayApi("/myPage/confirmVideoPlay", '', data);
    return result.keyValue;
}

function confirmDuplicateDevice(userKey, deviceType, deviceId, jLecKey) {
    if (jLecKey == null || jLecKey == undefined) return;

    var data = {
        deviceType : deviceType,
        deviceId : deviceId,
        jLecKey : jLecKey
    };
    var result = getPayApi("/myPage/confirmDuplicateDevice/", userKey, data);
    return result;
}

function injectVideoPlayTime(jLecKey, curriKey) {
    if (jLecKey == null || jLecKey == undefined) return;

    var data = {
        jLecKey : jLecKey,
        curriKey : curriKey
    };

    var result = postApi("/myPage/injectVideoPlayTime", data);
}

function getVideoPauseRequestPopup(jLecKey) {
    if (jLecKey == null || jLecKey == undefined) return;
    var result = getPayApi("/myPage/getVideoPauseRequestPopup/", jLecKey, '');
    return result;

}

//후기작성
function goReview(jlecKey) {
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    var availableReview = getAvailabilityLectureReview(sessionUserInfo.userKey, jlecKey);
    if(availableReview == false){
        alert("후기 작성을 할 수 없습니다.");
        return false;
    }else{
        var resultList = getPageApi("/myPage/getLecCtgInfo/", jlecKey);
        var teacherKey = resultList.result.teacherKey;
        var ctgKey = resultList.result.ctgKey;

        var teacherCtgKey = "";
        var reqKey ="";

        if (ctgKey ==216) teacherCtgKey = 352;
        else if (ctgKey ==217) teacherCtgKey = 328;
        else if (ctgKey ==218) teacherCtgKey = 414;
        else if (ctgKey ==219) teacherCtgKey = 481;
        else if (ctgKey ==220) teacherCtgKey = 562;
        else if (ctgKey ==221) teacherCtgKey = 632;

        var InfoList = getApi("/menu/getTeacherIntroduceLeftMenu/", teacherCtgKey,"");

        if (InfoList.result.length > 0) {
            var selList = InfoList.result;
            var teacherList = selList[0].teacherList;
            for(var i = 0 ; i <  teacherList.length; i++){
                if(teacherKey == teacherList[i].teacherKey){
                    reqKey = teacherList[i].reqKey;
                    break;
                }
            }
        }

        innerValue("teacherKey", teacherKey);
        innerValue("reqKey", reqKey);
        innerValue("jlecKey", jlecKey);

        goPage('teacher','detail');
    }
}
