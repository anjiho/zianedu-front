<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div id="wrap">
    <div id="skipLink">
        <a href="#">본문바로가기</a>
        <a href="#">주메뉴바로가기</a>
    </div>
    <!--좌측사이트메뉴-->
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">온라인<br />서점</a></h1>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:bookLeftMenu('tech');">기술직</a></li>
                <li class="item3"><a href="javascript:bookLeftMenu('post');">계리직</a></li>
                <li class="item3"><a href="javascript:bookLeftMenu('public');">행정직</a></li>
                <li class="item5"><a href="javascript:goAlgisa();">자격증/가산점</a></li>
                <li class="item4"><a href="javascript:bookLeftMenu('big');">빅모의고사</a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="#"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="#"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="#"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="#"><span class="icon item4"></span>내강의실</a></li>
                <li><a href="#"><span class="icon item5"></span>학원수강내역</a></li>
                <li><a href="#"><span class="icon item6"><em>30</em></span>장바구니</a></li>
                <li><a href="#"><span class="icon item7"></span>공지사항</a></li>
                <li><a href="#"><span class="icon item8"></span>1:1문의</a></li>
            </ul>
        </div>
        <div id="examBanner" class="slider useBx">
            <ul>
                <li>
                    <span>2019 국가직 7급 필기시험</span>
                    <b>D-116</b>
                    <a href="#">상세정보</a>
                </li>
                <li>
                    <span>2019 국가직 7급 필기시험</span>
                    <b>D-116</b>
                    <a href="#">상세정보</a>
                </li>
                <li>
                    <span>2019 국가직 7급 필기시험</span>
                    <b>D-116</b>
                    <a href="#">상세정보</a>
                </li>
            </ul>
        </div>
        <div id="snsLink">
            <b>지안에듀 SNS</b>
            <ul>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkFacebook.png" alt="페이스북"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkInstgram.png" alt="인스타그램"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkYoutube.png" alt="유투브"></a></li>
                <li><a href="#"><img src="/common/zian/images/common/btn_snsLinkBlog.png" alt="네이버블로그"></a></li>
            </ul>
        </div>
        <a href="#" id="btn_asideToggle">죄측메뉴열기/닫기</a>
    </div>
    <!--//좌측사이트메뉴-->
    <!--상단-->
    <div id="header">
        <div class="inner">
            <h1 class="logo_pc"><a href="#"><img src="/common/zian/images/common/logo04.png" alt="지안에듀 온라인서점"></a></h1>
            <h1 class="logo_mb"><a href="#"><img src="/common/zian/images/ex/logo07.png" alt="지안에듀 온라인서점"></a></h1>
            <!--최상단메뉴-->
            <div id="topNav">
                <ul>
                    <li><a href="#" class="btn_bookmark">즐겨찾기에 등록</a></li>
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">합격수기</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>
            </div>
            <!--//최상단메뉴-->
            <!--추가-->
            <div id="topNavM">
                <ul>
                    <li><a href="#" class="login_btn">로그인</a>
                        <ul class="logindrop">
                            <li><a href="">장바구니</a></li>
                            <li><a href="">내강의실</a></li>
                            <li><a href="">마이페이지</a></li>
                            <li><a href="">로그아웃</a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="header_menu" id="header_menu">메뉴</a></li>
                </ul>
            </div>

            <!-- sitemap_layer -->
            <div class="sitemap_layer" id="sitemap_layer">
                <div class="sitemap_layer_wrapper">
                    <div class="side_menu_header">
                        <p class="btn_home">지안에듀<span>님</span></p>
                        <span class="bar"></span>
                        <a href="" class="btn_logout">로그아웃</a>
                        <button class="btn_close_menu">닫기</button>
                    </div>
                    <!-- sitemap_wrap -->
                    <div class="sitemap_wrap">
                        <!-- sitemap_box -->
                        <div class="sitemap_box">
                            <ul>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>행정직학원</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                        <li><a href="#">10일</a></li>
                                        <li><a href="#">전체</a></li>
                                        <li><a href="#">10일</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>행정직온라인</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>기술직학원</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>기술직온라인</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>계리직학원</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>계리직온라인</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>자격증</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>온라인서점</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                                <li class="deth1_tit">
                                    <a href="#" class="normal">
                                        <span>빅모의고사</span>
                                    </a>
                                    <ul class="deth2_list">
                                        <li><a href="#">전체</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- //sitemap_box -->
                    </div>
                    <!-- //sitemap_wrap -->
                </div>
            </div>
            <!-- sitemap_layer -->
        </div>
        <!--주메뉴-->
        <div id="gnb">
            <div class="inner">
                <ul class="deaph1 cols7">
                    <li><a href="javascript:goBookStoreMobile('COMMON');">공통과목</a></li>
                    <li><a href="javascript:goBookStoreMobile('PUBLIC');">행정직</a></li>
                    <li><a href="javascript:goBookStoreMobile('TECH');">기술직</a></li>
                    <li><a href="javascript:goBookStoreMobile('POST');">계리직</a></li>
                    <li><a href="javascript:goBookStoreMobile('CERT');">자격증</a></li>
                    <li><a href="javascript:goPageNoSubmit('bookStore','errataList');">정오표</a></li>
                </ul>
            </div>

        </div>
        <!--//주메뉴-->
    </div>
    <!--//상단-->
    <script>
        function bookLeftMenu(val) {
            if(val == 'tech'){
                sessionStorage.setItem("leftMenu", "techOnline");
                goPageNoSubmit("techOnline", "main");
            }else if(val == 'post'){
                sessionStorage.setItem("leftMenu", "postOnline");
                goPageNoSubmit("postOnline", "main");
            }else if(val == 'public'){
                sessionStorage.setItem("leftMenu", "publicOnline");
                goPageNoSubmit("publicOnline", "main");
            }else if(val == 'big'){
                var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
                if(leftMenuInfo != 'bigExam') {
                    sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
                }
                sessionStorage.setItem("leftMenu", "bigExam");
                goPageNoSubmit('bigExam','bigExamMain');
            }
        }

        function goAlgisa() {
            window.open("http://www.algisa.com/public/main.html", "_blank");
            return false;
        }
    </script>