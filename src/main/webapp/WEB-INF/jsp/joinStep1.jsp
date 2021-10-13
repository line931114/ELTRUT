<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="frm" action="/ELTRUT/joinComplete">	
	<table border="1">
	<h3>회원정보</h3>
	
	<tr>
	<td><strong>아이디</strong></td>
	<td><input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" label="아이디"></td>
	</tr>
	
	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
	</tr>
	
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="이메일"></td>
	</tr>
	
	<tr>
	<td><strong>비밀번호</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="비밀번호"></td>
	</tr>
	
	<tr>
	<td><strong>우편번호</strong></td>
	<td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="우편번호"></td>
	</tr>
	
	<tr>
	<td><strong>주소</strong></td>
	<td><input type="text" name="MEMBER_ADDRESS1" id="MEMBER_ADDRESS1" value="" maxlength="20" label="주소"></td>
	<td><input type="text" name="MEMBER_ADDRESS2" id="MEMBER_ADDRESS2" value="" maxlength="20" label="주소"></td>
	</tr>
	
	<tr>
	<td><strong>핸드폰번호</strong></td>
	<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="핸드폰번호"></td>
	</tr>
	</table>
	
	<input type="submit" value="전송">
	</form>
</body>
</html>