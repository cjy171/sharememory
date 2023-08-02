<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String mb_ID = request.getParameter("mb_ID");
	String mb_PW = request.getParameter("mb_PW");
	
    // DB연결에 필요한 변수 선언
	String url = "jdbc:mysql://localhost:3306/sharememory";
	String uid = "root";
	String upw = "abcd1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where mb_ID = ? and mb_PW = ?";
	
	try{
		// 드라이버 호출
		Class.forName("com.mysql.jdbc.Driver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mb_ID);
		pstmt.setString(2, mb_PW);
		
		// sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			mb_ID = rs.getString("mb_ID");
			String mb_Name = rs.getString("mb_Name");
		
			synchronized(session){
				session.setAttribute("id", mb_ID);
				session.setAttribute("name", mb_Name);
			}
			
			response.sendRedirect("loginSuccess.jsp"); // 페이지이동
			
		} else{ // 로그인 실패
			response.sendRedirect("loginFail.jsp"); // 실패 페이지
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // 에러가 난 경우도 리다이렉트
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>