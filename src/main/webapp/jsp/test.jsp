<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script type='text/javascript' src='/dwr/engine.js'></script>
<script type='text/javascript' src='/dwr/util.js'></script>
<script>
    function modifyBoard() {
        var check = new isCheck();
        if (check.input("title", comment.input_title) == false) return;
        if (check.input("content", comment.input_content) == false) return;

        /*var data = {
            bbsMasterKey : $("#bbsMasterKey").val(),
            userKey : $("#userKey").val(),
            title : $("#title").val(),
            content : $("#content").val(),
            isSecret : $("#isSecret").val(),
            fileName : ""
        };
       var test =  postApi("/board/saveBoard", data);
       console.log(test);*/
    }

    function boardList() {
        var data = {
            sPage : 1,
            listLimit : 20
        };

        var boardList = getApi("/board/getNoticeList/", "10025", data);

        if (boardList.result.length == 0) return;
        if (boardList.result.length > 0){
            var selList = boardList.result;
            dwr.util.addRows("dataList", selList, [
                function(data) {return data.bbsKey;},
                function(data) {return data.createDate;},
                function(data) {return data.title;},
                function(data) {return data.indate;}
            ], {escapeHtml:false});
        }
    }
</script>
        <div>
            <input type="hidden" name="bbsMasterKey" id="bbsMasterKey" value="10025">
            <input type="hidden" name="userKey" id="userKey" value="112629">
             제목11<input type="text" name="title" id="title">
             내용2<input type="text" name="content" id="content">
            <input type="text" name="isSecret" id="isSecret" value="1">
            <input type="text" name="fileName" value="" id="fileName">
            <button onclick="modifyBoard();">저장</button>
        </div>
        <div>
            <button onclick="boardList();">게시글가져오기</button>
        </div>
        <table>
            <thead>
                <th>bbsKey</th>
                <th>createDate</th>
                <th>title</th>
                <th>indate</th>
            </thead>
            <tbody id="dataList">
            </tbody>
        </table>
</body>
</html>
