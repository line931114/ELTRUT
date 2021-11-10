<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>상품 리뷰수정하는 곳입니다.</title>

<script>
function validation() {
	var title = document.getElementById("REVIEW_TITLE");	
	var content = document.getElementById("REVIEW_CONTENT");
		
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("후기 내용을 입력해주세요");
		content.focus();
		return false;
	}
	document.reviewModify.submit();
} 
</script>

</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>${goodsReview.MEMBER_ID }님의 상품 리뷰수정하는 곳입니다.</h2>
      
    </div>
    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
		<form class="needs-validation" method="post" name="reviewModify" action="/ELTRUT/reviewModify" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">작성자</label>
              <input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" readonly value="${goodsReview.MEMBER_ID}">
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">리뷰번호</label>
              <input type="text" class="form-control" id="REVIEW_NUMBER" name="REVIEW_NUMBER" readonly value="${goodsReview.REVIEW_NUMBER }">
              
            </div>

			<div class="col-7">
			<label for="username" class="img-thumbnail">기존 이미지</label>
			<input type="image" class="img-thumbnail" src="/ELTRUT/file/reviewFile/${goodsReview.REVIEW_IMAGE}" width="100" height="100" alt=""  onerror="this.style.display='none';" />
            <input type="file" class="form-control" id="REVIEW_IMAGE" name="REVIEW_IMAGE" value="${goodsReview.REVIEW_IMAGE }">
            </div>
			
            <div class="col-7">
              <label for="email" class="form-label">리뷰제목 </label>
              <input type="text" class="form-control" id="REVIEW_TITLE" name="REVIEW_TITLE"  value="${goodsReview.REVIEW_TITLE }">
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">리뷰내용</label>
              <input type="text" class="form-control"  id="REVIEW_CONTENT" name="REVIEW_CONTENT" value="${goodsReview.REVIEW_CONTENT }">
              
            </div>

          </div>
          <hr class="my-4">
          <input type="hidden" name="GOODS_NUMBER" id="GOODS_NUMBER" value="${goodsReview.GOODS_NUMBER }">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="validation();">수정하기</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/ELTRUT/goodsReview?GOODS_NUMBER=${goodsReview.GOODS_NUMBER }'">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>