//강사 홈 정보
function getTeacherHomeInfo(teacherKey, device, menuCtgKey, listLimit) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        device : device,
        menuCtgKey : menuCtgKey,
        listLimit : listLimit
    };
    var infoList = getApi("/teacher/getTeacherHomeInfo/", teacherKey, data);
    var result = infoList.result.teacherInfo;

    $("#teacherImg").attr("src", result.imageListUrl);
    if(result.history != null){
        innerHTML("history", result.history);
    }
    if(result.youtubeUrl != null){
        innerHTML("youtube", result.youtubeUrl);
    }
}

function getTeacherNameSubjectName(teacherKey, menuCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        reqKey : menuCtgKey
    };
    var infoList = getApi("/teacher/getTeacherNameSubjectName/", teacherKey, data);
    var result = infoList.result;
    innerHTML("subject", result.subjectName);
    innerHTML("teacherName", result.teacherName);
}

//직렬별 교수소개 리스트
function getTeacherIntroduceList(ctgKey, pos, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        pos : pos
    };
    var InfoList = getApi("/teacher/getTeacherIntroduceList/", ctgKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습Q/A 상세정보
function getTeacherLearningQnaDetail(teacherKey, bbsKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var infoList = getApi("/teacher/getTeacherLearningQnaDetail/", teacherKey, data);
    return infoList;
}

//강사소개 > 수강후기, 온라인 상품 상세 > 회원리뷰
function getTeacherLectureReview(teacherKey, gKey, sPage, listLimit) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        gKey : gKey,
        sPage : sPage,
        listLimit : listLimit
    };
    var InfoList = getPageApi("/teacher/getTeacherLectureReview/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습 자료실
function getTeacherReferenceRoom(teacherKey, sPage, listLimit, searchType,  searchText, isNotice, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText,
        isNotice : isNotice
    };

    var infoList = getPageApi("/teacher/getTeacherReferenceRoom/", teacherKey, data);
    var cnt = infoList.cnt;
    if (infoList.result.length > 0) {
        paging.count(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return listNum--;},
                    function(data) {return "<a href='javascript:void(0);' class='subject' onclick='goDetailReference("+ cmpList.bbsKey +");'>" + gfn_substr(cmpList.title, 0, 40) + "</a>";},
                    function(data) {return cmpList.writeUserName;},
                    function(data) {return cmpList.indate2;},
                    function(data) {return cmpList.readCount;}
                ];
                dwr.util.addRows(tagId, [0], cellData, {escapeHtml: false});
            }
        }
    }
}

//강사소개 > 학습 학습공지
function getTeacherReferenceRoom2(teacherKey, sPage, listLimit, searchType,  searchText, isNotice, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText,
        isNotice : isNotice
    };

    var infoList = getPageApi("/teacher/getTeacherReferenceRoom/", teacherKey, data);
    var cnt = infoList.cnt;

    if (infoList.result.length > 0) {
        paging.count2(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return listNum--;},
                    function(data) {return "<a href='javascript:void(0);' class='subject' onclick='goDetailReference("+ cmpList.bbsKey +");'>" + gfn_substr(cmpList.title, 0, 40) + "</a>";},
                    function(data) {return cmpList.writeUserName;},
                    function(data) {return cmpList.indate2;},
                    function(data) {return cmpList.readCount;}
                ];
                dwr.util.addRows(tagId, [0], cellData, {escapeHtml: false});
            }
        }
    }
}

