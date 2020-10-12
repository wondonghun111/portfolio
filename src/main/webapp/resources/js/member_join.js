		//contextPath
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); 
		
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/; //a~z, 0~9로 시작하는 4~12자리 아이디를 만들수있다.
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; //A~Z,a~z,0~9로 시작하는 4~12자리 비밀번호 설정가능
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/; //가~힣. 한글로 이뤄진 문자만으로 2~6자리 이름을 적을수있다.
		// 이메일 검사 정규식
		var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //_특주문자가 가능하며 중앙에 @ 필수 .뒤에 2~3글자 필요.
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // -생략하고 01? 방식으로 적용
		// 성별 정규식
		var genderJ = false;
		
		var birthJ = false;
		var idChck = 0;
		var bool = false;
		var birth1 = false;
		var birth2 = false;
		var birth3 = false;
		var chk_email = false;
		var chk_email2 = false;
		var chk_address1 = false;
		var chk_address2 = false;
		var chk_address3 = false;
		var chk_address = false; //최종적으로 주소 판단
		
		
		//이메일 중복 검사
		function checkemail() {
		
		var user_email = $('#user_email').val();
			$.ajax({
				type : 'POST',
				url : ctx+'/emailChk',
				dataType : "json",
				data : {
					"user_email" : user_email
				},
				success : function(result) {
								
					if (result == 0 && emailJ.test($("#user_email").val())) {
						$('#email_check').html("사용할 수 있는 이메일입니다.");
						$('#email_check').css('color', 'black');
						chk_email = true;
					} else {
						$('#email_check').html("사용할 수 없는 이메일입니다.");
						$('#email_check').css('color', 'red');
						chk_email = false;
					}
				}
			})
		};
		
		//이메일 인증박스 오픈
		
		function attachAddr() {
			if(chk_email == false) {
				alert("이메일을 다시 확인해주세요.");
			} else if(chk_email == true) {
				var user_email = $("#user_email").val();		
				alert("이메일이 정상적으로 발송되었습니다.");
				document.getElementById('email_box').style.display='block';
				$("#user_email").prop('disabled',true);
				
				$.ajax({//request 부분
				  method: "POST",
				  url: ctx+"/auth",
				  data: {"user_email": user_email},//JSON 파라미터					 
				  success:function(data){				  				  
				  }
				});				
			}else { 
				alert("이메일을 다시 확인해주세요.");
			}
		}	
		
		
		function outCheck() {
			if (chk_email) {
				$('#email_check').hide();
			}
			if (chk_email == false) {
				$('#email_check').show();
			}
		}
		
		//이메일 인증박스 닫기
		function dettach_btn() {
				var dice = $("#email_number").val();
			if(document.getElementById('email_box').style.display=='block') {
			$.ajax({//request 부분
				  method: "POST",
				  url: ctx+"/certification",
				  data: "dice="+dice,//JSON 파라미터
				  success:function(data){				 
				  }
				}).done(function(data) {
				    if(data == "p") {
				    	alert('인증에 성공하였습니다.');
						document.getElementById('email_box').style.display='none';
						$('#email_click').attr('disabled', true);
						chk_email2 = true;
				    } else {
				    	alert('인증에 실패하였습니다.\n인증 번호를 다시 한번 확인해주세요.');
				    }
				});
			
			} else {
				
			}
		}
				
		//엔터키 가능
		function onKeyDown() {
			if (event.keyCode == 13) {
				event.preventDefault();
				onSubmit();
			}
		}
		//아이디	
	 	function checkId() {
			var userID = $('#user_id').val();
			$.ajax({
				type : 'POST',
				url : '../sn/idChk',
				dataType : "json",
				data : {
					"user_id" : userID
				},
				success : function(result) {
				}
				}).done(function(result) {
						if (idJ.test($('#user_id').val()) && (result == 0)) {
						$('#id_check').html("사용할 수 있는 아이디입니다.");
						$('#id_check').css('color', 'black');
						$('#id_check').hide();
						bool = true;
					}else if(result != 0){
						$('#id_check').html("중복된 아이디입니다.");
						$('#id_check').css('color', 'red');
						$('#id_check').show();
						bool = false;
					}else {
						$('#id_check').html("4~12글자이여야 합니다.");
						$('#id_check').css('color', 'red');
						$('#id_check').show();
						bool = false;
					}
				});	
		};
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
		
		//패스워드
		function check_pw() {
		$("#user_pw").blur(function() {
			if (pwJ.test($(this).val())) {
				$("#pw1_check").text('');
			} else {
				$('#pw1_check').text('비밀번호를 확인해주세요');
				$('#pw1_check').css('color', 'red');
			}
		});
		$("#pswd2").blur(
				function() {
					if (pwJ.test($(this).val())
							&& $('#user_pw').val() == ($('#pswd2').val())) {
						$("#pw2_check").text('');
					} else if ($('#user_pw').val() != $('#pswd2').val()) {
						$('#pw2_check').text('비밀번호가 서로 맞지않습니다 다시 확인해주세요');
						$('#pw2_check').css('color', 'red');
						document.getElementById("pswd2").value = null;
					} else {
						$('#pw2_check').text('비밀번호를 확인해주세요');
						$('#pw2_check').css('color', 'red');
					}
				});
				}
		//휴대전화 검사
		function check_phone() {
		$('#user_phone').blur(function() {
			if (phoneJ.test($(this).val())) {
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 ');
				$('#phone_check').css('color', 'red');
			}
		});
		}
		//이름 검사
		function check_name() {
		$('#user_name').blur(function() {
			if (nameJ.test($(this).val())) {
				$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요 ');
				$('#name_check').css('color', 'red');
			}
		});
		}
		//성별 검사
		function check_gender() {
		$('#user_gender').blur(function() {
			if ($('#user_gender option:selected').val() != '') {
				$("#gender_check").text('');
				genderJ = true;
			} else {
				$('#gender_check').text('성별을 확인해주세요 ');
				$('#gender_check').css('color', 'red');
				genderJ = false;
			}
		});
		}
			
	function check_birth() {
		// 생일 유효성 검사
			var data = document.getElementById("yy").value;
			var year = data.substr(0,4);
			var today = new Date(); // 날짜 변수 선언
			var yearNow = today.getFullYear(); // 올해 연도 가져옴
			var numSelect = document.getElementById("mm");
			var value = numSelect.options[document.getElementById("mm").selectedIndex].value;
			var day = document.getElementById("dd").value;
	
			 if (1900 > year || year > yearNow || year == null) {				
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
				birth1 = false;
			} else if (1 > value) {
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
				birth2 = false;
			} else if (1 > day || 31 < day) {
			$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red');
				birth3 = false;
			} else if ((value == 4 || value == 6 || value == 9 || value == 11)	&& day == 31) {
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');		
					birth3 = false;
			} else if (value == null || value == 0) {
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');
					birth3 = false;
			} else if (value == 2) {
				var isleep = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day > 29 || (day == 29 && !isleep)) {
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
				birth3 = false;
				} else {
					$('#birth_check').text('');
					birth1 = true;
					birth2 = true;
					birth3 = true;
				}
			} else  {
				$('#birth_check').text('');
				birth1 = true;
				birth2 = true;
				birth3 = true;
			}
	};
	
	//주소 유효성 검사
	function check_address() {
		var address_num = document.getElementById("postcode").value; // 우편번호
		var road_address = document.getElementById("roadAddress").value; //도로명주소
		var detail_address = document.getElementById("detailAddress").value; //상세주소
		
		if(address_num == null || address_num == '') {
			$('#addr_check').text('우편주소를 다시 확인해주세요 ');
				$('#addr_check').css('color', 'red');
				chk_address1 = false;
		}else if((road_address  == null) || (road_address == '')) {
			$('#addr_check').text('도로명주소를 다시 확인해주세요 ');
			$('#addr_check').css('color', 'red');
			chk_address2 = false;
		}else if((detail_address == null) || (detail_address == '')) {
			$('#addr_check').text('상세주소를 다시 확인해주세요 ');
				$('#addr_check').css('color', 'red');
				chk_address3 = false;
		}else {
			$('#addr_check').text('');
			chk_address1 = true;
			chk_address2 = true;
			chk_address3 = true;
		}
		
		if((chk_address1 && chk_address2 && chk_address3) == true) 	chk_address = true;	
	}

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
         
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;    
        }
    }).open();
}	
		// 가입하기 실행 버튼 유효성 검사
	/*	$('#btnJoin').on('click',function(e) {
		alert('테스트');
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
						$.ajax({
							type : 'POST',
							url : ctx+'/complete',
							data : {
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
							},
							succcess : function(data) {
								
							}
						});
					} else {
						alert('입력한 정보들을 다시 한번 확인해주세요 :)')
					}
	});
	*/
			
	window.onpageshow = function(e) {
			if(e.persisted || (window.performance && window.performance.navigation.type == 2)) {
				alert('뒤로가기를 할수없습니다.');
				window.history.forward();
				}
		}
		
		