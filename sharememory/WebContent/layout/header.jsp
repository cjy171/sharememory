<link href="/css/styles.css" rel="stylesheet" type="text/css">
<div class="header">
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="/index.jsp">ShareMemory</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <% if (session.getAttribute("id") != null) { %>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/blog/post_list.jsp">Blog</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/logoutAction.jsp">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/mypage.jsp">MyPage</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link" href="/blog/search.jsp">SEARCH</a>
          </li>
        </ul>
      </div>
      <% } else { %>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/blog/post_list.jsp">Blog</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/login.jsp">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/join.jsp">Join</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link" href="/blog/search.jsp">SEARCH</a>
          </li>
        </ul>
      </div>
      <% } %>
    </div>
  </nav>
</header>
</div>
<script>
	document.getElementById("searchLink").addEventListener("click", function() {
    	document.getElementById("modalLayer").style.display = "block";
    });
</script>