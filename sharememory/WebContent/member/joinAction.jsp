<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("UTF-8");
	
	Timestamp today_date = new Timestamp(System.currentTimeMillis());

	int mb_NO = 0;
	String selectQuery = "SELECT MAX(mb_NO) AS max_mb_NO from member";
	
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
   
   
	String sql = "insert into member(mb_NO, mb_ID, mb_PW, mb_Name, mb_Tel, mb_Gender, mb_JoinDate) values(?, ?, ?, ?, ?, ?, ?)";
   
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
      
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
      
      
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(selectQuery);
      
   		// 4. sql문 실행
   		ResultSet result = pstmt.executeQuery();
   		

		if (result.next()) {
			mb_NO = result.getInt("max_mb_NO") + 1;
		}
      
   		// 5. pstmt 재생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mb_NO);
		pstmt.setString(2, mb_ID);
		pstmt.setString(3, mb_PW);
		pstmt.setString(4, mb_Name);
		pstmt.setString(5, mb_Tel);
		pstmt.setString(6, mb_Gender);
		pstmt.setTimestamp(7, today_date);
      
      
		int updateResult = pstmt.executeUpdate();

      
		if(updateResult == 1){ // 성공
			response.sendRedirect("joinSuccess.jsp");
		} else{ // 실패
			response.sendRedirect("joinFail.jsp");
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