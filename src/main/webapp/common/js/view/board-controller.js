//게시판 글 저장
function saveBoard(bbsMasterKey, userKey, title, content, isSecret, ctgKey, fileName) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if(userKey == null || userKey == undefined) return;

    var data = {
        bbsMasterKey : bbsMasterKey,
        userKey : userKey,
        title : title,
        content : content,
        isSecret : isSecret,
        ctgKey :  ctgKey,
        fileName : fileName
    };
    var result = postApi("/board/saveBoard", data);
    return result;
}

//게시판 파일 다중 저장
function saveBoardFileList(bbsKey, fileName) {
    if(bbsKey == null || bbsKey == undefined) return;

    var data = {
        bbsKey : bbsKey,
        fileName : fileName
    };
    var result = postApi("/board/saveBoardFileList", data);
    return result;
}

//강사 게시판 글 저장
function saveTeacherBoard(bbsMasterKey, teacherKey, userKey, title, content, isNotice, isSecret, fileName) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if(userKey == null || userKey == undefined) return;
    if(teacherKey == null || teacherKey == undefined) return;

    var data = {
        bbsMasterKey : bbsMasterKey,
        teacherKey: teacherKey,
        userKey : userKey,
        title : title,
        content : content,
        isNotice : isNotice,
        isSecret : isSecret,
        fileName : fileName
    };
    var result = postApi("/board/saveTeacherBoard", data);
    return result;
}

//게시판 글 수정
function updateBoard(bbskey, title, content, isSecret, fileName) {
    if(bbskey == null || bbskey == undefined) return;
    var data = {
        bbsKey : bbskey,
        title : title,
        content : content,
        isSecret : isSecret,
        fileName : fileName
    };
    var result = postApi("/board/updateBoard", data);
    return result;
}

//게시판 상세정보(공지,커뮤니티)
function getBoardDetailInfo(bbsMasterKey, bbsKey) {
    if (bbsKey == null || bbsKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var InfoList = getApi("/board/getBoardDetailInfo/", bbsMasterKey, data);
    var result = InfoList.result;
    if(result != undefined){
       return result;
    }else{
        alert("오류가 발생했습니다. 관리자 문의 바랍니다.");
        return;
    }

}

//게시판 답글 삭제
function deleteBoard(bbsCommentKey) {
    if (bbsCommentKey == null || bbsCommentKey == undefined) return;

    var data = {
        bbsCommentKey : bbsCommentKey
    };
    if(confirm(comment.isDelete)){
        var result = postApi("/board/deleteBoard", data);
        /*
            TODO : result 값으로 alert
         */
    }
}


//커뮤니티 리스트
function getCommunityList(bbsMaterKey, sPage, listLimit) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var InfoList = getApi("/board/getCommunityList/", bbsMaterKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        $("#movieBanner0").attr("src", selList[0].fileUrl);
        $("#movieBanner1").attr("src", selList[1].fileUrl);
    }
}

function getCommunityList2(bbsMaterKey, sPage, listLimit, searchType, searchText) {
    if(bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/board/getCommunityList/", bbsMaterKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
       // if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return listNum--;},
                        function(data) {return "<a href='javascript:void(0);' onclick='detailEvent("+ cmpList.bbsKey +");'>" + cmpList.title + "</a>";},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                }
            }
     //   }
    }
}

function getCommunityList3(bbsMaterKey, sPage, listLimit, searchType, searchText) {
    if(bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/board/getCommunityList/", bbsMaterKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        // if (infoList.result.length > 0) {
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return listNum--;},
                    function(data) {return "<a href='javascript:goDetailReview("+ cmpList.bbsKey +");'>"+ cmpList.title +"</a>";},
                    function(data) {return cmpList.userName;},
                    function(data) {return cmpList.indate;},
                    function(data) {return cmpList.readCount;}
                ];
                dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                $('#dataList tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                });
            }
        }
        //   }
    }
}

