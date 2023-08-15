<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>ShareMemory</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/carousel/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>
    
<%@ include file="layout/header.jsp" %>

<main>

	
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        	<div class="carousel-indicators">
      			 <%
                int numItems = 3; // 가져올 아이템 개수
                for (int i = 0; i < numItems; i++) {
                %>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="<%= i %>" <% if (i == 0) { %>class="active"<% } %> aria-label="Slide <%= i+1 %>"></button>
                <%
                }
                %>
    		</div>
            <div class="carousel-inner">
                <%
                try {
                	Class.forName("com.mysql.jdbc.Driver");
                    String db_address = "jdbc:mysql://localhost:3306/sharememory";
                    String db_username = "root";
                    String db_pwd = "abcd1234";
                    
                    Connection conn = DriverManager.getConnection(db_address, db_username, db_pwd);
                    
                    request.setCharacterEncoding("UTF-8");
                    
                    String query = "SELECT * FROM blog ORDER BY bg_ReadCount DESC LIMIT 3";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    int itemCount = 0;
                    while (rs.next()) {
                        String postTitle = rs.getString("bg_Title");
                        int postIdx = rs.getInt("bg_Idx");
						String postContent = rs.getString("bg_Content");
                        int postReadCount = rs.getInt("bg_ReadCount");
                        %>
                        <div class="carousel-item <%= itemCount == 0 ? "active" : "" %>">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" viewBox="0 0 800 400" focusable="false">
                        <rect width="100%" height="100%" fill="<%= itemCount == 0 ? "#333" : (itemCount == 1 ? "#FFA500" : "#009000") %>"/>
                    </svg>
                    <div class="container">
                        <div class="carousel-caption <%= itemCount == 0 ? "text-start" : (itemCount == 1 ? "" : "text-end") %>">
                            <h1><%= postTitle %></h1>
                            <p><%= postContent %></p>
                            <p><a class="btn btn-lg btn-primary" href="../blog/post_read.jsp?bg_Idx=<%= postIdx %>">블로그 보러가기</a></p>
                        </div>
                    </div>
                </div>
                
                        <%
                        itemCount++;
                    }
                        rs.close();
                        stmt.close();
                    	conn.close();
                    
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                %>
            </div>
            <!-- 이전/다음 버튼 -->
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
      			<span class="visually-hidden">Previous</span>
    		</button>
    		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      			<span class="carousel-control-next-icon" aria-hidden="true"></span>
      			<span class="visually-hidden">Next</span>
    		</button>
        </div>




  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

 

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <%@ include file="layout/footer.jsp" %>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>