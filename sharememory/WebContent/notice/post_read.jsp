<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 열람</title>
</head>
<body>
    <h1>게시글 상세 열람</h1>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://localhost:3306/sharememory";
		String db_username = "root";
		String db_pwd = "abcd1234";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String nt_Idx = request.getParameter("nt_Idx");
        
        String insertQuery = "SELECT * FROM Notice WHERE nt_Idx=" + nt_Idx;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery(); %>
        
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>번호</td>
            	    <td><%=result.getInt("nt_Idx") %></td>
            	</tr>
            	<tr>
            	    <td>작성일</td>
            	    <td><%=result.getTimestamp("nt_Date") %></td>
            	</tr>
            	<tr>
            	    <td>작성자</td>
            	    <td><%=result.getString("nt_Writer") %></td>
            	</tr>
            	<tr>
            	    <td>제목</td>
            	    <td><%=result.getString("nt_Title") %></td>
            	</tr>
            	<tr>
            	    <td>내용</td>
            	    <td><%=result.getString("nt_Content") %></td>
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
    }%>

</body>
</html>