//공지사항 리스트
function getNoticeList(sPage, listLimit, bbsMaterKey, searchType, searchText) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();

    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/board/getNoticeList/", bbsMaterKey, data);
    var cnt = infoList.cnt;
    paging.count(sPage, cnt, '10', '10', comment.blank_list);
    if (infoList.result.length > 0) {

        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.isNotice == 1 ?  "<img src=\"/common/zian/images/common/icon_notice.png\" alt=\"\">"  : listNum--;},
                    function(data) {return "<a href='javascript:void(0);' onclick='goDetailNotice("+ cmpList.bbsKey +");'>" + gfn_substr(cmpList.title, 0, 40) + "</a>";},
                    function(data) {return cmpList.writerName;},
                    function(data) {return cmpList.createDate;},
                    function(data) {return cmpList.readCount;},
                    function(data) {return cmpList.isNotice == 1 ?  "1"  : "0";}
                ];
                dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                $('#dataList tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                    tr.children().eq(5).attr("style", "display:none");
                    if(tr.children().eq(5).text() == 1){
                        tr.attr("class", "notice");
                    }
                });
            }
        }
    }
}

function getNoticeList2(sPage, listLimit, bbsMaterKey, searchType, searchText) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();

    dwr.util.removeAllRows("dataList1"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/board/getNoticeList/", bbsMaterKey, data);
    var cnt = infoList.cnt;
    if (infoList.result.length > 0) {
        paging.count2(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.isNotice == 1 ?  "<img src=\"/common/zian/images/common/icon_notice.png\" alt=\"\">"  : listNum--;},
                    function(data) {return "<a href='javascript:void(0);' onclick='goQuestionDetail("+ cmpList.bbsKey +");'>" + gfn_substr(cmpList.title, 0, 40) + "</a>";},
                    function(data) {return cmpList.writerName;},
                    function(data) {return cmpList.createDate;},
                    function(data) {return cmpList.readCount;},
                ];
                dwr.util.addRows("dataList1", [0], cellData, {escapeHtml: false});
                $('#dataList1 tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                });
            }
        }
    }
}

//공지사항 리스트
function getNoticeList3(sPage, listLimit, bbsMaterKey, searchType, searchText) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();

    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/board/getNoticeList/", bbsMaterKey, data);
    var cnt = infoList.cnt;
    if (infoList.result.length > 0) {
        paging.count(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return cmpList.isNotice == 1 ?  "<img src=\"/common/zian/images/common/icon_notice.png\" alt=\"\">"  : listNum--;},
                    function(data) {return "<a href='javascript:void(0);' onclick='goTeacherDetail("+ cmpList.bbsKey +");'>" + gfn_substr(cmpList.title, 0, 40) + "</a>";},
                    function(data) {return cmpList.writerName;},
                    function(data) {return cmpList.createDate;},
                    function(data) {return cmpList.readCount;},
                ];
                dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                $('#dataList tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                });
            }
        }
    }
}

//배너 공지사항 리스트
function getBannerNoticeList(tagId, sPage, listLimit, bbsMaterKey) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var InfoList = getApi("/board/getBannerNoticeList/", bbsMaterKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        var tagStr = '"'+ tagId +'"';
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='javascript:detailReview("+ data.bbsKey +","+ tagStr +");'>"+ ellipsis(data.title,28) +"<span class='date'>" + data.createDate + "</span></a>"
        }, {escapeHtml: false});
    }
}

//배너 공지사항 리스트
function getBannerNoticeList2(tagId, sPage, listLimit, bbsMaterKey) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };

    var InfoList = getApi("/board/getBannerNoticeList/", bbsMaterKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        var tagStr = '"'+ tagId +'"';
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='javascript:goDetailNotice2("+ data.bbsKey +","+ tagStr +");'>"+ ellipsis(data.title,28) +"<span class='date'>" + data.createDate + "</span></a>"
        }, {escapeHtml: false});
    }
}

//합격후기 리스트 불러오기
function getPassReviewList(tagId, reviewType, listLimit) {
    var data = {
        listLimit : listLimit
    };
    var infoList = getApi("/board/getReviewList/", reviewType, data);
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        var i =0;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='#'>"+ ellipsis(data.title,25) +"<span class='date'>"+ data.createDate +"</span></a>"
        }, {escapeHtml: false});
    }
    initSliderOption2("passLatestList");
}

