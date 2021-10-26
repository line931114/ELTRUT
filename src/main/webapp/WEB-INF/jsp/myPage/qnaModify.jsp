<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 - QNA 수정하는 곳입니다.</title>

<script>
function validation() {
	var title = document.getElementById("CS_TITLE");	
	var content = document.getElementById("CS_CONTENT");
	var category =document.getElementById("CS_CATEGORY");
	
	if(category.value == ""){
		alert("문의 종류를 입력해주세요");
		category.focus();
		return false;
	}
	
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("문의 내용을 입력해주세요");
		content.focus();
		return false;
	}
	document.qnaModify.submit();
} 
</script>

</head>
<body>
<h2>문의사항 - QNA수정하는 곳입니다.</h2>



<form method="post" name="qnaModify" action="/ELTRUT/qnaModify" enctype="multipart/form-data">
<table border="1">
	
<tr>
	<td>문의번호</td>
	<td><input type="text" id="CS_NUMBER" name="CS_NUMBER" readonly value="${O.CS_NUMBER }"></td>
	</tr>
	
	<tr>
	<td>상품번호</td>
	<td><input type="text" id="GOODS_NUMBER" name="GOODS_NUMBER" readonly value="${O.GOODS_NUMBER }"></td>
	</tr>
	
	<tr>
	<td>문의종류</td>
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
	<td>기존 이미지</td>
	<td><img src="/ELTRUT/file/qnaFile/${O.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" />
	<input type="file" id="CS_IMAGE1" name="CS_IMAGE1" value="${O.CS_IMAGE1 }"></td>
	</tr>
	
	<tr>
	<td>문의제목</td>
	<td><input type="text" id="CS_TITLE" name="CS_TITLE" value="${O.CS_TITLE }"></td>
	</tr>
	
	<tr>
	<td>문의내용</td>
	<td><textarea id="CS_CONTENT" name="CS_CONTENT" rows="5" cols="33" >${O.CS_CONTENT }</textarea></td>
	</tr>
	
	<tr>
	<td>문의날짜</td>
	<td><input type="text" id="CS_REGDATE" name="CS_REGDATE" readonly value="${O.CS_REGDATE }"></td>
	</tr>
</table>
	<input type="button" value="수정하기" onclick="validation();">
	<input type="button" value="돌아가기" onclick="location.href='/ELTRUT/qnaCheck'">
</form>





</body>
</html>