<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h5>���̵� ã��</h5>

	<form method="post" name="find_form" action="/ELTRUT/findform1">	
	<table border="1">
	
	<tr>
	<td><strong>�̸�</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="�̸�"></td>
	</tr>
	
	<tr>
	<td><strong>�̸���</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="�̸���"></td>
	</tr>
	
	</table>
	
	<input type="button" value="������������" onclick="history.back();">
    <input type="submit" value="���̵�ã��" >
	
</form>
</body>
</html>