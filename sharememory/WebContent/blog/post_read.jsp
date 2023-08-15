<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String)session.getAttribute("id");
	if(sessionId == null) {
		sessionId = ""; 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 열람</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="body-content">
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
        
        String insertQuery = "SELECT * FROM Blog WHERE bg_Idx = ?";
        
        PreparedStatement psmt1 = connection.prepareStatement(insertQuery);
        psmt1.setInt(1, Integer.parseInt(bg_Idx));
        
        String countQuery = "UPDATE Blog set bg_ReadCount = (bg_ReadCount+1) WHERE bg_Idx=?";
        PreparedStatement psmt2 = connection.prepareStatement(countQuery);
        
        psmt2.setInt(1, Integer.parseInt(bg_Idx));
        psmt2.executeUpdate();
        
        ResultSet result = psmt1.executeQuery();
        %>
        
        <div class="container">
            <%
            while(result.next()) {
            %>
            <%
            	if(sessionId.equals(result.getString("mb_Id")) && sessionId != "") {
            %>
            <div class="btn-group">
            	<button type="button" class="btn btn-outline-secondary" value="수정" onClick="location.href='post_modify.jsp?bg_Idx=<%=result.getString("bg_Idx") %>'">수정</button>
				<button type="button" class="btn btn-outline-danger" value="삭제" onClick="location.href='post_delete_send.jsp?bg_Idx=<%=result.getString("bg_Idx") %>'">삭제</button>
            </div>
            <%
            	}
            %>
            <table class="post-info">
            	<tr>
            	    <td>작성자</td>
            	    <td><%=result.getString("mb_Id") %></td>
            	</tr>
            	<tr>
            	    <td>조회수</td>
            	    <td><%=result.getInt("bg_ReadCount") %></td>
            	</tr>
            	<tr>
            	    <td>작성일</td>
            	    <td><%=result.getTimestamp("bg_Date") %></td>
            	</tr>
            </table>
            	<h1><%=result.getString("bg_Title") %></h1>
    			<p><%=result.getString("bg_Content") %></p>
            	<div class="back-btn">
            	        <button type=button class="btn btn-secondary" onclick="location.href='post_list.jsp'">목록으로</button>
            	</div>
           	<% 
            }
            %>
        </div>
        <%
    }
    catch (Exception ex)
    {
        ex.printStackTrace();
    }
    
    %>
</div>  
<%@ include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>