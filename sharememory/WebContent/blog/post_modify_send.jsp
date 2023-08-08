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
    
    request.setCharacterEncoding("UTF-8");
    
 	String mb_ID = request.getParameter("mb_ID");
 	String bg_Title = request.getParameter("bg_Title");
 	String bg_Content = request.getParameter("bg_Content");
    
    String bg_Idx = request.getParameter("bg_Idx");
    
    String insertQuery = "SELECT * FROM Blog WHERE bg_Idx=" + bg_Idx;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);
 	
 	ResultSet result = psmt.executeQuery();
 	
 	while(result.next())
 	{
        insertQuery = "UPDATE Blog set bg_Title=?, mb_No=?, bg_Content=? WHERE bg_Idx=" + bg_Idx;
 	    
 	    psmt = connection.prepareStatement(insertQuery);
        
        psmt.setString(1, bg_Title);
        psmt.setString(2, mb_ID);
        psmt.setString(3, bg_Content);
        
        psmt.executeUpdate();
        
        response.sendRedirect("post_list.jsp");
 	}
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>