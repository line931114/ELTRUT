<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validation() {
	var title = document.getElementById("CANCEL_TITLE");	
	var content = document.getElementById("CANCEL_CONTENT");
	var category =document.getElementById("CANCEL_CATEGORY");
	
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
	document.enquiryModify.submit();
} 
</script>

</head>
<body>
<h3>내 문의사항-교환,반품 수정하는 페이지</h3>
<form method="post" name="enquiryModify" action="/ELTRUT/enquiryModify">
<table border="1">
	
<tr>
	<td>문의번호</td>
	<td><input type="text" id="CANCEL_NUMBER" name="CANCEL_NUMBER" readonly value="${O.CANCEL_NUMBER }"></td>
	</tr>
	
	<tr>
	<td>주문번호</td>
	<td><input type="text" id="ORDER_NUMBER" name="ORDER_NUMBER" readonly value="${O.ORDER_NUMBER }"></td>
	</tr>
	
	<tr>
	<td>문의종류</td>
	<td>
		<select name="CANCEL_CATEGORY" id="CANCEL_CATEGORY">
		<option id="CANCEL_CATEOGRY">교환</option>
		<option id="CANCEL_CATEOGRY">환불</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>문의제목</td>
	<td><input type="text" id="CANCEL_TITLE" name="CANCEL_TITLE" value="${O.CANCEL_TITLE }"></td>
	</tr>
	
	<tr>
	<td>문의내용</td>
	<td><textarea id="CANCEL_CONTENT" name="CANCEL_CONTENT" rows="5" cols="33" >${O.CANCEL_CONTENT }</textarea></td>
	</tr>
	
	<tr>
	<td>문의날짜</td>
	<td><input type="text" id="CANCEL_REGDATE" name="CANCEL_REGDATE" readonly value="${O.CANCEL_REGDATE }"></td>
	</tr>
</table>
	<input type="hidden" value="${sessionScope.MEMBER_ID }" id="MEMBER_ID" name="MEMBER_ID">
	<input type="button" value="수정하기" onclick="validation();">
	<input type="button" value="돌아가기" onclick="location.href='/ELTRUT/enquiryCheck'">
</form>
</body>
</html>