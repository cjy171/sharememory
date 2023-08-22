<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cmt_Writer=(String)session.getAttribute("id");
	if(cmt_Writer == null) {
		cmt_Writer = ""; 
	}%>
<%
try
{
	// JDBC 드라이버 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/sharememory";
    String db_username = "root";
    String db_pwd = "abcd1234";
    
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    // 문자열의 인코딩 방식 결정
    request.setCharacterEncoding("UTF-8");
    
    // 오늘 날짜 정보를 컴퓨터에서 받아올 객체 선언
	Timestamp cmt_Date = new Timestamp(System.currentTimeMillis());
    
    // 파라미터를 통해 정해진 정보를 받아와 각 문자열 변수에 저장
	int bg_Idx = Integer.parseInt(request.getParameter("bg_Idx"));
	String cmt_Content = request.getParameter("cmt_Content");
	
	//게시글 번호를 결정하기 위한 임기 정수형 변수 선언
	int cmt_Idx = 0;
	
	// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언()
	String insertQuery = "SELECT MAX(cmt_Idx) from Comment";
	
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	ResultSet result = psmt.executeQuery();
	
	while(result.next())
	{
		cmt_Idx = result.getInt("MAX(cmt_Idx)") + 1;
	}
	
	insertQuery = "INSERT INTO Comment(cmt_Idx, bg_Idx, mb_ID, cmt_Content, cmt_Date) VALUES (?, ?, ?, ?, ?)";
	
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setInt(1, cmt_Idx);
	psmt.setInt(2, bg_Idx);
	psmt.setString(3, cmt_Writer);
	psmt.setString(4, cmt_Content);
	psmt.setTimestamp(5, cmt_Date);
	
	psmt.executeUpdate();
	
	response.sendRedirect("post_read.jsp?bg_Idx=?");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>