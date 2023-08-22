z<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sessionId=(String)session.getAttribute("id");
	if(sessionId == null) {
		sessionId = ""; 
	}
%>
<%
	String sessionCmtId = (String)session.getAttribute("id");
    if(sessionCmtId == null) {
    	sessionCmtId = ""; 
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
        
        String selectQuery = "SELECT * FROM Blog WHERE bg_Idx = ?";
        
        PreparedStatement psmt1 = connection.prepareStatement(selectQuery);
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
            <br>
            <h2>댓글</h2>
            <hr>
            <div class="row justify-content-center mt-4">
   				<div class="col-md-10">
           			<form action="cmt_Reply_send.jsp" method="post">
           				<input type="hidden" name="bg_Idx" value="<%=bg_Idx %>">
                   		<textarea name="cmt_Content" id="cmt_Content" placeholder="댓글쓰기" rows="3" class="form-control" style="resize: none;"></textarea>
               			<button type="submit" class="btn btn-dark">댓글쓰기</button>
           			</form>
       			</div>
			</div>
			<hr>
			
			<%
			String selectQueryCmt = "SELECT * FROM Comment WHERE bg_Idx = ?";
			
			PreparedStatement psmtCmt = connection.prepareStatement(selectQueryCmt);
			
			psmtCmt.setInt(1, Integer.parseInt(bg_Idx));
        	
        	ResultSet resultCmt = psmtCmt.executeQuery();
        	
        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        	
        	while(resultCmt.next()) {
        		String CmtId = resultCmt.getString("mb_ID");
        	%>
			<div class="row justify-content-center mt-4">
				<div class="col-md-10">
		        	<div class="card">
		            	<div class="card-header">
		                	작성자: <%= CmtId %><br>
		                	작성일: <%= dateFormat.format(resultCmt.getTimestamp("cmt_Date")) %>
		            	</div>
		            <div class="card-body">
		            	<%= resultCmt.getString("cmt_Content") %>
		            </div>
		            <%
		        		if(sessionCmtId.equals(resultCmt.getString("mb_Id")) && sessionCmtId != "") {
		            %>
		            <div class="card-footer">
		            	<button type="button" value="수정" onClick="updateForm(<%= resultCmt.getString("cmt_Idx") %>)" class="btn btn-outline-secondary">수정</button>
						<button type="button" value="삭제" onClick="location.href='cmt_delete_send.jsp?cmt_Idx=<%=resultCmt.getString("cmt_Idx") %>'" class="btn btn-outline-danger">삭제</button>
		           	</div>
		           	<%
		            	}
		           	%>
		            	<div class="cmt-modify-form" id="modifyForm<%= resultCmt.getString("cmt_Idx") %>" style="display: none;">
		        			<form action="cmt_modify_send.jsp" method="post">
		            			<input type="hidden" name="cmt_Idx" value="<%= resultCmt.getString("cmt_Idx") %>">
		            			<textarea name="cmtContentUpdate" id="cmtContentUpdate" rows="5" class="form-control"><%= resultCmt.getString("cmt_Content") %></textarea>
		            			<button type="submit" class="btn btn-dark">수정하기</button>
		        			</form>
		    			</div>
		    		</div>
				</div>
			</div>
            <%
            	}
            %>
            
        <script>
    		function updateForm(cmtIdx) {
	        	var modifyForm = document.getElementById('modifyForm' + cmtIdx);
	        	if (modifyForm.style.display === 'none') {
	        		modifyForm.style.display = 'block';
	        	}else {
	        		modifyForm.style.display = 'none';
	        	}
    		}
		</script>
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