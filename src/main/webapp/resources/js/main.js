var rollingTime = 4000;
var rollingTimeSet;
var gnb = $(".gnb");
var snb = $(".snb");
var aside = $(".aside");
var footer = $(".footer");
var dbclick = $(".dbclick");
var policyList = $(".policy_list li");
var policyView = $(".policy_view li");
var scrollTopObj = $('<a href="#top" class="to-scroll-top">Top</a>').on('click', function() {
  $(window).scrollTop(0);
  return false;
}).appendTo(aside);
var topPosition = 0;
var recalTopPositionFn = [];
setInterval(function() {
  var newPosition = gnb.length > 0 ? gnb.offset().top : 0;
  if (topPosition != newPosition) {
    topPosition = newPosition;
    recalTopPositionFn.map(function(recalTopPositionFnOne) {
      recalTopPositionFnOne();
    });
    //$(window).trigger('scroll');
  }
}, 1);
  //로그아웃 버튼
 /* $(".logout_btn").click({
  	if(confirm("로그아웃 하시겠습니까?") ==true) {
  	document.form.submit();
  	}else {
  		return; 
  	}
  })*/

  //이미지 슬라이더
        $(".slider").slick({
            dots: true, //속성 설정 값 
            autoplay: true, // 자동으로 돌아가기
            autoplaySpeed: 3000, // 자동으로 돌아갈때 스피드 
            arrows: true, //화살표는 X
            responsive: [
                {
                breakpoint: 768,
                settings: {
                    autoplay:false,
                        
                }
            }]
        });
$(document).ready(function() {
  "use strict";

  // SNB
  var initialHeight = snb.css('height');
  snb.find("ul.nav").on("mouseenter", function() {
    var maxSnbHeight = Math.max.apply(null, snb.find('ul.sub').map(function ()
    {
      return $(this).outerHeight(true);
    }).get()) + snb.find('.nav').outerHeight(true);
    snb.addClass("over");
    snb.css('height', maxSnbHeight);
  });
  snb.on("mouseleave", function() {
    snb.removeClass("over");
    snb.css('height', initialHeight);
  });

  // Main banner start
  if($(".main_banner")[0]) {
    mainBanner();
  }

  // dotdotdot
  $(".dot").dotdotdot();

  // fancybox
  $("[data-fancybox]").fancybox({
    touch : {
      vertical : false,  // Allow to drag content vertically
      momentum : true  // Continue movement after releasing mouse/touch when panning
    },
    hash: false,
    youtube: {
      showinfo: 0
    },
    buttons: [
      'fullScreen',
      'close'
    ]
  });

    // 페이지 이동
    if (location.href.indexOf("?page") > -1) {
      var page = Number(location.href.split("?page")[1]);
      var slider_length = $(".swiper-tribe .swiper-slide").length;
      if (page > 0 && page <= slider_length) {
        if (!$("body").hasClass("exploer9")) {
          //console.log(true)
          swiperTribe.slideTo(page-1);
        } else {
          $("html, body").animate({
            scrollTop: $(".slide_"+page).offset().top - 60
          }, 300);
        }
      }
    }

    // 페이지 이동
    if (location.href.indexOf("?job") > -1) {
      var job = Number(location.href.split("?job")[1]);
      var slider_length = $(".swiper-slide").length;
      if (job > 0 && job <= slider_length) {
        if ($(".swiper-battle").length > 0) {// 전투 상세
          if (!$("body").hasClass("exploer9")) {
            swiperBattle.slideTo(job-1);
          } else {
            $("html, body").animate({
              scrollTop: $(".slide_"+job).offset().top - 60
            }, 300);
          }
        } else if ($(".swiper-job").length > 0) {//생활 상세
          if (!$("body").hasClass("exploer9")) {
            swiperJob.slideTo(job-1);
          } else {
            $("html, body").animate({
              scrollTop: $(".slide_"+job).offset().top - 60
            }, 300);
          }
        }
      }
    }
  
  try {
    //top.document.body.style.minWidth = '1500px';
  } catch(e) {}

  //main> pop_welcome, 메인 팝업 수정 2019.10.21.
  var $pop = $(".pop_welcome");
  var $win = $(window);
  //console.log($pop, $win)
  $pop.css({
    //left: ($win.width() - $pop.width()) / 2,
    //top: ($win.height() - $pop.height()) / 2
    marginLeft: $pop.width() / 2 * -1,
    marginTop: $pop.height() / 2 * -1
  })
});

