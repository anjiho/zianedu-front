$(function(){
	$("#btn_asideToggle").click(function(e){
		e.preventDefault();
		$("#aside").toggleClass("active");
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
});

$(window).resize(function(){
});

$(window).scroll(function(){
});