<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body class="bg-light" >
<div class="container">
  <main>
    
    <c:choose>
	<c:when test="${fn:length(goods) > 0}">
        <div class="row mb-2" style="justify-content: left;-webkit-text-stroke-width: medium;width: 70%;">
    <div class="col-md-6">
        <div class="col p-4 d-flex flex-column position-static">
		<c:forEach  items="${goods }" var="G" varStatus="idx">

        <form class="needs-validation" action="/ELTRUT/orderEnd">
        
          <label for="firstName" class="form-label">주문상품</label>
              <input type="text" class="form-control" value="${G.GOODS_NAME }" readonly>
          <label for="firstName" class="form-label">상품 이미지</label>
              <input type="image" class="img-thumbnail"  src="/ELTRUT/file/goodsFile/${G.GOODS_THUMBNAIL}"  width="330" height="442" alt="" onerror="this.src='/ELTRUT/file/noimg_130.gif'" />
        	<label for="lastName" class="form-label">주문색상</label>
              <input type="text" class="form-control" value="${G.GOODS_COLOR }" readonly>
       		<label for="username" class="form-label">주문사이즈</label>
                <input type="text" class="form-control" value="${G.GOODS_SIZE }" readonly>
        	<label for="email" class="form-label">상품금액</label>
              <input type="email" class="form-control" value="${G.GOODS_PRICE }" readonly>
              <label for="address" class="form-label">주문수량</label>
              <input type="text" class="form-control" value="${G.EA }" readonly>
              <label for="address2" class="form-label">주문금액</label>
              <input type="text" class="form-control" value="${G.TOTALPRICE }" readonly>
              <input type="hidden" name="EA" value="${G.EA }">
			<input type="hidden" name="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			<input type="hidden" name="CART_NUMBER" value="${CART_NUMBER }">
			<input type="hidden" name="goods_total" value="${G.TOTALPRICE }">${G.TOTALPRICE }
			<hr class="my-4">
		</c:forEach>
        </div>
    </div>
  </div>
	</c:when>
	<c:otherwise>
		<H3>주문상품이 없습니다.</H3>	
	</c:otherwise>
</c:choose>

		<c:set var="OM" value="${orderMember }"/>

    <div class="row g-5" style="width: 100%; position: fixed; left: 300px; top: 100px;">
      <h2>주문완료</h2>
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            
            <div class="col-7">
              <label for="lastName" class="form-label">주문번호</label>
              <input type="text" class="form-control" value="${ORDER_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">주문자</label>
                <input type="text" class="form-control" value="${BUYER_NAME }" readonly>
              
              </div>
              
            <div class="col-7">
              <label for="username" class="form-label">주문자 연락처</label>
                <input type="text" class="form-control" value="${BUYER_NUMBER }" readonly>
              
              </div>
              
            <div class="col-7">
              <label for="username" class="form-label">수령인</label>
                <input type="text" class="form-control" value="${RECEIVER_NAME }" readonly>
              
              </div>
              
            <div class="col-7">
              <label for="username" class="form-label">수령인 연락처</label>
                <input type="text" class="form-control" value="${RECEIVER_PHONE }" readonly>
              
              </div>

            <div class="col-7">
              <label for="address" class="form-label">우편번호</label>
              <input type="text" class="form-control" value="${ RECEIVER_ZIPCODE}" readonly>
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">상세주소</label>
              <input type="text" class="form-control" value="${RECEIVER_ADDRESS1 } - ${RECEIVER_ADDRESS2 }" readonly>
            </div>
            
            <div class="col-7">
              <label for="address" class="form-label">배송 요청사항</label>
              <input type="text" class="form-control" value="${DELIVERY_MESSAGE }" readonly>
              
            </div>
            <div class="col-7">
              <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/ELTRUT/main'" style="margin-top: 2%;">메인으로</button>
            </div>
            
          </div>
      </div>
    </div>
	</form>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>