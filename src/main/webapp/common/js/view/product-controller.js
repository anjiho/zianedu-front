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
function getLectureApplySubjectList(menuCtgKey, goodsType) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        goodsType : goodsType
    };
    var infoList = getApi("/product/getLectureApplySubjectList/", menuCtgKey, data);
        if(infoList != null){
            var selList = infoList.result;
            if(selList.length > 0){
                for(var i = 0; i< selList.length; i++){
                    var returnHtml = "<li>";
                    returnHtml += "<a href='javascript:void(0);' id='"+ selList[i].ctgKey +"'>"+ selList[i].name +"</a>";
                    returnHtml += "</li>";
                    $("#subject").append(returnHtml);
                }
            }
        }
}

//수강신청(온라인) > 단과 > 교수리스트
function getLectureApplyTeacherList(menuCtgKey, goodsType) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        goodsType : goodsType
    };
    var infoList = getApi("/product/getLectureApplyTeacherList/", menuCtgKey, data);
    if(infoList != null){
        var selList = infoList.result;
        if(selList.length > 0){
            for(var i = 0; i< selList.length;i++){
                var returnHtml = "<li>";
                returnHtml += "<a href='javascript:void(0);' id='"+ selList[i].teacherKey +"'>"+ selList[i].teacherName +"</a>";
                returnHtml += "</li>";
                $("#teacher").append(returnHtml);
            }
        }
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
            console.log(selList);
            for (var i = 0; i < selList.length; i++) {
                var cmpList  = selList[i];
                //if(cmpList.teacherTypeInfo != null){
                    var returnHtml = "<div class=\"lectureWrap\">";
                        if(cmpList.teacherTypeInfo != null) {
                            returnHtml += "<ul class=\"lectureTotal\">";
                                returnHtml += "<li class=\"left\">"+ cmpList.subjectName +"</li>";
                            returnHtml += "</ul>";
                        }
                            returnHtml += "<div class=\"teacherBody\">";
                            var teacherInfoLIST = cmpList.teacherTypeInfo;
                            if(teacherInfoLIST != null) {
                                for (var j = 0; j < teacherInfoLIST.length; j++) {
                                    returnHtml += "<div class=\"teacherRow\">";
                                    returnHtml += "<ul class=\"teacherList\">";
                                    returnHtml += "<li><span class=\"thumb\"><img src='" + teacherInfoLIST[j].imageTeacherList + "'></span></li>";
                                    returnHtml += "<li><b>" + teacherInfoLIST[j].teacherName + "</b></li>";
                                    returnHtml += "<li class=\"rchk\"><b>이론</b>" + teacherInfoLIST[j].theoryCnt + "개</li>";
                                    returnHtml += "<li class=\"rchk\"><b>문제풀이</b>" + teacherInfoLIST[j].problemSolveCnt + "개</li>";
                                    returnHtml += "<li class=\"rchk\"><b>단과특강</b>" + teacherInfoLIST[j].singleSpecialCnt + "개</li>";
                                    returnHtml += "<li class=\"rchk\"><b>필기대비</b>" + teacherInfoLIST[j].prepareNoteCnt + "개</li>";
                                    returnHtml += "<li class=\"rchk\"><b>모의고사</b>" + teacherInfoLIST[j].mockExamCnt + "개</li>";
                                    returnHtml += "</ul>";
                                    returnHtml += "<div class=\"toggleWrap\">";
                                    returnHtml += "<div class=\"div_toggle\">";
                                    returnHtml += "<ul class=\"lectureHead\">";
                                    returnHtml += "<li class=\"w15p\">유형</li>";
                                    returnHtml += "<li class=\"w40p\">강좌명</li>";
                                    returnHtml += "<li class=\"w35p\">수강료</li>";
                                    returnHtml += "</ul>";
                                    /* 유형별 뿌리기 */
                                    if (teacherInfoLIST[j].videoLectureInfo != null) {
                                        var videoLectureInfo = teacherInfoLIST[j].videoLectureInfo;
                                        returnHtml += "<div class=\"lectureBody\">";
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
                                                returnHtml += "<div class=\"lectureRow\">";
                                                returnHtml += "<ul class=\"lectureList\">";
                                                returnHtml += "<li class=\"w15p\">";
                                                returnHtml += "<span class=\"btn_learnType " + color + "\">" + teachLec.ctgName + "</span>";
                                                returnHtml += "</li>";
                                                returnHtml += "<li class=\"w40p\">";
                                                returnHtml += "<a href=\"#\" class=\"learnName\">" + teachLec.goodsName + "</a>";
                                                returnHtml += "<span class=\"learnNum\">강의수 <b class=\"colorBlue\">" + teachLec.lecCount + "강</b> | 수강일수 <b class=\"colorBlue\">" + teachLec.limitDay + "일</b></span>";
                                                returnHtml += "<span class=\"learnView\">샘플보기 <a href=\"#\" class=\"btn_s btn_quality\">일반화질</a> <a href=\"#\" class=\"btn_s btn_quality on\">고화질</a></span>";
                                                returnHtml += "</li>";
                                                returnHtml += "<li class=\"w40p ta_right\">";
                                                returnHtml += "<ul class=\"costList\">";

                                                for (var p = 0; p < teachLec.videoLectureKindList.length; p++) {
                                                    var kindInfo = teachLec.videoLectureKindList[p];
                                                    if (kindInfo.kind == 100) {
                                                        returnHtml += "<li>";
                                                        if (kindInfo.pcDiscountPercent != null) {
                                                            returnHtml += "<span class=\"colorRed\">" + kindInfo.pcDiscountPercent + "</span>";
                                                        }
                                                        returnHtml += "<span class=\"btn_ss btn_divTag\">PC</span>";
                                                        returnHtml += "<b class=\"cost\">" + teachLec.pcSellPriceName + "</b> <input type=\"checkbox\" name='lecChk' id='" + kindInfo.priceKey + "' value='" + kindInfo.gkey + "'>";
                                                        returnHtml += "</li>";
                                                    } else if (kindInfo.kind == 101) {
                                                        returnHtml += "<li>";
                                                        if (kindInfo.mobileDiscountPercent != null) {
                                                            returnHtml += "<span class=\"colorRed\">" + kindInfo.mobileDiscountPercent + "</span>";
                                                        }
                                                        returnHtml += "<span class=\"btn_ss btn_divTag\">모바일</span>";
                                                        returnHtml += "<b class=\"cost\">" + teachLec.mobileSellPriceName + "</b> <input type=\"checkbox\" name='lecChk' id='" + kindInfo.priceKey + "' value='" + kindInfo.gkey + "'>";
                                                        returnHtml += "</li>";
                                                    } else {
                                                        returnHtml += "<li>";
                                                        if (kindInfo.pcMobileDiscountPercent != null) {
                                                            returnHtml += "<span class=\"colorRed\">" + kindInfo.pcMobileDiscountPercent + "</span>";
                                                        }
                                                        returnHtml += "<span class=\"btn_ss btn_divTag\">PC</span> <span class=\"btn_ss btn_divTag\">모바일</span>";
                                                        returnHtml += "<b class=\"cost\">" + teachLec.pcMobileSellPriceName + "</b> <input type=\"checkbox\" name='lecChk' id='" + kindInfo.priceKey + "' value='" + kindInfo.gkey + "'>";
                                                        returnHtml += "</li>";
                                                    }
                                                }
                                                returnHtml += "</ul>";
                                                returnHtml += "</li>";
                                                returnHtml += "</ul>";//lectureList

                                                returnHtml += "<div class=\"toggleWrap\">";
                                                returnHtml += "<div class=\"div_toggle\">";
                                                returnHtml += "<div class=\"tableBox\">";
                                                returnHtml += "<table class=\"lecture\">";
                                                returnHtml += "<colgroup>";
                                                returnHtml += "<col class=\"w10p\">";
                                                returnHtml += "<col class=\"w40p\">";
                                                returnHtml += "<col class=\"w10p\">";
                                                returnHtml += "<col class=\"w40p\">";
                                                returnHtml += "</colgroup>";
                                                returnHtml += "<thead>";
                                                returnHtml += "<th scope=\"row\" style='text-align: center'>회차</th>";
                                                returnHtml += "<th scope=\"row\" style='text-align: center'>제목</th>";
                                                returnHtml += "<th scope=\"row\" style='text-align: center'>시간</th>";
                                                returnHtml += "<th scope=\"row\" style='text-align: center'>샘플보기</th>";
                                                returnHtml += "</thead>";
                                                returnHtml += "<tbody>";
                                                var lecList = getLectureList(teachLec.gkey, 'PC');
                                                if (lecList != null) {
                                                    var cmpList = lecList.result;
                                                    for (var m = 0; m < cmpList.lectureList.length; m++) {
                                                        var lecInfo = cmpList.lectureList[m];
                                                        returnHtml += "<tr>";
                                                        returnHtml += "<td class=\"ta_center\">" + lecInfo.numStr + "</td>";
                                                        returnHtml += "<td>" + lecInfo.name + "</td>";
                                                        returnHtml += "<td class=\"ta_center\">" + lecInfo.vodTime + "</td>";
                                                        if (lecInfo.num == 1) {
                                                            returnHtml += "<td class=\"ta_center\"><span class=\"learnView\">샘플보기 <a href=\"#\" class=\"btn_s btn_quality\">일반화질</a> <a href=\"#\" class=\"btn_s btn_quality on\">고화질</a></span></td>";
                                                        } else {
                                                            returnHtml += "<td class=\"ta_center\"></span></td>";
                                                        }
                                                        returnHtml += "</tr>";
                                                    }
                                                }
                                                returnHtml += "</tbody>";
                                                returnHtml += "</table>";
                                                returnHtml += "</div>";//tableBox
                                                returnHtml += "</div>";//div_toggle
                                                returnHtml += "<div class=\"btn_toggle\"><a href=\"#\"></a></div>";
                                                returnHtml += "</div>";//toggleWrap
                                                returnHtml += "</div>"//lectureRow
                                            }

                                            if(teachLec.teacherLectureBook != null){
                                                for(var p = 0; p < teachLec.teacherLectureBook.length; p++){
                                                    var bookInfo = teachLec.teacherLectureBook[p];
                                                    returnHtml += "<div class=\"lectureRow\">";
                                                        returnHtml += "<ul class=\"lectureList\">";
                                                            returnHtml += "<li class=\"w15p\">";
                                                                returnHtml += "<span class=\"btn_learnType gray\">교재</span>";
                                                            returnHtml += "</li>";
                                                            returnHtml += "<li class=\"w40p\">";
                                                                returnHtml += "<span class=\"btn_ss btn_divTag\">"+ bookInfo.isMain +"</span>";
                                                                returnHtml += "<a href=\"#\" class=\"learnName\">"+ bookInfo.bookName +"</a>";
                                                                returnHtml += "<span class=\"learnNum\">저자 <b class=\"colorBlue\">"+ bookInfo.writer +"</b> | 출판 <b class=\"colorBlue\">"+ bookInfo.publishDate +"</b></span>";
                                                            returnHtml += "<li>";
                                                            returnHtml += "<li class=\"w35p ta_right\">";
                                                                returnHtml += "<ul class=\"costList\">";
                                                                    returnHtml += "<li>";
                                                                        returnHtml += "<b class=\"cost\">"+ bookInfo.sellPriceName +"원</b> <input type=\"checkbox\" name='lecChk' id='" + bookInfo.priceKey + "' value='" + bookInfo.gkey + "'>";
                                                                    returnHtml += "</li>";
                                                                returnHtml += "</ul>";
                                                            returnHtml += "</li>";
                                                            returnHtml += "<li class=\"w10p ta_center\">&nbsp;</li>";
                                                        returnHtml += "</ul>";
                                                    returnHtml += "</div>";
                                                }
                                            }
                                        }
                                        returnHtml += "</div>";//lectureBody
                                    }
                                    returnHtml += "</div>";//div_toggle
                                    returnHtml += "<div class=\"btn_toggle lock\"><a href=\"#\"></a></div>";
                                    returnHtml += "</div>";//toggleWrap
                                    returnHtml += "</div>";//teacherRow
                                }//182 line for문 끝
                            }
                            returnHtml += "</div>";//teacherBody

                       returnHtml += "</div>"//lectureWrap
               // }
                $("#resultList").append(returnHtml);
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


