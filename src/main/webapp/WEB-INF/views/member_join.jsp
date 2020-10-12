<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member_join.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member_join.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div class="head">
				<table>
					<h1 class="h1">회원가입</h1>
					<tr>
						<td>
							<div class="center">
								<div class="stepLine">
									<div title="이용약관" class="stepDot"></div>
									<div title="정보입력" class="stepDot activeStep"></div>
									<div title="가입완료" class="stepDot"></div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
			<div id="container">
				<div id="content">
					<div class="join_content">
						<!-- 아이디 비밀번호 입력 -->
						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box int_id"> <input type="text"
									id="user_id" name="user_id" class="int" title="ID"
									maxlength="20" oninput="checkId()"> <span 
									class="step_url"><i class="fa fa-user-o"
										aria-hidden="true"></i></span>
								</span>
								<div class="check_font" id="id_check"></div>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">비밀번호</label>
								</h3>
								<span class="ps_box int_pass" id="pswd1Img"> <input
									type="password" id="user_pw" name="user_pw" class="int"
									title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20" onkeypress="capslock(event)" oninput = "check_pw()">
									<span class="step_url"><i class="fa fa-unlock-alt"
										aria-hidden="true"></i></span> <span class="lbl"><span
										id="pswd1Span" class="step_txt"></span></span>
								</span>
								<div class="capslockMsg" id="capslockMsg"
											style="display: none;">
											<span class="incaps"> &nbsp;<b>CapsLock</b> 키가
												눌려있습니다.&nbsp;
											</span>
								</div>
								<div class="check_font" id="pw1_check"></div>
								<h3 class="join_title">
									<label for="pswd2">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass_check" id="pswd2Img"> <input
									type="password" id="pswd2" name="pswd2" class="int" oninput = "check_pw()"
									title="비밀번호 재확인 입력" aria-describedby="pswd2Blind"
									maxlength="20"> <span class="step_url"><i
										class="fa fa-unlock-alt" aria-hidden="true"></i></span>
								</span>
								<div class="check_font" id="pw2_check"></div>
							</div>
						</div>
						<!-- //아이디 비밀번호 입력 -->
						<!-- 이름, 생년월일 입력 -->
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box box_right_space"> <input type="text"
								id="user_name" name="user_name" title="이름" class="int" oninput ="check_name()" maxlength="40">
								<span class="step_url"><i class="fa fa-user-circle"
									aria-hidden="true"></i></span>
							</span>
							<div class="check_font" id="name_check"></div>
							<div class="join_row join_birthday">
								<h3 class="join_title">
									<label for="yy">생년월일</label>
								</h3>
								<div class="bir_wrap">
									<div class="bir_yy">
										<span class="ps_box"> <input type="text" id="yy"
											name="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" 
											maxlength="4" oninput="check_birth()"><span class="step_url"><i
												class="fa fa-birthday-cake" aria-hidden="true"></i></span>
										</span>
									</div>
									<div class="bir_mm">
										<span class="ps_box"> <select id="mm" name="mm"
											class="sel" aria-label="월" oninput="check_birth()">
												<option value="">월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
										</span>
									</div>
									<div class=" bir_dd">
										<span class="ps_box"> <input type="text" name="dd"
											id="dd" placeholder="일" aria-label="일" class="int"
											maxlength="2" oninput="check_birth()"> <label for="dd"
											class="lbl"></label> <span class="step_url"><i
												class="fa fa-birthday-cake" aria-hidden="true"></i></span>
										</span>
									</div>
								</div>
							</div>
							<div class="check_font_birth" id="birth_check"></div>
							<!-- //이름, 생년월일 입력 -->
							<!-- 성별, ,이메일 ,전화번호 -->
							<div class="join_row join_sex">
								<h3 class="join_title">
									<label for="gender">성별</label>
								</h3>
								<div class="ps_box gender_code">
									<select name="user_gender" id="user_gender" class="sel" aria-label="성별" oninput ="check_gender()">
										<option value="" selected="">성별</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
								</div>
								<div class="check_font" id="gender_check"></div>
							</div>
							<div class="join_row join_email">
								<h3 class="join_title">
									<label for="email">본인 확인 이메일<span class="terms_choice"></span></label>
								</h3>
								
								<span class="ps_box int_email box_right_space"><input
									type="text" id="user_email" name="user_email" placeholder="이메일 인증을 클릭해주세요." 
									aria-label="이메일 인증을 클릭해주세요." class="int" maxlength="100" oninput="checkemail()" onblur="outCheck()"><i class="fa fa-envelope-o"
										aria-hidden="true"><input type = "button" id ="email_click"class="email_click" value ="인증하기" onclick ="attachAddr()"></i>
								</span>
								<div class="check_font" id="email_check"></div>	
								<br>
								<span class = "ps_box" id="email_box" style ="display:none">
								
									<input
									type="text" id="email_number" name="email_number" placeholder="이메일 인증번호를 입력해주세요." 
									aria-label="이메일 인증번호를 입력해주세요." class="int" maxlength="7">				
									<input type = "button" class="email_btn_click" id= "email_btn_click" value ="인증 확인" onclick ="dettach_btn()">								
								</span>
							</div>
							<div class="join_row join_address">
							<h3 class = "join_title">
								<label for="address">주소</label>
							</h3>
							<span class = "ps_box">
							<input type="text" id="postcode" class = "int" onkeyup="check_address()" placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							</span>
							<span class = "ps_box2">
							<input type="text" id="roadAddress" class="int2" onkeyup="check_address()" placeholder="도로명주소">
							</span>
							<span class = "ps_box2">
							<input type="text" id="detailAddress" class="int2" onkeyup="check_address()" placeholder="상세주소">
							</span>
								<div class="check_font" id="addr_check"></div>
								<br>
							</div>
							<h3 class="join_title">
								<label for="phoneNo">휴대전화</label>
							</h3>
							<div class="int_mobile_area">	
								<span class="ps_box int_mobile">
								<input type="tel"
									id="user_phone" name="user_phone" placeholder="전화번호 입력" oninput ="check_phone()"
									aria-label="전화번호 입력" class="int" maxlength="16"> <span
									class="step_url"><i class="fa fa-phone"
										aria-hidden="true"></i></span> <label for="phoneNo" class="lbl"></label>
								</span>						
								<div class="check_font" id="phone_check"></div>
							</div>
							<!-- 성별,휴대전화 번호 -->
							<!-- 가입 버튼 -->
							<div class="btn_area">
								<button type="button" id="btnJoin" class="btn_type btn_primary">
									<span>가입하기</span>
								</button>
							</div>
							<!-- // 가입 버튼 -->
						</div>
					</div>
				</div>
			</div>
		<table align=center>
			<tbody>
				<tr>
					<td align="center" colspan="2"><br> <br> <font
						color="#a4a4a4" size="2">cell center </font> <font color="#f67001"
						size="2"> 1599.1234 </font> <font color="#a4a4a4" size="2">
							wekdays am 10:00 ~ pm 6:00 </font> <font color="#f67001" size="2">
							lunch. pm 1:00 ~ pm 2:00 </font> <font color="#a4a4a4" size="2">
							sat, syn, holiday off.</font>
						<hr></td>
				</tr>
				<tr>
					<td class="foot1">
						<li><a href="#"> <font size="3">이용약관&nbsp;</font>
						</a></li>
						<li><a href="#"> <strong> <font size="3">개인정보처리방침&nbsp;</font>
							</strong>
						</a></li>
						<li><a href="#"> <font size="3">&nbsp;책임의 한계와
									법적고지&nbsp;</font>
						</a></li>
						<li><a href="#"> <font size="3">회원정보 고객센터&nbsp;</font>
						</a></li>
					</td>
				</tr>

				<tr>
					<td class="foot2"><img class="image1"
						src="<%=request.getContextPath()%>/resources/images/kakaologo1.png"> <span>kakao
							Copyright <a href="https://www.kakaocorp.com/" target="_blank">KAKAO
								Corp.</a> All Rights Reserved.
					</span></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script>


