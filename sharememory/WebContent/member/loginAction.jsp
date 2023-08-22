<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	try{
		request.setCharacterEncoding("UTF-8");
		
		// 드라이버 호출
		Class.forName("com.mysql.jdbc.Driver");
		
		// DB연결에 필요한 변수 선언
		String url = "jdbc:mysql://localhost:3306/sharememory";
		String uid = "root";
		String upw = "abcd1234";
		
		// conn 생성
		Connection conn = DriverManager.getConnection(url, uid, upw);
		
		String sql = "select * from member where mb_ID = ? and mb_PW = ?";
		
		String mb_ID = request.getParameter("mb_ID");
		String mb_PW = request.getParameter("mb_PW");
		
		// pstmt 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mb_ID);
		pstmt.setString(2, mb_PW);
		// sql실행
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			mb_ID = rs.getString("mb_ID");
			mb_PW = rs.getString("mb_PW");
            String mb_Name = rs.getString("mb_Name");
            String mb_Tel = rs.getString("mb_Tel");
            String mb_Gender = rs.getString("mb_Gender");
            String mb_JoinDate = rs.getString("mb_JoinDate");
		
			synchronized(session){
				session.setAttribute("id", mb_ID);
				session.setAttribute("pw", mb_PW);
				session.setAttribute("name", mb_Name);
				session.setAttribute("tel", mb_Tel);
				session.setAttribute("gender", mb_Gender);
				session.setAttribute("joindate", mb_JoinDate);
			}

 %>
		
 	<script>
		function login(){
			alert("로그인 되었습니다.");
			location.href = '../index.jsp';
		}
		login();	
	</script>
	
 <%		
		} else{ // 로그인 실패
%>
		<script>
			function loginFailed() {
				alert("로그인 실패!");
				location.href = 'login.jsp';
			}
			loginFailed();
		</script>
<%
		}
		
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // 에러가 난 경우도 리다이렉트
	} 
 %>