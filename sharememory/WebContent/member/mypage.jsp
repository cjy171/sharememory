<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지</title>
</head>
<body>
<h1>회원정보</h1>
<% String sessionId=(String)session.getAttribute("id");  %>
 아이디 : <%= sessionId %>
<p>머시기저시기</p>
<p><b><a href="logoutAction.jsp" onclick="logout(); return false;">로그아웃하기</a></b></p>
</body>
</html>