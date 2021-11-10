<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../cssUrl.jsp"/>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="text-align: -webkit-center">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block " src="/ELTRUT/file/1.jpg" alt="First slide" >
    </div>
   <div class="carousel-item">
      <img class="d-block " src="/ELTRUT/file/2.png" alt="Seconde slide">
    </div>
    <div class="carousel-item">
      <img class="d-block " src="/ELTRUT/file/3.png" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block " src="/ELTRUT/file/4.png" alt="Fourth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
 </div>

</body>
</html>