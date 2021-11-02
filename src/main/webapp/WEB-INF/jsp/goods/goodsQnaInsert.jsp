<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰작성페이지</title>

<script>
function validation() {
	var title = document.getElementById("CS_TITLE");	
	var content = document.getElementById("CS_CONTENT");
		
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
	document.goodsQnaInsert.submit();
} 
</script>

</head>
<body>
<h2>${sessionScope.MEMBER_ID }님 해당페이지는 상품 문의하는 곳입니다.</h2>

	<form method="post" name="goodsQnaInsert" action="/ELTRUT/goodsQnaInsert"
		enctype="multipart/form-data">
		<table border="1">

			<tr>
				<td>작성자</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" readonly
					value="${sessionScope.MEMBER_ID}"></td>
			</tr>

			
			<tr>
			<td>문의 종류</td>
			<td>
				<select name="CS_CATEGORY" id="CS_CATEGORY">
					<option id="CS_CATEGORY">배송문의</option>
					<option id="CS_CATEGORY">교환반품문의</option>
					<option id="CS_CATEGORY">입금확인문의</option>
					<option id="CS_CATEGORY">기타</option>
				</select>
			</td>
			</tr>
			
			
			<tr>
				<td>이미지 추가</td>
				<td><input type="file"id="CS_IMAGE1" name="CS_IMAGE1"></td>
			</tr>

			<tr>
				<td>문의 제목</td>
				<td><input type="text" id="CS_TITLE" name="CS_TITLE"></td>
			</tr>

			<tr>
				<td>문의 내용</td>
				<td><textarea id="CS_CONTENT" name="CS_CONTENT"
						rows="5" cols="33"></textarea></td>
			</tr>

		</table>
		<input type="hidden" name="GOODS_NUMBER" id="GOODS_NUMBER" value="${GOODS_NUMBER }"> 
		
		<input type="button" value="작성하기" onclick="validation();">
		<input type="button"value="돌아가기" onclick="location.href='/ELTRUT/goodsQna?GOODS_NUMBER=${GOODS_NUMBER}'">
	</form>

</body>
</html>