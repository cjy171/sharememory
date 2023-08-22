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
<title>글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../css/styles.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
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
    
    while(result.next()) {
    %>
    <div class="body-content">
		<div class="row justify-content-center mt-4">
   			<div class="col-md-6">
	        	<form action="post_modify_send.jsp" method="post">
	        		<input type="hidden" name="bg_Idx" value="<%= result.getInt("bg_Idx") %>">
	        		<div class="mb-3">
	                	<label for="bg_Title" class="form-label">제목</label>
	                	<input type="text" name="bg_Title" value="<%= result.getString("bg_Title") %>" class="form-control">
	        		</div>
	        		<div class="mb-3">
	        			<label for="bg_Content" class="form-label">내용 작성</label>
	            		<div id ="editor">
	                   		<textarea class="form-control" name="bg_Content" id="bg_Content" rows="5"><%= result.getString("bg_Content") %></textarea>
	               		</div>
	        		</div>    
	        		<button type="submit" class="btn btn-dark">수정</button>
	        		<button type="button" onclick="location.href='post_list.jsp'" class="btn btn-secondary">목록으로</button>
	        		<button type="reset" class="btn btn-light">원상복구</button>
	        	</form>
	        </div>
		</div>
	</div>  
	<%
	    }
	    
	    psmt.close();
	    connection.close();
	}
	catch (Exception ex)
	{
		ex.printStackTrace();
	}
	%>  
<script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) ),{
        	imageUpload: {
                uploadUrl: 'imageUpload.jsp'
            }
        }
            .catch( error => {
                console.error( error );
            } );
</script>
<%@ include file="../layout/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>