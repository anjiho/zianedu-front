<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div id="skipLink">
    <a href="#">본문바로가기</a>
    <a href="#">주메뉴바로가기</a>
</div>
<!--좌측사이트메뉴-->
<div id="publicOnline">
    <div id="aside">
        <div id="siteTab">
            <h1><a href="#"><span id="topName"></span></a></h1>
            <a href="javascript:void(0);" onclick="setLeftMenu()"><span id="topSub"></span></a>
        </div>
        <div id="bookStoreTab" style="background: #003471;display: none;    height: 160px; text-align: center;">
            <h1 style="border-bottom: none;display: block; margin: 0 20px;"><a href="javascript:goPageNoSubmit('bookStore','main')" style="padding: 50px 0;display: block;margin: 0; padding: 46px 0;font-size: 26px;color: #fff; line-height: 30px">온라인<br>서점</a></h1>
        </div>
        <div id="bigExamTab" style="background: #2e4261;display: none;height: 160px; text-align: center;">
            <h1 style="border-bottom: none;display: block; margin: 0 20px;"><a href="javascript:goPageNoSubmit('bigExam','main')" style="padding: 50px 0;display: block;margin: 0; padding: 46px 0;font-size: 26px;color: #fff; line-height: 30px">BIG<br>모의고사</a></h1>
        </div>
        <div id="siteNav">
            <ul>
                <li class="item2"><a href="javascript:void(0);" onclick="setLeftMenu1()"><span id="subMenu1"></span></a></li>
                <li class="item3"><a href="javascript:void(0);" onclick="setLeftMenu2()"><span id="subMenu2"></span></a></li>
                <li class="item5"><a href="javascript:void(0);" onclick="setLeftMenu3()"><span id="subMenu3"></span></a></li>
                <li class="item4"><a href="javascript:void(0);" onclick="setLeftMenu4()"><span id="subMenu4"></span></a></li>
                <li class="item4"><a href="javascript:void(0);" onclick="setLeftMenu5()"><span id="subMenu5"></span></a></li>
            </ul>
        </div>
        <div id="quickNav">
            <b>바로가기메뉴</b>
            <ul>
                <li class="noBg"><a href="javascript:goLecRoom();"><span class="icon item1"></span>강의실배정표</a></li>
                <li class="noBg"><a href="javascript:goOpenMenu();"><span class="icon item2"></span>학원시간표</a></li>
                <li class="noBg"><a href="javascript:goExamGuide();"><span class="icon item3"></span>수험가이드</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main')"><span class="icon item4"></span>내강의실</a></li>
                <li><a href="javascript:goPageNoSubmit('myLecRoom', 'main');"><span class="icon item5"></span>학원수강내역</a></li>
                <li><a href="javascript:goMyCart();"><span class="icon item6"><em id="cartCnt"></em></span>장바구니</a></li>
                <li><a href="javascript:goOpenMenu();"><span class="icon item7"></span>공지사항</a></li>
                <li><a href="javascript:goPageNoSubmit('customerCenter','consult');"><span class="icon item8"></span>1:1문의</a></li>
            </ul>
        </div>
        <div id="examBanner" class="slider useBx">
            <ul id="dDayBanner"></ul>
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
</div>
