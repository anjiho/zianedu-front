//강사소개 > 학원 강좌 정보
function getTeacherAcademyLecture(teacherKey, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey
    };
    var InfoList = getApi("/teacher/getTeacherAcademyLecture/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

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

//강사소개 > 학습 Q/A
function getTeacherLearningQna(teacherKey, sPage, listLimit, searchType, searchText, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var InfoList = getApi("/teacher/getTeacherLearningQna/", teacherKey, data);
                   //getPageApi 확인필요

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
    var InfoList = getApi("/teacher/getTeacherLearningQnaDetail/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
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
function getTeacherReferenceRoom(teacherKey, sPage, listLimit, searchType,  searchText, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var InfoList = getPageApi("/teacher/getTeacherReferenceRoom/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습자료실 상세정보
function getTeacherReferenceRoomDetail(teacherKey, bbsKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var InfoList = getApi("/teacher/getTeacherReferenceRoomDetail/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 수강후기 > 강사의 상품목록 셀렉트박스
function getTeacherVideoAcademyProductList(teacherKey) {
    if (teacherKey == null || teacherKey == undefined) return;

    var InfoList = getApi("/teacher/getTeacherVideoAcademyProductList/", teacherKey, "");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}


//강사소개 > 동영상 강좌 정보
function getTeacherVideoLecture(teacherKey, device, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (stepCtgKey == null || stepCtgKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey,
        device : device
    };

    var infoList = getApi("/teacher/getTeacherVideoLecture/", teacherKey, data);
    if(infoList.result.length > 0){
        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++){
            var cmpList = selList[i];
                if(cmpList.teacherLectureList.length > 0){
                    var lecList = cmpList.teacherLectureList;
                    for(var j = 0; j < lecList.length; j++){ //강의목록리스트
                         var retrunHtml = "<div class=\"lectureRow\">";
                                retrunHtml += '<ul class="lectureList">';
                                    retrunHtml += "<li class='w15p'>";
                                    /* 유형 */
                                    if(cmpList.stepCtgKey == 203) {
                                        retrunHtml += "<span class='btn_learnType green'>이론</span>";
                                    }else if(cmpList.stepCtgKey == 205){
                                        retrunHtml += "<span class=\"btn_learnType orange\">문제풀이</span>";
                                    }else if(cmpList.stepCtgKey == 207){
                                        retrunHtml += "<span class=\"btn_learnType purple\">모의고사</span>";
                                    }else if(cmpList.stepCtgKey == 4266){
                                        retrunHtml += " <span class=\"btn_learnType blue\">단과특강</span>";
                                    }

                                    retrunHtml += '</li>';
                                    retrunHtml += '<li class="w45p">';
                                        retrunHtml += '<a href="#" class="learnName">' + lecList[j].goodsName + '</a>';
                                        retrunHtml += '<span class="learnNum">강의수 <b class="colorBlue">'+ lecList[j].lecCount +'강</b> | 수강일수 <b class="colorBlue">'+ lecList[j].limitDay +'일</b></span>';
                                        retrunHtml += '<span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span>';
                                    retrunHtml += '</li>';
                                    retrunHtml += '<li class="w40p alignRight">';
                                        retrunHtml += '<ul class="costList">';
                                            /* PC MOBILE 가격 */
                                            if(lecList[j].videoLectureKindList.length > 0){
                                                for(var a = 0; a < lecList[j].videoLectureKindList.length; a++){
                                                    retrunHtml += '<li>';
                                                    if(lecList[j].videoLectureKindList[a].discountPercent != null){ //할인가격 표시
                                                        retrunHtml += '<span class="colorRed">'+ lecList[j].videoLectureKindList[a].discountPercent +'</span>';
                                                    }
                                                    if(lecList[j].videoLectureKindList[a].kind == 100){ //pc
                                                        retrunHtml += '<span class="btn_ss btn_divTag">PC</span>';
                                                    }else if(lecList[j].videoLectureKindList[a].kind == 101){ //mobile
                                                        retrunHtml += '<span class="btn_ss btn_divTag">모바일</span>';
                                                    }else{ //pc+mobile
                                                        retrunHtml += '<span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span> ';
                                                    }
                                                    retrunHtml += '<b class="cost">'+ lecList[j].videoLectureKindList[a].sellPriceName +'</b> <input type="checkbox" name="" value="">';
                                                    retrunHtml += '<a href="#" class="btn_s">장바구니</a>';
                                                    retrunHtml += '<a href="#" class="btn_s on">바로구매</a>';
                                                    retrunHtml += '</li>';
                                                }
                                            }
                                        retrunHtml += '</ul>';
                                    retrunHtml += '</li>';
                                retrunHtml += '</ul>';
                                if(lecList[j].lectureList.length > 0){ /* 강의리스트 회차정보 */
                                    retrunHtml += '<div class="toggleWrap">';
                                        retrunHtml += '<div class="div_toggle">';
                                            retrunHtml += '<div class="tableBox">';
                                                    retrunHtml += '<table class="lecture">';
                                                    retrunHtml += '<colgroup>';
                                                        retrunHtml += '<col class="w10p">';
                                                        retrunHtml += '<col class="w40p">';
                                                        retrunHtml += '<col class="w10p">';
                                                        retrunHtml += '<col class="w40p">';
                                                    retrunHtml += '</colgroup>';
                                                    retrunHtml += '<thead>';
                                                    retrunHtml += '<tr>';
                                                        retrunHtml += '<th scope="row" class="alignCenter">회차</th>';
                                                        retrunHtml += '<th scope="row" class="alignCenter">제목</th>';
                                                        retrunHtml += '<th scope="row" class="alignCenter">시간</th>';
                                                        retrunHtml += '<th scope="row" class="alignCenter">샘플보기</th>';
                                                    retrunHtml += '<tr>';
                                                    retrunHtml += '</thead>';
                                                    retrunHtml += '<tbody>';
                                                    for(var k = 0; k < lecList[j].lectureList.length; k++){
                                                        retrunHtml += '<tr>';
                                                            retrunHtml += '<td class="alignCenter">'+ lecList[j].lectureList[k].num +'</td>';
                                                            retrunHtml += '<td>'+ lecList[j].lectureList[k].name +'</td>';
                                                            retrunHtml += '<td class="alignCenter">'+ lecList[j].lectureList[k].vodTime +'</td>';
                                                            retrunHtml += '<td class="alignCenter"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>';
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
                            $("#lectureBody").append(retrunHtml);
                    }
                    /* 교재 */
                    for(var j = 0; j < lecList.length; j++){
                        if(lecList[j].teacherLectureBook.length > 0){
                            for(var k=0; k < lecList[j].teacherLectureBook.length; k++ ){
                                var lecBook = lecList[j].teacherLectureBook[k];
                                var retrunHtml = "<div class=\"lectureRow\">";
                                            retrunHtml += '<ul class="lectureList">';
                                                retrunHtml += "<li class='w15p'>";
                                                    retrunHtml += "<span class='btn_learnType gray'>교재</span>";
                                                retrunHtml += '</li>';
                                                retrunHtml += '<li class="w45p">';
                                                    retrunHtml += '<span class="btn_ss btn_divTag">주교재</span>';
                                                        retrunHtml += '<a href="#" class="learnName">'+ lecBook.bookName +'</a>';
                                                    retrunHtml += '<span class="learnNum">저자 <b class="colorBlue">'+ lecBook.writer +'</b> | 출판 <b class="colorBlue">' + lecBook.publishDate + '</b></span>';
                                                retrunHtml += '</li>';
                                                retrunHtml += '<li class="w40p alignRight">';
                                                    retrunHtml += '<ul class="costList">';
                                                        retrunHtml += '<li>';
                                                            retrunHtml += '<b class="cost">'+ lecBook.priceName +'원</b> <input type="checkbox" name="" value="">';
                                                            retrunHtml += '<a href="#" class="btn_s">장바구니</a>';
                                                            retrunHtml += '<a href="#" class="btn_s on">바로구매</a>';
                                                        retrunHtml += '</li>';
                                                    retrunHtml += '</ul>';
                                                 retrunHtml += '</li>';
                                retrunHtml += '</div>';
                                $("#lectureBody").append(retrunHtml);

                            }
                        }
                    } /* //교재 끝 */
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