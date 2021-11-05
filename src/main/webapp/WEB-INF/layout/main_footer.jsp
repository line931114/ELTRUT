<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>

</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<br><br><br><br>
<body>

<div class="container">
  <footer class="row row-cols-sm py-3 my-3 border-top">
   
    <div class="col">
<h5>회사 정책</h5>
<ul class="nav flex-column"><p></p>
        <li class="nav-item mb-2"><a href="https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml" class="nav-link p-0 text-muted">사업자등록번호<br/>120-88-14733</li>
        <li class="nav-item mb-2"><a href="https://www.ftc.go.kr/www/bizCommList.do?key=232" class="nav-link p-0 text-muted">통신판매업신고<br/>제2014-서울강남-02297</li>
        <li class="nav-item mb-2"><a href="/ELTRUT/terms" class="nav-link p-0 text-muted">이용약관</a></li>
        <li class="nav-item mb-2"><a href="/ELTRUT/privacy" class="nav-link p-0 text-muted">개인정보보호</a></li>        
     </ul>
     <p class="text-muted">© #21B - ELTURT</p>       
    </div>

    <div class="col">
      <h5>회사</h5>
      <ul class="nav flex-column"><p></p>
        <li class="nav-link mb-2 p-0 text-muted">TEL<br/> 010-1234-5678</a></li>
        <li class="nav-link mb-2 p-0 text-muted">MAIL<br/> ELTRUT@*****</a></li>
        <li class=""nav-item mb-2"><a href="https://m.map.kakao.com/" class="nav-link mb-2 p-0 text-muted">ADDRESS<br/> 서울특별시 **** </a></li>
     </ul>
    </div>

    <div class="col">
      <h5 style="height: 24px; mb-3">운영시간</h5>
      <ul class="nav flex-column">
       <p></p>
        <li class="nav-link mb-2 p-0 text-muted">OPEN <br/> AM 10:00~PM 06:00</a></li>
        <p></p>
        <li class="nav-link mb-2 p-0 text-muted">CLOSED <br/> SAT,SUN,HOLI </a></li>
        </ul>
    </div>
    
    <div class="col">
      <h5 style="height: 24px;">FOLLOW US</h5>
      <ul class="nav flex-column">
      <p></p>
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
       <p></p>   
     <c:choose>
		<c:when test="${empty MEMBER_ID}">
		<li class="nav-item mb-2"><a href="/ELTRUT/loginForm" class="nav-link p-0 text-muted">로그인</a></li>
		</c:when>
	</c:choose>
        <li class="nav-item mb-2"><a href="/ELTRUT/main0" class="nav-link p-0 text-muted">메인 페이지</a></li>     
        <li class="nav-item mb-2"><a href="/ELTRUT/main" class="nav-link p-0 text-muted">상품판매 페이지</a></li>
 
        </ul>
    </div>  
    
</footer>
</div>
</body>
</html>


