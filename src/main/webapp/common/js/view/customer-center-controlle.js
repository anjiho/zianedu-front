//자주하는질문 세부목록 가져오기
function getOftenQuestionDetailList(ctgKey) {
    var infoList = getApi("/customerCenter/getOftenQuestionDetailList/",ctgKey ,"");
    $("#reQuestionSel").empty();
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i =0; i < selList.length;i++){
            var returnHtml = "<option value='"+ selList[i].bbsKey +"'>"+ selList[i].title +"</option>";
            $("#reQuestionSel").append(returnHtml);
        }
    }
}

function getReserveTime(reserveDate, reserveLocation) {
    var data ={
        reserveDate : reserveDate,
        reserveLocation : reserveLocation
    };
    var infoList = getApi("/customerCenter/getReserveTime/", '' ,data);
    if(infoList != null){
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList  = selList[i];
            if(cmpList.reserveTimeName){
                var str = gfn_split(cmpList.reserveTimeName, ':');
                if(str[0] >= 9 && str[0] <= 11){
                    var time = '';
                    if((str[0]+ "").length < 2) {
                         time =  "0" +  cmpList.reserveTimeName;
                    }else {
                         time =  cmpList.reserveTimeName;
                    }

                    if(cmpList.reservedYn == true){
                        var returnHtml = "<li><a href='javascript:setTime(0,0);'>"+ time +"</a></li>";
                    }else{
                        var returnHtml = "<li><a href='javascript:setTime("+ selList[i].reserveTimeKey +","+ '"'+ time +'"' +");' id='"+ selList[i].reserveTimeKey +"'>"+ time +"</a></li>";
                    }
                    $("#morning").append(returnHtml);
                }else{
                    if(cmpList.reservedYn == true){
                        var returnHtml = "<li><a href='javascript:setTime(0,0);'>"+ cmpList.reserveTimeName +"</a></li>";
                    }else{
                        var returnHtml = "<li><a href='javascript:setTime("+ selList[i].reserveTimeKey +","+ '"'+ cmpList.reserveTimeName +'"' +");' id='"+ selList[i].reserveTimeKey +"'>"+ cmpList.reserveTimeName +"</a></li>";
                    }
                    $("#afternoon").append(returnHtml);
                }
            }
        }
    }
}

function reserveConsult(data) {
    var result = postApi("/customerCenter/reserveConsult", data);
    return result;
}

function changeConsultReserveStatus(idxList, reserveStatusType) {
    var data = {
        idxList : idxList,
        reserveStatusType : reserveStatusType
    };
    var result = postApi("/customerCenter/changeConsultReserveStatus", data);
    return result;
    
}

function getConsultReserveList(userKey,reserveStartDate, reserveEndDate, sPage, listLimit) {
    if (userKey == null || userKey == undefined) return;
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        reserveStartDate : reserveStartDate,
        reserveEndDate : reserveEndDate,
        sPage : sPage,
        listLimit : listLimit
    };

    var infoList = getPageApi("/customerCenter/getConsultReserveList/", userKey, data);
    var cnt = infoList.cnt;
    paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return "<input type=\"checkbox\" name='consultChk' id='"+ cmpList.idx +"' class=\"ck4\">";},
                    function(data) {return cmpList.reserveLocationName;},
                    function(data) {return cmpList.reserveDate+"<br>"+ cmpList.reserveTimeName},
                    function(data) {return cmpList.userName;},
                    function(data) {return "<input type=\"button\" value='상세내용' id='"+ cmpList.idx +"'>";},
                    function(data) {return cmpList.consultStatusName;}
                ];
                dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
            }
        }
    }
}