<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validation() {
	var title = document.getElementById("CANCEL_TITLE");	
	var content = document.getElementById("CANCEL_CONTENT");
	var category =document.getElementById("CANCEL_CATEGORY");
	
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
	document.enquiryModify.submit();
} 
</script>

</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>문의사항을 확인하실수있습니다.</h2>
      
    </div>
    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
		<form class="needs-validation" method="post" name="enquiryModify" action="/ELTRUT/enquiryModify">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">문의번호</label>
              <input type="text" class="form-control"id="CANCEL_NUMBER" name="CANCEL_NUMBER" readonly value="${O.CANCEL_NUMBER }">
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">주문번호</label>
              <input type="text" class="form-control" id="ORDER_NUMBER" name="ORDER_NUMBER" readonly value="${O.ORDER_NUMBER }">
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">문의종류</label>
              <select class="form-select" name="CANCEL_CATEGORY" id="CANCEL_CATEGORY" style="width: -webkit-fill-available;">
                <option id="CANCEL_CATEOGRY">교환</option>
				<option id="CANCEL_CATEOGRY">환불</option>
              </select>
              
              </div>

            <div class="col-7">
              <label for="email" class="form-label">문의제목 </label>
              <input type="email" class="form-control" id="CANCEL_TITLE" name="CANCEL_TITLE" value="${O.CANCEL_TITLE }">
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">문의내용</label>
              <input type="text" class="form-control"  id="CANCEL_CONTENT" name="CANCEL_CONTENT" value="${O.CANCEL_CONTENT }">
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">문의날짜</label>
              <input type="text" class="form-control" id="CANCEL_REGDATE" name="CANCEL_REGDATE" readonly value="${O.CANCEL_REGDATE }">
            </div>
          </div>
          <hr class="my-4">
			<input type="hidden" value="${sessionScope.MEMBER_ID }" id="MEMBER_ID" name="MEMBER_ID">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="validation();">수정하기</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/ELTRUT/enquiryCheck'">돌아가기</button>
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