//강사소개 > 학습 Q/A
function getTeacherLearningQna(teacherKey, sPage, listLimit, searchType, searchText, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows(tagId); //테이블 리스트 초기화

    var data = {
        sPage: sPage,
        listLimit: listLimit,
        searchType: searchType,
        searchText: searchText
    };
    var infoList = getPageApi("/teacher/getTeacherLearningQna/", teacherKey, data);
    var cnt = infoList.cnt;
    if (infoList.result.length > 0) {
        paging.count3(sPage, cnt, '5', '20', comment.blank_list);
        var listNum = ((cnt - 1) + 1) - ((sPage - 1) * 20); //리스트 넘버링
        var selList = infoList.result;
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        for (var i = 0; i < selList.length; i++) {
            var cmpList = selList[i];
            if (cmpList.level == 1) {//본문
                var returnHtml = '<tr>';
                returnHtml += '<td>' + listNum-- + '</td>';
                var lock = '';
                if (cmpList.pwd == 1) lock = 'lock';
                else if (cmpList.pwd == null) lock = '';
                if (cmpList.pwd == 1){
                    if(sessionUserInfo.userKey == cmpList.writeUserKey){
                        returnHtml += '<td><a href="javascript:void(0);" disabled class="subject ' + lock + '" onclick="goDetailqna('+  cmpList.bbsKey +');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                    }else{
                        //returnHtml += '<td><a href="javascript:void(0);" class="subject ' + lock + '" onclick="">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                        if(sessionUserInfo.authority != 0) {
                            returnHtml += '<td><a class="subject ' + lock + ' nonBoard">비밀글입니다</a></td>';
                        }else{
                            returnHtml += '<td><a href="javascript:void(0);" class="subject ' + lock + '" onclick="goDetailqna('+  cmpList.bbsKey +');">' + gfn_substr('비밀글입니다 ', 0, 40) + '</a></td>';
                        }

                    }
                }else{
                    returnHtml += '<td><a href="javascript:void(0);" disabled class="subject" onclick="goDetailqna('+  cmpList.bbsKey +');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                }

                if(cmpList.writeUserName != null){
                    returnHtml += '<td>' + cmpList.writeUserName + '</td>';
                }else{
                    returnHtml +='<td></td>';
                }
                returnHtml += '<td>' + cmpList.indate2 + '</td>';
                returnHtml += '<td>' + cmpList.readCount + '</td>';
                returnHtml += '</tr>';
                $("#dataList3").append(returnHtml);
            } else if (cmpList.level == 2) {//답글
                var returnHtml = '<tr class="reply">';
                returnHtml += '<td>' + listNum-- + '</td>';

                var lock = '';
                if (cmpList.pwd == 1) lock = 'lock';
                else if (cmpList.pwd == null) lock = '';
                if (cmpList.pwd == 1){
                    if(sessionUserInfo.userKey == cmpList.writeUserKey){
                        returnHtml += '<td><a href="javascript:void(0);" disabled class="subject reply ' + lock + '" onclick="goDetailqna('+  cmpList.bbsKey +');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                    }else{
                        if(sessionUserInfo.authority != 0) {
                            returnHtml += '<td><a class="subject  reply ' + lock + ' nonBoard">비밀글입니다</a></td>';
                        }else{
                            returnHtml += '<td><a href="javascript:void(0);" class="subject reply ' + lock + '" onclick="goDetailqna('+  cmpList.bbsKey +');">' + gfn_substr('비밀글입니다 ', 0, 40) + '</a></td>';
                        }

                    }
                }else{
                    returnHtml += '<td><a href="javascript:void(0);" class="subject reply" onclick="goDetailqna(' + cmpList.bbsKey + ');">' + gfn_substr(cmpList.title, 0, 40) + '</a></td>';
                }
                returnHtml += '<td>' + cmpList.writeUserName + '</td>';
                returnHtml += '<td>' + cmpList.indate2 + '</td>';
                returnHtml += '<td>' + cmpList.readCount + '</td>';
                returnHtml += '</tr>';
                $("#dataList3").append(returnHtml);
            }
        }
    }
}



//강사소개 > 학습자료실 상세정보
function getTeacherReferenceRoomDetail(teacherKey, bbsKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var infoList = getApi("/teacher/getTeacherReferenceRoomDetail/", teacherKey, data);
    return infoList;
}

