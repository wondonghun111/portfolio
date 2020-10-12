<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
  <meta charset="UTF-8">
  <title>WeCOMPANY 비밀번호 찾기</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources//css/member_find_pw.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources//css/member_find_login.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources//css/member_find_reset.css"/>
  <script  type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
  <div id="top" class="width868 login_wrap">
    <!-- 상단 -->
    <header class="header bg">
      <div class="head">
        <!-- 로고영역 -->
        <h1 class="logo">
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
            <ul class="page_menu clear"><!--three-->
              <li><a href="<%=request.getContextPath()%>/find_id" class="pmenu">아이디 찾기</a></li>
              <li><a href="<%=request.getContextPath()%>/find_pw"class="pmenu on">비밀번호 재설정</a></li>
            </ul>
          </section>
          <section>
            <div class="cont_head">
              <h3 class="head_tit">비밀번호 재설정</h3>
            </div>
            <div id="contbox" class="con_box brd">
              <div class="con innerbox">
                <h4 class="tit font_red dotred">가입 시 인증한 이메일(인증받은)을 통해 비밀번호를 재설정하실 수 있습니다.</h4>
                <div class="info_txt">
                  <p><em class="tip_deco_dot"></em>아이디를 잊으신 경우 아이디 찾기를 통해 아이디 확인을 먼저 해주시기 바랍니다.</p>
                  <p><em class="tip_deco_dot"></em>이메일은 반드시 인증받은(또는 이메일 변경을 통해 변경한) 메일 주소를 입력하셔야 합니다.</p>
                  <p><em class="tip_deco_dot"></em>회원 가입 시 실명이 아닌 다른 이름으로 가입했을 경우, 해당 가입 시 입력한 이름을 입력하셔야 합니다.</p>
                </div>
                <div class="bg_box">
                  <div class="form_box">              
                    <input type="text" class="int" title="아이디" id="user_id" name = "user_id" placeholder="아이디">
                    <input type="text" class="int" title="이름" id="user_name"  name = "user_name" placeholder="이름">
                    <input type="text" class="int" title="이메일" id="user_email" name = "user_email" placeholder="이메일">
                    <button type="button"  id="pw_find" class="btn_blue small btn_wrfull">확인</button>                 
                  </div>
                </div>
              </div> 
              <!-- //정보 입력 -->
            </div>
          </section>

        </article>
      </div>
    </main>
    	    <footer class="foot">
     <div class="info_policy">
       			<a href="https://www.kakaocorp.com/kakao/subsidiaryCompany" target="_blank">회사소개</a>
				<a href="http://www.kakao.com/policy/terms?type=ts&lang=ko">이용약관</a>
				<a href="https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy"><strong>개인정보처리방침</strong></a>
				<a href="http://www.kakao.com/policy/oppolicy?lang=ko"><strong>운영정책</strong></a>
				<a href="http://www.kakao.com/policy/safeguard?lang=ko"><strong>청소년보호정책</strong></a>
				<a href="https://www.kakaocorp.com/policy/notice/kakaocorp/list"><strong>공지사항</strong></a>
     </div>
     <div class="copyright">Copyright ⓒ 2020 - 2020 company. All rights reserved.</div>
    </footer>
  </div>
</body>
<script>
	const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); // 콘텍스트 패스
	var bool = false;
	
	function onKeyDown() {
		if (event.keyCode == 13) {
			event.preventDefault();
			onSubmit();
		}
	}
	$('#pw_find').on('click',function(e) {
		var user_id = jQuery.trim($('#user_id').val());
		var user_name = jQuery.trim($('#user_name').val());
		var user_email = jQuery.trim($('#user_email').val());
		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 
		if (!user_id) {
			alert("아이디를 입력해주세요.");
			$('#user_id').val('');
			$('#user_id').focus();
			return;
		}else {
			bool = true;
			}
		if (!user_name) {
			alert("이름을 입력해주세요.");
			$('#user_name').val('');
			$('#user_name').focus();
			return;
		}else {
			bool = true;
			}
        if (!user_email) {
			alert("이메일을 입력해주세요.");
			$('#user_email').val('');
			$('#user_email').focus();
			return;
		}else {
			bool = true;
			}
        if (!regExp.test(user_email)) {
			alert("이메일주소를 정확하게 입력하세요.");
			$('#user_email').val('');
			$('#user_email').focus();
			return;
		}	else {
			bool = true;
			}
 			$.ajax({//request 부분
				  type: "POST",
				  url: ctx+"/member_finding_pw",
				  contentType : "application/json; charset=UTF-8", // 요청 컨텐트 타입 
				  data: JSON.stringify({
					     'user_name' : user_name,
					  	 'user_email' : user_email,
					  	 'user_id' : user_id
				  }),success : function(data) {
						var judge = JSON.parse(JSON.stringify(data));
						if(judge==null || judge==undefined || judge=="null") {
							judge = "";
							}
						if(judge != "") {
						document.location.replace(ctx+'/member_find_pw_process?value='+judge);
							} else {
							alert('입력한 정보에 해당하는 계정이 없습니다.');
							}
					},  errer : function(err) {
						   alert(err);
					  }
 	 	});		
	});
</script>
</html>

    