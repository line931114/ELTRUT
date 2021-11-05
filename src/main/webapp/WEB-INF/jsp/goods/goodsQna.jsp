<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>상품QNA페이지</title>
<script>
if('${message}' != ""){
	alert('${message}');
}

function insertCheck(){
	var member = document.getElementById("MEMBER");
		if(member.value == ""){
			alert("qna작성을 위해선 로그인이 필수입니다.");
			return false;
		}else{
			location.href="/ELTRUT/goodsQnaInsert?GOODS_NUMBER="+${Q.GOODS_NUMBER }+"&MEMBER_ID="+member.value; 
		}
	}


function modify1(number,id){
	var member = document.getElementById("MEMBER");
	if(member.value == id.value){
		
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/goodsQnaModify?CS_NUMBER="+number.value+"&MEMBER_ID="+id.value; 
	}else{
		alert("해당 게시물의 작성자가 아니기때문에 수정,삭제가 불가능합니다.");
		return false;
	}
}

function delete1(number,id,goods){
	var member = document.getElementById("MEMBER");
	if(member.value == id.value){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/goodsQnaDelete?CS_NUMBER="+number.value+"&MEMBER_ID="+id.value+"&GOODS_NUMBER="+goods.value;
	}else{
	}

	}else{
		alert("해당 게시물의 작성자가 아니기때문에 수정,삭제가 불가능합니다.");
		return false;
	}
}

</script>

</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>상품QNA 페이지</h2>
    </div>
        <form class="needs-validation" >
        <h4 align="right">
         <button class="btn btn-primary btn-lg" type="button" onclick="insertCheck();">QNA작성</button>
         <input type="hidden" id="MEMBER" name="MEMBER" value="${sessionScope.MEMBER_ID }">
        </h4>
        
    <c:choose>
	<c:when test="${not empty goodsQna}">
		<c:forEach items="${goodsQna }" var="Q" varStatus="status">

    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">문의번호</label>
              <input type="text" class="form-control" value="${Q.CS_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">작성자</label>
              <input type="text" class="form-control" value="${Q.MEMBER_ID }" readonly>
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">문의 제목</label>
                <input type="text" class="form-control" value="${Q.CS_TITLE }" readonly>
              
              </div>
			
			<div class="col-7">
			<label for="username" class="form-label">문의 이미지</label>
			<input type="image" class="form-control" src="/ELTRUT/file/qnaFile/${Q.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" />
            
            </div>
            
            <div class="col-7">
              <label for="email" class="form-label">문의 내용</label>
              <input type="email" class="form-control" value="${Q.CS_CONTENT }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">관리자 댓글</label>
              <input type="text" class="form-control" value="${Q.CS_REPCONTENT }" readonly>
              
            </div>

          </div>
          <hr class="my-4">
			<input type="hidden" name="goodsNumber${status.index}" id="GOODS_NUMBER" value="${Q.GOODS_NUMBER }">
		<input type="hidden" name="csNumber${status.index}" id="CS_NUMBER" value="${Q.CS_NUMBER }">
		<input type="hidden" name="memberId${status.index}" id="MEMBER_ID" value="${Q.MEMBER_ID }">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="modify1(csNumber${status.index},memberId${status.index});">수정</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="delete1(csNumber${status.index},memberId${status.index},goodsNumber${status.index});">삭제</button>
          </div>
          <hr class="my-4">
      </div>
    </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"해당 상품의 QNA가 없습니다."</H3>	
	</c:otherwise>
</c:choose>
        </form>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>