//가입하기 실행 버튼 유효성 검사 


$('#btnJoin').on('click',function(e) {
var inval_Arr = new Array(8).fill(false);
			//아이디 정규식 
			if (idJ.test($('#user_id').val()) && bool) {
				inval_Arr[0] = true;
				
			} else {
				$('#id_check').html("아이디를 다시 한번 확인해주세요.");
				$('#id_check').css('color', 'red');
				inval_Arr[0] = false;
			}
			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (($('#user_pw').val() == ($('#pswd2').val()) != null)
					&& pwJ.test($('#user_pw1').val())) {
				inval_Arr[1] = true;

			} else {
				$('#pw2_check').text('비밀번호를 확인해주세요');
				$('#pw2_check').css('color', 'red');
				inval_Arr[1] = false;
			}
			// 이름 정규식
			if (nameJ.test($('#user_name').val())) {
				inval_Arr[2] = true;

			} else {
				$('#name_check').text('이름을 확인해주세요 ');
				$('#name_check').css('color', 'red');
				inval_Arr[2] = false;
			}
			// 이메일 정규식
			if (emailJ.test($('#user_email').val()) && chk_email2) {
				inval_Arr[3] = true;
			} else {
				$('#email_check').html("이메일을 인증하여 주세요.");
				$('#email_check').css('color', 'red');
				inval_Arr[3] = false;
			}
			//성별 정규식
			if (genderJ) {
				inval_Arr[4] = true;

			} else {
				inval_Arr[4] = false;
				$('#gender_check').text('성별을 선택해주세요.');
				$('#gender_check').css('color', 'red');
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#user_phone').val())) {
				inval_Arr[5] = true;

			} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 ');
			$('#phone_check').css('color', 'red');
				inval_Arr[5] = false;				
		} 
			// 생년월일 정규식
			if ((birth1 && birth2 && birth3) == true) {
				inval_Arr[6] = true;
				
			} else {
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
				inval_Arr[6] = false;								
			}
			// 주소 정규식
			if (chk_address == true) {
				inval_Arr[7] = true;						
			} else {
				$('#addr_check').text('주소를 다시 확인해주세요');
				$('#addr_check').css('color', 'red');
				inval_Arr[7] = false;								
			}
			
			var validAll = true;
			for (var i = 0; i < inval_Arr.length; i++) {
				if (inval_Arr[i] == false) {
					validAll = false;
				}
			}
			if (validAll) { // 유효성 모두 통과		
				
				var user_id = $('#user_id').val();
				var user_pw = $('#user_pw').val();
				var user_name = $('#user_name').val();
				var yy = $('#yy').val();
				var mm = $('#mm').val();
				var dd = $('#dd').val();
				var user_gender = $('#user_gender').val();
				var user_email = $('#user_email').val();
				var postcode = $('#postcode').val();
				var roadAddress = $('#roadAddress').val();
				var detailAddress = $('#detailAddress').val();
				var user_phone = $('#user_phone').val();		
				
				
				$.ajax({
					type : 'POST',
					url : '../sn/complete',
					contentType:'application/json',
					data : JSON.stringify({
						"user_id" : user_id,
						"user_pw" : user_pw,
						"user_name" : user_name,
						"yy" : yy,
						"mm" : mm,
						"dd" : dd,
						"user_gender" : user_gender,
						"user_email" : user_email,
						"postcode" : postcode,
						"roadAddress" :roadAddress,
						"detailAddress" : detailAddress,
						"user_phone" : user_phone								
					}),
					succcess : function(data) {
						
					}
				}).done(function(e) {
					location.replace('../sn/member_result');
				});
			} else {
				alert('입력한 정보들을 다시 한번 확인해주세요 :)')
			}
});
</script>
</html>