//회원 아이디 중복체크

//로그인

//회원탈퇴

//회원정보 수정

//회원 비밀번호 변경

//회원가입
//장바구니 리스트 삭제
function reg(data) {
    var result = postApi("/user/reg", data);
    console.log(result);
}
