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

function getMainMiniBanner2(tagId, ctgKey, listNum) {
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
        for(var i = 0; i < selList.length; i++){
            var returnHtml = "<a href='"+ selList[i].targetUrl +"'><img src='"+ selList[i].fullFileUrl +"' alt=''></a>";
            $("#reviewBanner").append(returnHtml);
        }
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
        $("#ABottomBanner1").attr("href", selList[0].targetUrl == null ? "#" : selList[0].targetUrl);
        $("#bottomBanner1").attr("src", selList[0].fullFileUrl);
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

//강사(지안교수진) 배너 리스트 [ 공통과목 교수진 ]
function getTeacherBannerList(tagId, ctgKey, subjectType, teacherMenuCtgKey) {
    var data = {
        subjectType : subjectType,
        teacherMenuCtgKey : teacherMenuCtgKey
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
function getTeacherPageList(tagId, ctgKey, subjectType, teacherMenuCtgKey) {
    var data = {
        subjectType : subjectType,
        teacherMenuCtgKey : teacherMenuCtgKey
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++) {
            var returnHtml = '<div class="swiper-slide">';
            returnHtml += '<div class="text-box">';
            returnHtml += '        <div class="row1">';
            returnHtml += '      <span>'+ selList[i].subjectName +'</span>';
            returnHtml += '       </div>';
            returnHtml += '       <div class="row2">';
            returnHtml += '       <span>'+ selList[i].teacherName +'</span>';
            returnHtml += '        </div>';
            returnHtml += '       <div class="row3">';
            returnHtml += '       <span>쉽고 재미있는, 공무원 국어 마스터</span>';
            returnHtml += '    </div>';
            returnHtml += '    </div>';
            returnHtml += '   <div class="img-box">';
            returnHtml += '       <img src="'+ selList[i].teacherImageUrl +'" alt="" />';
            returnHtml += '        </div>';
            returnHtml += '      <div class="btn-box">';
            returnHtml += '      <div class="lf-menu"><a href="javascript:goTeacherDetail('+ selList[i].teacherKey +','+ selList[i].reqKey + ');">교수님 홈</a></div>';
            returnHtml += '    <div class="rh-menu"><a href="goPageNoSubmit(\'review\',\'lectureList\');">수강후기</a></div>';
            returnHtml += '   </div>';
            returnHtml += '     </div>';
            $("#teacherList").append(returnHtml);
        }
        var swiper = new Swiper(".swiper-container", {
            spaceBetween: 12,
            slidesPerView: 4,
            slidesPerColumn: 2,
            slidesPerGroup:4,
            /* loop: true, */
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            breakpoints: {
                800: {
                    slidesPerView: 4,
                    slidesPerColumn: 2
                },
                500: {
                    slidesPerView: 2,
                    slidesPerColumn: 2
                },
                100: {
                    slidesPerView: 2,
                    slidesPerColumn: 2
                }
            }
        });
    }
}

//강사(지안교수진) 배너 리스트 [ 전공과목 교수진 ]
function getMajorTeacherBannerList(tagId, ctgKey, subjectType, teacherMenuCtgKey) {
    var data = {
        subjectType : subjectType,
        teacherMenuCtgKey : teacherMenuCtgKey
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

function getMajorTeacherPageList(tagId, ctgKey, subjectType, teacherMenuCtgKey) {
    var data = {
        subjectType : subjectType,
        teacherMenuCtgKey: teacherMenuCtgKey
    };
    var infoList = getApi("/banner/getTeacherBannerList/", ctgKey, data);
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i = 0; i < selList.length; i++) {
            var returnHtml = '<div class="swiper-slide">';
                returnHtml += '<div class="text-box">';
                returnHtml += '        <div class="row1">';
                returnHtml += '      <span>'+ selList[i].subjectName +'</span>';
                returnHtml += '       </div>';
                returnHtml += '       <div class="row2">';
                returnHtml += '       <span>'+ selList[i].teacherName +'</span>';
                returnHtml += '        </div>';
                returnHtml += '       <div class="row3">';
                returnHtml += '       <span>쉽고 재미있는, 공무원 국어 마스터</span>';
                returnHtml += '    </div>';
                returnHtml += '    </div>';
                returnHtml += '   <div class="img-box">';
                returnHtml += '       <img src="'+ selList[i].teacherImageUrl +'" alt="" />';
                returnHtml += '        </div>';
                returnHtml += '      <div class="btn-box">';
                returnHtml += '      <div class="lf-menu"><a href="javascript:goTeacherDetail('+ selList[i].teacherKey +','+ selList[i].reqKey + ');">교수님 홈</a></div>';
                returnHtml += '    <div class="rh-menu"><a href="goPageNoSubmit(\'review\',\'lectureList\');">수강후기</a></div>';
                returnHtml += '   </div>';
            returnHtml += '     </div>';
            $("#teacherList").append(returnHtml);
        }
        var swiper = new Swiper(".swiper-container", {
            spaceBetween: 12,
            slidesPerView: 4,
            slidesPerColumn: 2,
            slidesPerGroup:4,
            /* loop: true, */
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            breakpoints: {
                800: {
                    slidesPerView: 4,
                    slidesPerColumn: 2
                },
                500: {
                    slidesPerView: 2,
                    slidesPerColumn: 2
                },
                100: {
                    slidesPerView: 2,
                    slidesPerColumn: 2
                }
            }
        });
    }
}

//leftMenu D-day 리스트 불러오기
function getExamScheduleList(tagId) {
    var infoList = getApi("/banner/getExamScheduleList","" ,"");
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<span>"+ data.title +"</span>"+
                "<b>" + data.dday + "</b>"+
                "<a href='javascript:goExamNotice();'>상세정보</a>";
        }, {escapeHtml: false});
    }
    if($(".slider.useBx").length > 0){
        $(".slider.useBx").each(function(){
            kiplayer.sliderBx($(this).children("ul"));
        });
    }
    $(".bx-viewport ul").each(function(){
        $(this).find("li a").focus(function(){
            //$(this).parents(".bx-wrapper").eq(0).find(".bx-stop").trigger("click");
            var slideNo = $(this).parent().index();
            if(slideNo < $(this).parent().parent().children("li").length - 3){
                var sliderNo = parseInt($(this).parent().parent().attr("data-sliderNo"));
                sliderItem[sliderNo].goToSlide(slideNo);
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
