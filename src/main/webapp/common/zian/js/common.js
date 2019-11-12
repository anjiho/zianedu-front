$(function(){
	$("#btn_asideToggle").click(function(e){
		e.preventDefault();
		$("#aside").toggleClass("active");
	});
	$("#btn_asideToggle1").click(function(e){
		e.preventDefault();
		$("#aside1").toggleClass("active");
	});
	$("#btn_asideToggle2").click(function(e){
		e.preventDefault();
		$("#aside2").toggleClass("active");
	});
	$("#btn_asideToggle3").click(function(e){
		e.preventDefault();
		$("#aside3").toggleClass("active");
	});
	$("#btn_asideToggle4").click(function(e){
		e.preventDefault();
		$("#aside4").toggleClass("active");
	});
	$("#btn_asideToggle5").click(function(e){
		e.preventDefault();
		$("#aside5").toggleClass("active");
	});
	$(".btn_quickToggle").click(function(e){
		e.preventDefault();
		$("#quickBar").toggleClass("min");
	});
	$(".btn_bottomClose").click(function(e){
		e.preventDefault();
		$("#bottomBanner").removeClass("active");
	});
	$(document).on("click", ".classList dt a", function(e){
		e.preventDefault();
		$(this).parents("dl").eq(0).toggleClass("hidden");
	});
	$(document).on("click", ".classList .btn_toggleDetail", function(e){
		e.preventDefault();
		$(this).toggleClass("active");
		$(this).parents("tr").eq(0).next().toggleClass("active");
	});
	$(document).on("click", ".classComment dt a", function(e){
		e.preventDefault();
		$(".classComment li").removeClass("active");
		$(this).parents("li").eq(0).addClass("active");
	});


	// 20190925추가 원은정
	$("#gnb ul.deaph1 > li").on("mouseover",function(){
		$("#gnb ul.deaph1 > li").removeClass("active");
		$("#gnb ul.deaph1 > li > ul").hide();
		$(this).addClass("active");
		$(this).children("ul").show();
	});
	$("#gnb ul.deaph1 > li").on("mouseout",function(){
		$("#gnb ul.deaph1 > li").removeClass("active");
		$("#gnb ul.deaph1 > li > ul").hide();
	});

	$("#gnb ul.deaph1 > li").on("focusin",function(){
		$("#gnb ul.deaph1 > li").removeClass("active");
		$(this).addClass("active");
	});
	$("#gnb ul.deaph2 > li:last-child").on("focusout",function(){
		$(this).parent().parent().removeClass("active");
	});

	$("#gnb.second").on("mouseover focusin",function(){
		//$("#allMenu").addClass("active");
		$("#allMenu").show();
	});
	$("#gnb.second").on("mouseout focusout",function(){
		$("#allMenu").hide();
	});
	$("#gnb.third > ul > li").on("mouseover focusin",function(){
		$(this).children("div").addClass("active");
	});
	$("#gnb.third > ul > li").on("mouseout focusout",function(){
		$(".subMenu").removeClass("active");
	});

	$(".profile > dt").click(function(){
		if($(this).parent().hasClass("active")){
			$(this).parent().removeClass("active");
		}else{
			$(this).parent().addClass("active");
		}
	});

	$(".wishGroup > label").click(function(){
		var checkBox = $(this).siblings("input[type='checkbox']");
		checkBox.prop('checked', !checkBox.prop('checked'));
	});

	// $(".toggleWrap > .btn_toggle").click(function(){
	// 	if($(this).parent().hasClass("active")){
	// 		$(this).parent().removeClass("active");
	// 	}else{
	// 		$(this).parent().addClass("active");
	// 	}
	// });



});

$(window).resize(function(){
});

$(window).scroll(function(){
});


// $(function(){
// 	$("#btn_asideToggle").click(function(e){
// 		e.preventDefault();
// 		$("#aside").toggleClass("active");
// 	});
// 	$(".btn_bottomClose").click(function(e){
// 		e.preventDefault();
// 		$("#bottomBanner").removeClass("active");
// 	});
// 	$(document).on("click", ".classList dt a", function(e){
// 		e.preventDefault();
// 		$(this).parents("dl").eq(0).toggleClass("hidden");
// 	});
// 	$(document).on("click", ".classList .btn_toggleDetail", function(e){
// 		e.preventDefault();
// 		$(this).toggleClass("active");
// 		$(this).parents("tr").eq(0).next().toggleClass("active");
// 	});
// });
//
// $(window).resize(function(){
// });
//
// $(window).scroll(function(){
// });

