<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 성공</title>
<script>
	function login(){
		alert("로그인 되었습니다.");
		location.href = '../index.jsp';
	}
	setTimeout(login, 500);	
</script>
</head>
<body>
</body>
</html>