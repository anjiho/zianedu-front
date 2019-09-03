// 신규로 만들어진 스크립트 2019.09.02 임의 주석처리
// $(function(){
// 	if($("#mainVisualSlider1").length > 0){
// 		kiplayer.sliderBx($("#mainVisualSlider1"));
// 	}
// 	if($("#mainVisualSlider2").length > 0){
// 		kiplayer.sliderBx($("#mainVisualSlider2"));
// 	}
// 	$(".mainProductList").each(function(){
// 		kiplayer.sliderSlick($(this));
// 	});
// 	$(".mainStoryList").each(function(){
// 		kiplayer.sliderSlick($(this));
// 	});
// 	$(".mainTeacherPage").each(function(){
// 		var sliderOption = {auto:true,autoControls:true,controls:true,pagerCustom:'#bx-pager'};
// 		kiplayer.sliderBx($(this), sliderOption);
// 	});
// });
$(function(){
    $(".mainTeacherPage").each(function(){
 		var sliderOption = {auto:true,autoControls:true,controls:true,pagerCustom:'#bx-pager'};
 		kiplayer.sliderBx($(this), sliderOption);
 	});
});
//
// $(window).resize(function(){
// });
//
// $(window).scroll(function(){
// });







// $(function(){
//  	//kiplayer.sliderBx($("#mainShopVisual .left ul"));
//  	//kiplayer.sliderBx($("#mainVisual ul"));
//
// 	// var sliderOption1 = {
// 	// 	autoplay:true,dots:true,infinite:true,slidesToShow:2,slidesToScroll:1,
// 	// 	responsive:[{
// 	// 		breakpoint:767,
// 	// 		settings:{autoplay:true,slidesToShow:1,centerMode:true}
// 	// 	}]
// 	// };
// 	//kiplayer.sliderSlick($(".teacherList"), sliderOption1);
//
// 	//kiplayer.sliderSlick($(".productList"));
//
// 	$("#mainShopVisual .right ul li > a").click(function(){
// 		$("#mainShopVisual .right ul li").removeClass("active");
// 		$(this).parent().addClass("active");
// 	});
// });
//
// $(window).resize(function(){
// });
//
// $(window).scroll(function(){
// });
