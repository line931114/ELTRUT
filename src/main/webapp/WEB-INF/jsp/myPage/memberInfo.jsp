<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개인정보조회</title>
</head>
<body>
<h3 align="left">개인정보</h3>
<table align="left" border="1">
<tr>
<td> 회원아이디 : ${M.MEMBER_ID }</td>
</tr>
<tr>
<td> 이름 : ${M.MEMBER_NAME }</td>
</tr>
<tr>
<td> 이메일 : ${M.MEMBER_EMAIL }</td>
</tr>
<tr>
<td> 번호 : ${M.MEMBER_PHONE }</td>
</tr>
<tr>
<td> 우편 : ${M.MEMBER_ZIPCODE }</td>
</tr>
<tr>
<td> 주소 : ${M.MEMBER_ADDRESS1 }- ${M.MEMBER_ADDRESS2 }</td>
</tr>
</table>
<br><br><br><br><br><br><br><br><br>
<a href="pwCheck" > 회원정보수정</a>
</body>
</html>