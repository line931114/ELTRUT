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
    <form >
    </div>
       
        <h4 align="right">
         <button class="btn btn-primary btn-lg" type="button" onclick="insertCheck();">후기작성</button>
         <input type="hidden" id="MEMBER" name="MEMBER" value="${sessionScope.MEMBER_ID }">
        </h4>
        
        
    <table class="table table-striped" style="text-align-last: center" >
      	<thead>
     		<tr>
     	 		<th style="width:100px">번호</th>
     	 		<th style="width:210px">리뷰 이미지</th>
     	 		<th style="width:200px">제목</th>
     	 		<th style="width:250px">내용</th>
     	 		<th style="width:210px">작성자</th>
     	 		<th></th>
     	 		<th></th>
     		</tr>
     	</thead>
     </table>    
        
        
        
    <c:choose>
	<c:when test="${not empty goodsReview}">
		<c:forEach items="${goodsReview }" var="G" varStatus="status">

	 <table class="table table-striped" style="text-align-last: center" >
      <tbody>
      	<thead>
     		<tr>
     	 		<td style="width:100px;height:80px; vertical-align: middle; "><input type="hidden" class="form-control" value="${G.REVIEW_NUMBER }" readonly>${G.REVIEW_NUMBER }</td>
     	 		<td style="width:200px;height:80px; vertical-align: middle; "><img src="/ELTRUT/file/reviewFile/${G.REVIEW_IMAGE}" onerror="this.style.display='none';" class="img-thumbnail" /></td>														
     	 		<td style="width:200px;height:80px; vertical-align: middle;; "><input type="hidden" class="form-control" value="${G.REVIEW_TITLE }" readonly>${G.REVIEW_TITLE }</td>
     	 		<td style="width:250px;height:80px; vertical-align: middle; "><input type="hidden" class="form-control" value="${G.REVIEW_CONTENT }" readonly>${G.REVIEW_CONTENT }</td>     	 		
     	 		<td style="width:200px;height:80px; vertical-align: middle; "><input type="hidden" class="form-control" value="${G.MEMBER_ID }" readonly>${G.MEMBER_ID }</td>
     	 		
				<td style="vertical-align: middle;">  <button class="btn btn-primary btn-lg" type="button" onclick="modify1(reviewNumber${status.index},memberId${status.index});">수정</button></td>
        		<td style="vertical-align: middle;">  <button class="btn btn-primary btn-lg" type="button" onclick="delete1(reviewNumber${status.index},memberId${status.index},goodsNumber${status.index});">삭제</button></td>
     		</tr>
     	</thead>
      </tbody>		   				
     </table>

			<input type="hidden" name="goodsNumber${status.index}" id="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			<input type="hidden" name="reviewNumber${status.index}" id="REVIEW_NUMBER" value="${G.REVIEW_NUMBER }">
			<input type="hidden" name="memberId${status.index}" id="MEMBER_ID" value="${G.MEMBER_ID }">
      
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"상품후기가 없습니다."</H3>	
	</c:otherwise>
</c:choose>
       
  </main>
</div>
		 </form>		

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>