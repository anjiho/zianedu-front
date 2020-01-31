<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            sessionStorage.setItem("leftMenu", "bigExam");
            getMainMiniBanner("mainVisualSlider1", 6760, 5);//대배너 옆 미니 배너
            getMainMiniBanner2("mainVisualSlider2", 6761, 5);//대배너 옆 미니 배너
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }

    });
    $(function(){
        // if($("#mainVisualSlider1").length > 0){
        //     kiplayer.sliderBx($("#mainVisualSlider1"));
        // }
        // if($("#mainVisualSlider2").length > 0){
        //     kiplayer.sliderBx($("#mainVisualSlider2"));
        // }

        $(".mainStoryList").each(function(){
            kiplayer.sliderSlick($(this));
        });

        $(".mainTeacherTitle > li").eq(0).addClass("active");
        $(".mainTeacherPage").each(function(){
            var sliderOption = {
                auto:true,autoControls:true,controls:true,pagerCustom:'#bx-pager',hideControlOnEnd:true,onSlideNext:function(e){
                    $(".mainTeacherTitle > li").removeClass("active");
                    if(e.index() < 4){
                        $(".mainTeacherTitle > li").eq(0).addClass("active");
                    }else{
                        $(".mainTeacherTitle > li").eq(1).addClass("active");
                    }
                }
            };
            kiplayer.sliderBx($(this), sliderOption);
        });
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container" class="big">
            <div class="inner">
                <!--서브 컨텐츠-->

                <div id="mainVisual">
                    <ul id="mainVisualSlider1"></ul>
                </div>

                <!-- 빅모의고사 응시후기 STORY -->
                <div class="mainStory">
                    <div class="inner">
                        <div class="titleBar">
                            <h5>빅모의고사 응시후기 STORY</h5>
                            <a href="#" class="btn_more">전체보기</a>
                        </div>
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

                <!--국어 영어 한국사 완전정복  -->
                <div class="mainBanner">
                    <div class="titleBar">
                        <h5>국어 영어 한국사 완&nbsp;/&nbsp;전&nbsp;/&nbsp;정&nbsp;/&nbsp;복</h5>
                        <span>주간 모의고사는 지안공무원학원에서 자체적으로 매주 실시하는 공통과목 모의고사 서비스로, <br>
					실제 시험 못지 않은 문제 퀄리티와 해설 영상, 개인별 성적 분석자료까지 모두 무료로 제공됩니다. </span>
                    </div>
                    <img src="http://52.79.40.214/Upload//100/bbs/slider02.jpg" alt="">
                </div>

                <!--지안에듀 모의고사 200% 활용법  -->
                <div class="bannerSlider">
                    <div class="titleBar">
                        <h5>지안에듀 모의고사 200% 활용법</h5>
                    </div>
                    <div id="mainVisual">
                        <ul id="mainVisualSlider2"></ul>
                    </div>
                </div>

                <!--주간 모의고사 일정안내 -->
                <div class="testTable">
                    <div class="titleBar">
                        <h5>주간 모의고사 일정안내</h5>
                    </div>
                    <div class="tbw01">
                        <table>
                            <thead>
                            <tr>
                                <th style="text-align: center;">회차</th>
                                <th style="text-align: center;">과목</th>
                                <th style="text-align: center;">응시 가능 기간</th>
                                <th style="text-align: center;">출제범위</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1회차</td>
                                <td>국어 영어 한국사</td>
                                <td>4/8(월) ~ 4/14(일)</td>
                                <td>전범위</td>
                            </tr>
                            <tr>
                                <td>2회차</td>
                                <td>국어 영어 한국사</td>
                                <td>4/15(월) ~ 4/21(일)</td>
                                <td>전범위</td>
                            </tr>
                            <tr>
                                <td>3회차</td>
                                <td>국어 영어 한국사</td>
                                <td>4/22(월) ~ 4/28(일)</td>
                                <td>전범위</td>
                            </tr>
                            <tr>
                                <td>4회차</td>
                                <td>국어 영어 한국사</td>
                                <td>5/6(월) ~ 4/12(일)</td>
                                <td>전범위</td>
                            </tr>
                            <tr>
                                <td>5회차</td>
                                <td>국어 영어 한국사</td>
                                <td>5/20(월) ~ 4/26(일)</td>
                                <td>전범위</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_crud">
                        <a href="" class="com_btn bdgray">바로 응시하러가기 ></a>
                    </div>
                </div>

                <!--고객센터 -->
                <div class="cs divGroup">
                    <div class="csleft">
                        <div>
                            <div class="titleBar">
                                <h5>고객센터</h5>
                            </div>
                            <div class="callnumber">
                                <ul>
                                    <li>대표전화 :<span>02-816-1724</span></li>
                                    <li>2관학원 :<span>070-4870-0634</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="line"><span>라인</span></div>
                    <div class="csright">
                        <div>
                            <ul>
                                <li>1. 학원 동영상 상담 및 결재문의 </li>
                                <li>2. 도서재고 및 배송 문의 </li>
                                <li>3. 동영상 결재 및 환불문의 </li>
                            </ul>
                            <ul>
                                <li>운영시간 : 9:00 ~ 18:00 ( 주말 ,공휴일 제외 )</li>
                                <li>점심시간 : 12:30 ~ 13:30</li>
                            </ul>
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