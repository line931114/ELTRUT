<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>문의사항 - QNA 수정하는 곳입니다.</title>

<script>
function validation() {
	var title = document.getElementById("CS_TITLE");	
	var content = document.getElementById("CS_CONTENT");
	var category =document.getElementById("CS_CATEGORY");
	
	if(category.value == ""){
		alert("문의 종류를 입력해주세요");
		category.focus();
		return false;
	}
	
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("문의 내용을 입력해주세요");
		content.focus();
		return false;
	}
	document.qnaModify.submit();
} 
</script>

</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>문의사항 - QNA수정하는 곳입니다.</h2>
      
    </div>
    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
		<form class="needs-validation" method="post" name="qnaModify" action="/ELTRUT/qnaModify" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">문의번호</label>
              <input type="text" class="form-control" id="CS_NUMBER" name="CS_NUMBER" readonly value="${O.CS_NUMBER }">
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">상품번호</label>
              <input type="text" class="form-control" id="GOODS_NUMBER" name="GOODS_NUMBER" readonly value="${O.GOODS_NUMBER }">
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">문의종류</label>
              <select class="form-select" name="CS_CATEGORY" id="CS_CATEGORY" style="width: -webkit-fill-available;">
				<option id="CS_CATEGORY">배송문의</option>
				<option id="CS_CATEGORY">교환반품문의</option>
				<option id="CS_CATEGORY">입금확인문의</option>
				<option id="CS_CATEGORY">기타</option>
			</select>
              
              </div>

			<div class="col-7">
			<label for="username" class="form-label">기존 이미지</label>
			<input type="image" class="img-thumbnail" src="/ELTRUT/file/qnaFile/${O.CS_IMAGE1}"  alt=""  onerror="this.style.display='none';" />
            <input type="file" class="form-control" id="CS_IMAGE1" name="CS_IMAGE1" value="${O.CS_IMAGE1 }">
            </div>
			
            <div class="col-7">
              <label for="email" class="form-label">문의제목 </label>
              <input type="text" class="form-control" id="CS_TITLE" name="CS_TITLE" value="${O.CS_TITLE }">
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">문의내용</label>
              <input type="text" class="form-control"  id="CS_CONTENT" name="CS_CONTENT" value="${O.CS_CONTENT }">
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">문의날짜</label>
              <input type="text" class="form-control" id="CS_REGDATE" name="CS_REGDATE" readonly value="${O.CS_REGDATE }">
            </div>
          </div>
          <hr class="my-4">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="validation();">수정하기</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/ELTRUT/qnaCheck'">돌아가기</button>
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