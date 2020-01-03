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
                    if((str[0]+ "").length < 2) {
                        var time =  "0" +  cmpList.reserveTimeName;
                    }else {
                        var time =  cmpList.reserveTimeName;
                    }

                    if(cmpList.reservedYn == true){
                        var returnHtml = "<li><a href='javascript:setTime(0,0);'>"+ time +"</a></li>";
                    }else{
                        var returnHtml = "<li><a href='javascript:setTime("+ selList[i].reserveTimeKey +","+ '"'+ time +'"' +");' id='"+ selList[i].reserveTimeKey +"'>"+ cmpList.reserveTimeName +"</a></li>";
                    }
                    $("#morning").append(returnHtml);
                }else{
                    if(cmpList.reservedYn == true){
                        var returnHtml = "<li><a href='javascript:setTime(0,0);'>"+ time +"</a></li>";
                    }else{
                        var returnHtml = "<li><a href='javascript:setTime("+ selList[i].reserveTimeKey +","+ '"'+ time +'"' +");' id='"+ selList[i].reserveTimeKey +"'>"+ cmpList.reserveTimeName +"</a></li>";
                        console.log(returnHtml);
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