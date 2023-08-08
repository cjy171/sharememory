<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐러셀</title>
</head>
<body>
    <div id="carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <% 
            
            try {
            	Class.forName("com.mysql.jdbc.Driver");
        		String db_address = "jdbc:mysql://localhost:3306/sharememory";
    			String db_username = "root";
    			String db_pwd = "abcd1234";
        		Connection conn = DriverManager.getConnection(db_address, db_username, db_pwd);
    			
                String query = "SELECT * FROM blog ORDER BY bg_ReadCount DESC LIMIT 3";
                
                PreparedStatement psmt = conn.prepareStatement(query);
                
                ResultSet rs = psmt.executeQuery();
                
                while (rs.next()) {
                    String title = rs.getString("bg_Title");
                    String content = rs.getString("bg_Content");
                    
            %>
                    <div class="carousel-item">
                        <h2><%= title %></h2>
                        <p><%= content %></p>
                    </div>
            <%
                }
                if(conn != null) conn.close();
        		if(psmt != null) psmt.close();
        		if(rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
            
        </div>
    </div>
</body>
</html>
