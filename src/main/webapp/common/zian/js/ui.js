/* 수강후기 상단 탭메뉴 */
$(function(){
    $(".review > ul > li").click(function(){
        $(this).parent().find("li").removeClass("active");
        $(this).addClass("active");
        $(".reviewBoard").removeClass("active");
        $(".reviewBoard").eq($(this).index()).addClass("active");
    });
    $(" .review > ul > li").eq(0).click();
});

/*  닫힘버튼 */
$(document).ready(function(){
  $(".btn_modalClose").click(function(){
    $(this).parents(".Dropmenu_down").hide("500");
  });
});

/* 온라인 출간일순 및 저자순 */
$(function(){
    
      $(".shoplist > ul > li").click(function(){
      $(this).parent().find("li").removeClass("active");
      $(this).addClass("active");
       $(".shopBoard").removeClass("active");
       $(".shopBoard").eq($(this).index()).addClass("active");
    });
       $(" .shoplist > ul > li").eq(0).click();
});

/*  장바구니 체크박스 */
$( document ).ready( function(){
    $( '.check-all' ).click( function() {
      $( '.ck' ).prop( 'checked', this.checked );
    } );
    $( '.check-all2' ).click( function() {
      $( '.ck2' ).prop( 'checked', this.checked );
    } );
    $( '.check-all3' ).click( function() {
      $( '.ck3' ).prop( 'checked', this.checked );
    } );
    $( '.check-all4' ).click( function() {
      $( '.ck4' ).prop( 'checked', this.checked );
    } );
  });



/*  정지일수 선택 */
( function( $ ) {
$( document ).ready(function() {
    $('.edusup_multi > ul > li > a').click(function() {
          $('.edusup_multi li').removeClass('selected');
              $(this).closest('li').addClass('selected');
              var checkElement = $(this).next();
              if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $(this).closest('li').removeClass('selected');
                checkElement.slideUp('fast');
              }
              if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('.edusup_multi ul ul:visible').slideUp('fast');
                checkElement.slideDown('fast');
              }
              if($(this).closest('li').find('ul').children().length == 0) {
                return true;
              } else {
                return false;
              }
        });
    });


 
} )( jQuery );

/* 내강의실 > tab_large_2dept  부분 */
$(function(){
      $(".Dropmenu .lfloat .Droptab_wrap .tab").click(function(){
		var dataTab = $(this).attr('data-tab');
		$(this).parent().find(".tab").removeClass("active");
		$(this).addClass("active");
		$(".Dropmenu .rfloat ul").removeClass("active");
		$(".Dropmenu .rfloat ."+dataTab).addClass("active");
    });

});



/* 장바구니 > 결제하기  부분 */
function checkBox() {
var check_Box = document.getElementsByName("ckbox"); //체크박스 name
for (j = 0; j < check_Box.length; j++) {
  var disign = document.getElementById([j+1]); // 보여질내용
  if(check_Box[j].checked == true ){
    disign.style.display = "block";
  }else{
    check_Box[j].checked = false;
    disign.style.display = "none";
  }
  }
}


/* 수강신청 > 선택 및 해제 그리고 전체해제 */

$(document).ready(function(){
    $('#uncheck').off('click').on('click', function() {
        $("#subject li a").each(function () {
            $(this).removeClass('active');
        });
        $("#teacher li a").each(function () {
            $(this).removeClass('active');
        });
        $("#type li a").each(function () {
            $(this).removeClass('active');
        });
    });
});


/* 수강신청 > 이론.문제풀이.단과특강등 선택 및 해제 */

$(document).ready(function(){

  $(".rchk").click(function(){
  $(this).toggleClass("on");
});

});

/* 온라인서점 > select부분 */
 $(document).ready(function() {
    $(".type_wrap .type_btn").click(function() {
      $(this).removeClass('on').next().slideUp();
        if($(this).next("ul").is(":visible")){
        $(this).next("ul").slideUp("fast");
        } else {
       $(this).addClass('on');
            $(".type_wrap .typedrop").slideUp("fast");
            $(this).next("ul").slideToggle("fast");
        }
    });
});