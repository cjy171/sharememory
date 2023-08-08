<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String)session.getAttribute("id");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 열람</title>
</head>
<body>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://localhost:3306/sharememory";
		String db_username = "root";
		String db_pwd = "abcd1234";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String bg_Idx = request.getParameter("bg_Idx");
        
        String insertQuery = "SELECT * FROM Blog WHERE bg_Idx=?";
        
        PreparedStatement psmt1 = connection.prepareStatement(insertQuery);
        
        psmt1.setInt(1, Integer.parseInt(bg_Idx));
        
        String countQuery = "UPDATE Blog set bg_ReadCount = (bg_ReadCount+1) WHERE bg_Idx=?";
        
        PreparedStatement psmt2 = connection.prepareStatement(countQuery);
        
        psmt2.setInt(1, Integer.parseInt(bg_Idx));
        
        psmt2.executeUpdate();
        
        ResultSet result = psmt1.executeQuery(); %>
        
        <h1>게시글 상세 열람</h1>
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>작성자</td>
            	    <td><%=sessionId %></td>
            	</tr>
            	<tr>
            	    <td>조회수</td>
            	    <td><%=result.getInt("bg_ReadCount") %></td>
            	</tr>
            	<tr>
            	    <td>작성일</td>
            	    <td><%=result.getTimestamp("bg_Date") %></td>
            	</tr>
            	<tr>
            	    <td>제목</td>
            	    <td><%=result.getString("bg_Title") %></td>
            	</tr>
            	<tr>
            	    <td>내용</td>
            	    <td><%=result.getString("bg_Content") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <button type=button onclick="location.href='post_list.jsp'">목록으로</button>
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
    }
    
    %>

</body>
</html>