//수강후기 리스트 불러오기
function getLecReviewList(tagId, reviewType, listLimit) {
    var data = {
        listLimit : listLimit
    };
    var infoList = getApi("/board/getReviewList/", reviewType, data);

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href='#'>"+ ellipsis(data.title,25) +"<span class='date'>"+ data.createDate +"</span></a>"
        }, {escapeHtml: false});
    }
    initSliderOption2("lecLatestList");
}

//강의실 배정표 리스트
function getLectureRoomTableList(yyyymmdd) {
   var infoList =  getApi("/board/getLectureRoomTableList/", yyyymmdd, "");
   return infoList;
}

//강의실 배정표 저장
function saveLectureRoomTabel(academyNumber, lectureDate, fileName) {
    if(academyNumber == null || academyNumber == undefined) return;
    if(lectureDate == null || lectureDate == undefined) return;

    var data = {
        lectureDate : lectureDate,
        academyNumber : academyNumber,
        fileName : fileName
    };
    var result = postApi("/board/saveLectureRoomTable", data);
    return result;
}

//bbsMasterKey
function getBbsMasterKey() {
    var bbsmasterKey = '';
    var noticeHeaderInfo = sessionStorage.getItem('noticeHeader');
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline" || leftMenuInfo == "publicAcademy"){//행정직 온라인, 행정직학원
        if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
        else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
        else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
        else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
        else if(noticeHeaderInfo == "mockNotice") bbsmasterKey = "11049";//
        else if(noticeHeaderInfo == "scoreAnnounce") bbsmasterKey = "11050";//
        else bbsmasterKey = "10057";//온라인서점
    }else if(leftMenuInfo == "techOnline" || leftMenuInfo == "techAcademy"){//기술직 온라인. 기술직학원
        if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10026";
        else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10027";
        else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10030";
        else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
        else if(noticeHeaderInfo == "mockNotice") bbsmasterKey = "11049";//
        else if(noticeHeaderInfo == "scoreAnnounce") bbsmasterKey = "11050";//
        else bbsmasterKey = "10057";
    }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){//계리직 온라인. 계리직 학원
        if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10041";
        else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10042";
        else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10044";
        else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
        else if(noticeHeaderInfo == "mockNotice") bbsmasterKey = "11049";//
        else if(noticeHeaderInfo == "scoreAnnounce") bbsmasterKey = "11050";//
        else bbsmasterKey = "10057";
    }else{
        if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10026";
        else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10027";
        else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10030";
        else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
        else if(noticeHeaderInfo == "mockNotice") bbsmasterKey = "11049";//
        else if(noticeHeaderInfo == "scoreAnnounce") bbsmasterKey = "11050";//
        else bbsmasterKey = "10057";
    }
    return bbsmasterKey;
}

function saveBoardComment(bbsKey, userKey, comment) {
    if(bbsKey == null || bbsKey == undefined) return;
    if(userKey == null || userKey == undefined) return;

    var data = {
        bbsKey : bbsKey,
        userKey : userKey,
        comment : comment
    };
    var result = postApi("/board/saveBoardComment", data);
    return result;
}

function saveBoardReply(bbsMasterKey, bbsParentKey, userKey, title, content, isSecret) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if(bbsParentKey == null || bbsParentKey == undefined) return;
    if(userKey == null || userKey == undefined) return;

    var data = {
        bbsMasterKey : bbsMasterKey,
        bbsParentKey : bbsParentKey,
        userKey : userKey,
        title : title,
        content : content,
        isSecret : isSecret
    };
    var result = postApi("/board/saveBoardReply", data);
    return result;
}

function saveBoardByAlliance(bbsMasterKey, title, content) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    var data = {
        bbsMasterKey : bbsMasterKey,
        title : title,
        content : content
    };
    var result = postApi("/board/saveBoardByAlliance", data);
    return result;
}

