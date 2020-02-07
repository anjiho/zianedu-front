$(function(){
    /*
   kiplayer.sliderBx($("#mainShopVisual #productSlider1"));
    kiplayer.sliderBx($("#mainShopVisual #productSlider2"));
    kiplayer.sliderBx($("#mainShopVisual #productSlider3"));
    kiplayer.sliderBx($("#mainShopVisual #productSlider4"));
    kiplayer.sliderBx($("#mainShopVisual #productSlider5"));

   var sliderOption1 = {
       autoplay:true,dots:true,infinite:true,slidesToShow:2,slidesToScroll:1,
       responsive:[{
           breakpoint:767,
           settings:{autoplay:true,slidesToShow:1,centerMode:true}
       }]
   };
   kiplayer.sliderSlick($("#teacherList1"), sliderOption1);
   kiplayer.sliderSlick($("#teacherList2"), sliderOption1);

   kiplayer.sliderSlick($("#productList1"));
   kiplayer.sliderSlick($("#productList2"));
   kiplayer.sliderSlick($("#productList3"));
   kiplayer.sliderSlick($("#productList4"));

   $("#mainShopVisual .right ul li > a").click(function(){
       $("#mainShopVisual .right ul li").removeClass("active");
       $(this).parent().addClass("active");
   });
   */

    // if($("#mainVisualSlider1").length > 0){
    //     kiplayer.sliderBx($("#mainVisualSlider1"));
    // }
    // if($("#mainVisualSlider2").length > 0){
    //     kiplayer.sliderBx($("#mainVisualSlider2"));
    // }
    // /*$(".mainProductList").each(function(){
    //     kiplayer.sliderSlick($(this));
    // });*/
    // $(".mainProductList2").each(function(){
    //     kiplayer.sliderSlickNew($(this));
    // });
    // $(".mainProductList3").each(function(){
    //     kiplayer.sliderSlickNew2($(this));
    // });

    /*index_inline main 부분 슬라이드 slick 교체 부분
        /*$(".mainStoryList").each(function(){
            kiplayer.sliderSlick($(this));
        });*/

    /*$(".mainTeacherTitle > li").eq(0).addClass("active");
    $(".mainTeacherPage").each(function(){
        var sliderOption = {
            auto:true,autoControls:true,controls:true,pagerCustom:'#bx-pager',hideControlOnEnd:true,onSlideNext:function(e){
                $(".mainTeacherTitle > li").removeClass("active");
                if(e.index() < 4){
                    $(".mainTeacherTitle > li").eq(0).addClass("active");
                }else{
                    $(".mainTeacherTitle > li").eq(1).addClass("active");
                }
            }
        };
        kiplayer.sliderBx($(this), sliderOption);
    });*/

    var galleryThumbs1 = new Swiper('#mainTeacherTab1 .mainTeacherTitle', {
        spaceBetween:0,
        slidesPerView:6,
        loop:true,
        freeMode:true,
        loopedSlides:7, //looped slides should be the same
        watchSlidesVisibility:true,
        watchSlidesProgress:true,
        breakpointsInverse: true, breakpoints:
            { // when window width is >= 320px
                320: { slidesPerView: 2, spaceBetween: 0 },
                // when window width is >= 480px
                600: { slidesPerView: 3, spaceBetween: 0 },
                // when window width is >= 640px
                800: { slidesPerView: 4, spaceBetween: 0 } ,
                // when window width is >= 640px
                1024: { slidesPerView: 6, spaceBetween: 0 }
            }
    });

    var galleryTop1 = new Swiper('#mainTeacherTab1 .mainTeacherPage', {
        spaceBetween:0,
        loop:true,
        loopedSlides:7, //looped slides should be the same
        navigation:{
            nextEl:'#mainTeacherTab1 .swiper-button-next',
            prevEl:'#mainTeacherTab1 .swiper-button-prev',
        },
        thumbs:{
            swiper:galleryThumbs1,
        },
    });

    var galleryThumbs2 = new Swiper('#mainTeacherTab2 .mainTeacherTitle', {
        spaceBetween:0,
        slidesPerView:6,
        loop:true,
        freeMode:true,
        loopedSlides:7, //looped slides should be the same
        watchSlidesVisibility:true,
        watchSlidesProgress:true,
        breakpointsInverse: true, breakpoints:
            { // when window width is >= 320px
                320: { slidesPerView: 2, spaceBetween: 0 },
                // when window width is >= 480px
                600: { slidesPerView: 3, spaceBetween: 0 },
                // when window width is >= 640px
                800: { slidesPerView: 4, spaceBetween: 0 } ,
                // when window width is >= 640px
                1024: { slidesPerView: 6, spaceBetween: 0 }
            }
    });
    var galleryTop2 = new Swiper('#mainTeacherTab2 .mainTeacherPage', {
        spaceBetween:0,
        loop:true,
        loopedSlides:7, //looped slides should be the same
        navigation:{
            nextEl:'#mainTeacherTab2 .swiper-button-next',
            prevEl:'#mainTeacherTab2 .swiper-button-prev',
        },
        thumbs:{
            swiper:galleryThumbs2,
        },
    });
});

$(window).resize(function(){
});

$(window).scroll(function(){
});