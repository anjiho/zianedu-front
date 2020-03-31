<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            $(".mainStoryList").each(function(){
                kiplayer.sliderSlick($(this));
            });
            $(".slick-dots").hide();
            var pcMobile = divisionPcMobile();
            if(pcMobile == 'PC'){
                $('#writeContent').summernote({
                    height: 300,
                    minHeight: null,
                    maxHeight: null,
                    focus: true
                });
            } else {
                $('#content').attr("cols", 40);
                $('#content').attr("rows", 15);
            }

            $("#attachFile").on("change", addFiles);
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
    });

    var filesTempArr = [];
    function addFiles(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var filesArrLen = filesArr.length;
        var filesTempArrLen = filesTempArr.length;
        for( var i=0; i<filesArrLen; i++ ) {
            filesTempArr.push(filesArr[i]);
            $("#fileList").append("<div>" + filesArr[i].name + "<a href='javascript:void(0);' onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\">X</a></div>");
        }
        $(this).val('');
    }
    function deleteFile (eventParam, orderParam) {
        filesTempArr.splice(orderParam, 1);
        var innerHtmlTemp = "";
        var filesTempArrLen = filesTempArr.length;
        for(var i=0; i<filesTempArrLen; i++) {
            innerHtmlTemp += "<div>" + filesTempArr[i].name + "<a  href='javascript:void(0);' onclick=\"deleteFile(event, " + i + ");\">X</a></div>"
        }
        $("#fileList").html(innerHtmlTemp);
    }
    
   function saveReview() {
       var check = new isCheck();
       if (check.input("title", comment.input_title) == false) return;
       if($('textarea[name="writeContent"]').val() == ''){
           alert('서브제목을 입력해 주세요.');
           return false;
       }
       var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
       if (filesTempArr.length == 0) { //파일 없을때
           var title = getInputTextValue("title");
           var content = $('textarea[name="writeContent"]').val();
           var result = saveBoard(11030, sessionUserInfo.userKey, title, content, 0, 0, '');
           if (result.resultCode == 200) {
               alert("성공적으로 등록 완료되었습니다");
               return false;
           }
       } else {
           var formData = new FormData();
           for (var i = 0, filesTempArrLen = filesTempArr.length; i < filesTempArrLen; i++) {
               formData.append("files", filesTempArr[i]);
           }
           $.ajax({
               url: "http://52.79.40.214:9090/fileUpload/boardFileList",
               method: "post",
               dataType: "JSON",
               data: formData,
               cache: false,
               processData: false,
               contentType: false,
               success: function (data) {
                   if (data.resultCode == 200) {
                       var fileName = data.keyValue;
                       var title = getInputTextValue("title");
                       var content = $('textarea[name="writeContent"]').val();
                       var result = saveBoard(11030, sessionUserInfo.userKey, title, content, 0, 0, fileName);
                       var str = toStrFileName(fileName);
                       saveBoardFileList(result.keyValue, str);
                       if (result.resultCode == 200) {
                           alert("성공적으로 등록 완료되었습니다");
                           return false;
                       }
                   }
               }
           });
       }
   }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap" class="big">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/bigExamHeader.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="titleBar">
                    <h5>응시후기</h5>
                    <span>지안에듀 모의고사 완전 정복, 모의고사 응시후기를 작성해주세요!</span>
                </div>

                <div class="review_txt">
                    <p>수강생분들의 모의고사 응시후기를 알려주세요.</p>
                    <span>총<b>5</b>개의 합격자 영상이 있습니다. <br>지안에듀에서 실전 못지않은 모의고사 응시후기를 확인해보세요.</span>
                </div>
                <!--review_point : 응시후기 포인트-->
                <div class="review_point">
                    <p><span class="ico"></span>응시후기 포인트 지급안내</p>
                    <ul>
                        <li>1. 작성 시 무조건 <b>200P</b> 지급 (월 1회까지만 지급되며, 매달 추가 작성 가능)</li>
                        <li>2. BEST 선정 시 무려 <b>1000P </b>추가 지급!</li>
                    </ul>
                </div>

                <!-- 지안에듀 모의고사 BEST 응시후기 -->
                <div class="mainStory mainStorysub">
                    <div class="inner">
                        <div class="titleBar">
                            <h5>지안에듀 모의고사 BEST 응시후기</h5>
                        </div>
                        <br>
                        <div class="mainStoryList">
                            <div class="item"><div>
                                <span class="name">안성진<b>기술직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">김기한<b>전산직</b></span>
                                <b>기출문제</b>
                                <span class="desc">
								전년도에 비해 국어와 한국사가 어려워져서 걱정했지만 빠르고 짧게 필요한 것만 알려주시고 불필요한 내용은 과감히 지워주셨습니다. 기출문제가 매우 중요하여 인강으로 들으면서 시간.…
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">신예은<b>행정직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								항상 합격수기를 보면서 나도 빨리 합격하고 싶은 생각을 하였습니다. 정말 기쁩니다. 자격증없이 시작했기 때문에 먼저 자격증을 땄습니다. 기출문제를 풀고 주간 빅모의고사를 통해 약점을 보완하 …
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">안성진<b>기술직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								꿈꾸던 합격수기를 쓰게되어 더욱 새롭네요. 최종적인 단어로 요약하자면 ‘꾸준함 ! 실력보단 꾸준함이 중요하고 지안공무원에서 꾸준하게 공부할 수 있도록 도와주셔서 새로운 인생을 맞이하게 되었습니다. 화이팅 하세요
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">김기한<b>전산직</b></span>
                                <b>기출문제</b>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            </div></div>
                        </div>
                    </div>
                </div>

                <div class="boardWrap">
                    <h5>후기 등록하기</h5>
                    <div class="tableBox">
                        <table class="form">
                            <caption></caption>
                            <colgroup>
                                <col class="w130">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">제목</th>
                                <td><input type="text" id="title" placeholder="제목을 입력해주세요." class="w100p"></td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td><textarea id="writeContent" name="writeContent" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
<%--                                <td class="">--%>
<%--                                    <a href="#" class="btn_m gray w110">파일 업로드</a>--%>
<%--                                    <ul class="fileList">--%>
<%--                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.png</a></li>--%>
<%--                                        <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일002.png</a></li>--%>
<%--                                    </ul>--%>
<%--                                </td>--%>
                                <td class="">
                                    <label for="attachFile">파일 업로드</label>
                                    <input type="file" name="attachFile[]" id="attachFile" class="btn_m gray w110"  multiple/>
                                    <ul id='fileList' class="fileList"></ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:goPageNoSubmit('bigExam','bigReviewList')" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:saveReview();" class="btn_m radius w110">등록</a>
                    </div>
                </div>

                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