//강사소개 > 수강후기 > 강사의 상품목록 셀렉트박스
function getTeacherVideoAcademyProductList(teacherKey) {
    if (teacherKey == null || teacherKey == undefined) return;

    var InfoList = getApi("/teacher/getTeacherVideoAcademyProductList/", teacherKey, "");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학원 강좌 정보
function getTeacherAcademyLecture(teacherKey, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (stepCtgKey == null || stepCtgKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey
    };
    var infoList = getApi("/teacher/getTeacherAcademyLecture/", teacherKey, data);
    if (infoList != null) {
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            for (var i = 0; i < selList.length; i++) {
                var cmpList = selList[i];
                if(cmpList.teacherAcademyList.length > 0){
                    var lecList = cmpList.teacherAcademyList;
                    for(var j = 0; j < lecList.length; j++){
                        var returnHtml = '<div class="lectureRow">';
                        returnHtml += ' <ul class="lectureList">';
                        returnHtml += '<li class="w15p">';
                        if (cmpList.stepCtgKey == 203) {
                            returnHtml += '<span class="btn_learnType green">이론</span>';
                        }else if(cmpList.stepCtgKey == 767){
                            returnHtml += '<span class="btn_learnType purple">종합반</span>';
                        }else if(cmpList.stepCtgKey == 205){
                            returnHtml += '<span class="btn_learnType orange">문제풀이</span>';
                        }else if(cmpList.stepCtgKey == 204){
                            returnHtml += '<span class="btn_learnType blue">단과특강</span>';
                        }else if(cmpList.stepCtgKey == 774){
                            returnHtml += '<span class="btn_learnType navy">아침특강</span>';
                        }else if(cmpList.stepCtgKey == 4266){
                            returnHtml += '<span class="btn_learnType navy">모의고사</span>';
                        }
                        returnHtml += '</li>';
                        returnHtml += '<li class="w45p">';
                        returnHtml += '<span class="learnName">'+ lecList[j].goodsName +'</span>';
                        returnHtml += '<span class="learnNum">수강기간 <b class="colorBlue">'+ lecList[j].lectureDate +' ('+ lecList[j].kind +'개월)</b></span>';
                        returnHtml += '</li>';
                        returnHtml += '<li class="w40p alignRight">';
                        returnHtml += '<ul class="costList">';
                        returnHtml += '<li>';
                        if(lecList[j].discountPercent != null){
                            returnHtml += '<span class="colorRed">'+ lecList[j].discountPercent +'</span>';
                        }
                        returnHtml += '<b class="cost">'+ lecList[j].sellPriceName +'원</b> <input type="checkbox" name="lecChk" id="'+ lecList[j].priceKey +'" value="'+ lecList[j].gkey +'">';
                        //returnHtml += "<a href='javascript:goShopBasket(" + lecList[j].gkey + "," + lecList[j].priceKey + ");' class='btn_s'>장바구니</a>&nbsp;";
                        //returnHtml += '<a href="#" class="btn_s on">바로구매</a>';
                        returnHtml += '</li>';
                        returnHtml += '</ul>';
                        returnHtml += '</li>';
                        returnHtml += '</ul>';
                        returnHtml += '</div>';
                        $("#lecAcaBody").append(returnHtml);
                        /* 교재 */
                        var returnBookHtml = '';
                        if (lecList[j].teacherLectureBook.length > 0) {
                            for (var k = 0; k < lecList[j].teacherLectureBook.length; k++) {
                                var lecBook = lecList[j].teacherLectureBook[k];
                                returnBookHtml = "<div class=\"lectureRow\">";
                                returnBookHtml += '<ul class="lectureList">';
                                returnBookHtml += "<li class='w15p'>";
                                    returnBookHtml += "<span class='btn_learnType gray'>교재</span>";
                                returnBookHtml += '</li>';
                                returnBookHtml += '<li class="w45p">';
                                    returnBookHtml += '<span class="btn_ss btn_divTag">'+ lecBook.isMain +'</span>';
                                    returnBookHtml += '<span class="learnName">'+ lecBook.bookName +'</span>';
                                    if(lecBook.writer != null && lecBook.publishDate != null){
                                        returnBookHtml += '<span class="learnNum">저자 <b class="colorBlue">'+ lecBook.writer +'</b> | 출판 <b class="colorBlue">'+ lecBook.publishDate +'</b></span>';
                                    }
                                returnBookHtml += '</li>';
                                returnBookHtml += '<li class="w40p alignRight">';
                                    returnBookHtml += '<ul class="costList">';
                                         returnBookHtml += '<li>';
                                             returnBookHtml += '<span class="colorRed">'+ lecBook.discountPercent +'</span>';
                                             returnBookHtml += '<b class="cost">'+ lecBook.sellPriceName +'원</b> <input type="checkbox"  name="lecChk" id="'+lecBook.priceKey +'" value="'+ lecBook.gkey +'">';
                                             //returnBookHtml += "<a href='javascript:goShopBasket(" + lecBook.gkey + "," +lecBook.priceKey + ");' class='btn_s'>장바구니</a>";
                                             //returnBookHtml += '<a href="#" class="btn_s on">바로구매</a>';
                                         returnBookHtml += '</li>';
                                     returnBookHtml += '</ul>';
                                returnBookHtml += '</li>';
                                returnBookHtml += '</ul>';
                                returnBookHtml += '</div>';
                                $("#lecAcaBody").append(returnBookHtml);
                            }
                        }
                    }
                }
            }
        }
    }
}

