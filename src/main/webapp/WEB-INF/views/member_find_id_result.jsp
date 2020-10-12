<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과창</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_id_result.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_login.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_reset.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
</head>

<body>
	<div id="top" class="width868 login_wrap">
		<!-- 상단 -->
		<header class="header bg">
			<div class="head">
				<!-- 로고영역 -->
				<h1 class="logo">
					<a href="<%=request.getContextPath()%>/main"> <img
						style="width: 120px; height: 30px;"
						src="<%=request.getContextPath()%>/resources/images/kakaologo1.png"
						alt="logo">
					</a>
				</h1>
				<!-- //로고영역 -->
				<div class="area_links">
					<ul>
						<li><a href="<%=request.getContextPath()%>/clause">회원가입</a></li>
						<li><a href="<%=request.getContextPath()%>/loginform">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/main">메인화면</a></li>
					</ul>
				</div>
			</div>
		</header>
		<main id="container">
			<div class="content idsearch">
				<input type="hidden" id="value0" name="value0" value=""> <input
					type="hidden" id="value1" name="value1" value="">
				<article>
					<h2 class="blind">아이디 찾기</h2>
					<section id="pagemenu">
						<h2 class="blind">페이지 메뉴</h2>
						<ul class="page_menu clear">
							<!--three-->
							<li><a href="<%=request.getContextPath()%>/find_id"
								class="pmenu on">아이디 찾기</a></li>
							<li><a href="<%=request.getContextPath()%>/find_pw"
								class="pmenu">비밀번호 재설정</a></li>
						</ul>
					</section>
					<section>
						<div class="cont_head">
							<h3 class="head_tit">아이디 찾기</h3>
						</div>
						<div id="contbox" class="con_box brd">
							<!-- 일치 아이디 안내 -->
							<div class="con innerbox">
								<h4 class="tit font_red dotred">입력하신 정보(이름/이메일)와 일치하는 아이디를
									안내해드립니다.</h4>
								<div class="info_txt">
									<p>
										<em class="tip_deco_dot"></em>해당 아이디를 모두 확인하시려면 하단 [등록한 이메일로
										아이디 받기]를 통해 확인하실 수 있습니다.
									</p>
								</div>
								<div class="bg_box">
									<div class="form_box">
										<p class="userid">유저 아이디 : ${user_id}</p>
										<p class="joinday">생성일 : ${create_date}</p>
										<button type="button" id="send_login"
											class="btn_result small btn_wrfull">로그인하러 가기</button>
										<button type="button" id="send_pw"
											class="btn_result small btn_wrfull">비밀번호 찾기</button>
									</div>
								</div>
							</div>
							<!-- //일치 아이디 안내 -->
						</div>
					</section>

				</article>
			</div>
		</main>
		<footer class="foot">
			<div class="info_policy">
				<a href="https://www.kakaocorp.com/kakao/subsidiaryCompany"
					target="_blank">회사소개</a> <a
					href="http://www.kakao.com/policy/terms?type=ts&lang=ko">이용약관</a> <a
					href="https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy"><strong>개인정보처리방침</strong></a>
				<a href="http://www.kakao.com/policy/oppolicy?lang=ko"><strong>운영정책</strong></a>
				<a href="http://www.kakao.com/policy/safeguard?lang=ko"><strong>청소년보호정책</strong></a>
				<a href="https://www.kakaocorp.com/policy/notice/kakaocorp/list"><strong>공지사항</strong></a>
			</div>
			<div class="copyright">Copyright ⓒ 1999 - 2020 COMPANY. All
				rights reserved.</div>
		</footer>
	</div>
</body>
<script>
	const ctx = window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2)); // 콘텍스트 패스
	$('#send_login').on('click', function(e) {
		location.href = ctx + '/loginform';
	});
	$('#send_pw').on('click', function(e) {
		location.href = ctx + '/find_pw';
	});
</script>

</html>