function getLectureAcademyTeacherList(menuCtgKey, subjectMenuKeys, teacherKeys, stepCtgKeys, goodsType) {
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
                var retrunHtml = "<div class=\"lectureWrap\">";
                if(cmpList.academyLectureInfo != null) {
                    retrunHtml += "<ul class='lectureTotal bdt'>";
                        retrunHtml += "<li class='left'>" + cmpList.subjectName + "</li>";
                    retrunHtml += "</ul>";
                    for(var j = 0; j < cmpList.academyLectureInfo.length; j++){
                        retrunHtml += "<div class=\"lectureBody lectureBody2\">";
                        retrunHtml += "<div class=\"lectureRow\">";
                            retrunHtml += "<div class=\"lectureTop\">";
                                var color = "";
                                if (cmpList.academyLectureInfo[j].stepCtgKey == 207) color = "blue";
                                else if (cmpList.academyLectureInfo[j].stepCtgKey == 203)  color = "green";
                                else if (cmpList.academyLectureInfo[j].stepCtgKey == 205)  color = "orange";
                                else if (cmpList.academyLectureInfo[j].stepCtgKey == 4266) color = "purple";
                                else color = "navy";

                                retrunHtml += "<span class=\"btn_learnType " + color + "\">"+ cmpList.academyLectureInfo[j].ctgName +"</span>";
                                retrunHtml += "<span class=\"sale\">"+ cmpList.academyLectureInfo[j].discountPercent +"</span>";
                                retrunHtml += "<span class=\"new\">"+ cmpList.academyLectureInfo[j].emphasisStr +"</span>";
                            retrunHtml += "</div>";
                            retrunHtml += "<ul class=\"lectureList\">";
                                retrunHtml += "<li>";
                                    retrunHtml += "<a href=\"#\" class=\"learnName\">" + cmpList.academyLectureInfo[j].goodsName + "</a>";
                                    retrunHtml += "<span class=\"learnNum\">수강기간<b class=\"colorBlue\">"+ cmpList.academyLectureInfo[j].lectureDate +" ("+ cmpList.academyLectureInfo[j].month +")</b></span>";
                                retrunHtml += "</li>";
                                retrunHtml += "<li>";
                                    retrunHtml += "<b class=\"cost\">"+ cmpList.academyLectureInfo[j].sellPrice +"원</b> <input type=\"checkbox\" name='lecChk' id='"+ cmpList.academyLectureInfo[j].priceKey +"' value='"+ cmpList.academyLectureInfo[j].gkey +"'>";
                                retrunHtml += "</li>";
                            retrunHtml += "</ul>";//teacherList
                        retrunHtml += "<div>";//lectureRow
                        retrunHtml += "<div class=\"toggleWrap\">";
                            retrunHtml += "<div class=\"div_toggle\">";
                                retrunHtml += "<div class=\"lectureRow\">";
                                    retrunHtml += "<div class=\"alignCenter\"><img src='" + cmpList.academyLectureInfo[j].imageView + "' style='width: 100%'></div><br>";
                                retrunHtml += "</div>";//lectureRow
                            retrunHtml += "</div>";//div_toggle
                            retrunHtml += "<div class=\"btn_toggle lock\"><a href=\"#\"></a></div>";
                        retrunHtml += "</div>";//toggleWrap
                        retrunHtml += "</div>";//
                        retrunHtml += "</div>";//lectureWrap
                        retrunHtml += "</div>";//lectureWrap
                    }
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

//패키지 수강신청
function getSpecialPackageList(menuCtgKey, subjectMenuKeys, teacherKeys, stepCtgKeys, device) {
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        subjectMenuKeys : subjectMenuKeys,
        teacherKeys : teacherKeys,
        stepCtgKeys: stepCtgKeys,
        device : device
    };
    var infoList = getApi("/product/getSpecialPackageList/", menuCtgKey, data);
    console.log(infoList);
    if (infoList != null) {
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            var returnHtml = "<div class=\"lectureWrap\">";
                    returnHtml += "<ul class=\"lectureTotal bdt\">";
                        returnHtml += "<li class=\"right\">";
                            returnHtml += "선택한 항목 <span class=\"colorRed\" id='selCount'></span>개를";
                            returnHtml += "<a href='javascript:goCheckedShopBasket();' class=\"btn_m\">장바구니 담기</a>&nbsp;";
                            returnHtml += "<a href=\"#\" class=\"btn_m on\">바로구매</a>";
                        returnHtml += "</li>";
                    returnHtml += "</ul>";
            for(var i = 0; i < selList.length; i++){
                returnHtml +=  "<div class=\"lectureBody lectureBody2\">";
                        returnHtml += "<div class=\"lectureRow\">";
                            returnHtml += "<div class=\"lectureTop\">";
                                returnHtml += "<span class=\"sale\">"+ selList[i].discountPercent +"</span>";
                            returnHtml += "</div>";
                            returnHtml += "<ul class=\"lectureList\">";
                                    returnHtml += "<li class=\"\">";
                                        returnHtml += "<a href=\"#\" class=\"learnName\">"+ selList[i].goodsName +"</a>";
                                        returnHtml += "<span class=\"learnNum\">시험대비 <b class=\"colorBlue\">"+ selList[i].examYear +"년도</b> | 학습기간 <b class=\"colorBlue\">"+ selList[i].limitDay +"일</b></span>";
                                    returnHtml += "</li>";
                                    returnHtml += "<li class=\"w40p ta_right\">";
                                        returnHtml += "<ul class=\"costList\">"; //pc & mobile 가격 구분
                                            if(selList[i].videoLectureKindList != null) {
                                                returnHtml += "<li></li>";
                                                for(var j = 0; j < selList[i].videoLectureKindList.length; j++) {
                                                    var pcMobileKind = selList[i].videoLectureKindList[j];
                                                    returnHtml += "<li>";
                                                        var pcMobileName = "";
                                                        if(pcMobileKind.kind == 100) pcMobileName = 'PC';
                                                        else pcMobileName = '모바일';
                                                        returnHtml += "<span class='btn_ss btn_divTag'>"+ pcMobileName +"</span>";
                                                        returnHtml += "<b class='cost'>"+ pcMobileKind.priceName +"원</b> <input type=\"checkbox\" name='lecChk' id='"+ pcMobileKind.priceKey +"' value='"+ pcMobileKind.gkey +"'>";
                                                    returnHtml += "<li>";
                                                }
                                            }
                                        returnHtml += "</ul>";
                                    returnHtml += "</li>";
                            returnHtml += "</ul>";//lectureList
                        returnHtml += "</div>";//lectureRow
                        returnHtml += "<div class=\"toggleWrap\">";
                            returnHtml += "<div class=\"div_toggle\">";
                                returnHtml += "<p class=\"lectureTotal bdt bggray\">패키지 구성</p>";
                                if(selList[i].includeProductList != null){
                                    for(var k = 0; k < selList[i].includeProductList.length; k++){
                                        var productInfo = selList[i].includeProductList[k];
                                        returnHtml += "<div class=\"lectureRow\">";
                                            returnHtml += "<ul class=\"lectureList lectureList2\">";
                                                returnHtml += "<li><span class=\"thumb\"><img src='"+ productInfo.imageList +"' alt=\"\"></span></li>";
                                                returnHtml += "<li class=\"\">";
                                                    returnHtml += "<div class=\"lectureTop\">";
                                                    returnHtml += "<span class=\"btn_learnType orange\">"+ productInfo.stepName +"</span><span class=\"sale\">"+ productInfo.discountPercent +"</span><span class=\"new\">"+ productInfo.emphasisName +"</span>";
                                                    returnHtml += "</div>";//lectureTop
                                                    returnHtml += "<a href=\"#\" class=\"learnName\">"+ productInfo.name +"</a>";
                                                    returnHtml += "<span class=\"learnNum\">총 강의수 <b class=\"colorBlue\">"+ productInfo.lectureCount +"강</b> | 수강일수 <b class=\"colorBlue\">"+ productInfo.limitDay +"일</b></span>";
                                                returnHtml += "</li>";
                                            returnHtml += "</ul>";//lectureList lectureList2
                                        returnHtml += "</div>";//lectureRow
                                        if(productInfo.lectureList != null){
                                            returnHtml += "<div class=\"toggleWrap\">";
                                                returnHtml += "<div class=\"div_toggle\">";
                                                    returnHtml += "<div class=\"lectureRow\">";
                                                        returnHtml += "<div class=\"tableBox tableBox2\">";
                                                            returnHtml += "<table class=\"lecture\">";
                                                                returnHtml += "<colgroup>";
                                                                    returnHtml += "<col class=\"w10p\">";
                                                                    returnHtml += "<col class=\"w40p\">";
                                                                    returnHtml += "<col class=\"w10p\">";
                                                                    returnHtml += "<col class=\"w40p\">";
                                                                returnHtml += "</colgroup>";
                                                                returnHtml += "<thead>";
                                                                    returnHtml += "<tr>";
                                                                        returnHtml += "<th scope=\"row\">회차</th>";
                                                                        returnHtml += "<th scope=\"row\">제목</th>";
                                                                        returnHtml += "<th scope=\"row\">시간</th>";
                                                                        returnHtml += "<th scope=\"row\">샘플보기</th>";
                                                                    returnHtml += "</tr>";
                                                                returnHtml += "</thead>";
                                                                returnHtml += "<tbody>";
                                                                for(var l = 0; l < productInfo.lectureList.length; l++){
                                                                    var lecList = productInfo.lectureList[l];
                                                                    returnHtml += "<tr>";
                                                                        returnHtml += "<td class=\"ta_center\">"+ lecList.numStr +"</td>";
                                                                        returnHtml += "<td>"+ lecList.name +"</td>";
                                                                        returnHtml += "<td class=\"ta_center\">"+ lecList.vodTime +"</td>";
                                                                        returnHtml += "<td class=\"ta_center\"><span class=\"learnView\"> <a href=\"#\" class=\"btn_s btn_quality\">일반화질</a> <a href=\"#\" class=\"btn_s btn_quality on\">고화질</a></span></td>";
                                                                    returnHtml += "</tr>";
                                                                } //테이블 for문
                                                                 returnHtml += "</tbody>";
                                                            returnHtml += "</table>";
                                                        returnHtml += "</div>";//tableBox tableBox2
                                                    returnHtml += "</div>";//lectureRow
                                                returnHtml += "</div>";//div_toggle
                                            returnHtml += "<div class=\"btn_toggle lock\"><a href=\"#\"></a></div>";
                                            returnHtml += "</div>"; //toggleWrap 강의리스트 테이블
                                        }
                                    }
                                }
                            returnHtml += "</div>";//div_toggle
                            returnHtml += "<div class=\"btn_toggle lock\"><a href=\"#\"></a></div>";
                        returnHtml += "</div>";//toggleWrap
                    returnHtml += "</div>";//lectureBody lectureBody2
                }
            returnHtml += "</div>";
            $("#resultList").append(returnHtml);
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

function getPackageCtgKey() {
    var menuCtgKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        menuCtgKey = 764;
    }else if(leftMenuInfo == "techOnline"){
        menuCtgKey = 833;
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