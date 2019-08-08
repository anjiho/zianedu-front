<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div id="skipLink">
    <a href="#">본문바로가기</a>
    <a href="#">주메뉴바로가기</a>
</div>
<!--좌측사이트메뉴-->
<div id="aside">
    <h1><a href="javascript:goMain();"><img src="/common/zian/images/common/logo_notext.png" alt="zion edu"></a></h1>
    <div id="siteNav">
        <ul>
            <li class="item1"><a href="javascript:goPage('publicOnline', 'main')">행정직</a></li>
            <li class="item2"><a href="javascript:goPage('techOnline', 'main')">기술직</a></li>
            <li class="item3"><a href="javascript:goPage('postOnline', 'main')">계리직</a></li>
            <li class="item4"><a href="#">온라인 서점</a></li>
            <li class="item5"><a href="#">자격증/가산점</a></li>
        </ul>
    </div>
    <div id="quickNav">
        <b>바로가기메뉴</b>
        <ul>
            <li class="noBg"><a href="#"><span class="icon item1"></span>강의실배정표</a></li>
            <li class="noBg"><a href="#"><span class="icon item2"></span>학원시간표</a></li>
            <li class="noBg"><a href="#"><span class="icon item3"></span>수험가이드</a></li>
            <li><a href="#"><span class="icon item4"></span>수강중인강좌</a></li>
            <li><a href="#"><span class="icon item5"></span>학원수강내역</a></li>
            <li><a href="#"><span class="icon item6"><!--<em>30</em>--></span>장바구니</a></li>
            <li><a href="#"><span class="icon item7"></span>쿠폰 마일리지</a></li>
            <li><a href="#"><span class="icon item8"></span>1:1문의</a></li>
        </ul>
    </div>
    <div id="examBanner" class="slider useBx">
        <ul id="dDayBanner">
        </ul>
    </div>
    <div id="snsLink">
        <b>지안에듀 SNS</b>
        <ul>
            <li><a href="https://www.facebook.com/zianedu/" target="_blank"><img src="/common/zian/images/common/btn_snsLinkFacebook.png" alt="페이스북"></a></li>
            <li><a href="https://www.instagram.com/zianedu_algisa/" target="_blank"><img src="/common/zian/images/common/btn_snsLinkInstgram.png" alt="인스타그램"></a></li>
            <li><a href="https://www.youtube.com/channel/UCVggN-Fjn55m-v6SposcJJw/featured?view_as=subscriber" target="_blank"><img src="/common/zian/images/common/btn_snsLinkYoutube.png" alt="유투브"></a></li>
            <li><a href="https://blog.naver.com/dreamart0829" target="_blank"><img src="/common/zian/images/common/btn_snsLinkBlog.png" alt="네이버블로그"></a></li>
        </ul>
    </div>
    <a href="#" id="btn_asideToggle">죄측메뉴열기/닫기</a>
</div>
<!--//좌측사이트메뉴-->
<script>
    $( document ).ready(function() {
        getExamScheduleList("dDayBanner"); //d-day 슬라이드 배너
    });
</script>
