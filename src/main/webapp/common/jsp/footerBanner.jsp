<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');
        if(leftMenuInfo == "publicOnline"){
            getMainBottomBanner(6284, 2);
        }else if(leftMenuInfo == "publicAcademy"){
            getMainBottomBanner(6285, 2);
        }else if(leftMenuInfo == "techOnline"){
            getMainBottomBanner(6287, 2);
        }else if(leftMenuInfo == "techAcademy"){
            getMainBottomBanner(6286, 2);
        }else if(leftMenuInfo == "postOnline"){
            getMainBottomBanner(6289, 2);
        }else if(leftMenuInfo == "postAcademy"){
            getMainBottomBanner(6288, 2);
        }
    });
</script>
<!--하단고정식배너-->
<div id="bottomBanner" class="active" style="background-color:#2e3191;">
    <div class="inner">
        <a id="ABottomBanner1" href=""><img src="" id="bottomBanner1" alt=""></a>
        <a href="#" class="btn_bottomClose">하단배너 창닫기</a>
    </div>
</div>
<!--//하단고정식배너-->
