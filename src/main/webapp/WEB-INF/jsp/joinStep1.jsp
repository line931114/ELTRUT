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
	<h3>ȸ������</h3>
	
	<tr>
	<td><strong>���̵�</strong></td>
	<td><input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" label="���̵�"></td>
	</tr>
	
	<tr>
	<td><strong>�̸�</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="�̸�"></td>
	</tr>
	
	<tr>
	<td><strong>�̸���</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="�̸���"></td>
	</tr>
	
	<tr>
	<td><strong>��й�ȣ</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="��й�ȣ"></td>
	</tr>
	
	<tr>
	<td><strong>�����ȣ</strong></td>
	<td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="�����ȣ"></td>
	</tr>
	
	<tr>
	<td><strong>�ּ�</strong></td>
	<td><input type="text" name="MEMBER_ADDRESS1" id="MEMBER_ADDRESS1" value="" maxlength="20" label="�ּ�"></td>
	<td><input type="text" name="MEMBER_ADDRESS2" id="MEMBER_ADDRESS2" value="" maxlength="20" label="�ּ�"></td>
	</tr>
	
	<tr>
	<td><strong>�ڵ�����ȣ</strong></td>
	<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="�ڵ�����ȣ"></td>
	</tr>
	</table>
	
	<input type="submit" value="����">
	</form>
</body>
</html>