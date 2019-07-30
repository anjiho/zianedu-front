//게시판 글 저장
function saveBoard(data) {

}


//게시판 글 수정
function updateBoard() {

}

//게시판 글 삭제
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
function getCommunityList(bbsMaterKey, tagId) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var InfoList = getApi("/banner/getCommunityList/", bbsMaterKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}


//공지사항 리스트
function getNoticeList(tagId, sPage, listLimit, bbsMaterKey) {
    if (bbsMaterKey == null || bbsMaterKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var InfoList = getApi("/board/getNoticeList/", bbsMaterKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            /*
            TODO :
             */
        }, {escapeHtml: false});
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
            return "<a href=''>"+ gfn_substr(data.title, 0, 27) +"<span class='date'>" + data.createDate + "</span></a>"
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
            return "<a href='#'>"+ gfn_substr(data.title,0,25) +"<span class='date'>"+ data.createDate +"</span></a>"
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
            return "<a href='#'>"+ gfn_substr(data.title,0,25) +"<span class='date'>"+ data.createDate +"</span></a>"
        }, {escapeHtml: false});
    }
    initSliderOption2("lecLatestList");
}
