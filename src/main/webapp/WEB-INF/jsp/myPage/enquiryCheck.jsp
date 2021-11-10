<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>내문의사항</title>

<script>
function modify1(number){
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/enquiryModify?CANCEL_NUMBER="+number.value; 
}

function delete1(number){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/enquiryDelete?CANCEL_NUMBER="+number.value; 
	}else{
	}
}

</script>

</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>반품/교환 목록을 확인 하실수있습니다.</h2>
    </div>
    <c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">

    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
        <form class="needs-validation" >
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">문의번호</label>
              <input type="text" class="form-control" value="${O.CANCEL_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">상품번호</label>
              <input type="text" class="form-control" value="${O.ORDER_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">문의종류</label>
                <input type="text" class="form-control" value="${O.CANCEL_CATEGORY }" readonly>
              
              </div>

            <div class="col-7">
              <label for="email" class="form-label">문의제목 </label>
              <input type="email" class="form-control" value="${O.CANCEL_TITLE }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">문의내용</label>
              <input type="text" class="form-control" value="${O.CANCEL_CONTENT }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">문의날짜</label>
              <input type="text" class="form-control" value="${O.CANCEL_REGDATE }" readonly>
            </div>
          </div>
          <hr class="my-4">
			<input type="hidden" name=cancelNumber${status.index } id="CANCEL_NUMBER" value="${O.CANCEL_NUMBER }">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="modify1(cancelNumber${status.index});">수정</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="delete1(cancelNumber${status.index});">삭제</button>
          </div>
          <hr class="my-4">
        </form>
      </div>
    </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"문의 내용이 없습니다."</H3>	
	</c:otherwise>
</c:choose>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>