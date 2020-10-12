<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>member_ifnd_process</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_pw_process.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources//css/member_find_pw_process2.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
	<!--스킵 내비게이션-->
	<div class="skip">
		<a href="#pagemenu"><span>페이지메뉴 영역 바로가기</span></a> <a href="#contbox"><span>본문
				영역 바로가기</span></a>
	</div>
	<!-- //스킵 내비게이션-->
	<div id="top" class="width868 login_wrap">
		<!-- 상단 -->
		<header class="dcheader bg">
			<div class="dchead">
				<!-- 로고영역 -->
				<h1 class="dc_logo">
					<a href="<%=request.getContextPath()%>/main">
            <img style="width: 120px; height: 30px;" src="<%=request.getContextPath()%>/resources/images/kakaologo1.png" alt="logo">
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
			<div class="content repw">
				<article>
					<h2 class="blind">아이디 찾기</h2>
					<section id="pagemenu">
						<h2 class="blind">페이지 메뉴</h2>
						<ul class="page_menu clear">
							<!--three-->
							<li><a href="./member_find_id.php" class="pmenu">아이디 찾기</a></li>
							<li><a href="./member_find_pw.php" class="pmenu on">비밀번호
									재설정</a></li>
						</ul>
					</section>
					<section>
						<div class="cont_head">
							<h3 class="head_tit">비밀번호 재설정</h3>
						</div>
						<div id="contbox" class="con_box brd">
							<form id="codeForm" method="post">
								<input type="hidden" id="value" name="value"
									value="${user_email}"> <input type="hidden"
									id="user_id" name="user_id" value="${user_id}"> <input
									type="hidden" id="user_name" name="user_name"
									value="${user_name}">
								<!-- 인증 코드 입력 -->
								<div class="con innerbox">
									<h4 class="tit font_red dotred">가입 시 인증한 이메일(인증받은)을 통해
										비밀번호를 재설정하실 수 있습니다.</h4>
									<div class="info_txt">
										<p>
											<em class="tip_deco_dot"></em>입력하신 메일 주소로 발송된 비밀번호 재설정 인증 코드를
											입력해 주시기 바랍니다.
										</p>
										<p>
											<em class="tip_deco_dot"></em>발급된 인증 번호는 개인 정보 보호를 위해 5분간만
											유효합니다.
										</p>
									</div>
									<div class="bg_box">
										<div>
											<b>인증 코드 발송 후 코드를 입력해 주세요</b>
											<p class="useremail">${ user_email }</p>
											<div class="code_box clear">
												<div class="code_inputbox clear">
													<input type="text" class="code_input" title="인증 코드"
														placeholder="인증 코드 입력" id="code" name="code">
													<button type="button" class="btn_codeok" id="code_confirm">확인</button>
												</div>
												<button type="button" class="btn_white small btn_recode"
													id="cert_check" style="cursor: pointer;">인증 코드 발송</button>
											</div>
											<p class="time" id="time_text" style="display: none;">
												인증 번호 입력까지 남은 시간은 <b class="font_red" id="time">4분 46초</b>
												입니다.
											</p>
										</div>
									</div>
								</div>
								<!-- //인증 코드 입력 -->
							</form>
						</div>
					</section>
				</article>
			</div>
		</main>
		<footer class="dcfoot">
			<div class="info_policy">
				<a href="https://www.kakaocorp.com/kakao/subsidiaryCompany"
					target="_blank">회사소개</a> <a
					href="http://www.kakao.com/policy/terms?type=ts&lang=ko">이용약관</a> <a
					href="https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy"><strong>개인정보처리방침</strong></a>
				<a href="http://www.kakao.com/policy/oppolicy?lang=ko"><strong>운영정책</strong></a>
				<a href="http://www.kakao.com/policy/safeguard?lang=ko"><strong>청소년보호정책</strong></a>
				<a href="https://www.kakaocorp.com/policy/notice/kakaocorp/list"><strong>공지사항</strong></a>
			</div>
			<div class="copyright">Copyright ⓒ 2020 - 2020 company. All
				rights reserved.</div>
		</footer>
	</div>
</body>
<script>
	const ctx = window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2)); // 콘텍스트 패스
	var timerID;
	var intervalTime = function() {
		timerID = setInterval("inputTime()", 1000);
	}
	var code_i = 0;
	var m = 4;
	var s = 59;
	var re_code = 0;
	var inputTime = function() {
		code_i++;
		if (code_i == 1) {
			if (re_code = 0) {
				m = 4;
				s = 59;
			}
			$('#time_text')
					.html(
							'인증 번호 입력까지 남은 시간은&nbsp;<b class="font_red" id="time">4분 59초</b>&nbsp;입니다.');
			$('#time_text').show();
		}
		if (s == 0) {
			m = m - 1;
			s = 60;
		}
		s = s - 1;
		$('#time').text(m + '분 ' + s + '초');
		if (m == '0' && s == '0') {
			re_code = 0;
			$('#time_text').text('인증 시간이 만료되었습니다. 재발급 받으세요');
			clearInterval(timerID);
			m = 4;
			s = 59;
		} else {
			re_code = 1;
		}
	}
	

	$(function() {
		$('#cert_check')
				.click(
						function() {
							var value = $('#value').val();
							if (!value) {
								alert('정상적으로 메일이 발송되지 않았습니다.');
								return false;
							} else {
								if (re_code == 0) {
									$
											.ajax({
												type : "POST",
												url : ctx
														+ "/member_find_pw_processing",
												contentType : "application/json; charset=UTF-8",
												data : value,
												success : function(data) {
													
													var result = JSON
															.parse(JSON
																	.stringify(data));
												
													if (result == null
															|| result == undefined
															|| result == "null") {
														result = "";
													}
													if (result != '') {
														intervalTime();
														alert('입력하신 이메일로 인증번호를 발송하였습니다.');
														$('#time_text')
																.html(
																		'인증 번호 입력까지 남은 시간은&nbsp;<span id="time">4분 59초</span>&nbsp;입니다.');
													}
												}
											});
								} else {
									alert('이전에 발송된 유효한 코드가 있습니다. 인증 시간 만료 후에 재발송 가능합니다.');
									return false;
								}
							}
						});
	});

	$(function() {
		$('#code_confirm').on('click', function(e) {
			var value = jQuery.trim($('#value').val());
			var dice = $("#code").val();
			var user_email = $('#user_email').val();
			var user_name = $('#user_name').val();
			var user_id = $('#user_id').val();
			if (!dice) {
				alert('인증 코드를 입력해 주십시오.');
				return false;
			} else {
				$.ajax({
					type : "POST",
					url : ctx + "/member_find_pw_processing2",
					contentType : "application/json; charset=UTF-8",
					data : dice,
					success : function(data) {
					}
				}).done(function(data) {
					if (data == "p") {
						alert("인증에 성공하였습니다.");
						location.replace('member_find_pw_result');
					} else {
						alert("인증에 실패하였습니다.");
					}
				})
			}
		});
	});
</script>
</html>