//강사소개 > 동영상 강좌 정보
function getTeacherVideoLecture(teacherKey, device, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (stepCtgKey == null || stepCtgKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey,
        device: device
    };
    var infoList = getApi("/teacher/getTeacherVideoLecture/", teacherKey, data);
    if (infoList != null) {
        if (infoList.result.length > 0) {
            var selList = infoList.result;
            for (var i = 0; i < selList.length; i++) {
                var cmpList = selList[i];
                if (cmpList.teacherLectureList.length > 0) {
                    var lecList = cmpList.teacherLectureList;
                    for (var j = 0; j < lecList.length; j++) { //강의목록리스트
                        var retrunHtml = "<div class=\"lectureRow\">";
                        retrunHtml += '<ul class="lectureList">';
                        retrunHtml += "<li class='w15p'>";
                        /* 유형 */
                        if (cmpList.stepCtgKey == 203) {
                            retrunHtml += "<span class='btn_learnType green'>이론</span>";
                        } else if (cmpList.stepCtgKey == 205) {
                            retrunHtml += "<span class=\"btn_learnType orange\">문제풀이</span>";
                        } else if (cmpList.stepCtgKey == 207) {
                            retrunHtml += "<span class=\"btn_learnType purple\">모의고사</span>";
                        } else if (cmpList.stepCtgKey == 4266) {
                            retrunHtml += " <span class=\"btn_learnType blue\">단과특강</span>";
                        }else if (cmpList.stepCtgKey == 4172) {
                            retrunHtml += " <span class=\"btn_learnType navy\">필기대비</span>";
                        }

                        retrunHtml += '</li>';
                        retrunHtml += '<li class="w45p">';
                        retrunHtml += '<span class="learnName">' + lecList[j].goodsName + '</span>';
                        retrunHtml += '<span class="learnNum">강의수 <b class="colorBlue">' + lecList[j].lecCount + '강</b> | 수강일수 <b class="colorBlue">' + lecList[j].limitDay + '일</b></span>';
                        retrunHtml += '<span class="learnView">샘플보기 <a href="javascript:void(0);" onclick="OpenSamplePlayer(' + "'"  + lecList[j].lowVideo + "'" + ');" class="btn_s btn_quality" >일반화질</a> <a href="javascript:void(0);" onclick="OpenSamplePlayer(' + "'"  + lecList[j].highVideo + "'" + ');" class="btn_s btn_quality on">고화질</a></span>';
                        retrunHtml += '</li>';
                        retrunHtml += '<li class="w40p alignRight">';
                        retrunHtml += '<ul class="costList">';
                        /* PC MOBILE 가격 */
                        if (lecList[j].videoLectureKindList.length > 0) {
                            for (var a = 0; a < lecList[j].videoLectureKindList.length; a++) {
                                retrunHtml += '<li>';
                                if (lecList[j].videoLectureKindList[a].discountPercent != null) { //할인가격 표시
                                    retrunHtml += '<span class="colorRed">' + lecList[j].videoLectureKindList[a].discountPercent + '</span>';
                                }
                                if (lecList[j].videoLectureKindList[a].kind == 100) { //pc
                                    retrunHtml += '<span class="btn_ss btn_divTag">PC</span>';
                                } else if (lecList[j].videoLectureKindList[a].kind == 101) { //mobile
                                    retrunHtml += '<span class="btn_ss btn_divTag">모바일</span>';
                                } else { //pc+mobile
                                    retrunHtml += '<span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span> ';
                                }
                                retrunHtml += "<b class='cost'>" + lecList[j].videoLectureKindList[a].sellPriceName + "</b> <input type='checkbox' name='lecChk' id='" + lecList[j].videoLectureKindList[a].priceKey + "' value='" + lecList[j].videoLectureKindList[a].gkey + "'>";
                                retrunHtml += '</li>';
                            }
                        }
                        retrunHtml += '</ul>';
                        retrunHtml += '</li>';
                        retrunHtml += '</ul>';
                        if (lecList[j].lectureList.length > 0) { /* 강의리스트 회차정보 */
                            retrunHtml += '<div class="toggleWrap">';
                            retrunHtml += '<div class="div_toggle">';
                            retrunHtml += '<div class="tableBox">';
                            retrunHtml += '<table class="classList">';
                            retrunHtml += '<colgroup>';
                            retrunHtml += '<col class="w10p">';
                            retrunHtml += '<col class="w40p">';
                            retrunHtml += '<col class="w10p">';
                            retrunHtml += '<col class="w40p">';
                            retrunHtml += '</colgroup>';
                            retrunHtml += '<thead>';
                            retrunHtml += '<tr>';
                            retrunHtml += '<th scope="row">회차</th>';
                            retrunHtml += '<th scope="row">제목</th>';
                            retrunHtml += '<th scope="row">시간</th>';
                            retrunHtml += '<th scope="row">샘플보기</th>';
                            retrunHtml += '<tr>';
                            retrunHtml += '</thead>';
                            retrunHtml += '<tbody>';
                            for (var k = 0; k < lecList[j].lectureList.length; k++) {
                                retrunHtml += '<tr>';
                                retrunHtml += '<td class="ta_center">' + lecList[j].lectureList[k].num + '</td>';
                                retrunHtml += '<td>' + lecList[j].lectureList[k].name + '</td>';
                                retrunHtml += '<td class="ta_center">' + lecList[j].lectureList[k].vodTime + '</td>';

                                if (lecList[j].lectureList[k].num == 1) {
                                    retrunHtml += '<td class="ta_center"><span class="learnView">샘플보기 <a href="javascript:void(0);" onclick="OpenSamplePlayer(' + "'"  + lecList[j].lowVideo + "'" + ');" class="btn_s btn_quality" >일반화질</a> <a href="javascript:void(0);" onclick="OpenSamplePlayer(' + "'"  + lecList[j].highVideo + "'" + ');" class="btn_s btn_quality on">고화질</a></span></td>';
                                    //retrunHtml += '<td class="alignCenter"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>';
                                } else {
                                    retrunHtml += '<td class="ta_center"><span class="learnView"> </span></td>';
                                }
                                retrunHtml += '</tr>';
                            }
                            retrunHtml += '<tbody>';
                            retrunHtml += '</table>';
                            retrunHtml += '</div>';
                            retrunHtml += '</div>';
                            retrunHtml += '<div class="btn_toggle"><a href="#"></a></div>';
                            retrunHtml += '</div>';
                        }
                        retrunHtml += '</div>';
                        $("#lecOnlineBody").append(retrunHtml);
                        /* 교재 */
                        var returnBookHtml = '';
                        if (lecList[j].teacherLectureBook.length > 0) {
                            for (var b = 0; b < lecList[j].teacherLectureBook.length; b++) {
                                var lecBook = lecList[j].teacherLectureBook[b];
                                returnBookHtml = "<div class=\"lectureRow\">";
                                returnBookHtml += '<ul class="lectureList">';
                                returnBookHtml += "<li class='w15p'>";
                                returnBookHtml += "<span class='btn_learnType gray'>교재</span>";
                                returnBookHtml += '</li>';
                                returnBookHtml += '<li class="w45p">';
                                returnBookHtml += '<span class="btn_ss btn_divTag">주교재</span>';
                                returnBookHtml += '<span class="learnName">' + lecBook.bookName + '</span>';
                                returnBookHtml += '<span class="learnNum">저자 <b class="colorBlue">' + lecBook.writer + '</b> | 출판 <b class="colorBlue">' + lecBook.publishDate + '</b></span>';
                                returnBookHtml += '</li>';
                                returnBookHtml += '<li class="w40p alignRight">';
                                returnBookHtml += '<ul class="costList">';
                                returnBookHtml += '<li>';
                                returnBookHtml += '<b class="cost">' + lecBook.priceName + '원</b> <input type="checkbox" name="lecChk" id="' + lecBook.priceKey + '" value="' + lecBook.gkey + '">';
                                //returnBookHtml += '<a href="#" class="btn_s">장바구니</a>';
                                //returnBookHtml += '<a href="#" class="btn_s on">바로구매</a>';
                                returnBookHtml += '</li>';
                                returnBookHtml += '</ul>';
                                returnBookHtml += '</li>';
                                returnBookHtml += '</div>';
                                $("#lecOnlineBody").append(returnBookHtml);
                            }
                        }
                    }
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

// 강사 커리큘럼 정보
function getTeacherCurriculum(teacherKey, device, menuCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        device : device,
        menuCtgKey : menuCtgKey
    };

    var infoList = getResultStrApi("/teacher/getTeacherCurriculum/", teacherKey, data);

    if (infoList.result != null) {
        var selList = infoList.result;
        innerHTML("curriculum", selList);
    }else{
        innerHTML("curriculum", "");
    }

}