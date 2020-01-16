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

//직렬별 메인 대 배너 불러오기
function getMainBigBanner(tagId, ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='"+ data.targetUrl +"'><img src='"+ data.fullFileUrl +"' alt=''></a>"
        }, {escapeHtml: false});
    }
    kiplayer.sliderBx($("#" + tagId));
}

//직렬별 메인 옆 미니배너 불러오기
function getMainMiniBanner(tagId, ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='"+ data.targetUrl +"'><img src='"+ data.fullFileUrl +"' alt=''></a>"
        }, {escapeHtml: false});
    }
    kiplayer.sliderBx($("#" + tagId));
}

function getMainreviewBanner(tagId, ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='"+ data.targetUrl +"'><img src='"+ data.fullFileUrl +"' alt=''></a>"
        }, {escapeHtml: false});
    }
}

//최하단 배너
function getMainBottomBanner(ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList != null) {
        var selList = bannerInfoList.result;
        $("#ABottomBanner1").attr("href", selList[1].targetUrl == null ? "#" : selList[1].targetUrl);
        $("#bottomBanner1").attr("src", selList[1].fullFileUrl);
    }else{
        return;
    }
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
            $("#eventBanner" + i).attr("src", cmpList.fullFileUrl);
            $("#eventBannerHref" + i).attr("href", cmpList.targetUrl);
        }
    }
}

//index 페이지 - 메인 대 배너s
/*
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
*/


//행적직 온라인 - 대배너
/*
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
 */

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
        for(var i = 0; i < selList.length; i++) {
            var cmpList = selList[i];
            var retrunHtml = "<div class='swiper-slide'>";
            retrunHtml += '<div>';
            retrunHtml += "<span class='category'>"+ cmpList.subjectName + "</span>" + "<b>"+ cmpList.teacherName + "</b>";
            retrunHtml += "<span class='thumb'><img src='"+ cmpList.teacherImageUrl +"' alt='' style='width: 100px;height: 140px'></span>";
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            $("#teacherList1").append(retrunHtml);
        }
        var galleryThumbs1 = new Swiper('#mainTeacherTab1 .mainTeacherTitle', {
            spaceBetween:0,
            slidesPerView:6,
            loop:true,
            freeMode:true,
            loopedSlides:7, //looped slides should be the same
            watchSlidesVisibility:true,
            watchSlidesProgress:true,
        });
        var galleryTop1 = new Swiper('#mainTeacherTab1 .mainTeacherPage', {
            spaceBetween:0,
            loop:true,
            loopedSlides:7, //looped slides should be the same
            navigation:{
                nextEl:'#mainTeacherTab1 .swiper-button-next',
                prevEl:'#mainTeacherTab1 .swiper-button-prev',
            },
            thumbs:{
                swiper:galleryThumbs1,
            },
        });
        $(window).resize(function(){
        });
        $(window).scroll(function(){
        });
    }
}

//공통과목 교수진 페이지
function getTeacherPageList(tagId, ctgKey, subjectType) {
    var data = {
        subjectType : subjectType
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);
    if (infoList.result.length > 0) {

        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++) {
            var cmpList = selList[i];

            var retrunHtml = "<div class=\"swiper-slide\">";
            retrunHtml += '<div>';
            retrunHtml += '<div class="thumb"><span><img src="'+ cmpList.teacherImageUrl +'" alt=""></span></div>';
            retrunHtml += '<div class="teacherInfo">';
            retrunHtml += '<span class="category">'+ cmpList.subjectName +'</span>';
            retrunHtml += '<b>'+ cmpList.teacherName +'</b>';
            retrunHtml += '<span class="btnArea">';
            retrunHtml += '<a href="#"><img src="/common/zian/images/common/icon_home.png" alt=""> 교수홈</a>';
            retrunHtml += '<a href="#"><img src="/common/zian/images/common/icon_review.png" alt=""> 수강후기</a>';
            retrunHtml += '</span>';
            retrunHtml += '<span class="desc">';
            retrunHtml += '<b>약력</b>';
            retrunHtml += cmpList.teacherInfo.history+'<br />';
            retrunHtml += '</span>';
            if(cmpList.teacherInfo.bookWriting != null){
                retrunHtml += '<span class="desc">';
                retrunHtml += '<b>저서</b>';
                retrunHtml += cmpList.teacherInfo.bookWriting +'<br />';
                retrunHtml += '</span>';
            }
            retrunHtml += '</span>';
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            $("#teacherPage1").append(retrunHtml);
        }
    }
}

