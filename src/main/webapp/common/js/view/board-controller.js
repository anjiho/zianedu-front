//게시판 글 저장
function saveBoard(bbsMasterKey, userKey, title, content, isSecret, fileName) {
    if(bbsMasterKey == null || bbsMasterKey == undefined) return;
    if(userKey == null || userKey == undefined) return;

    var data = {
        bbsMasterKey : bbsMasterKey,
        userKey : userKey,
        title : title,
        content : content,
        isSecret : isSecret,
        fileName : fileName
    };
    var result = postApi("/board/saveBoard", data);
    return result;
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

    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    //gfn_emptyView("H", "");//페이징 예외사항처리

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };

    var InfoList = getPageApi("/board/getNoticeList/", bbsMaterKey, data);
    var cnt = InfoList.cnt;
    if (InfoList.result.length > 0) {
        paging.count(sPage, cnt, '10', '10', comment.blank_list);
        var listNum = ((cnt-1)+1)-((sPage-1)*10); //리스트 넘버링
        var selList = InfoList.result;
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
        /*dwr.util.addRows("dataList", selList, [
            function(data) {return listNum--;},
            function(data) {return "<a href='javascript:void(0);' onclick='goDetailNotice("+ data.bbsKey +");'>" + gfn_substr(data.title, 0, 37) + "</a>";},
            function(data) {return data.writerName;},
            function(data) {return data.createDate;},
            function(data) {return data.readCount;},
        ], {escapeHtml:false});*/
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
