//좌측 메뉴 리스트 가져오기
function getLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var infoList = getApi("/menu/getLeftMenu/", ctgKey,"");
    if (infoList.result.length > 0) {
        var selList = infoList.result;

        dwr.util.addOptions(tagId, selList, function (data) {
           return "<a href='javascript:getSubjectTeacherInfo("+ data.ctgKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}

//교수소개 좌측메뉴 가져오기
function getTeacherIntroduceLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTeacherIntroduceLeftMenu/", ctgKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        for(var i = 0 ; i <  selList.length; i++){
            var teacherList = selList[i].teacherList;
            dwr.util.addOptions(tagId, teacherList, function (data) {
                return "<div>"+
                            "<span class=\"category\">"+ data.subjectName +"</span>"+
                            "<b class=\"name\">"+ data.teacherName +"</b>"+
                            "<span class=\"thumb\"><img src='"+ data.teacherImage + "' alt=\"\"></span>"+
                            "<a href=\"#\" class=\"link_home\">교수홈</a>"+
                            "<a href=\"#\" class=\"link_comment\">수강후기</a>"+
                        "</div>";
            }, {escapeHtml: false});
        }
    }
}

//기술직동영상 > 지안패스 > 좌측 가져오기
function getTechVodZianPassLeftMenu(tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTechVodZianPassLeftMenu/", "","");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}