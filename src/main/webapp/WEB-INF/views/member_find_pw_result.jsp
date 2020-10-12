<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호 변경</title>

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
				<input type="hidden" id="user_id" name="user_id" value="${user_id}">
				<input type="hidden" id="user_name" name="user_name"
					value="${user_name}"> <input type="hidden" id="user_email"
					name="user_email" value="${user_email}">
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
							<!-- 새 비밀번호 입력 -->
							<div class="con innerbox">
								<h4 class="tit font_red dotred">가입 시 인증한 이메일(인증받은)을 통해
									비밀번호를 재설정하실 수 있습니다.</h4>
								<div class="info_txt">
									<p>
										<em class="tip_deco_dot"></em>영문, 숫자, 특수문자 조합하여 8~20자로 설정해 주시기
										바랍니다.(대소문자를 조합하시면 더욱 안전합니다.)
									</p>
									<p>
										<em class="tip_deco_dot"></em>영문, 숫자 동일 및 연속 3자리 또는 특수문자 동일
										3자리 사용 불가합니다. 예) 123, 111, abc, aaa, !!!
									</p>
									<p>
										<em class="tip_deco_dot"></em>주기적으로 비밀번호를 변경해 주시기 바랍니다.
									</p>
								</div>
								<div class="bg_box">
									<div class="form_box">
										<input type="password" class="int" id="pw" name="pw"
											title="새 비밀번호 입력" placeholder="새 비밀번호"
											onkeypress="capslock(event)">
										<div class="capslockMsg" id="capslockMsg"
											style="display: none;">
											<span class="incaps"> &nbsp;<b>CapsLock</b> 키가
												눌려있습니다.&nbsp;
											</span>
										</div>
										<div class="pw_rule">
											<div class="pw_tip">
												<p class="tip_tit">비밀번호 필수 조건</p>
												<div class="checkbox chkStr">
													<p class="chklbl">영문, 숫자, 특수문자 조합입니다.</p>
												</div>
												<div class="checkbox chkLen">
													<p class="chklbl">8~20자입니다.</p>
												</div>
											</div>
											<div class="pw_step">
												<div class="step_box">
													<div class="top">
														<span class="step_tit">안전 정도</span>
														<button type="button" class="btn_pw_info"
															onclick="showLayer(this, 'pwInfoLayer');return false;">
															<span class="blind">비밀번호 설정 안내</span><em
																class="sp_img icon_pwinfo_open"></em>
														</button>
														<span class="step_txt"></span>

													</div>
													<div class="btm_box">
														<span class="bar"></span>
													</div>
												</div>
												<p class="impsb_txt tip3" style="display: none;">
													영문, 숫자 동일 및 연속 3자리 또는 특수문자 동일<br>3자리 사용 불가합니다. 예) 123,
													111, abc, aaa, !!!
												</p>
											</div>
											<div class="pop_wrap type2" id="pwInfoLayer"
												style="left: 77px; top: 70px; display: none">
												<div class="pop_content pw_seting">
													<div class="pop_head dashed">
														<strong>비밀번호 설정 안내</strong>
													</div>
													<div class="inner">
														<div class="pop_info">
															<p>
																안전한 비밀번호를 사용하는 것은<br>스스로 개인 정보를 지키는 간단한 방법입니다.
															</p>
														</div>
														<ul class="step_info">
															<li><em class="tip_deco_dot"></em><span class="tit"><b
																	class="impossible">사용 불가</b></span><span class="txt">
																	비밀번호에 부적합합니다.</span></li>
															<li><em class="tip_deco_dot"></em><span class="tit"><b
																	class="normal">보통</b></span> <span class="txt"> <span>영문,
																		숫자, 특수문자 조합 8~20자 필수입니다.</span> <span>영문, 숫자 동일 및 연속 3자리 또는 특수문자
																		동일 3자리</span> <span>사용 불가합니다. 예) 123, 111, abc, aaa,
																		!!!</span>
															</span></li>
															<li><em class="tip_deco_dot"></em><span class="tit"><b
																	class="safe">안전</b></span><span class="txt">'<b
																	class="normal">보통</b>' +&nbsp;대문자 조합으로 안전한 비밀번호입니다.
															</span></li>
														</ul>
													</div>
												</div>
												<button type="button" class="under poply_close"
													onclick="showLayer(this, 'pwInfoLayer');return false;">
												</button>
											</div>
										</div>
										<input type="password" class="int" id="pwc" name="pwc"
											title="새 비밀번호 확인 입력" placeholder="새 비밀번호 확인">
										<div class="tip_msgbox">
											<p class="tip_msg tip5" id="pwc_info">비밀번호를 다시 입력해 주세요</p>
											<p class="tip_msg error tip1" id="pwc_unable"
												style="display: none">비밀번호가 일치하지 않습니다.</p>
										</div>
										<button type="button" class="btn_blue small btn_wrfull"
											id="pw_confirm">확인</button>
									</div>
								</div>
							</div>
							<!--//새 비밀번호 입력 -->
						</div>
					</section>

				</article>
			</div>
		</main>
		<footer class="dcfoot">
			<div class="info_policy">
       			<a href="https://www.kakaocorp.com/kakao/subsidiaryCompany" target="_blank">회사소개</a>
				<a href="http://www.kakao.com/policy/terms?type=ts&lang=ko">이용약관</a>
				<a href="https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy"><strong>개인정보처리방침</strong></a>
				<a href="http://www.kakao.com/policy/oppolicy?lang=ko"><strong>운영정책</strong></a>
				<a href="http://www.kakao.com/policy/safeguard?lang=ko"><strong>청소년보호정책</strong></a>
				<a href="https://www.kakaocorp.com/policy/notice/kakaocorp/list"><strong>공지사항</strong></a>
     </div>
			<div class="copyright">Copyright ⓒ 2020 - 2020 company. All
				rights reserved.</div>
		</footer>

	</div>
