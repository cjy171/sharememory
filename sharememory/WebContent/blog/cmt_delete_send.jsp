<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
    
    request.setCharacterEncoding("UTF-8");
    
    String cmt_Idx = request.getParameter("cmt_Idx");
    
    String insertQuery = "DELETE FROM Comment WHERE cmt_Idx= ? ";
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);

 	psmt.setInt(1, Integer.parseInt(cmt_Idx));

    psmt.executeUpdate();
 	response.sendRedirect("post_read.jsp?bg_Idx=?");
    
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>