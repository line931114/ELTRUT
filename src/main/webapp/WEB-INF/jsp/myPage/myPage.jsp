<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>

<head>

<title>Insert title here</title>
</head>
<body>
    

<main>
  
  <div class="container px-4 py-5" id="hanging-icons">
    <h2 class="pb-2 border-bottom">마이페이지</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="col d-flex align-items-start">
        <div>
          <h2>개인정보 수정</h2>
          <p>개인정보를 수정하거나 확인 또는 삭제하실수 있습니다.</p>
          <a href="memberInfo" class="btn btn-dark" style="color: white;">개인정보 수정하기</a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div>
          <h2>반품교환</h2>
          <p>주문한상품을 반품 또는 교환하실수 있습니다.</p>
          <a href="enquiryCheck" class="btn btn-dark" style="color: white;">반품/교환하기</a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div>
          <h2>QNA</h2><p>QNA로 궁금하신것들을 문의하실수있습니다.</p>
          <a href="qnaCheck" class="btn btn-dark" style="color: white;">QNA 확인하기</a>
        </div>
      </div>
    <div class="col d-flex align-items-start">
        <div>
          <h2>구매내역</h2><p>주문하신상품의 구매내역을 확인하실수 있습니다.</p>
          <a href="orderInfo" class="btn btn-dark" style="color: white;">구매내역 확인하기</a>
        </div>
      </div></div>
  </div>

</main>

</body>
</html>