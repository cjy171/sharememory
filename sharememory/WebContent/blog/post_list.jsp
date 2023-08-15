<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String)session.getAttribute("id");
	if(sessionId == null) {
		sessionId = ""; 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="body-content">
<div class="container">
	<form action="post_read.jsp" method="get">
		<%
			try
			{
				// JDBC 드라이버 연결
				Class.forName("com.mysql.jdbc.Driver");
				String db_address = "jdbc:mysql://localhost:3306/sharememory";
				String db_username = "root";
				String db_pwd = "abcd1234";
				
				Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
				// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언
				String insertQuery = "SELECT * FROM Blog order by bg_Idx desc";
				
				// MySQL 쿼리문 실행
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				
				// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
				ResultSet result = psmt.executeQuery();
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

				%>
				<%
            			if(sessionId != "") {
            		%>
					        <button type="button" value="신규 글 작성" onClick="location.href='post_new.jsp'">신규 글 작성</button>
					<%
            			}
           			%>
				
				<table border="1">
					<tr>
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<%
					while (result.next()){
					%>
					
						<tr>
							<td><%=result.getString("mb_ID") %></td>
							<td><a href="post_read.jsp?bg_Idx=<%=result.getInt("bg_Idx") %>"><%=result.getString("bg_Title") %></a></td>
							<td><%=dateFormat.format(result.getTimestamp("bg_Date")) %></td>
						</tr>
					<%
						}
					%>
				</table>
			<%
			}
			catch (Exception ex)
			{
				out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
			}%>
	</form>
	</div>
</div>	
<%@ include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>