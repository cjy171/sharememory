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
    
    int cmt_Idx = Integer.parseInt(request.getParameter("cmt_Idx"));
 	String cmt_Content = request.getParameter("cmt_Content");

 	
   
    String insertQuery = "UPDATE Comment SET cmt_Content = ? WHERE cmt_Idx=?";

	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setString(1, cmt_Content);
	psmt.setInt(2, cmt_Idx);
	
	psmt.executeUpdate();
	connection.commit();
	
	
	psmt.close();
	connection.close();
	
	response.sendRedirect("post_read.jsp?bg_Idx= ?");
}
catch (Exception ex) {
	ex.printStackTrace();
}
%>