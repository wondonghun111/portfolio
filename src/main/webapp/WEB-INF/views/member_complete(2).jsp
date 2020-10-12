<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">
window.onload = function() {
	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 8 || kcode == 116) event.returnValue = false;
	}
}
</script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member_clause.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body oncontextmenu="return false">
	<div id="wrap">
		<header id="header"></header>
		<aside class="aside"></aside>
		<section class="section1">
			<div class="contents">
				<span class="con_span">
					<h1>가입을 환영합니다.</h1>
				</span>
				<div class="bor_box">
					<span><strong>${sessionScope.user_name}</strong>님은<br>
						<strong>${sessionScope.user_id}</strong> 의 아이디로 가입 완료 되었습니다.</span>
				</div>
			</div>
		</section>
		<section class="section2">
			<div class="container">
				<div class="sec2_div">
					<span class="comment">
						<h1>
							<span>회원가입이 정상적으로 완료되었습니다.</span>
						</h1> <br>
						<p>
							<span>메인 화면이나 로그인 화면으로 가실려면 버튼을 클릭해주세요.</span>
						</p>
					</span>
				</div>
				<span class="btn_box">
					<button type="button" id="btn1" class="btn1" onClick="btn1">
						<span>메인화면</span>
					</button>
					<button type="button" id="btn2" class="btn2" onClick="btn2">
						<span>로그인화면</span>
					</button>
				</span>
			</div>
		</section>
	</div>
	<script>
    
       document.getElementById("btn1").onclick = function() {
         location.href = "<%=request.getContextPath()%>/main"
     }
      document.getElementById("btn2").onclick = function() {
         location.href = "<%=request.getContextPath()%>/loginform"
		}
	</script>
</body>

</html>
