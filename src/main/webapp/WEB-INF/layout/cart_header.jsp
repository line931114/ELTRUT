<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../cssUrl.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">



<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
  <div class="container-fluid">
     <div class="nav-menu">
     <a href="#sidebar" class="btn-lg" data-bs-toggle="offcanvas" role=button" area-controls="sidebar" onclick="openNav()">
         <span class="bi bi-list" ></span>
         </a>
     </div>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto" style="align-items: center";>
  <a class="navbar-brand" href="http://localhost:8081/ELTRUT/main">
      <img src="/ELTRUT/file/ELTRUT.png" alt="" width="310" height="98">
    </a>
        <c:choose>
        <c:when test="${empty MEMBER_ID}">
    <li  class="nav-item"> 
    <a  class="nav-link" sty href="loginForm">로그인</a>
    </li>
    <li class="nav-item"> 
      <a class="nav-link" href="#">도움말</a> 
    </li> 
    </c:when> 
    <c:otherwise>
    <li class="nav-item"> 
      <a class="nav-link" href="myPage">${MEMBER_ID}</a> 
    </li> 
    <li class="nav-item"> 
      <a class="nav-link" href="#">도움말</a> 
    </li> 
    <li class="nav-item"> 
      <a class="nav-link" href="/ELTRUT/cartList">장바구니(${header_basket.C})</a>
     </li>
   
    <li class="nav-item"> 
      <a class="nav-link" href="logout">로그아웃</a> 
    </li>   

    </c:otherwise>
    </c:choose> 
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
  
</nav>


<nav class="navbar fixed-bottom navbar-white bg-white">
  <div class="container-fluid">
 
    <div class="col-12"><input type="button" class="btn float-right btn-dark btn-sm" value="쇼핑계속" onclick=""/>
   
   <div class="col-12"><input type="button" class="btn float-right btn-dark btn-sm" value="구매" onclick='return submit2();' style="margin-right:1%"/></div>
  </div>
</nav>



<title>ELTRUT</title>

 
<script>
function search() {
   if(search1.isSearch.value==""){
   alert('내용을 입력해주세요');
   return false;
   }
}
</script>


 <style>
body {
  font-family: "Lato", sans-serif;
}



.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #FFFFFF;
  overflow-x: hidden;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 10px;
  color: #000000;
  display: block;
 
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 30px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 10px;}
}

.btn-space {
    margin-right: 5px;
}

body { padding-top: 80px; }

</style> 

</head>
<body>







<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <p>ELTRUT </p> 
  <p>
  <a class="NEW " data-bs-toggle="collapse" href="#collapseNEW" aria-expanded="false" aria-controls="collapseNEW">
    NEW
  </a>
</p>
<div class="NewContents collapse" id="collapseNEW">
  <div class="card card-body">
    <a href="#">CLOTHES</a>
    <a href="#">SHOES</a>
  </div>
</div>

<p>
  <a class="BS" data-bs-toggle="collapse" href="#collapseBS" aria-expanded="false" aria-controls="collapseBS">
    BEST SELLER
  </a>
</p>
<div class="BSContents collapse" id="collapseBS">
  <div class="card card-body">
    <a href="#">CLOTHES</a>
    <a href="#">SHOES</a>
  </div>
</div>

<p>
  <a class="COLLECTION" data-bs-toggle="collapse" href="#collapseCOLLECTION" role="link" aria-expanded="false" aria-controls="collapseCOLLECTION">
    COLLECTION
  </a>
</p>
<div class="COLLECTION collapse" id="collapseCOLLECTION">
  <div class="card card-body">
    <a href="#">OUTER</a>
    <a href="#">TOP</a>
    <a href="#">T-SHIRTS</a>
    <a href="#">KNIT</a>
    <a href="#">DRESS</a>
    <a href="#">PANTS</a>
    <a href="#">SKIRTS</a>
    <a href="#">SHOES</a>
  </div>
</div>

  <a href="#">COMMERCIAL</a>
  <a href="#">ABOUT US</a>
</div>




<script>
function openNav() {
  document.getElementById("mySidenav").style.cssText=`
     width: 250px;
     z-index: 1200;
  `;
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
   





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</body>
</html>