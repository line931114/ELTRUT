<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h5>아이디 찾기</h5>

	<form method="post" name="find_form" action="/ELTRUT/findform1">	
	<table border="1">
	
	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
	</tr>
	
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="이메일"></td>
	</tr>
	
	</table>
	
	<input type="button" value="이전페이지로" onclick="history.back();">
    <input type="submit" value="아이디찾기" >
	
</form>
</body>
</html>