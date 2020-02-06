<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js' type='text/javascript'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.css'>
<script>
    $(document).ready(function () {
        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(0)").addClass('active');
            }else if(tabMenuInfo == "tabMenu2"){
                $("#tabHeader li ").each(function () {$(this).removeClass('active');});
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'gradeList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'examUseList');
            }
        });
    });

    function fn_search(val) {
        // var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        // var sPage = getInputTextValue("sPage");
        // var reserveStartDate =  getInputTextValue('searchStartDate');
        // var reserveEndDate =  getInputTextValue('searchEndDate');
        // if(val == "new") sPage = "1";
        // getConsultReserveList(sessionUserInfo.userKey, reserveStartDate, reserveEndDate, sPage, 10);
    }
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
                    <%@include file="/common/jsp/myPageHeader.jsp" %>
                    <div class="Mypage">
                        <div class="tabBox review coupon">
                            <ul id="tabHeader">
                                <li><a href="javascript:goPageNoSubmit('myPage','gradeList');">성적관리<span></span></a></li>
                                <li><a href="javascript:goPageNoSubmit('myPage','examUseList');">최근사용내역<span></span></a></li>
                            </ul>
                        </div>

                        <!--성적관리 -->
                        <div class=" grade reviewBoard">
                            <div class="tab_topContent tabContent">
                                <ul class="tabBar">
                                    <li class="active"><a href="#">학원모의고사(온)</a></li>
                                    <li><a href="#">학원모의고사(오프)</a></li>
                                    <li><a href="#">주간모의고사</a></li>
                                    <li><a href="#">기출문제</a></li>
                                </ul>
                                <div class="tabPage ">학원모의고사(온)</div>
                                <div class="tabPage ">학원모의고사(오프)</div>
                                <div class="tabPage">주간모의고사</div>
                                <div class="tabPage active">
                                    <!-- 수강중 -->
                                    <div class="tabPage  active">
                                        <form>
                                            <!--수정 및 추가 -->
                                            <ul class="searchArea floatnone">
                                                <li class="left">
                                                    <select>
                                                        <option>제목</option>
                                                    </select>
                                                    <input type="text">
                                                    <input type="submit" value="검색" class="btn_m on">
                                                    <a href="" class="search_ico">검색</a>
                                                </li>
                                                <li class="right ">
                                                    <select name="" class="w120">
                                                        <option value="">직렬선택</option>
                                                    </select>
                                                    <select name="" class="w120">
                                                        <option value="">급수선택</option>
                                                    </select>
                                                    <select name="" class="w120">
                                                        <option value="">과목선택</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table class="disnoneM">
                                                <colgroup>
                                                    <col>
                                                    <col width="380px">
                                                    <col width="180px">
                                                    <col>
                                                    <col>
                                                    <col width="100px">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th style="text-align: center;">직렬</th>
                                                    <th style="text-align: center;">모의고사명</th>
                                                    <th style="text-align: center;">응시기간</th>
                                                    <th style="text-align: center;">성적보기</th>
                                                    <th style="text-align: center;">오답노트</th>
                                                    <th style="text-align: center;">시험지</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>일반행정직</td>
                                                    <td>2019 제3회 일반행정직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="javascript:testPop1()" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">문제지</a>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">해설지</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>전산직</td>
                                                    <td>2019 제2회 전산직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">문제지</a>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">해설지</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <table class="disnonepc ltxt">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <span>일반행정직</span>
                                                        <p>2019 제3회 일반행정직 전과목 모의고사</p>
                                                        <span><b>응시기간 :</b> 2019.06.30 23:59~ 2019.06.30 23:59</span>
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- paging -->

                                        <!-- //paging -->
                                    </div>
                                    <div class="tabPage">
                                        <form>
                                            <ul class="searchArea">
                                                <li class="left">
                                                    <select>
                                                        <option>제목</option>
                                                    </select>
                                                    <input type="text">
                                                    <input type="submit" value="검색" class="btn_m on">
                                                </li>
                                                <li class="right"><select name="" class="w190">
                                                    <option value="">직렬선택</option>
                                                </select>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col width="380px">
                                                    <col width="180px">
                                                    <col>
                                                    <col>
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th>직렬</th>
                                                    <th>모의고사명</th>
                                                    <th>응시기간</th>
                                                    <th>성적보기</th>
                                                    <th>오답노트</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>일반행정직</td>
                                                    <td>2019 제3회 일반행정직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>전산직</td>
                                                    <td>2019 제2회 전산직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- paging -->
                                        <div class="paging">
                                            <div class="boardnavi">
                                                <a class="prev" href="#">이전 목록이동</a>
                                                <span>
											<strong class="selected">1</strong>
										</span>
                                                <a class="next" href="#">다음 목록이동</a>
                                            </div>
                                        </div>
                                        <!-- //paging -->
                                    </div>
                                    <div class="tabPage">
                                        <form>
                                            <ul class="searchArea">
                                                <li class="left">
                                                    <select>
                                                        <option>제목</option>
                                                    </select>
                                                    <input type="text">
                                                    <input type="submit" value="검색" class="btn_m on">
                                                </li>
                                                <li class="right"></li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col width="380px">
                                                    <col width="180px">
                                                    <col>
                                                    <col>
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th>직렬</th>
                                                    <th>모의고사명</th>
                                                    <th>응시기간</th>
                                                    <th>성적보기</th>
                                                    <th>오답노트</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>일반행정직</td>
                                                    <td>2019 제3회 일반행정직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>전산직</td>
                                                    <td>2019 제2회 전산직 전과목 모의고사</td>
                                                    <td>~ 2019.06.30 23:59<br>
                                                        ~ 2019.06.30 23:59
                                                    </td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- paging -->

                                        <!-- //paging -->
                                    </div>
                                    <div class="tabPage">
                                        <form>
                                            <ul class="searchArea">
                                                <li class="left">
                                                    <select>
                                                        <option>제목</option>
                                                    </select>
                                                    <input type="text">
                                                    <input type="submit" value="검색" class="btn_m on">
                                                </li>
                                                <li class="right">
                                                    <select name="" class="w120">
                                                        <option value="">직렬선택</option>
                                                    </select>
                                                    <select name="" class="w120">
                                                        <option value="">급수선택</option>
                                                    </select>
                                                    <select name="" class="w120">
                                                        <option value="">과목선택</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </form>
                                        <div class="tableBox">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col>
                                                    <col>
                                                    <col width="350px">
                                                    <col>
                                                    <col>
                                                    <col width="100px">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th>직렬</th>
                                                    <th>급수</th>
                                                    <th>과목</th>
                                                    <th>모의고사명</th>
                                                    <th>성적보기</th>
                                                    <th>오답노트</th>
                                                    <th>시험지</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>일반행정직</td>
                                                    <td>9급</td>
                                                    <td>영어</td>
                                                    <td>2019 제3회 일반행정직 전과목 모의고사</td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">문제지</a>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">해설지</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>일반행정직</td>
                                                    <td>9급</td>
                                                    <td>영어</td>
                                                    <td>2019 제3회 일반행정직 전과목 모의고사</td>
                                                    <td>
                                                        <a href="" class="blue small">성적보기</a>
                                                    </td>
                                                    <td>
                                                        <a href="" class="black small">오답노트</a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">문제지</a>
                                                        <a href="#" class="iconFile" target="_blank" title="새창열림">해설지</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- paging -->

                                        <!-- //paging -->
                                    </div>
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
<!--팝업 수강안내사항 modal1-->
<div id="modal1" class="modalWrap" style="">
    <div class="inner">
        <div class="modalTitle">
            <h2>상세내용</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div class="modalContent">
            <div class="pop_cont">
                <p class="pTxt"><b>이름</b> : <span id="conusltName"></span></p>
                <p class="pTxt"><b>연락처</b> : <span id="phoneNum"></span></p>
                <p class="pTxt"><b>상담요청직군</b> : <span id="ctgNameStr"></span></p>
                <p class="pTxt"><b>상담요청내용</b> : <span id="consultContent"></span></p>
            </div>
        </div>
    </div>
</div>
<!--//팝업-->
