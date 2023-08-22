<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionID=(String)session.getAttribute("id");
	String sessionPW=(String)session.getAttribute("pw");
	String sessionName=(String)session.getAttribute("name");
	String sessionTel=(String)session.getAttribute("tel");
	String sessionGender=(String)session.getAttribute("gender");
	String sessionJoinDate=(String)session.getAttribute("joindate");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.115.4">
    <title>마이페이지</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/checkout/">

    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../css/styles.css" rel="stylesheet" type="text/css">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>MYPAGE</h2>
    </div>

    <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원정보</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="Name" class="form-label">ID</label>
              <input type="text" class="form-control" id="Id" value="<%= sessionID %>" required disabled>
            </div>

            <div class="col-12">
              <label for="Password" class="form-label">Password</label>
              <input type="text" class="form-control" id="password" value="<%= sessionPW %>" required disabled>
            </div>

            <div class="col-12">
              <label for="Name" class="form-label">Name</label>
              <input type="text" class="form-control" id="Name" value="<%= sessionName %>" required disabled>
            </div>
            
            <div class="col-12">
              <label for="Tel" class="form-label">Tel</label>
              <input type="text" class="form-control" id="Tel" value="<%= sessionTel %>" required disabled>
            </div>
            
            <div class="col-12">
              <label for="Joindate" class="form-label">Join Date</label>
              <input type="text" class="form-control" id="Joindate" value="<%= sessionJoinDate %>" required disabled>
            </div>
          </div>
          
          	<div class="col-12">
              <label for="Gender" class="form-label">Gender</label>
              <input type="text" class="form-control" id="Gender" value="<%= sessionGender %>" required disabled>
            </div>

          
		  <hr class="my-4">
		  <input onclick="location.href = 'logoutAction.jsp';" class="w-100 btn btn-outline-primary btn-lg" type="button" value="로그아웃">
        </form>
      </div>
    </div>
  </main>

<%@ include file="/layout/footer.jsp" %>

</div>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="checkout.js"></script></body>
</html>
