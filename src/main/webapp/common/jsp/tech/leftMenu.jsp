<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    function setLeftMenu(val) {
        //if (leftMenuSession == undefined || leftMenuSession == null) {
        sessionStorage.setItem("leftMenu", val);
        // }else{
        //     alert("2");
        //     activeLeftMenu(val);
        // }
    }

</script>
<!--좌측사이트메뉴-->
<div id="aside">
    <div id="siteTab">
        <h1><a href="javascript:goPage('techOnline', 'main')">기술직<br />온라인</a></h1>
        <a href="javascript:goPage('techAcademy', 'main')">기술직 학원</a>
    </div>
    <div id="siteNav">
        <ul>
            <li class="item2"><a href="javascript:goPage('publicOnline', 'main')">행정직</a></li>
            <li class="item3"><a href="javascript:goPage('postOnline', 'main')">계리직</a></li>
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
<!--//좌측사이트메뉴-->