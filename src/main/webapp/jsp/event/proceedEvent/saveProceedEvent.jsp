<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {

    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox">
                    <ul>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li><a href="#">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 진행중이벤트-->
                <div class="boardWrap eventBoard">
                    <div class="boardWrap">
                        <h5>글 등록하기</h5>
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
                                    <td><input type="text" name="" placeholder="제목을 입력해주세요." class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">서브제목</th>
                                    <td><textarea name="" placeholder="내용을 입력해주세요." class="w100p h240"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">기간</th>
                                    <td>
                                        <div class="date_pick">
                                            <form name="form_reserve" id="form_reserve" action="/shop/mypage.html" method="GET">
                                                <input name="mypage_type" type="hidden" value="myreserve">
                                                <fieldset>
                                                    <legend>적립금 기간 검색 폼</legend>
                                                    <span class="key-wrap">
								                            <input name="" class="" id="" onclick="" type="text"  readonly="" value="2019-09-21">
								                            <img align="abmiddle" class="" onclick="" src="../images/content/btn_calendar.gif"> <span class="hyphen">~</span>
								                         	<input name="" class="" id="" onclick="" type="text" readonly="" value="2019-10-21">
								                        	<img align="" class="" onclick="" src="../images/content/btn_calendar.gif">
							                            </span>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">대상</th>
                                    <td><input type="text" name="" placeholder="" class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">상세URL</th>
                                    <td><input type="text" name="" placeholder="http://" class="w100p"></td>
                                </tr>
                                <tr>
                                    <th scope="row">썸네일</th>
                                    <td class="">
                                        <label for="ex_file">업로드</label>
                                        <input type="file" id="ex_file">
                                        <ul class="fileList">
                                            <li><a href="#"><img src="../images/common/icon_file.png" alt=""> 파일001.jpg</a></li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btnArea">
                            <a href="#" class="btn_m gray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                            <a href="#modal9" class="btn_m radius w110 btn_modalOpen">등록</a>
                        </div>
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