//게시판 글 저장
function saveBoard(data) {

}


//게시판 글 수정
function updateBoard() {

}

//게 시판 글 삭제
function deleteBoard(bbsKey) {
    if (bbsKey == null || bbsKey == undefined) return;

    var data = {
        bbsKey : bbsKey
    };
    if(confirm(comment.isDelete)){
        var result = postApi("/board/deleteBoard", data);
        /*
            TODO : result 값으로 alert
         */
    }
}

//게시판 상세정보(공지,커뮤니티)
function getBoardDetailInfo(bbsKey, tagId) {
    if (bbsKey == null || bbsKey == undefined) return;
    var InfoList = getApi("/board/getBoardDetailInfo/", bbsKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//게시판 답글 저장
function saveBoardCommnet() {

}

//게시판 답글 수정
function updateBoardComment() {

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

//상품 리뷰 저장
function saveProductReview() {

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


//공지사항 리스트
function getNoticeList(sPage, listLimit, bbsMaterKey, searchType, searchText) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var paging = new Paging();
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var InfoList = getApi("/board/getNoticeList/", bbsMaterKey, data);

    if (InfoList.result.length > 0) {
        var cnt = InfoList.cnt;
        paging.count(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = InfoList.result;
        dwr.util.addRows("dataList", selList, [
            function(data) {return listNum;},
            function(data) {return "<a href='javascript:void(0);' onclick='goDetailNotice("+ data.bbsKey +");'>" + data.title + "</a>";},
            function(data) {return data.writerName;},
            function(data) {return data.indate;},
            function(data) {return data.readCount;},
        ], {escapeHtml:false});
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
        dwr.util.addOptions(tagId, selList, function (data) {
            return "<a href=''>"+ ellipsis(data.title,28) +"<span class='date'>" + data.createDate + "</span></a>"
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
