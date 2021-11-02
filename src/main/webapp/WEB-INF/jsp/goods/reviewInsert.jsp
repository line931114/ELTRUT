<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰작성페이지</title>

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
	document.reviewInsert.submit();
} 
</script>

</head>
<body>
<h2>${sessionScope.MEMBER_ID }님의 상품 리뷰등록하는 곳입니다.</h2>

	<form method="post" name="reviewInsert" action="/ELTRUT/reviewInsert"
		enctype="multipart/form-data">
		<table border="1">

			<tr>
				<td>작성자</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" readonly
					value="${sessionScope.MEMBER_ID}"></td>
			</tr>

			<tr>
				<td>이미지 추가</td>
				<td><input type="file"id="REVIEW_IMAGE" name="REVIEW_IMAGE"></td>
			</tr>

			<tr>
				<td>리뷰 제목</td>
				<td><input type="text" id="REVIEW_TITLE" name="REVIEW_TITLE"></td>
			</tr>

			<tr>
				<td>리뷰 내용</td>
				<td><textarea id="REVIEW_CONTENT" name="REVIEW_CONTENT"
						rows="5" cols="33"></textarea></td>
			</tr>

		</table>
		<input type="hidden" name="GOODS_NUMBER" id="GOODS_NUMBER" value="${review.GOODS_NUMBER }"> 
		<input type="hidden" name="ORDER_NUMBER" id="ORDER_NUMBER" value="${review.ORDER_NUMBER }"> 
		
		<input type="button" value="작성하기" onclick="validation();">
		<input type="button"value="돌아가기" onclick="location.href='/ELTRUT/goodsReview?GOODS_NUMBER=${review.GOODS_NUMBER}'">
	</form>

</body>
</html>