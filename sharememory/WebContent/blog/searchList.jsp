<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/CSS/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<div class="body-content">
	<div class="container">
	<%
		try
		{
			// JDBC 드라이버 연결
			Class.forName("com.mysql.jdbc.Driver");
			String db_address = "jdbc:mysql://localhost:3306/sharememory";
			String db_username = "root";
			String db_pwd = "abcd1234";
			Connection conn = DriverManager.getConnection(db_address, db_username, db_pwd);
			
			// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언
			String insertQuery = "SELECT * FROM Blog WHERE bg_Title LIKE ? OR bg_Content LIKE ?";
			
			// MySQL 쿼리문 실행
			PreparedStatement psmt = conn.prepareStatement(insertQuery);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			String findKeyword = request.getParameter("findKeyword");
			
		    psmt.setString(1, "%" + findKeyword + "%");
		    psmt.setString(2, "%" + findKeyword + "%");
		    
		 	// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
			ResultSet result = psmt.executeQuery();
			
		 	boolean searchResult = false;
			%>
			
			<table border="1">
			<%
				while (result.next()){
					searchResult = true;
					String postWriter = result.getString("mb_ID");
					int postIdx = result.getInt("bg_Idx");
					String postTitle = result.getString("bg_Title");
					String postDate = dateFormat.format(result.getTimestamp("bg_Date"));
       		%>
           		<tr>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td><%= postWriter %></td>
					<td><a href="post_read.jsp?bg_Idx=<%= postIdx %>"><%= postTitle %></a></td>
					<td><%= postDate %></td>
				</tr>
			<%
				}
      		%>
			</table>
		<%
		if(!searchResult){
		%>
		<p>검색 결과가 없습니다.</p>
		<%
		}
		result.close();
        psmt.close();
        conn.close();
		}
		catch (Exception ex)
		{
			out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
		}%>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>