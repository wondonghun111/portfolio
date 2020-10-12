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
    
    <style type="text/css">
    body {
	background-color: #f5f6fa;
}
    </style>
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
            <li class="icon cart"><a href ="#"></a></li>
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
   <body>
   <div class = "loca">
   </div>
   <p style="text-align: center; font-size: 20px;"><strong>찾아 오시는 길</strong></p><br>
   <section class = "content">
   	<div id = "contain">
		<div id="map" style="width:50%;height:50vh; border:5px solid #dbdbdb;"></div>
   	</div>
   </section>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=c02e7d80fc362a41e11f8561e95222b9"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.501756, 127.025437), // 지도의 중심좌표
	        level: 1, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	//지도에 마커를 생성하고 표시한다.
	var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(37.501756, 127.025437),
		map: map //마커를 표시할 지도 객체
		});

	var iwContent =
		'<div style= "padding:5px;text-align:center;">회사의 위치</div>'
	 // iwPosition = new kakao.maps.LatLng(37.501756, 127.025437);

	  //윈포 윈도우를 생성합니다.
	 var infowindow = new kakao.maps.InfoWindow({
	//	position: iwPosition,
		content: iwContent
		 });

	 //마커 위에 인포윈도우를 표시합니다.
	 infowindow.open(map,marker);
</script>
	
</body>
    
    <footer id="footer2">
        <div class = "container">
           <div class = "row">
               <div class = "footer map">
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>


</html>