<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
	<form action="post_read.jsp" method="get">
		<h1>공지사항 목록</h1>
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
				String insertQuery = "SELECT * FROM Notice order by nt_Idx desc";
				
				// MySQL 쿼리문 실행
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				
				// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
				ResultSet result = psmt.executeQuery();%>
				
				<table border="1">
					<tr>
						<td colspan="5">
							<h3>게시글 제목 클릭시 상세 열람 가능</h3>
						</td>
					</tr>
					<tr>
					    <td colspan="5">
					        <button type="button" value="신규 글 작성" onClick="location.href='post_new.jsp'">신규 글 작성</button>
					    </td>
					</tr>
					<tr>
						<td>번호</td>
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
						<td>관리</td>
					</tr>
					<%
					while (result.next())
					{%>
						<tr>
							<td><%=result.getInt("nt_Idx") %></td>
							<td><%=result.getInt("nt_Writer") %></td>
							<td><a href="post_read.jsp?nt_Idx=<%=result.getInt("nt_Idx") %>"><%=result.getString("nt_Title") %></a></td>
							<td><%=result.getTimestamp("nt_Date") %></td>
							<td>
								<button type="button" value="수정" onClick="location.href='post_modify.jsp?nt_Idx=<%=result.getString("nt_Idx") %>'">수정</button>
								<button type="button" value="삭제" onClick="location.href='post_delete_send.jsp?nt_Idx=<%=result.getString("nt_Idx") %>'">삭제</button>
							</td>
						</tr>
					<%
					}%>
				</table>
			<%
			}
			catch (Exception ex)
			{
				out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
			}%>
	</form>
</body>
</html>