function updateBoardByAlliance(bbsKey, title, content) {
    if(bbsKey == null || bbsKey == undefined) return;
    var data = {
        bbsKey : bbsKey,
        title : title,
        content : content
    };
    var result = postApi("/board/updateBoardByAlliance", data);
    return result;
    
}

function getPasserVideoList(sPage, listLimit, searchType, searchText) {
    var paging = new Paging();
    dwr.util.removeAllOptions('dataList');

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/board/getPasserVideoList/", '', data);
    var cnt = infoList.cnt;
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            function formatter(cmpList) {
                var gopageName = '"detailLecture"';
                return ""+
                    "<a href='javascript:void(0);'><img src='"+ cmpList.fileUrl +"' width=\"100%\"></a>"+
                    "<a href='javascript:detailReview("+ cmpList.bbsKey +","+ gopageName +")'><sapn class='thumb'>"+  gfn_substr(cmpList.title, 0, 12) +"</span></a>"+
                    "";
            }
        }
        dwr.util.addOptions('dataList', selList, formatter, {escapeHtml:false});
    }
}

//합격수기 > 합격수기,도서후기,수강후기
function getReviewBoardList(bbsMasterKey, sPage, listLimit, searchType, searchText, gKey) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if (gKey == undefined) gKey = "";
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText,
        gKey : gKey
    };
    var infoList = getPageApi("/board/getReviewBoardList/", bbsMasterKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        if (infoList.result.length > 0) {
            var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
            var selList = infoList.result;
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return listNum--;},
                        function(data) {return "<a href='javascript:detailReview("+ cmpList.bbsKey +");'>"+ cmpList.title +"</a>";},
                        function(data) {return cmpList.userName;},
                        function(data) {return cmpList.indate;},
                        function(data) {return cmpList.readCount;}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                    $('#dataList tr').each(function(){
                        var tr = $(this);
                        tr.children().eq(1).attr("class", "left");
                    });
                }
            }
        }
    }
}

//합격수기 > 합격자영상 리스트
function getPasserVideoListFromReview(bbsMasterKey, sPage, listLimit, searchType, searchText) {
    var paging = new Paging();
    dwr.util.removeAllOptions('dataList');
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/board/getPasserVideoListFromReview/", bbsMasterKey, data);
    var cnt = infoList.cnt;
    //if (infoList.result.length > 0) {
        var selList = infoList.result;
        paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            function formatter(cmpList) {
                return ""+
                    "<div class=\"fthub\"><a href='javascript:void(0);'><img src='"+ cmpList.fileUrl +"'></a></div>"+
                    "<a href='javascript:detailReview("+ cmpList.bbsKey +")'><sapn class='thumb'>"+ gfn_substr(cmpList.title, 0, 12) +"</span></a>";
            }
        }
        dwr.util.addOptions('dataList', selList, formatter, {escapeHtml:false});
    //}
}

//합격자영상 bbsmasterkey
function getReviewMasterKey() {
    var bbsMasterKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        bbsMasterKey = 11045;
    }else if(leftMenuInfo == "publicAcademy"){
        bbsMasterKey = 11045;
    }else if(leftMenuInfo == "techOnline"){
        bbsMasterKey = 10970;
    }else if(leftMenuInfo == "techAcademy"){
        bbsMasterKey = 10970;
    }else if(leftMenuInfo == "postOnline"){
        bbsMasterKey = 11047;
    }else if(leftMenuInfo == "postAcademy"){
        bbsMasterKey = 11047;
    }else{
        bbsMasterKey = 10970;
    }
    return bbsMasterKey;
}

//합격수기 > bbsmasterKey
function getPassReviewMasterKey() {
    var bbsMasterKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        bbsMasterKey = 10013;
    }else if(leftMenuInfo == "publicAcademy"){
        bbsMasterKey = 10013;
    }else if(leftMenuInfo == "techOnline"){
        bbsMasterKey = 10032;
    }else if(leftMenuInfo == "techAcademy"){
        bbsMasterKey = 10032;
    }else if(leftMenuInfo == "postOnline"){
        bbsMasterKey = 10048;
    }else if(leftMenuInfo == "postAcademy"){
        bbsMasterKey = 10048;
    }else{
        bbsMasterKey = 10032;
    }
    return bbsMasterKey;
}


