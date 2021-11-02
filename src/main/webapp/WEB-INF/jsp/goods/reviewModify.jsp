<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰수정하는 곳입니다.</title>

<script>
function validation() {
	var title = document.getElementById("REVIEW_TITLE");	
	var content = document.getElementById("REVIEW_CONTENT");
		
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("후기 내용을 입력해주세요");
		content.focus();
		return false;
	}
	document.reviewModify.submit();
} 
</script>

</head>
<body>
<h2>${goodsReview.MEMBER_ID }님의 상품 리뷰수정하는 곳입니다.</h2>

<form method="post" name="reviewModify" action="/ELTRUT/reviewModify" enctype="multipart/form-data">
<table border="1">
	
	<tr>
	<td>작성자</td>
	<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" readonly value="${goodsReview.MEMBER_ID}"></td>
	</tr>
	
	<tr>
	<td>리뷰 번호</td>
	<td><input type="text" id="REVIEW_NUMBER" name="REVIEW_NUMBER" readonly value="${goodsReview.REVIEW_NUMBER }"></td>
	</tr>
	
	<tr>
	<td>기존 이미지</td>
	<td><img src="/ELTRUT/file/reviewFile/${O.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" />
	<input type="file" id="REVIEW_IMAGE" name="REVIEW_IMAGE" value="${goodsReview.REVIEW_IMAGE }"></td>
	</tr>
	
	<tr>
	<td>리뷰 제목</td>
	<td><input type="text" id="REVIEW_TITLE" name="REVIEW_TITLE"  value="${goodsReview.REVIEW_TITLE }"></td>
	</tr>
	
	<tr>
	<td>리뷰 내용</td>
	<td><textarea id="REVIEW_CONTENT" name="REVIEW_CONTENT" rows="5" cols="33" >${goodsReview.REVIEW_CONTENT }</textarea></td>
	</tr>

</table>
	<input type="hidden" name="GOODS_NUMBER" id="GOODS_NUMBER" value="${goodsReview.GOODS_NUMBER }">
	<input type="button" value="수정하기" onclick="validation();">
	<input type="button" value="돌아가기" onclick="location.href='/ELTRUT/goodsReview'">
</form>





</body>
</html>