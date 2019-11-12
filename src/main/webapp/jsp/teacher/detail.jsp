<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String teacherKey = request.getParameter("teacherKey");
    String reqKey = request.getParameter("reqKey");
%>
<style>
    .video-container {position: relative;padding-bottom: 56.25%;height: 0;overflow: hidden;}
    .video-container iframe,.video-container object,.video-container embed{position: absolute; top:0; left:0; width:100%; height: 100%}
</style>
<script>
    var teacherKey = '<%=teacherKey%>';
    var menuCtgKey = '<%=reqKey%>';

    $( document ).ready(function() {
        var pcMobile = divisionPcMobile();
        if(pcMobile == 'pc') pcMobile = 1;
        else if(pcMobile == 'mobile') pcMobile = 3;

        getTeacherHomeInfo(teacherKey, pcMobile , menuCtgKey, 10);//홈정보
        getTeacherNameSubjectName(teacherKey, menuCtgKey);//과목, 선생님명 불러오기
        getTeacherCurriculum(teacherKey, pcMobile, menuCtgKey);//커리큘럼 불러오기
        getTeacherVideoLecture(teacherKey, pcMobile, 0);//강좌소개 (동영상) 리스트 불러오기

    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="javascript:goPage('publicOnline', 'main')"><img src="/common/zian/images/common/logo01.png" alt="지안에듀 행정직"> 온라인</a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="deaph1 cols7">
                        <li><a href="#">내강의실</a>
                            <ul class="deaph2">
                                <li><a href="#">수강중</a></li>
                                <li><a href="#">일시정지</a></li>
                                <li><a href="#">수강완료</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">지안패스</a></li>
                        <li><a href="#">무료강좌</a>
                            <ul class="deaph2">
                                <li><a href="#">이론</a></li>
                                <li><a href="#">기출풀이</a></li>
                            </ul>
                        </li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a>
                            <ul class="deaph2">
                                <li><a href="#">합격영상</a></li>
                                <li><a href="#">합겨수기</a></li>
                                <li><a href="#">수강후기</a></li>
                                <li><a href="#">도서후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--//주메뉴-->
        </div>
        <!--//상단-->

        <!--본문-->
        <div id="container">

            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="teacherView">
                    <div class="teacherInfo">
                        <div class="thumb">
                            <img src="" alt="" id="teacherImg">
                            <a href="javascript:goPage('teacher','main')" class="btn_teacherThumb">교수님 리스트</a>
                        </div>
                        <div class="info">
                            <span class="category" id="subject"></span>
                            <span class="name"><b id="teacherName"></b> 교수님</span>
<%--                            <span class="infoText">쉽고 재미있는, 공무원 국어마스터</span>--%>
                            <dl class="profile">
                                <dt>약력</dt>
                                <dd id="history"></dd>
                            </dl>
                            <div class="teacherInfoTab tabContent">
                                <ul class="tabBar">
                                    <li class="active" style="width:340px;"><a href="#">OT영상</a></li>
                                </ul>
                                <div class="tabPage active">
                                    <div class="otMovie video-container" id="youtube"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="teacherContentsTab tabContent">
                        <ul class="tabBar">
                            <li><a href="#">커리큘럼</a></li>
                            <li><a href="#">강좌소개</a></li>
                            <li><a href="#">학습안내</a></li>
                            <li><a href="#">학습 Q&A</a></li>
                        </ul>
                        <div class="tabPage active"><!--커리큘럼 tab-->
                            <div class="tab_curriculum">
                                <span id="curriculum"></span>
                            </div>
                        </div>
                        <div class="tabPage"><!-- 강좌소개 tab -->
                            <div class="tab_lecture">
                                <div class="tabContent">
                                    <ul class="tabBar tabLecture">
                                        <li class="active"><a href="">동영상</a></li>
                                        <li><a href="">학원</a></li>
                                    </ul>
                                    <!-- 동영상 -->
                                    <div class="tabPage active">
                                        <div class="typeSelect"></div>
                                        <form>
                                            <div class="lectureWrap">
                                                <ul class="lectureTotal">
                                                    <li class="left"></li>
                                                    <li class="right">
                                                        선택한 항목 <span class="colorRed">3</span>개를
                                                        <a href="#" class="btn_m">장바구니 담기</a>
                                                        <a href="#" class="btn_m on w120">바로구매</a>
                                                    </li>
                                                </ul>
                                                <ul class="lectureHead">
                                                    <li class="w15p">유형</li>
                                                    <li class="w45p">강좌명</li>
                                                    <li class="w40p">수강료</li>
                                                </ul>
                                                <div class="lectureBody" id="lectureBody"></div> <!-- 동영상 강좌 리스트 -->
                                            </div>
                                        </form>
                                    </div>
                                    <!-- 학원 -->
                                    <div class="tabPage">
                                        <div class="typeSelect"></div>
                                        <form>
                                            <div class="lectureWrap">
                                                <ul class="lectureTotal">
                                                    <li class="left"></li>
                                                    <li class="right">
                                                        선택한 항목 <span class="colorRed">3</span>개를
                                                        <a href="#" class="btn_m">장바구니 담기</a>
                                                        <a href="#" class="btn_m on w120">바로구매</a>
                                                    </li>
                                                </ul>
                                                <ul class="lectureHead">
                                                    <li class="w15p">유형</li>
                                                    <li class="w35p">강좌명</li>
                                                    <li class="w40p">수강료</li>
                                                    <li class="w10p">관심</li>
                                                </ul>
                                                <div class="lectureBody">
                                                    <div class="lectureRow">
                                                        <ul class="lectureList">
                                                            <li class="w15p">
                                                                <span class="btn_learnType green">이론</span>
                                                            </li>
                                                            <li class="w35p">
                                                                <a href="#" class="learnName">2020 대비 안효선 국어 기본 + 심화 이론반 [9월 개강]</a>
                                                                <span class="learnNum">수정기간 <b class="colorBlue">2020.09.02 ~ 2020.11.01 (2개월)</b></span>
                                                            </li>
                                                            <li class="w40p alignRight">
                                                                <ul class="costList">
                                                                    <li>
                                                                        <span class="colorRed">20%</span>
                                                                        <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                                        <a href="#" class="btn_s">장바구니</a>
                                                                        <a href="#" class="btn_s on">바로구매</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="lectureRow">
                                                        <ul class="lectureList">
                                                            <li class="w15p">
                                                                <span class="btn_learnType gray">교재</span>
                                                            </li>
                                                            <li class="w35p">
                                                                <span class="btn_ss btn_divTag">부교재</span>
                                                                <a href="#" class="learnName">2020 지안국어 기본서(3권)</a>
                                                                <span class="learnNum">저자 <b class="colorBlue">탑스팟</b> | 출판 <b class="colorBlue">2019.06.28</b></span>
                                                            </li>
                                                            <li class="w40p alignRight">
                                                                <ul class="costList">
                                                                    <li>
                                                                        <span class="colorRed">20%</span>
                                                                        <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                                        <a href="#" class="btn_s">장바구니</a>
                                                                        <a href="#" class="btn_s on">바로구매</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="lectureRow">
                                                        <ul class="lectureList">
                                                            <li class="w15p">
                                                                <span class="btn_learnType purple">종합반</span>
                                                            </li>
                                                            <li class="w35p">
                                                                <a href="#" class="learnName">2020 군무원 행정9급 대비 전과목 (국어+행정+정보) [9월]</a>
                                                                <span class="learnNum">수정기간 <b class="colorBlue">2020.09.02 ~ 2020.11.01 (2개월)</b></span>
                                                            </li>
                                                            <li class="w40p alignRight">
                                                                <ul class="costList">
                                                                    <li>
                                                                        <span class="colorRed">20%</span>
                                                                        <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                                        <a href="#" class="btn_s">장바구니</a>
                                                                        <a href="#" class="btn_s on">바로구매</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="lectureRow">
                                                        <ul class="lectureList">
                                                            <li class="w15p">
                                                                <span class="btn_learnType purple">종합반</span>
                                                            </li>
                                                            <li class="w35p">
                                                                <a href="#" class="learnName">2020 행정직 9급대비 전과목 (공통 + 행정학 + 사회) 이론 종합반 [9월 개강]</a>
                                                                <span class="learnNum">수정기간 <b class="colorBlue">2020.09.02 ~ 2020.11.01 (2개월)</b></span>
                                                            </li>
                                                            <li class="w40p alignRight">
                                                                <ul class="costList">
                                                                    <li>
                                                                        <span class="colorRed">20%</span>
                                                                        <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                                        <a href="#" class="btn_s">장바구니</a>
                                                                        <a href="#" class="btn_s on">바로구매</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tabPage">
                            학습안내
                        </div>
                        <div class="tabPage">
                            학습 Q&A
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

