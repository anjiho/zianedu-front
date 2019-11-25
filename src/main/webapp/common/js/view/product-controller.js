//학원별 학원수강신청 상품 리스트
function getAcademyLectureListFromCategoryMenu(ctgKey, stepCtgKey, teacherKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey,
        teacherKey : teacherKey
    };
    var InfoList = getApi("/product/getAcademyLectureListFromCategoryMenu/", ctgKey, data);
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

//학원수강 상품 상세정보
function getAcademyProductDetail(gKey) {
    if (gKey == null || gKey == undefined) return;
    var InfoList = getApi("/product/getAcademyProductDetail/", gKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//학원별 무료 동영상강의 상품 리스트
function getFreeVideoLectureListFromCategoryMenu(ctgKey, device, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        device: device
    };
    var InfoList = getApi("/product/getFreeVideoLectureListFromCategoryMenu/", ctgKey, data);
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

//모의고사 상품 리스트
function getMockExamListFromCategoryMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/product/getMockExamListFromCategoryMenu/", ctgKey);
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

//특별 패키지 상품 상세정보
function getAcademyProductDetail(gKey) {
    if (gKey == null || gKey == undefined) return;
    var InfoList = getApi("/product/getAcademyProductDetail/", gKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//특별 패키지 상품 리스트
function getSpecialPackageList(tagId) {
    var InfoList = getApi("/product/getSpecialPackageList/", "","");
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

//학원별 동영상강의 상품 리스트
function getVideoLectureListFromCategoryMenu(ctgKey, stepCtgKey, teacherKey) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey,
        teacherKey : teacherKey,
    };
    var InfoList = getApi("/product/getVideoLectureListFromCategoryMenu/", ctgKey, data);
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

//동영상 강좌 상품 상세정보
function getVideoProductDetail(gKey, device) {
    if (gKey == null || gKey == undefined) return;
    var data = {
        device : device
    };
    var InfoList = getApi("/product/getVideoProductDetail/", gKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//내강의실 > 동영상 > 강좌 상세정보
function getLectureList(gKey, device) {
    if (gKey == null || gKey == undefined) return;
    var data = {
        device : device
    };
    var infoList = getApi("/product/getLectureList/", gKey, data);
    return infoList;
}

//수강신청(온라인) > 단과 > 과목리스트
function getLectureApplySubjectList(menuCtgKey) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var infoList = getApi("/product/getLectureApplySubjectList/", menuCtgKey, "");

    var selList = infoList.result;
    if(selList.length > 0){
        dwr.util.addOptions('subject', selList, function (data) {
            return "<a href='javascript:test("+ data.ctgKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}

//수강신청(온라인) > 단과 > 교수리스트
function getLectureApplyTeacherList(menuCtgKey, goodsType) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        goodsType : goodsType
    };
    var infoList = getApi("/product/getLectureApplyTeacherList/", menuCtgKey, data);

    var selList = infoList.result;
    if(selList.length > 0){
        dwr.util.addOptions('teacher', selList, function (data) {
            return "<a href='javascript:test("+ data.teacherKey +");'>"+ data.teacherName +"</a>"
        }, {escapeHtml: false});
    }
}

//수강신청(온라인) > 단과 > 수강리스트
function getLectureApplyTeacherTypeList(menuCtgKey, subjectMenuKeys, teacherKeys, stepCtgKeys, goodsType) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        subjectMenuKeys : subjectMenuKeys,
        teacherKeys : teacherKeys,
        stepCtgKeys: stepCtgKeys,
        goodsType : goodsType
    };
    var infoList = getApi("/product/getLectureApplyTeacherTypeList/", menuCtgKey, data);
    if (infoList != null) {
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            for (var i = 0; i < selList.length; i++) {
                var cmpList = selList[i];
                if (cmpList.teacherTypeInfo != null) {
                    var retrunHtml = "<div class=\"lectureWrap\">";
                    retrunHtml += "<ul class='lectureTotal'>";
                    retrunHtml += "<li class='left'>" + cmpList.subjectName + "</li>";
                    retrunHtml += "<li class='right'>";
                    retrunHtml += "선택한 항목<span class='colorRed'>0</span>개를";
                    retrunHtml += "<a href=\"#\" class=\"btn_m\">장바구니 담기</a>";
                    retrunHtml += "<a href=\"#\" class=\"btn_m on\">바로구매</a>";
                    retrunHtml += "</li>";
                    retrunHtml += "</ul>";
                    /*선생님 정보 뿌리기*/
                    if (cmpList.teacherTypeInfo != null) {
                        var teacherInfoLIST = cmpList.teacherTypeInfo;
                        for (var j = 0; j < teacherInfoLIST.length; j++) {
                            retrunHtml += "<div class=\"teacherBody\">";
                            retrunHtml += "<div class=\"teacherRow\">";
                            retrunHtml += "<ul class=\"teacherList\">";
                            retrunHtml += "<li><span class=\"thumb\"><img src='" + teacherInfoLIST[j].imageTeacherList + "'></span></li>";
                            retrunHtml += "<li><b>" + teacherInfoLIST[j].teacherName + "</b></li>";
                            retrunHtml += "<li class=\"rchk\"><b>이론</b>" + teacherInfoLIST[j].theoryCnt + "개</li>";
                            retrunHtml += "<li class=\"rchk\"><b>문제풀이</b>" + teacherInfoLIST[j].problemSolveCnt + "개</li>";
                            retrunHtml += "<li class=\"rchk\"><b>단과특강</b>" + teacherInfoLIST[j].singleSpecialCnt + "개</li>";
                            retrunHtml += "<li class=\"rchk\"><b>필기대비</b>" + teacherInfoLIST[j].prepareNoteCnt + "개</li>";
                            retrunHtml += "<li class=\"rchk\"><b>모의고사</b>" + teacherInfoLIST[j].mockExamCnt + "개</li>";
                            retrunHtml += "</ul>";

                            retrunHtml += "<div class=\"toggleWrap\">";
                            retrunHtml += "<div class=\"div_toggle\">";
                            retrunHtml += "<ul class=\"lectureHead\">";
                            retrunHtml += "<li class=\"w15p\">유형</li>";
                            retrunHtml += "<li class=\"w40p\">강좌명</li>";
                            retrunHtml += "<li class=\"w35p\">수강료</li>";
                            retrunHtml += "</ul>";
                            /*유형별 강좌 뿌리기*/
                            if (teacherInfoLIST[j].videoLectureInfo != null) {
                                var videoLectureInfo = teacherInfoLIST[j].videoLectureInfo;
                                for (var k = 0; k < videoLectureInfo.length; k++) {
                                    var teacherLectureList = videoLectureInfo[k].teacherLectureList;
                                    for (var l = 0; l < teacherLectureList.length; l++) {
                                        var teachLec = teacherLectureList[l];
                                        var color = "";
                                        if (videoLectureInfo[k].stepCtgKey == 207) { //단과특강
                                            color = "blue";
                                        } else if (videoLectureInfo[k].stepCtgKey == 203) {//이론
                                            color = "green";
                                        } else if (videoLectureInfo[k].stepCtgKey == 205) {//문제풀이
                                            color = "orange";
                                        } else if (videoLectureInfo[k].stepCtgKey == 4266) {//모의고사
                                            color = "purple";
                                        } else { //필기대비
                                            color = "navy";
                                        }

                                        retrunHtml += "<div class=\"lectureBody\">";
                                        retrunHtml += "<div class=\"lectureRow\">";
                                        retrunHtml += "<ul class=\"lectureList\">";
                                        retrunHtml += "<li class=\"w15p\">";
                                        retrunHtml += "<span class=\"btn_learnType " + color + "\">" + teachLec.ctgName + "</span>";
                                        retrunHtml += "</li>";
                                        retrunHtml += "<li class=\"w40p\">";
                                        retrunHtml += "<a href=\"#\" class=\"learnName\">" + teachLec.goodsName + "</a>";
                                        retrunHtml += "<span class=\"learnNum\">강의수 <b class=\"colorBlue\">" + teachLec.lecCount + "강</b> | 수강일수 <b class=\"colorBlue\">" + teachLec.limitDay + "일</b></span>";
                                        retrunHtml += "<span class=\"learnView\">샘플보기 <a href=\"#\" class=\"btn_s btn_quality\">일반화질</a> <a href=\"#\" class=\"btn_s btn_quality on\">고화질</a></span>";
                                        retrunHtml += "</li>";
                                        retrunHtml += "<li class=\"w40p ta_right\">";
                                        retrunHtml += "<ul class=\"costList\">";
                                        if (teachLec.mobileSellPriceName != null) {
                                            retrunHtml += "<li>";
                                            retrunHtml += "<span class=\"colorRed\">" + teachLec.discountPercent + "</span>";
                                            retrunHtml += "<span class=\"btn_ss btn_divTag\">모바일</span>";
                                            retrunHtml += "<b class=\"cost\">" + teachLec.mobileSellPriceName + "</b> <input type=\"checkbox\" name=\"\" value=\"\">";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s\">장바구니</a>";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s on\">바로구매</a>";
                                            retrunHtml += "</li>";
                                        }
                                        if (teachLec.pcMobileSellPriceName != null) {
                                            retrunHtml += "<li>";
                                            retrunHtml += "<span class=\"colorRed\">" + teachLec.discountPercent + "</span>";
                                            retrunHtml += "<span class=\"btn_ss btn_divTag\">PC</span>";
                                            retrunHtml += "<b class=\"cost\">" + teachLec.pcMobileSellPriceName + "</b> <input type=\"checkbox\" name=\"\" value=\"\">";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s\">장바구니</a>";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s on\">바로구매</a>";
                                            retrunHtml += "</li>";
                                        }
                                        if (teachLec.pcSellPriceName != null) {
                                            retrunHtml += "<li>";
                                            retrunHtml += "<span class=\"btn_ss btn_divTag\">모바일</span><span class=\"btn_ss btn_divTag\">pc</span> ";
                                            retrunHtml += "<b class=\"cost\">" + teachLec.pcSellPriceName + "</b> <input type=\"checkbox\" name=\"\" value=\"\">";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s\">장바구니</a>";
                                            retrunHtml += "<a href=\"#\" class=\"btn_s on\">바로구매</a>";
                                            retrunHtml += "</li>";
                                        }
                                        retrunHtml += "</ul>";
                                        retrunHtml += "</li>";
                                        retrunHtml += "</ul>";
                                        retrunHtml += "<div class=\"tableBox\">";
                                        retrunHtml += "<table class=\"lecture\">";
                                        retrunHtml += "<colgroup>";
                                        retrunHtml += "<col class=\"w10p\">";
                                        retrunHtml += "<col class=\"w40p\">";
                                        retrunHtml += "<col class=\"w10p\">";
                                        retrunHtml += "<col class=\"w40p\">";
                                        retrunHtml += "</colgroup>";
                                        retrunHtml += "<thead>";
                                        retrunHtml += "<tr>";
                                        retrunHtml += "<th scope=\"row\" style=\"text-align:center\">회차</th>";
                                        retrunHtml += "<th scope=\"row\" style=\"text-align:center\">제목</th>";
                                        retrunHtml += "<th scope=\"row\" style=\"text-align:center\">시간</th>";
                                        retrunHtml += "<th scope=\"row\" style=\"text-align:center\">샘플보기</th>";
                                        retrunHtml += "</tr>";
                                        retrunHtml += "</thead>";
                                        retrunHtml += "<tbody>";

                                        var lecList = getLectureList(teachLec.gkey, 'PC');
                                        if (lecList != null) {
                                            var cmpList = lecList.result;
                                            for (var m = 0; m < cmpList.lectureList.length; m++) {
                                                var lecInfo = cmpList.lectureList[m];
                                                retrunHtml += "<tr>";
                                                retrunHtml += "<td class=\"ta_center\">" + lecInfo.num + "</td>";
                                                retrunHtml += "<td>" + lecInfo.name + "</td>";
                                                retrunHtml += "<td class=\"ta_center\">" + lecInfo.vodTime + "</td>";
                                                if (lecInfo.num == 1) {
                                                    retrunHtml += "<td class=\"ta_center\"><span class=\"learnView\">샘플보기 <a href=\"#\" class=\"btn_s btn_quality\">일반화질</a> <a href=\"#\" class=\"btn_s btn_quality on\">고화질</a></span></td>";
                                                } else {
                                                    retrunHtml += "<td class=\"ta_center\"></span></td>";
                                                }
                                                retrunHtml += "</tr>";
                                            }
                                        }
                                        retrunHtml += "</tbody>";
                                        retrunHtml += "</table>";
                                        retrunHtml += "</div>";

                                        retrunHtml += "</div>";
                                        retrunHtml += "</div>";
                                    }
                                }
                            }
                            retrunHtml += "</div>";
                            retrunHtml += "<div class=\"btn_toggle lock\"><a href=\"#\"></a></div>";
                            retrunHtml += "</div>";

                            retrunHtml += "</div>";
                            retrunHtml += "</div>";
                        }
                    }
                    /* //선생님 정보 뿌리기*/
                    retrunHtml += "</div>";
                    $("#resultList").append(retrunHtml);
                }
            }
        }
    }
    $(".toggleWrap > .btn_toggle").click(function(){
        if($(this).parent().hasClass("active")){
            $(this).parent().removeClass("active");
        }else{
            $(this).parent().addClass("active");
        }
    });
}


function getLecOrderCtgKey() {
    var menuCtgKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        menuCtgKey = 234;
    }else if(leftMenuInfo == "publicAcademy"){
        menuCtgKey = 335;
    }else if(leftMenuInfo == "techOnline"){
        menuCtgKey = 453;
    }else if(leftMenuInfo == "techAcademy"){
        menuCtgKey = 394;
    }else if(leftMenuInfo == "postOnline"){
        menuCtgKey = 585;
    }else if(leftMenuInfo == "postAcademy"){
        menuCtgKey = 518;
    }
    return menuCtgKey;
}

function getOnlineAcaType() {
    var str = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline" || leftMenuInfo == "techOnline" || leftMenuInfo == "postOnline"){
        str = 'VIDEO';
    }else if(leftMenuInfo == "publicAcademy" || leftMenuInfo == "techAcademy" || leftMenuInfo == "postAcademy"){
        str = 'ACADEMY';
    }
    return str;
}