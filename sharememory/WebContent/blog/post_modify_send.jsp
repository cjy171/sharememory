<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/sharememory";
    String db_username = "root";
    String db_pwd = "abcd1234";
    
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    connection.setAutoCommit(false);
    
    request.setCharacterEncoding("UTF-8");
    
 	String mb_ID = request.getParameter("mb_ID");
 	String bg_Title = request.getParameter("bg_Title");
 	String bg_Content = request.getParameter("bg_Content");
    String bg_Idx = request.getParameter("bg_Idx");
    
    String insertQuery = "UPDATE Blog SET bg_Title = ?, bg_Content = ? WHERE bg_Idx=?";

	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setString(1, bg_Title);
	psmt.setString(2, bg_Content);
	psmt.setString(3, bg_Idx);
	
	psmt.executeUpdate();
	connection.commit();
	
	%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="post_list.jsp";
		</script>
	<%
	
	psmt.close();
	connection.close();
}
catch (Exception ex) {
	ex.printStackTrace();
}
%>