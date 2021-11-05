<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>

<meta charset="UTF-8">
<title>문의사항 -QNA</title>

<script>
function modify1(number){
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/qnaModify?CS_NUMBER="+number.value; 
}

function delete1(number){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/qnaDelete?CS_NUMBER="+number.value; 
	}else{
	}
}
</script>
</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>문의사항 - QNA확인하는 곳입니다.</h2>
    </div>
        <form class="needs-validation" >
    <c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">

    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">문의번호</label>
              <input type="text" class="form-control" value="${O.CS_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">상품번호</label>
              <input type="text" class="form-control" value="${O.GOODS_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">문의종류</label>
                <input type="text" class="form-control" value="${O.CS_CATEGORY }" readonly>
              
              </div>
			
			<div class="col-7">
			<label for="username" class="form-label">문의 이미지</label>
			<input type="image" class="form-control" src="/ELTRUT/file/qnaFile/${O.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" />
            
            </div>
            
            <div class="col-7">
              <label for="email" class="form-label">문의제목 </label>
              <input type="email" class="form-control" value="${O.CS_TITLE }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">문의내용</label>
              <input type="text" class="form-control" value="${O.CS_CONTENT }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">문의날짜</label>
              <input type="text" class="form-control" value="${O.CS_REGDATE }" readonly>
            </div>
          </div>
          <hr class="my-4">
			<input type="hidden" name=csNumber${status.index } id="CS_NUMBER" value="${O.CS_NUMBER }">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="modify1(csNumber${status.index});">수정</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="delete1(csNumber${status.index});">삭제</button>
          </div>
          <hr class="my-4">
      </div>
    </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"문의 내용이 없습니다."</H3>	
	</c:otherwise>
</c:choose>
        </form>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>