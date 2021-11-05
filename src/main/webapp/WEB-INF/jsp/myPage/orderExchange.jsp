<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="utf-8">
<title>상품교환,환불 페이지</title>
<script>
 function cancel_Exchange() {
	var title = document.getElementById("CANCEL_TITLE");	
	var content = document.getElementById("CANCEL_CONTENT");
	
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("취소사유를 입력해주세요");
		content.focus();
		return false;
	}
} 
/* 
function cancle_Exchange() {
	var form = document.order_Exchange;
	
	if(form.CANCLE_TITLE.value.length ==0){
		alert("제목을 입력하세요");
		form.CANCLE_TITLE.focus();
		return;
	}
} */

</script>
</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>상품교환,환불 페이지</h2>
      
    </div>
    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
		<form class="needs-validation" method="post" name="cancel" action="/ELTRUT/cancel" onsubmit ="return cancel_Exchange()">
          <div class="row g-3">

            <div class="col-7">
              <label for="lastName" class="form-label">상품번호</label>
              <input type="text" class="form-control" value="${oc.GOODS_NUMBER }" readonly>
              
            </div>
           
            <div class="col-7">
              <label for="firstName" class="form-label">상품명</label>
              <input type="text" class="form-control" value="${oc.GOODS_NAME }" readonly>
              
            </div>

			<div class="col-7">
			<label for="username" class="form-label">주문금액</label>
            <input type="text" class="form-control" value="${oc.ORDER_TOTAL_PRICE }" readonly>
            </div>
			
            <div class="col-7">
              <label for="email" class="form-label">배송비 </label>
              <input type="text" class="form-control" value="3000" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">수량</label>
              <input type="text" class="form-control" value="${oc.ORDER_AMOUNT }" readonly>
              
            </div>
				<hr class="my-4" style="min-width: -webkit-fill-available;">
				
				<div class="col-7">
              <label for="username" class="form-label">사유선택</label>
              <select class="form-select" name="CANCEL_CATEGORY" id="CANCEL_CATEGORY" style="width: -webkit-fill-available; margin-bottom:5%;">
				<option id="CANCEL_CATEOGRY">교환</option>
				<option id="CANCEL_CATEOGRY">환불</option>
			</select>
				</div>
				
            <div class="col-7">
              <label for="address2" class="form-label">제목</label>
              <input type="text" class="form-control" id="CANCEL_TITLE" name="CANCEL_TITLE" >
            </div>
            
            <div class="col-7">
              <label for="address2" class="form-label">사유입력</label>
              <input type="text" class="form-control" id="CANCEL_CONTENT" name="CANCEL_CONTENT" >
            </div>
            
            <div class="col-7">
              <label for="address2" class="form-label">환불예정금액</label>
              <input type="text" class="form-control" value="${oc.ORDER_TOTAL_PRICE-3000 }"  readonly>
            </div>
          </div>
          <hr class="my-4" style="min-width: -webkit-fill-available;">
          <input type="hidden" name="ORDER_NUMBER" id="ORDER_NUMBER" value="${oc.ORDER_NUMBER }"> 
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="submit" >글 작성하기</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/ELTRUT/orderInfo'">이전 페이지로 이동</button>
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