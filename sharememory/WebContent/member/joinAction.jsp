<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("UTF-8");
	
	Timestamp today_date = new Timestamp(System.currentTimeMillis());
	
	String mb_ID = request.getParameter("mb_ID");
	String mb_PW = request.getParameter("mb_PW");
	String mb_Name = request.getParameter("mb_Name");
	String mb_Tel = request.getParameter("mb_Tel");
	String mb_Gender = request.getParameter("mb_Gender");
   
	// 1.변수선언
	String url = "jdbc:mysql://localhost:3306/sharememory";
	String uid = "root";
	String upw = "abcd1234";
   
	Connection conn = null;
	PreparedStatement pstmt = null;
   
   
	String sql = "insert into member(mb_ID, mb_PW, mb_Name, mb_Tel, mb_Gender, mb_JoinDate) values(?, ?, ?, ?, ?, ?)";
   
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
      
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);   		
      
   		// 3. pstmt 재생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mb_ID);
		pstmt.setString(2, mb_PW);
		pstmt.setString(3, mb_Name);
		pstmt.setString(4, mb_Tel);
		pstmt.setString(5, mb_Gender);
		pstmt.setTimestamp(6, today_date);
      
      
		int updateResult = pstmt.executeUpdate();

      
		if(updateResult == 1){ // 성공
			out.println("<script>alert('회원가입 성공!');</script>");
		} else{ // 실패
			out.println("<script>alert('회원가입 실패!');</script>");
		}
      
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
			out.println("오류가 발생했습니다. 오류 메시지 : " + e.getMessage());
		}
	}
%>