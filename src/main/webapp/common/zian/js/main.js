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
