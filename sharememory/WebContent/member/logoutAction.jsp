<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
<script>
	function logout(){
		alert("로그아웃 되었습니다");
		location.href = '../index.jsp';
	}
	setTimeout(logout, 500);	
</script>
</head>
<body>
</body>
</html>