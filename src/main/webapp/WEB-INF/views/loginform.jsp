<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html lang=ko>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<form class="login_form" name= "frm" id="loginForm" 
action = "<%=request.getContextPath() %>/loginlogic" method ="POST">
	<div class="login_page_wrap">
		<div class="login_box">
			<div class="side1">
				<figure class="front">
					<img src="//dasdas123.dothome.co.kr/PROJECT/img/kakao2.png"
						alt="images">
				</figure>
				<div class="back">
					<i class="fa fa-heart" aria-hidden="true"></i>
				</div>
			</div>
			<h1>
				<span><strong>카카오</strong> 로그인 </span>
			</h1>
			<input class="ipt_id" type="text" id="user_id" name="user_id"
				placeholder="아이디" onkeydown="onKeyDown()" tabindex="1">
				<input
				class="ipt_pw" type="password" id="user_pw" name="user_pw"
				placeholder="비밀번호" onkeydown="onKeyDown()" tabindex="1">
			<button type="submit" class="login_ok"  onclick="onSubmit()">로그인</button>
			<c:if test="${not empty error}">
				<div class = "error">${error}</div>
			</c:if>
			<c:if test = "${not empty msg }">
				<div class = "msg">${msg }</div>
			</c:if>			
			<input type = "hidden" name = "${_csrf.parameterName} " value ="${_csrf.token }"/>
			<ul class="list">
				<li><a href="<%=request.getContextPath()%>/clause">회원가입</a></li>
				<li><a href="<%=request.getContextPath()%>/find_id">아이디 찾기</a></li>
				<li><a href="<%=request.getContextPath()%>/find_pw">비밀번호 찾기</a></li>
			</ul>
			<div class="com_sns">
				<div class="label">다양한 채널에서 카카오를 만나보세요</div>
				<ul>
					<li><a class="home" href="<%=request.getContextPath() %>/main">홈페이지</a></li>
					<li><a class="instagram"
						href="https://www.instagram.com/kakaofriends_official/?hl=ko"
						target="_blank">인스타그램</a></li>
					<li><a class="facebook"
						href="https://www.facebook.com/kakao.brandmedia/" target="_blank">페이스북</a></li>
					<li><a class="youtube"
						href="https://www.youtube.com/channel/UCBjvBJgIp3NGkrTBEfWBUVw"
						target="_blank">유튜브</a></li>
					<li><a class="twitter" href="https://twitter.com/kakaoteam"
						target="_blank">트위터</a></li>
				</ul>
			</div>
		</div>
	</div>
</form>



<!-- 푸터 -->

<div class="footer">
	<div class="ft_bar">
		<div class="wrap">
			<ul>
				<li><a href="https://www.kakaocorp.com/kakao/subsidiaryCompany"
					target="_blank">회사소개</a></li>
				<li><a href="http://www.kakao.com/policy/terms?type=ts&lang=ko">이용약관</a></li>
				<li><a
					href="https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy"><strong>개인정보처리방침</strong></a></li>
				<li><a href="http://www.kakao.com/policy/oppolicy?lang=ko"><strong>운영정책</strong></a></li>
				<li><a href="http://www.kakao.com/policy/safeguard?lang=ko"><strong>청소년보호정책</strong></a></li>
				<li><a
					href="https://www.kakaocorp.com/policy/notice/kakaocorp/list"><strong>공지사항</strong></a></li>
			</ul>
		</div>
	</div>
	<div class="wrap">
		<div class="ft_lbox">
			<div class="ft_logo">KAKAO</div>
			<div class="ft_info">
				<p>
					Copyright <strong><a href="http://www.kakaocorp.com/main"
						class="link_kakao">Kakao Corp.</a></strong>© All rights reserved.
				</p>
				제주특별자치도 제주시 첨단로 242 (우)63309 11F~15F | ㉾ 06210 | Tel 1899-1326 | Fax
				02-1234-5678 | Email kakako@naver.com<br>사업자등록번호 201-81-55470 |
				통신판매업신고 제 2018-서울강남-03265 | 대표이사 여민수 | 조수용 <a
					href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208147521"
					target="_blank">사업자정보확인</a>
			</div>
		</div>
		<div class="ft_rbox">
			<div class="ft_logo"></div>
		</div>
	</div>
</div>
<script src= "<%=request.getContextPath()%>/resources/js/loginform.js"></script>

</html>
