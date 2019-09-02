$(function(){
	$("#btn_asideToggle").click(function(e){
		e.preventDefault();
		$("#aside").toggleClass("active");
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

