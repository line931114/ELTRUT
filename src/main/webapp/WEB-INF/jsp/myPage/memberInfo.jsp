<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������ȸ</title>
</head>
<body>
<h3 align="left">��������</h3>
<table align="left" border="1">
<tr>
<td> ȸ�����̵� : ${M.MEMBER_ID }</td>
</tr>
<tr>
<td> �̸� : ${M.MEMBER_NAME }</td>
</tr>
<tr>
<td> �̸��� : ${M.MEMBER_EMAIL }</td>
</tr>
<tr>
<td> ��ȣ : ${M.MEMBER_PHONE }</td>
</tr>
<tr>
<td> ���� : ${M.MEMBER_ZIPCODE }</td>
</tr>
<tr>
<td> �ּ� : ${M.MEMBER_ADDRESS1 }- ${M.MEMBER_ADDRESS2 }</td>
</tr>
</table>
<br><br><br><br><br><br><br><br><br>
<a href="pwCheck" > ȸ����������</a>
</body>
</html>