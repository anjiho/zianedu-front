$(function(){
 	//kiplayer.sliderBx($("#mainShopVisual .left ul"));
 	//kiplayer.sliderBx($("#mainVisual ul"));

	// var sliderOption1 = {
	// 	autoplay:true,dots:true,infinite:true,slidesToShow:2,slidesToScroll:1,
	// 	responsive:[{
	// 		breakpoint:767,
	// 		settings:{autoplay:true,slidesToShow:1,centerMode:true}
	// 	}]
	// };
	//kiplayer.sliderSlick($(".teacherList"), sliderOption1);

	kiplayer.sliderSlick($(".productList"));

	$("#mainShopVisual .right ul li > a").click(function(){
		$("#mainShopVisual .right ul li").removeClass("active");
		$(this).parent().addClass("active");
	});
});

$(window).resize(function(){
});

$(window).scroll(function(){
});
