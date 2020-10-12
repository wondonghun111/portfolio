<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>complete</title>
	<script type="text/javascript">
	
	alert("가입해주셔서 감사합니다." + "\n" +"확인을 누를 시 메인페이지로 이동합니다.");
	document.location.href="<%=request.getContextPath()%>/main";
	
	</script>
</head>
<body>
<%
	session.invalidate();
%>
</body>
</html>