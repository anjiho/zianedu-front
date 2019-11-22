<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->

        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="selectArea">
                    <dl>
                        <dt>분류</dt>
                        <dd>
                            <ul>
                                <li><a href="#" class="chk">전체</a></li>
                                <li><a href="#" class="chk">공통</a></li>
                                <li><a href="#" class="chk">전공</a></li>
                                <li><a href="#" class="chk">패키지</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>과목</dt>
                        <dd>
                            <ul>
                                <li><a href="#" class="chk">전체</a></li>
                                <li><a href="#" class="chk">국어</a></li>
                                <li><a href="#" class="chk">영어</a></li>
                                <li><a href="#" class="chk">한국사</a></li>
                                <li><a href="#" class="chk">사회</a></li>
                                <li><a href="#" class="chk">경영학</a></li>
                                <li><a href="#" class="chk">행정법</a></li>
                                <li><a href="#" class="chk">행정학</a></li>
                                <li><a href="#" class="chk">면접</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>교수</dt>
                        <dd>
                            <ul>
                                <li><a href="#" class="chk">전체</a></li>
                                <li><a href="#" class="chk">윤서영</a></li>
                                <li><a href="#" class="chk">오선희</a></li>
                                <li><a href="#" class="chk">안효선</a></li>
                                <li><a href="#" class="chk">김성익</a></li>
                                <li><a href="#" class="chk">윤광덕</a></li>
                                <li><a href="#" class="chk">조재권</a></li>
                                <li><a href="#" class="chk">임찬호</a></li>
                                <li><a href="#" class="chk">김준호</a></li>
                                <li><a href="#" class="chk">함보연</a></li>
                                <li><a href="#" class="chk">이동훈</a></li>
                                <li><a href="#" class="chk">박병호</a></li>
                                <li><a href="#" class="chk">정다훈</a></li>
                                <li><a href="#" class="chk">조대진</a></li>
                                <li><a href="#" class="chk">천정운</a></li>
                                <li><a href="#" class="chk">염오봉</a></li>
                                <li><a href="#" class="chk">오재우</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>유형</dt>
                        <dd>
                            <ul>
                                <li><a href="#" class="chk">전체</a></li>
                                <li><a href="#" class="chk">이론</a></li>
                                <li><a href="#" class="chk">문제풀이</a></li>
                                <li><a href="#" class="chk">단과특강</a></li>
                                <li><a href="#" class="chk">필기대비</a></li>
                                <li><a href="#" class="chk">모의고사</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <div class="btnArea">
                        <a href="#" class="btn_m btn_release" id="uncheck">전체해제</a>
                    </div>
                </div>
                <!-- 국어 -->
                <div class="lectureWrap">
                    <ul class="lectureTotal">
                        <li class="left">국어</li>
                        <li class="right">
                            선택한 항목 <span class="colorRed">0</span>개를
                            <a href="#" class="btn_m">장바구니 담기</a>
                            <a href="#" class="btn_m on">바로구매</a>
                        </li>
                    </ul>
                    <div class="teacherBody">
                        <div class="teacherRow">
                            <ul class="teacherList">
                                <li><span class="thumb"><img src="../images/content/img_teacherlist02.png" alt=""></span></li>
                                <li><b>오희선</b></li>
                                <li class="rchk"><b>이론</b>20개</li>
                                <li class="rchk"><b>문제풀이</b>22개</li>
                                <li class="rchk"><b>단과특강</b>15개</li>
                                <li class="rchk"><b>필기대비</b>22개</li>
                                <li class="rchk"><b>모의고사</b>5개</li>
                            </ul>
                            <div class="toggleWrap">
                                <div class="div_toggle">
                                    <ul class="lectureHead">
                                        <li class="w15p">유형</li>
                                        <li class="w35p">강좌명</li>
                                        <li class="w40p">수강료</li>
                                        <li class="w15p">관심</li>
                                    </ul>
                                    <div class="lectureBody">
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType green">이론</span>
                                                </li>
                                                <li class="w35p">
                                                    <a href="#" class="learnName">2020 대비 안효선 올인원 이론강의 [5%적립]</a>
                                                    <span class="learnNum">강의수 <b class="colorBlue">58강</b> | 수강일수 <b class="colorBlue">80일</b></span>
                                                    <span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <span class="colorRed">20%</span> <span class="btn_ss btn_divTag">PC</span>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">60,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">
                                                    <div class="wishGroup">
                                                        <input type="checkbox" name="" value=""><label></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="tableBox">
                                                <table class="lecture">
                                                    <colgroup>
                                                        <col class="w10p">
                                                        <col class="w40p">
                                                        <col class="w10p">
                                                        <col class="w40p">
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th scope="row">회차</th>
                                                        <th scope="row">제목</th>
                                                        <th scope="row">시간</th>
                                                        <th scope="row">샘플보기</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="ta_center">01</td>
                                                        <td>1강 190511-1번</td>
                                                        <td class="ta_center">56</td>
                                                        <td class="ta_center"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="ta_center">02</td>
                                                        <td>1강 190511-2번</td>
                                                        <td class="ta_center">56</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="ta_center">03</td>
                                                        <td>1강 190511-3번</td>
                                                        <td class="ta_center">56</td>
                                                        <td></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn_toggle lock"><a href="#"></a></div>
                            </div>
                        </div>
                        <div class="teacherRow">
                            <ul class="teacherList">
                                <li><span class="thumb"><img src="../images/content/img_teacherlist03.png" alt=""></span></li>
                                <li><b>안효선</b></li>
                                <li class="rchk"><b>이론</b>20개</li>
                                <li class="rchk"><b>문제풀이</b>22개</li>
                                <li class="rchk"><b>단과특강</b>10개</li>
                                <li class="rchk"><b>필기대비</b>12개</li>
                                <li class="rchk"><b>모의고사</b>5개</li>
                            </ul>
                            <div class="toggleWrap active">
                                <div class="div_toggle">
                                    <ul class="lectureHead">
                                        <li class="w15p">유형</li>
                                        <li class="w35p">강좌명</li>
                                        <li class="w40p">수강료</li>
                                        <li class="w15p">관심</li>
                                    </ul>
                                    <div class="lectureBody">
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType green">이론</span>
                                                </li>
                                                <li class="w35p">
                                                    <a href="#" class="learnName">2020 대비 안효선 올인원 이론강의 [5%적립]</a>
                                                    <span class="learnNum">강의수 <b class="colorBlue">58강</b> | 수강일수 <b class="colorBlue">80일</b></span>
                                                    <span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <span class="colorRed">20%</span> <span class="btn_ss btn_divTag">PC</span>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">60,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">
                                                    <div class="wishGroup">
                                                        <input type="checkbox" name="" value=""><label></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="toggleWrap">
                                                <div class="div_toggle">
                                                    <div class="tableBox">
                                                        <table class="lecture">
                                                            <colgroup>
                                                                <col class="w10p">
                                                                <col class="w40p">
                                                                <col class="w10p">
                                                                <col class="w40p">
                                                            </colgroup>
                                                            <thead>
                                                            <tr>
                                                                <th scope="row">회차</th>
                                                                <th scope="row">제목</th>
                                                                <th scope="row">시간</th>
                                                                <th scope="row">샘플보기</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td class="ta_center">01</td>
                                                                <td>1강 190511-1번</td>
                                                                <td class="ta_center">56</td>
                                                                <td class="ta_center"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="ta_center">02</td>
                                                                <td>1강 190511-2번</td>
                                                                <td class="ta_center">56</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="ta_center">03</td>
                                                                <td>1강 190511-3번</td>
                                                                <td class="ta_center">56</td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="btn_toggle"><a href="#"></a></div>
                                            </div>
                                        </div>
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType gray">교재</span>
                                                </li>
                                                <li class="w35p">
                                                    <span class="btn_ss btn_divTag">주교재</span>
                                                    <a href="#" class="learnName">2020 지안국어 기본서 (3권)</a>
                                                    <span class="learnNum">저자 <b class="colorBlue">탑스팟</b> | 출판 <b class="colorBlue">2019.06.28</b></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">&nbsp;</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn_toggle lock"><a href="#"></a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 한국사 -->
                <div class="lectureWrap">
                    <ul class="lectureTotal">
                        <li class="left">한국사</li>
                        <li class="right">
                            선택한 항목 <span class="colorRed">0</span>개를
                            <a href="#" class="btn_m">장바구니 담기</a>
                            <a href="#" class="btn_m on">바로구매</a>
                        </li>
                    </ul>
                    <div class="teacherBody">
                        <div class="teacherRow">
                            <ul class="teacherList">
                                <li><span class="thumb"><img src="../images/content/img_teacherlist07.png" alt=""></span></li>
                                <li class="rchk"><b>임찬호</b></li>
                                <li class="rchk"><b>이론</b>20개</li>
                                <li class="rchk"><b>문제풀이</b>22개</li>
                                <li class="rchk"><b>단과특강</b>15개</li>
                                <li class="rchk"><b>필기대비</b>22개</li>
                                <li class="rchk"><b>모의고사</b>5개</li>
                            </ul>
                            <div class="toggleWrap">
                                <div class="div_toggle">
                                    <ul class="lectureHead">
                                        <li class="w15p">유형</li>
                                        <li class="w35p">강좌명</li>
                                        <li class="w40p">수강료</li>
                                        <li class="w15p">관심</li>
                                    </ul>
                                    <div class="lectureBody">
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType green">이론</span>
                                                </li>
                                                <li class="w35p">
                                                    <a href="#" class="learnName">2020 대비 안효선 올인원 이론강의 [5%적립]</a>
                                                    <span class="learnNum">강의수 <b class="colorBlue">58강</b> | 수강일수 <b class="colorBlue">80일</b></span>
                                                    <span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <span class="colorRed">20%</span> <span class="btn_ss btn_divTag">PC</span>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">60,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">
                                                    <div class="wishGroup">
                                                        <input type="checkbox" name="" value=""><label></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="tableBox">
                                                <table class="lecture">
                                                    <colgroup>
                                                        <col class="w10p">
                                                        <col class="w40p">
                                                        <col class="w10p">
                                                        <col class="w40p">
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th scope="row">회차</th>
                                                        <th scope="row">제목</th>
                                                        <th scope="row">시간</th>
                                                        <th scope="row">샘플보기</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="ta_center">01</td>
                                                        <td>1강 190511-1번</td>
                                                        <td class="ta_center">56</td>
                                                        <td class="ta_center"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="ta_center">02</td>
                                                        <td>1강 190511-2번</td>
                                                        <td class="ta_center">56</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="ta_center">03</td>
                                                        <td>1강 190511-3번</td>
                                                        <td class="ta_center">56</td>
                                                        <td></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn_toggle lock"><a href="#"></a></div>
                            </div>
                        </div>
                        <div class="teacherRow">
                            <ul class="teacherList">
                                <li><span class="thumb"><img src="../images/content/img_teacherlist08.png" alt=""></span></li>
                                <li><b>김준호</b></li>
                                <li class="rchk"><b>이론</b>20개</li>
                                <li class="rchk"><b>문제풀이</b>22개</li>
                                <li class="rchk"><b>단과특강</b>10개</li>
                                <li class="rchk"><b>필기대비</b>12개</li>
                                <li class="rchk"><b>모의고사</b>5개</li>
                            </ul>
                            <div class="toggleWrap">
                                <div class="div_toggle">
                                    <ul class="lectureHead">
                                        <li class="w15p">유형</li>
                                        <li class="w35p">강좌명</li>
                                        <li class="w40p">수강료</li>
                                        <li class="w15p">관심</li>
                                    </ul>
                                    <div class="lectureBody">
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType green">이론</span>
                                                </li>
                                                <li class="w35p">
                                                    <a href="#" class="learnName">2020 대비 안효선 올인원 이론강의 [5%적립]</a>
                                                    <span class="learnNum">강의수 <b class="colorBlue">58강</b> | 수강일수 <b class="colorBlue">80일</b></span>
                                                    <span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <span class="colorRed">20%</span> <span class="btn_ss btn_divTag">PC</span>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">60,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                        <li>
                                                            <span class="btn_ss btn_divTag">PC</span> <span class="btn_ss btn_divTag">모바일</span>
                                                            <b class="cost">120,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">
                                                    <div class="wishGroup">
                                                        <input type="checkbox" name="" value=""><label></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="toggleWrap">
                                                <div class="div_toggle">
                                                    <div class="tableBox">
                                                        <table class="lecture">
                                                            <colgroup>
                                                                <col class="w10p">
                                                                <col class="w40p">
                                                                <col class="w10p">
                                                                <col class="w40p">
                                                            </colgroup>
                                                            <thead>
                                                            <tr>
                                                                <th scope="row">회차</th>
                                                                <th scope="row">제목</th>
                                                                <th scope="row">시간</th>
                                                                <th scope="row">샘플보기</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td class="ta_center">01</td>
                                                                <td>1강 190511-1번</td>
                                                                <td class="ta_center">56</td>
                                                                <td class="ta_center"><span class="learnView">샘플보기 <a href="#" class="btn_s btn_quality">일반화질</a> <a href="#" class="btn_s btn_quality on">고화질</a></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="ta_center">02</td>
                                                                <td>1강 190511-2번</td>
                                                                <td class="ta_center">56</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="ta_center">03</td>
                                                                <td>1강 190511-3번</td>
                                                                <td class="ta_center">56</td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="btn_toggle"><a href="#"></a></div>
                                            </div>
                                        </div>
                                        <div class="lectureRow">
                                            <ul class="lectureList">
                                                <li class="w15p">
                                                    <span class="btn_learnType gray">교재</span>
                                                </li>
                                                <li class="w35p">
                                                    <a href="#" class="learnName">2020 지안국어 기본서 (3권)</a>
                                                    <span class="learnNum">저자 <b class="colorBlue">탑스팟</b> | 출판 <b class="colorBlue">2019.06.28</b></span>
                                                </li>
                                                <li class="w40p ta_right">
                                                    <ul class="costList">
                                                        <li>
                                                            <b class="cost">48,000원</b> <input type="checkbox" name="" value="">
                                                            <a href="#" class="btn_s">장바구니</a>
                                                            <a href="#" class="btn_s on">바로구매</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="w10p ta_center">&nbsp;</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn_toggle lock"><a href="#"></a></div>
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