function getLecReviewMasterKey() {
    var bbsMasterKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        bbsMasterKey = 10015;
    }else if(leftMenuInfo == "publicAcademy"){
        bbsMasterKey = 10014;
    }else if(leftMenuInfo == "techOnline"){
        bbsMasterKey = 10034;
    }else if(leftMenuInfo == "techAcademy"){
        bbsMasterKey = 10033;
    }else if(leftMenuInfo == "postOnline"){
        bbsMasterKey = 10049;
    }else if(leftMenuInfo == "postAcademy"){
        bbsMasterKey = 10056;
    }else{
        bbsMasterKey = 10034;
    }
    return bbsMasterKey;
}

function getBookReviewMasterKey() {
    var bbsMasterKey = '';
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo == "publicOnline"){
        bbsMasterKey = 10016;
    }else if(leftMenuInfo == "publicAcademy"){
        bbsMasterKey = 10016;
    }else if(leftMenuInfo == "techOnline"){
        bbsMasterKey = 10035;
    }else if(leftMenuInfo == "techAcademy"){
        bbsMasterKey = 10035;
    }else if(leftMenuInfo == "postOnline"){
        bbsMasterKey = 10050;
    }else if(leftMenuInfo == "postAcademy"){
        bbsMasterKey = 10050;
    }else{
        bbsMasterKey = 10035;
    }
    return bbsMasterKey;
}

//게시판 글 저장
function saveBoardReview(bbsMasterKey, userKey, title, content, isSecret, ctgKey, fileName, youtubeHtml, gKey, successSubject, lectureSubject) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if(userKey == null || userKey == undefined) return;

    var data = {
        bbsMasterKey : bbsMasterKey,
        userKey : userKey,
        title : title,
        content : content,
        isSecret : isSecret,
        ctgKey :  ctgKey,
        fileName : fileName,
        youtubeHtml : youtubeHtml,
        gKey : gKey,
        successSubject : successSubject,
        lectureSubject : lectureSubject
    };
    var result = postApi("/board/saveBoardReview", data);
    return result;
}

//수기글 수정
function updateBoardReview(bbsKey, title, content, isSecret, fileName, youtubeHtml, gKey, successSubject, lectureSubject) {
    var data = {
        bbsKey : bbsKey,
        title : title,
        content : content,
        isSecret : isSecret,
        fileName : fileName,
        youtubeHtml : youtubeHtml,
        gKey : gKey,
        successSubject : successSubject,
        lectureSubject : lectureSubject
    };
    var result = postApi("/board/updateBoardReview", data);
    return result;
}

function getReviewBoardCount(bbsMasterKey) {
    var infoList = getResultApi("/board/getReviewBoardCount/", bbsMasterKey, '');
    if(infoList != null){
        return infoList.keyValue;
    }
}

function deleteBoardFile(bbsFileKey) {
    // var data = {
    //     bbsFileKey : bbsFileKey
    // };
    var result = postPathApi("/board/deleteBoardFile/", bbsFileKey, '');
    return result;
}

function getFaQList(faqTypeKey, sPage, listLimit, searchType, searchText) {
    if (faqTypeKey == null || faqTypeKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/board/getFaQList/", faqTypeKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        // if (infoList.result.length > 0) {
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = infoList.result;
        paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return listNum--;},
                    function(data) {return "<a href='javascript:void(0);' onclick='detailOften("+ cmpList.bbsKey +");'>" + cmpList.ctgName + cmpList.title + "</a>";},
                ];
                dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                $('#dataList tr').each(function(){
                    var tr = $(this);
                    tr.children().eq(1).attr("class", "left");
                });
            }
        }
    }
}

function updateFaqBoard(bbsKey, faqTypeKey, title, content) {
    if(bbsKey == null || bbsKey == undefined) return;
    var data = {
        bbsKey : bbsKey,
        faqTypeKey : faqTypeKey,
        title : title,
        content : content
    };
    var result = postApi("/board/updateFaqBoard", data);
    return result;
}