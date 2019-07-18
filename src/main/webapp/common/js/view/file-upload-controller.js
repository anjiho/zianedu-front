//게시판 파일 업로드
function boardFile(fileData) {
    var result = postApi("/fileUpload/boardFile", fileData);
}