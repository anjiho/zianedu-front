<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
function setLeftMenu(val) {
    if(val != ""){
        sessionStorage.setItem("leftMenu", val);
        if(val == "publicOnline"){
            goPage("publicOnline", "main");
        }else if(val == "publicAcademy"){
            goPage("publicAcademy", "main");
        }else if(val == "techOnline"){
            goPage("techOnline", "main");
        }else if(val == "techAcademy"){
            goPage("techAcademy", "main");
        }else if(val == "postOnline"){
            goPage("postOnline", "main");
        }else if(val == "postAcademy"){
            goPage("postAcademy", "main");
        }
    }
}

$(document).ready(function () {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');
    if(leftMenuInfo != null){
        if(leftMenuInfo == "publicOnline"){
            gfn_display("publicAcademy", false);
            gfn_display("publicOnline", true);
        }else if(leftMenuInfo == "publicAcademy"){
            gfn_display("publicOnline", false);
            gfn_display("publicAcademy", true);
        }else if(leftMenuInfo == "techOnline"){
            gfn_display("techOnline", true);
            gfn_display("techAcademy", false);
            $("#siteTab").css("background", "#f69321");
        }else if(leftMenuInfo == "techAcademy"){
            gfn_display("techOnline", false);
            gfn_display("techAcademy", true);
            $("#wrap.skill .mainCustomer .btn_apply").backgroundColor("#f69321");
        }else if(leftMenuInfo == "postOnline"){
            gfn_display("postAcademy", false);
            gfn_display("postOnline", true);
        }else if(leftMenuInfo == "postAcademy"){
            gfn_display("postOnline", false);
            gfn_display("postAcademy", true);
        }
    }
});
</script>
<div id="skipLink">
    <a href="#">본문바로가기</a>
    <a href="#">주메뉴바로가기</a>
</div>
<!--좌측사이트메뉴-->
<div id="publicOnline" style="display: none;">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">행정직<br />온라인</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('publicAcademy')">행정직 학원</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('techOnline')">기술직</a></li>
                <li class="item3"><a href="#">계리직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>
<div id="publicAcademy" style="display: none;">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">행정직<br />학원</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')">행정직 온라인</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('techOnline')">기술직</a></li>
                <li class="item3"><a href="#">계리직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>
<!-- 기술직 leftMenu -->
<div id="techOnline" style="display: none;">
    <div id="aside">
        <div id="siteTab" style="background: #f69321;">
            <h1><a href="#">기술직<br />온라인</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('techAcademy')">기술직 학원</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')">행정직</a></li>
                <li class="item3"><a href="#">계리직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>

<div id="techAcademy" style="display: none;">
    <div id="aside">
        <div id="siteTab" style="background: #f69321;">
            <h1><a href="#">기술직<br />학원</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('techOnline')">기술직 온라인</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')">행정직</a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu('postOnline')">계리직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>

<!-- 계리직 leftMenu -->
<div id="postOnline" style="display: none;">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">계리직<br />온라인</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('postAcademy')">계리직 학원</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')">행정직</a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu('techOnline')">기술직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>

<div id="postAcademy" style="display: none;">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#">계리직<br />학원</a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu('postOnline')">계리직 온라인</a>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu('publicOnline')">행정직</a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu('techOnline')">기술직</a></li>
                <li class="item5"><a href="#">자격증/가산점</a></li>
                <li class="item4"><a href="#">온라인 서점</a></li>
                <li class="item4"><a href="#">빅모의고사</a></li>
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
                <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
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
</div>
<script>
    $( document ).ready(function() {
        getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    });
</script>
