<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../css/styles.css" rel="stylesheet" type="text/css">
<style>
  body {
    background-color: #343a40;
  }
</style>
<script>

function check() {
	if(document.findkey.findKeyword.value===""){
		alert("검색어를 입력하세요.");
		document.findkey.findKeyword.focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>


<div class="body-content">
    <form name="findkey" action="searchList.jsp" method="get" onsubmit="return check();" class="row g-2 justify-content-center">
        <div class="col-md-7 col-lg-6">
            <input type="text" name="findKeyword" placeholder="검색어를 입력하세요" class="form-control">
        </div>
        <div class="col-md-3 col-lg-2">
            <button type="submit" class="btn btn-success w-100">SEARCH</button>
        </div>
    </form>
</div>

<%@ include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>