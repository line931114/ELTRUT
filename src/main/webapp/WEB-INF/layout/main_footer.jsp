<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<br><br><br><br>
<body>

<div class="container">
  <footer class="row row-cols-sm py-5 my-5 border-top">
    <div class="col">
      <p class="text-muted">© #21B - ELTURT</p>
    </div>

    <div class="col">
      <h5>회사</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">TEL. 010-1234-5678</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">ADDRESS. 서울특별시 **** </a></li>
        <li class="nav-item mb-2"><a href="/ELTRUT/privacy" class="nav-link p-0 text-muted">이용약관</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">개인정보보호</a></li>    
      </ul>
    </div>

    <div class="col">
      <h5 style="height: 24px;">운영시간</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">MON-FRI AM 10:00~PM 06:00</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">SAT,SUN,HOLI CLOSED</a></li>
        </ul>
    </div>
    
    <div class="col">
      <h5 style="height: 24px;">FOLLOW US</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_이광호</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_정혜림</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_손수완</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_장세영</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_정원철</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">#21B_이지수</a></li>
        </ul>
    </div>
    
    <div class="col">
      <h5 style="height: 24px;">페이지 메인기능</h5>
      <ul class="nav flex-column">   
     <c:choose>
		<c:when test="${empty MEMBER_ID}">
		<li class="nav-item mb-2"><a href="/ELTRUT/loginForm" class="nav-link p-0 text-muted">로그인</a></li>
		</c:when>
	</c:choose>
	    
        <li class="nav-item mb-2"><a href="/ELTRUT/main0" class="nav-link p-0 text-muted">메인페이지</a></li>
     
        <li class="nav-item mb-2"><a href="/ELTRUT/main" class="nav-link p-0 text-muted">상품 판매 페이지</a></li>
     
        </ul>
    </div>
</footer>
</div>
</body>
</html>


