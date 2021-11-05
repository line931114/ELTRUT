<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<meta charset="UTF-8">
<title>상품후기페이지</title>
<script>
if('${message}' != ""){
	alert('${message}');
}



function insertCheck(){
	var member = document.getElementById("MEMBER");
		if(member.value == ""){
			alert("후기작성을 위해선 로그인이 필수입니다.");
			return false;
		}else{
			location.href="/ELTRUT/reviewInsert?GOODS_NUMBER="+${G.GOODS_NUMBER }+"&MEMBER_ID="+member.value; 
		}
	}


function modify1(number,id){
	var member = document.getElementById("MEMBER");
	if(member.value == id.value){
		alert("수정 페이지로 이동하겠습니다.");
		location.href="/ELTRUT/reviewModify?REVIEW_NUMBER="+number.value+"&MEMBER_ID="+id.value; 		
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
			location.href="/ELTRUT/reviewDelete?REVIEW_NUMBER="+number.value+"&MEMBER_ID="+id.value+"&GOODS_NUMBER="+goods.value;
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
      <h2>상품후기 페이지</h2>
    </div>
        <form class="needs-validation" >
        <h4 align="right">
         <button class="btn btn-primary btn-lg" type="button" onclick="insertCheck();">후기작성</button>
         <input type="hidden" id="MEMBER" name="MEMBER" value="${sessionScope.MEMBER_ID }">
        </h4>
        
    <c:choose>
	<c:when test="${not empty goodsReview}">
		<c:forEach items="${goodsReview }" var="G" varStatus="status">

    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">리뷰번호</label>
              <input type="text" class="form-control" value="${G.REVIEW_NUMBER }" readonly>
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">작성자</label>
              <input type="text" class="form-control" value="${G.MEMBER_ID }" readonly>
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">리뷰제목</label>
                <input type="text" class="form-control" value="${G.REVIEW_TITLE }" readonly>
              
              </div>
			
			<div class="col-7">
			<label for="username" class="form-label">리뷰 이미지</label>
			<input type="image" class="form-control" src="/ELTRUT/file/reviewFile/${G.REVIEW_IMAGE}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" />
            
            </div>
            
            <div class="col-7">
              <label for="email" class="form-label">리뷰내용</label>
              <input type="email" class="form-control" value="${G.REVIEW_CONTENT }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">관리자 댓글</label>
              <input type="hidden" class="form-control" value="" readonly>
              
            </div>

          </div>
          <hr class="my-4">
			<input type="hidden" name="goodsNumber${status.index}" id="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			<input type="hidden" name="reviewNumber${status.index}" id="REVIEW_NUMBER" value="${G.REVIEW_NUMBER }">
			<input type="hidden" name="memberId${status.index}" id="MEMBER_ID" value="${G.MEMBER_ID }">
          <div style="text-align: -webkit-center;">
          <button class="btn btn-primary btn-lg" type="button" onclick="modify1(reviewNumber${status.index},memberId${status.index});">수정</button>
          <button class="btn btn-primary btn-lg" type="button" onclick="delete1(reviewNumber${status.index},memberId${status.index},goodsNumber${status.index});">삭제</button>
          </div>
          <hr class="my-4">
      </div>
    </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"상품후기가 없습니다."</H3>	
	</c:otherwise>
</c:choose>
        </form>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>