//IE background fixed scroll bug fix
	function onKeyDown() {
		if (event.keyCode == 13) {
			event.preventDefault();
			onSubmit();
		}
	}
	
	function onSubmit() {		

		if (frm.j_username.value == "") {
			alert("로그인할 아이디를 입력하여 주세요.");
			txtmemberID.focus();
			return;
		}

		if (frm.j_password.value == "") {
			alert("비밀번호를 입력하여 주세요.");
			txtpwd.focus();
			return;
		}
		//폼 내부의 데이터를 전송할 주소
		frm.submit();
	}
	