// Window scroll Event
$(window).on("scroll", function(event) {
  var w = $(window);
  var gnbTop = gnb.length > 0 ? gnb.offset().top + gnb.outerHeight(true) : 0;
  var scroll = w.scrollTop();
  var topObjStyle = function() {
    scrollTopObj.css({
      'top': w.height() - (snb.outerHeight() + footer.outerHeight() + scrollTopObj.outerHeight() + 20),
    });
  };
  if (scroll > gnbTop) {
    snb.addClass("fixed");
    topObjStyle();
  } else {
    snb.removeClass("fixed");
  }
  if(w.height() > aside.height() + footer.outerHeight() + 70) {
    if (scroll > gnbTop) {
      aside.addClass("fixed");
      topObjStyle();
    } else {
      aside.removeClass("fixed");
    }
  }
});
$(window).trigger('scroll');
recalTopPositionFn.push(function() {
  $(window).trigger('scroll');
});
function throttle(fn, threshhold, scope) {
  if(!threshhold) {
    threshhold = 250;
  }
  var last,
      deferTimer;
  return function () {
    var context = scope || this;

    var now = +new Date(),
        args = arguments;
    if (last && now < last + threshhold) {
      // hold on to it
      clearTimeout(deferTimer);
      deferTimer = setTimeout(function () {
        last = now;
        fn.apply(context, args);
      }, threshhold);
    } else {
      last = now;
      fn.apply(context, args);
    }
  };
}

// Main Banner
function mainBanner() {
  var rollingBanner;
  var navBox = $(".main_banner .mbanner_nav");
  var totalNum = navBox.find("li").length;
  var currentNum = 0;

  navBox.find(".mbanner_num span").html(totalNum);

  // Nav button box click
  navBox.find("li").on("click", function() {
    var $this = $(this);
    var movNum = $this.data("movNum");
    var movId = $this.data("movId");
    currentNum = $this.data("bannerNum");
    navBox.find(".mbanner_num strong").html(currentNum);
    if($this.hasClass("on") === false) {
      navBox.find("li").removeClass("on");
      $this.addClass("on");
      $(".mbanner_box").fadeOut().eq(currentNum - 1).fadeIn().find(".mbanner_char").css({marginLeft: -238}).stop().animate({marginLeft: -338}, 1000, "easeInOutCubic");
    }
    // Youtube control
    var movBox = $(".mbanner_wrap [data-mov-num]");
    if(movBox.length > 0) {
      // console.log("clear iframe");
      movBox.find("iframe").attr("src", "");
    }
    if($this.find(".btn_mbanner_box.mov").length !== 0) {
      $(".mbanner_wrap").find("[data-mov-num='"+ movNum +"'] iframe").attr("src", "https://www.youtube.com/embed/"+ movId +"?rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1&amp;loop=1&amp;playlist="+ movId);
      rollingTimeSet = rollingTime * 3;
    } else {
      rollingTimeSet = rollingTime;
    }

    // Auto rolling control
    clearInterval(rollingBanner);
    if(navBox.hasClass("stop") === false) {
      // console.log("loop time " + (rollingTimeSet / 1000) + "s");
      loopInterval();
      pregerssBar();
    } else {
      progressBarFull();
    }
  });

  // Nav button arrow click
  navBox.find(".btn_mbanner_nav").on("click", function() {
    var currentIdx = navBox.find("li.on").index();
    var prevIdx = currentIdx - 1;
    var nextIdx = currentIdx + 1;
    if($(this).hasClass("prev")) {
      if(currentIdx === 0) {
        prevIdx = 4;
        for(var i = 0; i < 5; i++) {
          navBox.find("li").last().prependTo(".main_banner .mbanner_nav ul");
        }
      }
      navBox.find("li").eq(prevIdx).trigger("click");
    }
    if($(this).hasClass("next")) {
      if(currentIdx === 4) {
        nextIdx = 0;
        for(var j = 0; j < 5; j++) {
          navBox.find("li").eq(0).appendTo(".main_banner .mbanner_nav ul");
        }
      }
      navBox.find("li").eq(nextIdx).trigger("click");
    }
  });

  // Auto rolling
  function pregerssBar() {
    navBox.find("li .progress_bar").hide();
    navBox.find("li.on .progress_bar").css({width: 0}).show().stop().animate({
      width: 232
    }, rollingTimeSet);
  }

  function progressBarFull() {
    navBox.find("li .progress_bar").hide();
    navBox.find("li.on .progress_bar").css({width: 232}).show().stop();
  }

  function loopInterval() {
    rollingBanner = setInterval(function() {
      navBox.find(".btn_mbanner_nav.next").trigger("click");
    }, rollingTimeSet);
  }

  // Navigation click event
  navBox.find("li .btn_mbanner_box").on("click", function() {
    var $this = $(this);
    if($this.hasClass("mov")) {
      navBox.addClass("stop");
    }
    if($this.hasClass("img")) {
      navBox.removeClass("stop");
    }
  });

  // first load trigger click
  navBox.find("li").eq(0).trigger("click");
}
