 
/*  로그인 */
 $(document).ready(function() {
    $("#topNavM .login_btn").click(function() {
        $(this).removeClass('on').next().slideUp();
        if($(this).next("ul.logindrop").is(":visible")){
            $(this).next("ul.logindrop").slideUp("500");
        } else {
            $(this).addClass('on');
            $("#topNavM .logindrop").slideUp("500");
            $(this).next("ul.logindrop").slideToggle("500");
        }
    });
});




$( document ).ready( function() {
	$( "#sitemap_layer" ).simplerSidebar( {
		top:0,
		opener: "#header_menu",
		animation: {
			easing: "easeOutQuint"
		},
		sidebar: {
			align: "right",
			closingLinks: ".close-sb, .btn_close_menu",
		}
	} );
} );




 $(document).on('ready', function() {
						$(".Mdepth1").slick({
						  dots: false,
						  infinite: false,
						  slidesToShow: 10,
						  slidesToScroll: 10,
						  variableWidth: false,
						  speed: 300,
						  arrows: true,
						  responsive: [
						    {
						      breakpoint: 600,
						      settings: {
						        slidesToShow: 4,
						        slidesToScroll: 4
						      }
						    },
						    {
						      breakpoint: 480,
						      settings: {
						        slidesToShow: 3,
						        slidesToScroll: 3
						      }
						    }
						  ]
						});
					  });


/*교수소개 snb*/
$(document).on('ready', function() {
						$("#snb .cols9s").slick({
						  dots: false,
						  infinite: false,
						  slidesToShow: 6,
						  slidesToScroll: 6,
						  variableWidth: false,
						  speed: 300,
						  arrows: true,
						  responsive: [
						    {
						      breakpoint: 600,
						      settings: {
						        slidesToShow: 6,
						        slidesToScroll: 6
						      }
						    },
						    {
						      breakpoint: 480,
						      settings: {
						        slidesToShow: 4,
						        slidesToScroll: 4
						      }
						    }
						  ]
						});
					  });



  $(document).on('ready', function() {
				$(".regular").slick({
				  dots: false,
				  infinite: false,
				  slidesToShow: 6,
				  slidesToScroll: 6,
				  variableWidth: false,
				  speed: 300,
				  arrows: true,
				  responsive: [
				    {
				      breakpoint: 600,
				      settings: {
				        slidesToShow: 6,
				        slidesToScroll: 6,
				      }
				    },
				    {
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 5,
				        slidesToScroll: 5
				      }
				    },
				    {
				      breakpoint: 321,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 3
				      }
				    }
				  ]
				});
			  });


/*index_inline main 부분 슬라이드 slick 교체 부분*/
$(document).on('ready', function() {
				$(".mainStoryList").slick({
				  dots: false,
				  infinite: true,
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  variableWidth: false,
				  arrows: true,
				  autoplay:true,
				  responsive: [
				    { autoplay:true,
				      breakpoint: 800,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 1,
				      }
				    },
				    { autoplay:true,
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    },
				    {autoplay:true,
				      breakpoint: 321,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    }
				  ]
				});
			  });


/*index_inline main 부분 슬라이드 slick 교체 부분*/
$(document).on('ready', function() {
				$(".mainProductList").slick({
				  dots: true,
				  infinite: true,
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  variableWidth: false,
				  arrows: true,
				  autoplay:true,
				  responsive: [
				    { autoplay:true,
				      breakpoint: 800,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 1,
				      }
				    },
				    { autoplay:true,
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    },
				    {autoplay:true,
				      breakpoint: 321,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    }
				  ]
				});
			  });


/*index_inline main 부분 슬라이드 slick 교체 부분*/
$(document).on('ready', function() {
				$(".mainProductList2").slick({
				  dots: true,
				  infinite: true,
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  variableWidth: false,
				  arrows: true,
				  autoplay:true,
				  responsive: [
				    { autoplay:true,
				      breakpoint: 800,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 1,
				      }
				    },
				    { autoplay:true,
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    },
				    {autoplay:true,
				      breakpoint: 321,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    }
				  ]
				});
			  });


/*index_inline main 부분 슬라이드 slick 교체 부분*/
$(document).on('ready', function() {
				$(".mainProductList3").slick({
				  dots: true,
				  infinite: true,
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  variableWidth: false,
				  arrows: true,
				  autoplay:true,
				  responsive: [
				    { autoplay:true,
				      breakpoint: 800,
				      settings: {
				        slidesToShow: 3,
				        slidesToScroll: 1,
				      }
				    },
				    { autoplay:true,
				      breakpoint: 480,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    },
				    {autoplay:true,
				      breakpoint: 321,
				      settings: {
				        slidesToShow: 2,
				        slidesToScroll: 1
				      }
				    }
				  ]
				});
			  });



 /*$(document).ready(function() {
        $(".sitemap_box .deth1_tit").click(function() {
          $(this).removeClass('on').next().slideUp();
            if($(this).next("ul").is(":visible")){
            $(this).next("ul.deth2_list").slideUp("fast");
            } else {
           $(this).addClass('on');
                $(".sitemap_box .deth2_list").slideUp("fast");
                $(this).next("ul.deth2_list").slideToggle("fast");
            }
        });
    });*/





/*  사이드메누 */
( function( $ ) {
$( document ).ready(function() {
    $('.sitemap_box > ul > li > a').click(function() {
          $('.sitemap_box li').removeClass('selected');
              $(this).closest('li').addClass('selected');
              var checkElement = $(this).next();
              if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $(this).closest('li').removeClass('selected');
                checkElement.slideUp('fast');
              }
              if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('.sitemap_box ul ul:visible').slideUp('fast');
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