</body>

<script type="text/javascript">
const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); 
var pw = $('#pw').val();
var pwc = $('#pwc').val();
var pw_check1 = false; //비밀번호체크
var pw_check2 = false;

function chkContinue(pw){   //연속된 문자, 숫자 체크(3자리)
	 var cnt = 0;
	 var cnt2 = 0;
	 var tmp = "";
	 var tmp2 = "";
	 var tmp3 = "";
	 var same_str = 'N';
	 
	 for(i=0; i<pw.length; i++){
		 tmp = pw.charAt(i);
		 tmp2 = pw.charAt(i+1);
		 tmp3 = pw.charAt(i+2);
	  
		  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == 1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == 1){
			  cnt = cnt + 1;
		  }
		  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == -1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == -1){
			  cnt2 = cnt2 + 1;
		  }
		  
		  if(tmp.charCodeAt(0) == tmp2.charCodeAt(0) && tmp2.charCodeAt(0) == tmp3.charCodeAt(0)){
			  same_str = 'Y';
		  }
	 }
	 if(cnt > 0 || cnt2 > 0 || same_str == 'Y'){//사용불가
		 return true;
	 }else{
		 return false;
	 }
}

var showLayer = function(obj, layerName){
	if($("#"+layerName).css("display") == "none"){
		$("#"+layerName).show();
	} else {
		$("#"+layerName).hide();
	}
};


$(document).ready(function(){
	$('#pw').blur(function(){
	var pw = $('#pw').val();
	var pwc = $('#pwc').val();

	var pattern = /^[^ ].*[^ ]$/;
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-z]/;
	var pattern3 = /[~`!@#$%^&*()_+|=\-{}<>[\]?;:,./]/;
	var pattern4 = /[A-Z]/; //대문자
	
	$('.step_box').removeClass('normal')
	$('.step_box').removeClass('safe')
	$('.step_box').removeClass('impossible')
	$('.tip3').css('display','none');
	$('.tip4').css('display','none');
	$('.pw_tip .chkStr').removeClass('on')
	$('.pw_tip .chkLen').removeClass('on')
	$('.step_box .step_txt').html('');
	
	if(pw == ''){
		return false;
	}
	
	if(pwc && pw == pwc)	$('.tip1').css('display','none')
	
	if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)){
		$('.pw_tip .chkStr').removeClass('on')
	}else{
		$('.pw_tip .chkStr').addClass('on')
	}
	if(pw.length < 8 || pw.length > 20){
		$('.pw_tip .chkLen').removeClass('on')
	}else{
		$('.pw_tip .chkLen').addClass('on')
	}
	
	if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || !pattern.test(pw) || pw.length < 8 || pw.length > 20){
		
		$('.step_box').addClass('impossible')
		$('.step_box .step_txt').html('사용 불가');
		
		if(chkContinue(pw))	$('.tip3').css('display','block');
		pw_check1 = false;
		
	}else{
		if(chkContinue(pw)){
			$('.tip3').css('display','block');
			$('.step_box').addClass('impossible')
			$('.step_box .step_txt').html('사용 불가');
			pw_check1 = false;		
		}else if(pattern4.test(pw)){			
			$('.step_box').addClass('safe')
			$('.step_box .step_txt').html('안전');
			pw_check1 = true;	
		}else{	
			$('.step_box').addClass('normal')
			$('.step_box .step_txt').html('보통');
			pw_check1 = true;	
		}
	}
})
});
$(document).ready(function(){
	$('#pwc').blur(function(){
	
	var pwc = $('#pwc').val();
	var pw = $('#pw').val();
	
	if(pw == pwc){
		$('.tip1').css('display','none')
		pw_check2 = true;
	}else{
		$('.tip1').css('display','block')
		pw_check2 = false;
	}
	if(pwc == ''){
		$('.tip5').css('display','block')
		$('.tip1').css('display','none')
		pw_check2 = false;
	}else{
		$('.tip5').css('display','none')
	}
})
});


$('#pw_confirm').on('click',function(e){
	var pw = $('#pw').val();
	var user_email = $('#user_email').val();
	var user_name = $('#user_name').val();
	var user_id = $('#user_id').val();
	
	$.ajax({
		type: "POST",
		url: ctx+"/member_find_pw_result_process",
		contentType : "application/json; charset=UTF-8",
		dataType : "json",
		data : JSON.stringify({
			'user_pw' : pw,
			'user_email' : user_email,
			'user_name' : user_name,
			'user_id': user_id}),
		success:function(data){
			
			}
		}).done(function(data) {
			if((pw_check1 && pw_check2) == true) {
			alert('비밀번호가 정상적으로 변경되었습니다.');
			location.replace(ctx+'/loginform');
			}else {
				alert('비밀번호를 다시 확인하여 주세요.');
				}
			});
});

function capslock(e){
    var keyCode = 0;
    var shirftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if(((keyCode >= 65 && keyCode <90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 112) && shiftKey)){
		$("#capslockMsg").css("color","red");
        $("#capslockMsg").css("display","block");
    }else{
        $("#capslockMsg").css("display","none");
    }
       
}

</script>