<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
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
<body>
<h2 align="center"> 상품후기 페이지</h2> 

<form>
<h4 align="right">
<input type="button" value="후기작성" onclick="insertCheck();">
<input type="hidden" id="MEMBER" name="MEMBER" value="${sessionScope.MEMBER_ID }">		
</h4>
<c:choose>
	<c:when test="${not empty goodsReview}">
		<c:forEach items="${goodsReview }" var="G" varStatus="status">
=======================================================================================
	
	<table border="1">
	<tr>
	<td>리뷰번호</td>
	<td>${G.REVIEW_NUMBER }</td>
	</tr>
	
	<tr>
	<td>작성자</td>
	<td>${G.MEMBER_ID }</td>
	</tr>
	<tr>
	<td>리뷰제목</td>
	<td>${G.REVIEW_TITLE }</td>
	</tr>
	
	<tr>
	<td>리뷰 이미지</td>
	<td><img src="/ELTRUT/file/reviewFile/${G.REVIEW_IMAGE}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" /></td>
	</tr>
	
	<tr>
	<td>리뷰내용</td>
	<td>${G.REVIEW_CONTENT }</td>
	</tr>

	<tr>
	<td>관리자 댓글</td>
	</tr>	
</table>
		<input type="hidden" name="goodsNumber${status.index }" id="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
		<input type="hidden" name="reviewNumber${status.index }" id="REVIEW_NUMBER" value="${G.REVIEW_NUMBER }">
		<input type="hidden" name="memberId${status.index }" id="MEMBER_ID" value="${G.MEMBER_ID }">
				
		<input type="button" value="수정" onclick="modify1(reviewNumber${status.index},memberId${status.index });">				
		<input type="button" value="삭제" onclick="delete1(reviewNumber${status.index},memberId${status.index },goodsNumber${status.index });">
	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"상품후기가 없습니다."</H3>	
	</c:otherwise>
</c:choose>

</form>
</body>
</html>