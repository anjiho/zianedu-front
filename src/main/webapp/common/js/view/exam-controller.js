//모의고사 상품 리스트 > 직렬선택
function getMockExamClassCtgSelectBoxList(onOffKey, tagId) {
    if (onOffKey == null || onOffKey == undefined) return;

    var infoList = getApi("/exam/getMockExamClassCtgSelectBoxList/", onOffKey, '');

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#"+tagId).append(returnHtml);
        }
    }
}

//모의고사 학원 상품 리스트 > 직렬선택
function getMockExamBuyClassCtgSelectBoxList(userKey, onOffKey, tagId) {
    if (onOffKey == null || onOffKey == undefined) return;
    var data = {
        onOffKey : onOffKey
    };

    var infoList = getApi("/exam/getMockExamBuyClassCtgSelectBoxList/", userKey, data);

    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#"+tagId).append(returnHtml);
        }
    }
}


//모의고사 상품 리스트 > 직렬선택
function getMockExamListAtBuy(userKey, onOffKey, sPage, listLimit, ctgKey, searchType, searchText, tagId) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    if(tagId == 'dataList'){
        dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    }else{
        dwr.util.removeAllRows("dataList2"); //테이블 리스트 초기화
    }
    var data = {
        onOffKey : onOffKey,
        sPage : sPage,
        listLimit : listLimit,
        ctgKey : ctgKey,
        searchType : searchType,
        searchText : searchText
    };

    var infoList = getPageApi("/exam/getMockExamListAtBuy/", userKey, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        var selList = infoList.result;
        if(tagId == 'dataList'){
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
        }else{
            paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
        }
        for(var  i=0; i < selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<tr>";
                    returnHtml += "<td>"+ cmpList.className +"</td>";
                    returnHtml += "<td>"+ cmpList.goodsName +"</td>";
                    returnHtml += "<td>"+ cmpList.acceptStartDate +"<br>~"+ cmpList.acceptEndDate +"</td>";
                    if(cmpList.acceptType == 0){//응시마감
                        returnHtml += "<td><a href='' class=''>응시마감</a></td>";
                    }else if(cmpList.acceptType == 1){//응시가능
                        returnHtml += "<td><a href='' class='small blue'>응시가능</a></td>";
                    }else{//응시완료
                        returnHtml += "<td><a href='' class='small bdgray'>응시완료</a></td>";
                    }
                    if(tagId == "dataList"){
                            returnHtml += "<td>";
                        if(cmpList.acceptType != 1){
                            returnHtml += "<ul class=\"fileList\">";
                                returnHtml += "<li><a href='"+ cmpList.printQuestionFileUrl +"' target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 문제지</a></li>";
                                returnHtml += "<li><a href='"+ cmpList.printCommentaryFileUrl +"'  target='_blank'><img src=\"/common/zian/images/common/icon_file.png\" alt=\"\"> 해설지</a></li>";
                            returnHtml += "</ul>";
                        }
                            returnHtml += "</td>";
                    }
            returnHtml += "</tr>";
            $("#"+tagId).append(returnHtml);
        }
    }
}