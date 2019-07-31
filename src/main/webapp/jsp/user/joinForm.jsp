<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap">
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <%@include file="/common/jsp/header.jsp" %>
    <script>
        function init() {
            activeJoinHeaderBtn("statusBar_02");
        }

        //가입하기
        function goJoin() {
            
        }
    </script>
    <div id="container">
        <div class="inner">
            <div class="joinWrap">
                <h2>회원가입</h2>
                <%@include file="/common/jsp/user/joinHeader.jsp" %>
                <div class="tableBox">
                    <table class="form">
                        <caption>회원가입 등록폼</caption>
                        <colgroup>
                            <col class="w150">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="col">이름</th>
                            <td>
                                <input type="text" id="name" name="name" class="w150">
                                <span class="radioGroup w60 cols2">
									<input type="radio" name="sex" id="sex_m" value="" checked><label for="sex_m">남</label>
									<input type="radio" name="sex" id="sex_f" value=""><label for="sex_f">여</label>
								</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">아이디</th>
                            <td>
                                <input type="text" id="userId" name="userId" class="w270">
                                (6~12자 영문+숫자 조합)
                                <div class="captionText">아이디를 입력해주세요.</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">비밀번호</th>
                            <td>
                                <input type="password" id="pwd" name="pwd" class="w270">
                                (특수문자+영문+숫자 8자 이상으로 조합)
                                <div class="captionText">비밀번호를 입력해주세요.</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">비밀번호 확인</th>
                            <td>
                                <input type="password" id="rePwd" name="rePwd" class="w270">
                                <div class="captionText">비밀번호가 일치하지 않습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">이메일</th>
                            <td>
                                <input type="text" id="email" name="email" class="w180"> @
                                <input type="text" id="emailAddress" name="emailAddress" class="w180">
                                <select name="" class="w180">
                                    <option value="">직접입력</option>
                                </select>
                                <div class="captionText">※등록된 기기변경시 인증번호가 전송됩니다. 신중히 등록해주세요.</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">휴대전화</th>
                            <td>
                                <input type="text" id="telephoneMobile" name="telephoneMobile" value="" class="w270">
                                <a href="#" class="btn_inline">인증번호 발송</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">인증번호</th>
                            <td>
								<span class="timerWrap">
									<input type="text" name="" value="" class="w270">
									<span class="timer"></span>
								</span>
                                <a href="#" class="btn_inline">인증번호 확인</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">주소</th>
                            <td class="multiLine">
                                <input type="text" id="zipcode" name="zipcode" class="w150">
                                <a href="#" class="btn_inline">우편번호 찾기</a><br />
                                <input type="text" id="address" name="address" class="w400"> (상세주소)
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">준비직렬</th>
                            <td>
                                <select id="interestCtgKey0" class="w180">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <a href="#" onclick="goJoin();" class="btn_l w130 on">가입하기</a>
                    <a href="javascript:goMain();" class="btn_l w130">취소</a>
                </div>
            </div>
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