//강사(지안교수진) 배너 리스트 [ 전공과목 교수진 ]
function getMajorTeacherBannerList(tagId, ctgKey, subjectType) {
    var data = {
        subjectType : subjectType
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for (var i = 0; i < selList.length; i++) {
            var cmpList = selList[i];
            var retrunHtml = "<div class='swiper-slide'>";
            retrunHtml += '<div>';
            retrunHtml += "<span class='category'>" + cmpList.subjectName + "</span>" + "<b>" + cmpList.teacherName + "</b>";
            retrunHtml += "<span class='thumb'><img src='" + cmpList.teacherImageUrl + "' alt='' style='width: 100px;height: 140px'></span>";
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            $("#teacherList2").append(retrunHtml);
        }
    }
    var galleryThumbs2 = new Swiper('#mainTeacherTab2 .mainTeacherTitle', {
        spaceBetween:0,
        slidesPerView:6,
        loop:true,
        freeMode:true,
        loopedSlides:7, //looped slides should be the same
        watchSlidesVisibility:true,
        watchSlidesProgress:true,
    });
    var galleryTop2 = new Swiper('#mainTeacherTab2 .mainTeacherPage', {
        spaceBetween:0,
        loop:true,
        loopedSlides:7, //looped slides should be the same
        navigation:{
            nextEl:'#mainTeacherTab2 .swiper-button-next',
            prevEl:'#mainTeacherTab2 .swiper-button-prev',
        },
        thumbs:{
            swiper:galleryThumbs2,
        },
    });
}

function getMajorTeacherPageList(tagId, ctgKey, subjectType) {
    var data = {
        subjectType : subjectType
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);
    if (infoList.result.length > 0) {

        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++) {
            var cmpList = selList[i];

            var retrunHtml = "<div class=\"swiper-slide\">";
            retrunHtml += '<div>';
            retrunHtml += '<div class="thumb"><span><img src="'+ cmpList.teacherImageUrl +'" alt=""></span></div>';
            retrunHtml += '<div class="teacherInfo">';
            retrunHtml += '<span class="category">'+ cmpList.subjectName +'</span>';
            retrunHtml += '<b>'+ cmpList.teacherName +'</b>';
            retrunHtml += '<span class="btnArea">';
            retrunHtml += '<a href="#"><img src="/common/zian/images/common/icon_home.png" alt=""> 교수홈</a>';
            retrunHtml += '<a href="#"><img src="/common/zian/images/common/icon_review.png" alt=""> 수강후기</a>';
            retrunHtml += '</span>';
            retrunHtml += '<span class="desc">';
            retrunHtml += '<b>약력</b>';
            retrunHtml += cmpList.teacherInfo.history+'<br />';
            retrunHtml += '</span>';
            if(cmpList.teacherInfo.bookWriting != null) {
                retrunHtml += '<span class="desc">';
                retrunHtml += '<b>저서</b>';
                retrunHtml += cmpList.teacherInfo.bookWriting + '<br />';
                retrunHtml += '</span>';
            }
            retrunHtml += '</span>';
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            retrunHtml += '</div>';
            $("#teacherPage2").append(retrunHtml);
        }
    }


}

//leftMenu D-day 리스트 불러오기
function getExamScheduleList(tagId) {
    var infoList = getApi("/banner/getExamScheduleList","" ,"");
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        console.log(selList);
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<span>"+ data.title +"</span>"+
                "<b>" + data.dday + "</b>"+
                "<a href=\"#\">상세정보</a>";
        }, {escapeHtml: false});
    }
    if($(".slider.useBx").length > 0){
        $(".slider.useBx").each(function(){
            kiplayer.sliderBx($(this).children("ul"));
        });
    }
    $(".bx-viewport ul").each(function(){
        $(this).find("li a").focus(function(){
            alert(1);
            //$(this).parents(".bx-wrapper").eq(0).find(".bx-stop").trigger("click");
            var slideNo = $(this).parent().index();
            if(slideNo < $(this).parent().parent().children("li").length - 3){
                var sliderNo = parseInt($(this).parent().parent().attr("data-sliderNo"));
                sliderItem[sliderNo].goToSlide(slideNo);
                console.log(sliderNo+"|"+slideNo);
            }
        });
    });
}

//커뮤니티 리스트
function getRandingBannerList(ctgKey, listNum) {
    var data = {
        listNumber : listNum
    };
    var bannerInfoList = getApi("/banner/getMainMiniBanner/", ctgKey , data);
    if (bannerInfoList.result.length > 0) {
        var selList = bannerInfoList.result;
        for (var i=0; i<3; i++) {
            $("#mainBanner" + i).attr("src", selList[i].fullFileUrl);
            $("#mainBannerHref" + i).attr("href", selList[i].targetUrl);
        }
    }
}
