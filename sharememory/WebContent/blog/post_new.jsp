<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String)session.getAttribute("id");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 게시글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../css/styles.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="body-content">
   	<div class="row justify-content-center mt-4">
   		<div class="col-md-6">
           	<form action="post_new_send.jsp" method="post">
               	<div class="mb-3">
                   	<label for="bg_Title" class="form-label">제목</label>
                   	<input type="text" class="form-control" name="bg_Title" id="bg_Title">
               	</div>
               	<div class="mb-3">
                   	<label for="bg_Content" class="form-label">내용 작성</label>
                   	<div id ="editor">
                   		<textarea class="form-control" name="bg_Content" id="bg_Content" rows="5"></textarea>
               		</div>
               	</div>
               	<div>
               		<label for="image" class="form-label">이미지</label>
               		<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
    				<div id="image_container"></div>
               	</div>
               	<button type="submit" class="btn btn-dark">저장</button>
               	<button type="button" onclick="location.href='post_list.jsp'" class="btn btn-secondary">목록으로</button>
               	<button type="reset" class="btn btn-light">초기화</button>
           	</form>
       	</div>
	</div>
</div>
<script>
        CKEDITOR.replace('editor');
</script>
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
<script>
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
</script>

<%@ include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
<script src="script.js">
ClassicEditor 

.create( document.querySelector( ‘#content' ) ) 

.then( editor => { 

    console.log( editor ); 

} ) 

.catch( error => { 

    console.error( error ); 

} );
</script>
</body>
</html>