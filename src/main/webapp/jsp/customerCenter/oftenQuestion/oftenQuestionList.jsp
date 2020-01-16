<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function(){
        $('.inquiry_tab ul li').each(function(){
            var $this = $(this);
            $this.click(function(){
                $this.parent().find('li').removeClass('active');
                $this.addClass('active');
            });
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
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox tBox4">
                    <ul>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">상담예약</a></li>
                        <li><a href="#">모바일문의</a></li>
                        <li class="active"><a href="#">자주하는질문</a></li>
                    </ul>
                </div>
                <br />
                <div class="inquiry_lnfo">
                    <img src="../images/content/inquiry_img.jpg">
                    <ul>
                        <li>· 수강신청/결제</li>
                        <li>· 사이트이용</li>
                        <li>· 모바일이용</li>
                        <li>· 동영상재수강</li>
                        <li>· 모의고사</li>
                    </ul>
                </div>
                <div class="inquiry_tab">
                    <ul>
                        <li class="active ml-n"><a href="#">전체</a></li>
                        <li><a href="#">회원관련</a></li>
                        <li><a href="#">수강신청관련</a></li>
                        <li><a href="#">동영상관련</a></li>
                        <li class="ml-n mb-n"><a href="#">모바일관련</a></li>
                        <li class="mb-n"><a href="#">결제·환불관련</a></li>
                        <li class="mb-n"><a href="#">교재·배송교환</a></li>
                        <li class="mb-n"><a href="#">기타문의</a></li>
                    </ul>
                </div>
                <div class="boardWrap">
                    <div class="boardSearch">
                        <select name="" class="w90">
                            <option value="">제목</option>
                        </select>
                        <!--html 추가 및 수정-->
                        <input type="text" name="" value="" class="w240">
                        <a href="#" class="btn_inline on w140 disnoneM">검색</a>
                        <a href="#" class="search_ico disnonepc">검색</a>
                        <div class="btnArea">
                            <a href="#" class="btn_inline w140 write_ico">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="tableBox">
                        <table class="list">
                            <caption></caption>
                            <colgroup>
                                <col class="w100">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>2</td>
                                <td class="left"><a href="#"><span class="inquiry_p">[동영상관련] </span>지안에듀에서 국가기술 전문강사님을 모십니다.</a></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td class="left"><a href="#"><span class="inquiry_p">[모바일관련] </span>지안에듀에서 국가기술 전문강사님을 모십니다.</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- html 추가  -->
                        <table class="listM">
                            <tbody>
                            <tr>
                                <td>
                                    <span class="tit"><span class="inquiry_p">[동영상관련] </span> 지안에듀에서 국가기술 전문강사님을 모십니다.</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="tit"><span class="inquiry_p">[동영상관련] </span> 지안에듀에서 국가기술 전문강사님을 모십니다.</span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- //html 추가  -->
                    </div>
                    <div class="paging">
                        <a href="#" class="btn_prev">이전</a>
                        <a href="#" class="active">1</a>
                        <a href="#" class="btn_next">다음</a>
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
