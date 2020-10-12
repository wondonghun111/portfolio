<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMPANY_MAIN</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main_reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slick.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.touchSlider.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/uph-1.0.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.unobtrusive-ajax.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/webfont.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/stringprototype.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/slick.min.js"></script>
    
</head>
<body>
    <div class="gnb">
        <a href="<%=request.getContextPath()%>/main" class="logo">COMPANY</a>
        <ul><c:if test="${sessionScope.userId == null }">
            <li><a href="<%=request.getContextPath()%>/loginform"><span>로그인</span></a></li>
            <li><a href="<%=request.getContextPath()%>/clause"><span>회원가입</span></a></li>
            <li><a href="<%=request.getContextPath()%>/find_id"><span>아이디/비밀번호 찾기</span></a></li>            
            </c:if>
            <c:if test="${sessionScope.userId != null}">
            <li><h2><a href="#">${sessionScope.userName}</a>님 환영합니다.</h2></li>
        <!--     <li class="icon cart"><a href ="#"></a></li> -->
         	<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
            </c:if>
        </ul>
    </div>
    <div class="snb main" style="height: 70px;">
        <div class="wrap">
            <ul class="nav">
                <li>
                    <span><a href="#">게시글1</a></span>
                    <ul class="sub" style="">
                        <li><a href="<%=request.getContextPath() %>/map"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                        <li><a href="#"><span>게시판3</span></a></li>
                    </ul>
                </li>              
                <li>
                    <span><a href="#"><span>게시글2</span></a></span>
                    <ul class="sub" style="">
                        <li><a href="#"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                        <li><a href="#"><span>게시판3</span></a></li>
                        <li><a href="#"><span>게시판4</span></a></li>
                    </ul>
                </li>            
                <li>
                    <span><a href="#"><span>게시글3</span></a></span>
                    <ul class="sub" style="">
                        <li><a href="#"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                        <li><a href="#"><span>게시판3</span></a></li>
                        <li><a href="#"><span>게시판4</span></a></li>
                    </ul>
                </li>
                <li>
                    <span><a href="#"><span>게시글4</span></a></span>
                    <ul class="sub" style="">
                        <li><a href="#"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                        <li><a href="#"><span>게시판3</span></a></li>
                        <li><a href="#"><span>게시판4</span></a></li>
                        <li><a href="#"><span>게시판5</span></a></li>
                        <li><a href="#"><span>게시판6</span></a></li>
                    </ul>
                </li>
                <li>
                    <span><a href="#"><span>게시글5</span></a></span>
                    <ul class="sub" style="">
                        <li><a href="#"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                    </ul>
                </li>
                <li>
                    <span><a href="#"><span>게시글6</span></a></span>
                    <ul class="sub" style="">
                        <li><a href="#"><span>게시판1</span></a></li>
                        <li><a href="#"><span>게시판2</span></a></li>
                        <li><a href="#"><span>게시판3</span></a></li>
                        <li><a href="#"><span>게시판4</span></a></li>
                        <li><a href="#"><span>게시판5</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="com_wrap">
        <div class="main_wrap">
            <div class="main_banner">
                <div class="mbanner_wrap">
                    <!-- mbanner_wrap -->
                    <div class="mbanner_box" style="background-image:url(<%=request.getContextPath()%>/resources/images/slider001.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지01</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                        <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/result01.png);  margin-left: -338px;"></div>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider01.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지02</h1>
                                    <p>테스트 메세지<br></p>
                                        
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider02.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지03</h1>
                                    <p>테스트 메세지<br></p>
                                </div>
                            </div>
                        </a>
                       <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/result02.png); margin-left: -138px;"></div>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider03.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지04</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider08.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지05</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                    <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/result03.png); margin-left: -338px;"></div>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider04.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지06</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                     <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/result04.png); margin-left: -338px;"></div> 
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider05.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지07</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                     <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/result05.png); margin-left: -338px;"></div>
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider06.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지08</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                 <!--      <div class="mbanner_char" style="background-image: url(); margin-left: -338px;"></div> -->
                    </div>
                    <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider07.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지09</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                    </div>
                   <div class="mbanner_box" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider10.jpg); display: none;">
                        <a href="javascript: goLink('#', 'B', '', '')">
                            <div class="title_wrap">
                                <div class="title_box">
                                    <h2>00/00 ~ 00/00</h2>
                                    <h1>이벤트 공지10</h1>
                                    <p>테스트 메세지</p>
                                </div>
                            </div>
                        </a>
                      <!--  <div class="mbanner_char" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider10.jpg); margin-left: -338px;"></div> -->
                    </div>
                </div>
                <div class="mbanner_nav">
                    <ul>
                        <li class="img" data-banner-num="1">
                            <div class="btn_mbanner_box img"></div><span>슬라이더01</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="2">
                            <div class="btn_mbanner_box img"></div><span>슬라이더02</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="3">
                            <div class="btn_mbanner_box img"></div><span>슬라이더03</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="4">
                            <div class="btn_mbanner_box img"></div><span>슬라이더04</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="5">
                            <div class="btn_mbanner_box img"></div><span>슬라이더05</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="6">
                            <div class="btn_mbanner_box img"></div><span>슬라이더06</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="7">
                            <div class="btn_mbanner_box img"></div><span>슬라이더07</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="8">
                            <div class="btn_mbanner_box img"></div><span>슬라이더08</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="9">
                            <div class="btn_mbanner_box img"></div><span>슬라이더09</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                        <li class="img" data-banner-num="10">
                            <div class="btn_mbanner_box img"></div><span>슬라이더10</span>
                            <div class="progress_bar" style="width: 232px; display: none;"></div>
                        </li>
                    </ul>
                    <input type="button" class="btn_mbanner_nav prev">
                    <input type="button" class="btn_mbanner_nav next">
                    <div class="mbanner_num"><strong>1</strong>/<span>10</span></div>
                </div>
              <!--   <a class="mbanner_full" href="/news/event">전체보기</a>  -->
            </div>

        </div>
    </div>
   <main>
        <section id="contents">
            <div class="container">
                <h2 class="ir_su">사이트 컨텐츠</h2>
                <section id="cont_left">
                    <h3 class="ir_su">사이트 왼쪽 컨텐츠</h3>
                    <article class="column col1">
                        <h4 class="col_title">Menu</h4>
                        <p class="col_desc">box-shadow를 이용한 마우스 오버 효과입니다.</p>
                        <div class="menu">
                            <ul>
                                <li><a href="#">Cafe <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                <li><a href="#">Tutorial <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                <li><a href="#">WebSite <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                <li><a href="#">Reference <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                <li><a href="#">CSS3 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                <li><a href="#">HTML5 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>

                        <!-- //메뉴-->
                    </article>
                    <!-- //col1 -->
                    <article class="column col2">
                        <h4 class="col_title">Notice</h4>
                        <p class="col_desc">게시판 영역의 한줄 효과와 두 줄 효과 게시판입니다.</p>
                        <!-- 게시판 -->
                        <div class="notice1">
                            <h5>Notice1</h5>
                            <ul>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                            </ul>
                            <a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
                        </div>
                        <!-- //게시판 -->
                        <!-- 게시판2 -->
                        <div class="notice2 mt15">
                            <h5>Notice2</h5>
                            <ul>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                                <li><a href="#">이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.이 줄은 한 줄 효과입니다.</a></li>
                            </ul>
                            <a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
                        </div>
                        <!-- //게시판2 -->
                        <!-- 실제 내용 -->


                        <!-- // -->
                    </article>
                    <!-- //col2 -->
                    <article class="column col3">
                        <h4 class="col_title">Blog</h4>
                        <p class="col_desc">해상도에 따라 이미지를 다르게 표현하는 방법입니다.</p>
                        <!-- blog1 -->
                        <div class="blog1">
                            <h5 class="ir_su">image1</h5> <!-- ir_su를 사용하면 우리눈에는 안보이게 작업한다.-->
                            <figure>                               
                           <!-- <img src="/PROJECT/img/blog3_@3.jpg" alt="normal image"class = "img-normal">
                            <img src="/PROJECT/img/blog3_@3.jpg" alt="retina image" width="100%"class = "img-retina">-->
                                <img src="<%=request.getContextPath()%>/resources/images/blog1_@1.jpg" srcset="<%=request.getContextPath()%>/resources/images/blog3_@1.jpg 1x,<%=request.getContextPath()%>/resources/images/blog3_@2.jpg 2x, <%=request.getContextPath()%>/resources/images/blog3_@3 3x" alt="normal image">
                                <figcaption>웹 사이트 이미지 글입니다.
                                    웹 사이트 이미지 글입니다.
                                    웹 사이트 이미지 글입니다.</figcaption>
                            </figure>
                        </div>
                        <!-- //blog1-->
                        <div class="blog2 mt15">
                            <div class="img-retina">
                                <h5>image2</h5>
                            </div>
                            <p> 웹 사이트 이미지 글입니다. 웹 사이트 이미지 글입니다. 웹 사이트 이미지 글입니다.</p>
                        </div>

                        <!-- blog2 -->
                        <!-- //blog2 -->
                    </article>
                    <!-- //col3 -->
                </section>
                <section id="cont_center">
                    <h3 class="ir_su"> 사이트 가운데 컨텐츠</h3>
                    <article class="column col4">
                        <h4 class="col_title">Slick Slider</h4>
                        <p class="col_desc">slick.js를 이용한 이미지 슬라이드 효과입니다.</p>
                        <!-- 이미지 슬라이드 -->
                        <div class="slider">
                            <div>
                                <figure>

                                    <img src="<%=request.getContextPath()%>/resources/images/slider01.jpg" alt="이미지1"> 
                                    <figcaption><em>Responsive Site1</em><span>슬라이드 플러그인을 이용한  이미지 슬라이드 입니다.</span></figcaption>

                                </figure>
                            </div>
                            <div>
                                <figure>
                                    <img src="<%=request.getContextPath()%>/resources/images/slider02.jpg" alt="이미지2">
                                    <figcaption><em>Responsive Site2</em><span>슬라이드 플러그인을 이용한  이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
                            </div>
                            <div>
                                <figure>
                                    <img src="<%=request.getContextPath()%>/resources/images/slider03.jpg" alt="이미지3">
                                    <figcaption><em>Responsive Site3</em><span>슬라이드 플러그인을 이용한  이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
                            </div>
                            </div>
                        <!-- //이미지 슬라이드 -->
                    </article>
                    <!-- //col4 -->
                    <article class="column col5">
                        <h4 class="col_title">Blend Effect</h4>
                        <p class="col_desc">Background-blend-meod와 mix-blend-mode</p>
                        <!-- lightbox -->
                        <div class ="lightbox square clearfix">
                            <a href="<%=request.getContextPath()%>/resources/images/light01_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light01.jpg" alt="이미지"><em>blur</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light02_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light02.jpg" alt="이미지"><em>brightness</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light03_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light03.jpg" alt="이미지"><em>contrast</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light04_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light04.jpg" alt="이미지"><em>grayscale</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light05_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light05.jpg" alt="이미지"><em>hur-rotate</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light06_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light06.jpg" alt="이미지"><em>invert</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light07_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light07.jpg" alt="이미지"><em>opacity</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light08_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light08.jpg" alt="이미지"><em>saturate</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light09_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light09.jpg" alt="이미지"><em>sepia</em></a>
                            <a href="<%=request.getContextPath()%>/resources/images/light10_s.jpg"><img src ="<%=request.getContextPath()%>/resources/images/light09.jpg" alt="이미지"><em>Mix</em></a>
                        </div>

                        <!-- //lightbox -->
                    </article>
                    <!-- //col5 -->
                    <article class="column col6">
                        <h4 class="col_title">Video</h4>
                        <p class="col_desc"> 영상을 보여주는 영역입니다.</p>
                        <!-- video -->
                            <video controls="controls" loop = "loop">
                                <source src="<%=request.getContextPath()%>/resources/images/video.mp4" type="video/mp4">
                            </video>
                        <!-- //video -->
                    </article>
                    <!-- //col6 -->
                </section>
                <section id="cont_right">
                    <h3 class="ir_su"> 사이트 오른쪽 컨텐츠</h3>
                    <article class="column col7">
                        <h4 class="col_title">Effect1</h4>
                        <p class="col_desc">CSS의 transform을 이용한 마우스 오버효과입니다..</p>
                        <!-- side1 -->
                        <div class="side1">
                            <figure class = "front">
                                <img src="<%=request.getContextPath()%>/resources/images/side1.jpg" alt="이미지1">
                            </figure>
                            <div class="back">
                                <i class="fa fa-heart" aria-hidden="true"></i>
                            </div>
                        </div>
                        <!-- //side1 -->
                    </article>
                    <!-- //col7-->
                    <article class="column col8">
                       <h4 class ="col_title">Effect2</h4>
                        <p class ="col_desc">CSS의 transform을 이용한 마우스 오버효과입니다.</p>
                           <!-- side2 -->
                           <div class = "side2">
                            <figure class= "front">
                                <img src="<%=request.getContextPath()%>/resources/images/side4.jpg" alt="이미지2">
                                <figcaption>
                                    Hover Effect
                                </figcaption>
                            </figure>
                            <figure class = "back">
                                <img src="<%=request.getContextPath()%>/resources/images/side2.jpg" alt="이미지2">
                                <figcaption>
                                    Hvoer Effect
                                </figcaption>
                            </figure>
                        </div>
                        <!-- //side2 -->
                    </article>
                       <!-- //col8 -->
                    <article class="column col9">
                        <h4 class ="col_title">Effect3</h4>
                        <p class = "col_desc">CSS의 transform을 이용한 마우스 오버효과입니다.</p>
                        <!-- side3 -->
                        <div class = "side3">
                            <figure>
                                <img src="<%=request.getContextPath()%>/resources/images/side3.jpg" alt="이미지3">
                            <figcaption>
                                <h3>Hover<em>Effect</em></h3>
                                </figcaption>
                            </figure>
                        </div>
                    <!-- //side3 -->
                    </article>
                    <!-- //col9 -->   
                  </section>                  
            </div>
        </section>
        <!-- //contents -->
    </main>
    
    <footer id="footer">
        <div class = "container">
           <div class = "row">
               <div class = "footer">
                   <ul>
                       <li><a href = "#">사이트 도움말</a></li>
                       <li><a href = "#">사이트 이용약관</a></li>
                       <li><a href = "#">사이트 운영원칙</a></li>
                       <li><a href = "#"><strong>개인정보취급방침</strong></a></li>
                       <li><a href = "#">책임의 한계와 법적고지</a></li>
                       <li><a href = "#">게시중단요청서비스</a></li>
                       <li><a href = "#">고객센터</a></li>
                   </ul>
                   <address>
                       Copyright ©
                       <a href="#"><strong>webstory</strong></a>
                       All Rights Reserved.
                   </address>
               </div>
           </div>
            
        </div>
    </footer>
    <!-- //footer -->

</body>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/main.js">
</script>
</html>