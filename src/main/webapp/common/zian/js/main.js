// $(function(){
// 	var sliderOption1 = {
// 		auto:true,
// 		pagerCustom:'.visualPager'
// 	};
// 	kiplayer.sliderBx($(".visualSlider"), sliderOption1);
//
// 	var sliderOption2 = {
// 		auto:true,
// 		mode:'vertical'
// 	};
// 	kiplayer.sliderBx($(".latestList ul"), sliderOption2);
//
// 	kiplayer.sliderSlick($(".teacherList"));
// });
//
// $(window).resize(function(){
// });
//
// $(window).scroll(function(){
// });


// function initSliderOption1(className) {
// 	$(function(){
// 		var sliderOption1 = {
// 			auto:true,
// 			pagerCustom:'.visualPager'
// 		};
// 		kiplayer.sliderBx($("." + className), sliderOption1);
//
// 	});
//
// 	$(window).resize(function(){
// 	});
//
// 	$(window).scroll(function(){
// 	});
// }

function initSliderOption2(tagId) {
	$(function(){
		var sliderOption2 = {
			auto:true,
			mode:'vertical'
		};
		kiplayer.sliderBx($("#" + tagId +" ul"), sliderOption2);
	});

	$(window).resize(function(){
	});

	$(window).scroll(function(){
	});
}

function initExamSlideBanner() {
	if($(".slider.useBx").length > 0){
		$(".slider.useBx").each(function(){
			kiplayer.sliderBx($(this).children("ul"));
		});
	}
}

function activeLeftMenu(className) {
	$("#siteNav " + "."+className).addClass("active");
}

function activeHeaderBtn(tagId) {
	$("#topSelect > ul > li").removeClass("active");
	$("#" + tagId).addClass("active");
}

function activeJoinHeaderBtn(tagId) {
	$(".statusBar > li").removeClass("active");
	$("#" + tagId).addClass("active");
}

function initMainJs() {
	$(function(){
		var sliderOption1 = {
			auto:true,
			pagerCustom:'.visualPager'
		};
		kiplayer.sliderBx($(".visualSlider"), sliderOption1);

		var sliderOption2 = {
			auto:true,
			mode:'vertical'
		};
		kiplayer.sliderBx($(".latestList ul"), sliderOption2);

		kiplayer.sliderSlick($(".teacherList"));
	});

	$(window).resize(function(){
	});

	$(window).scroll(function(){
	});
}

//지안에듀 교수진 리스트 슬라이드
function initTeacherListBanner(bannerId){
	$(function(){
		kiplayer.sliderSlick($("#"+bannerId));
	});
	$(window).resize(function(){});
	$(window).scroll(function(){});
}


//지안에듀 교수진 리스트 슬라이드 - 2개씩 리스트 노출불러오기
function initTeacherListBanner1(bannerId){
	$(function(){
		var sliderOption1 = {
			autoplay:true,dots:false,infinite:true,slidesToShow:2,slidesToScroll:1,
			responsive:[{
				breakpoint:767,
				settings:{autoplay:true,slidesToShow:1,centerMode:true}
			}]
		};
		kiplayer.sliderSlick($("#"+bannerId), sliderOption1);
	});
	$(window).resize(function(){});
	$(window).scroll(function(){});
}

