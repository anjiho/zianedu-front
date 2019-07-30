//온라인 서점 중앙 이벤트 배너
function getBookStoreCenterBanner(tagId) {
    var infoList = getApi("/banner/getBookStoreCenterBanner","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//온라인서점 중앙 오른쪽 이벤트 배너
function getBookStoreCenterRightBanner(tagId) {
    var bannerInfoList = getApi("/banner/getBookStoreCenterRightBanner","" ,"");

    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//대 배너 밑 미니 배너
function getMainMiniBanner(tagId, ctgKey, listNum) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey, data);

    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;

        for (var i=0; i<selList.length; i++) {
            var cmpList = selList[i];
            $("#mainBanner" + i).attr("src", cmpList.fullFileUrl);
        }
    }
}

//행적직 온라인 - 대 배너 옆 미니배너 리스트 불러오기
function getPublicOnlineMainMiniBanner(tagId, ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='#'><img src='"+ data.fullFileUrl +"' alt=''></a>"
        }, {escapeHtml: false});
    }
    kiplayer.sliderBx($("#mainVisualSlider2"));
}

//헹정직 온라인 - 이벤트 배너
function getEventMiniBanner(tagId, ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;

        for (var i=0; i<selList.length; i++) {
            var cmpList = selList[i];
            console.log(cmpList);
            $("#eventBanner" + i).attr("src", cmpList.fullFileUrl);
        }
    }
}


//index 페이지 - 메인 대 배너
function getIndexMainBigBanner(tagId, titleTagId, listNum) {
    var bannerInfoList = getApi("/banner/getMainBigBanner/", listNum ,"");
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
            dwr.util.addOptions(tagId, selList, function (data) {
                return "<a href='#'><img src='"+ data.fullFileUrl +"' alt=''></a>"
            }, {escapeHtml: false});

            var i = 0;
            dwr.util.addOptions(titleTagId, selList, function (data) {
                return "<a href='#' data-slide-index='"+ i++ +"'>"+ data.title +"</a>"
            }, {escapeHtml: false});
    }
    initSliderOption1("visualSlider");
}

//행적직 온라인 - 대배너
function getMainBigBanner(tagId, listNum) {
    var bannerInfoList = getApi("/banner/getMainBigBanner/", listNum ,"");
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='#'><img src='"+ data.fullFileUrl +"' alt=''></a>"
        }, {escapeHtml: false});
    }
    kiplayer.sliderBx($("#mainVisualSlider1"));
    $(window).resize(function(){});
    $(window).scroll(function(){});
}

//메인페이지 최상단 배너
function getMainPageTopBanner(tagId) {
    var infoList = getApi("/banner/getMainPageTopBanner","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//배너 온라인 서점 리스트
function getOnlineBookList(tagId) {
    var infoList = getApi("/banner/getOnlineBookList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//패키지 강좌 리스트
function getPackageLectureList(tagId) {
    var infoList = getApi("/banner/getPackageLectureList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//학원인기강좌 리스트
function getPopulateAcademyLectureList(tagId) {
    var infoList = getApi("/banner/getPopulateAcademyLectureList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//동영상 인기강좌 리스트
function getPopulateVideoLectureList(tagId) {
    var infoList = getApi("/banner/getPopulateVideoLectureList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//직렬별 팝업 리스트
function getPopupList(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var infoList = getApi("/banner/getPopupList/", ctgKey,"");

    if (InfoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//인기 검색어 리스트
function getSearchKeywordList(className) {
    if (className == null || className == undefined) return;
    var searchKeywordList = getApi("/banner/getSearchKeywordList/", className,"");

    if (searchKeywordList.result.length > 0) {
        var selList = searchKeywordList.result;
        dwr.util.addRows("dataList", selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//강사(지안교수진) 배너 리스트 [ 공통과목 교수진 ]
function getTeacherBannerList(tagId, ctgKey, subjectType) {
    var data = {
        subjectType : subjectType
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);
    if (infoList.result.length > 0) {
        var selList = infoList.result;

        dwr.util.addOptions(tagId, selList, function (data) {
            return "<div>" +
                        "<span class=\"name\">"+ data.subjectName +"<span>"+ data.teacherName +"</span></span>"+
                        "<img src='"+ data.teacherImageUrl +"' alt=''>"+
                        "<a href='' class=\"btn_teacherHome\"><span class=\"icon\"></span>교수홈</a>"+
                        "<a href='' class=\"btn_teacherReview\"><span class=\"icon\"></span>수강후기</a>"+
                    "</div>"
        }, {escapeHtml: false});
    }
    initTeacherListBanner("teacherList");
    initTeacherListBanner1("teacherList1");
}

//강사(지안교수진) 배너 리스트 [ 전공과목 교수진 ]
function getMajorTeacherBannerList(tagId, ctgKey, subjectType) {
    var data = {
        subjectType : subjectType
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);

    if (infoList.result.length > 0) {
        var selList = infoList.result;

        dwr.util.addOptions(tagId, selList, function (data) {
            return "<div>" +
                "<span class=\"name\">"+ data.subjectName +"<span>"+ data.teacherName +"</span></span>"+
                "<img src='"+ data.teacherImageUrl +"' alt=''>"+
                "<a href='' class=\"btn_teacherHome\"><span class=\"icon\"></span>교수홈</a>"+
                "<a href='' class=\"btn_teacherReview\"><span class=\"icon\"></span>수강후기</a>"+
                "</div>"
        }, {escapeHtml: false});
    }
    initTeacherListBanner("majorTeacherList");
    initTeacherListBanner1("teacherList2");
}

//leftMenu D-day 리스트 불러오기
function getExamScheduleList(tagId) {
    var infoList = getApi("/banner/getExamScheduleList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<span>"+ data.title +"</span>"+
                "<b>" + data.dday + "</b>"+
                "<a href=\"#\">상세정보</a>";
        }, {escapeHtml: false});
    }
    initExamSlideBanner();
}
