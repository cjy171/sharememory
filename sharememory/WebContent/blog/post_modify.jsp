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
<title>글 수정</title>
</head>
<body>
    <h1>글 수정</h1>
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
        
        String insertQuery = "SELECT * FROM Blog WHERE bg_Idx=" + bg_Idx;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
            <form action="post_modify_send.jsp" method="post">
            <input type="hidden" name="bg_Idx" value="<%=result.getInt("bg_Idx") %>">
            <table border="1">
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="mb_ID" value="<%=result.getString("mb_ID") %>"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="bg_Title" value="<%=result.getString("bg_Title") %>"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea rows="10" cols="20" name="bg_Content"><%=result.getString("bg_Content") %></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">수정</button>
                        <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                        <button type="reset">원상복구</button>
                    </td>
                </tr>
            </table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</body>
</html>