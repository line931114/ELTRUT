<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ǻ���</title>

<script>
function modify1(number){
	alert("���� �������� �̵��ϰڽ��ϴ�.");
	location.href="/ELTRUT/enquirymodify?CANCEL_NUMBER="+number.value; 
}

function delete1(number){
	if(confirm("���ǳ����� ���� �����Ͻðڽ��ϱ�?")){
		alert("���� ������ �����ϰڽ��ϴ�.");
		location.href="/ELTRUT/enquirydelete?CANCEL_NUMBER="+number.value; 
	}else{
	}
}

</script>

</head>
<body>
<h3>���ǻ��� Ȯ���ϴ� ���Դϴ�.</h3>

<form>

<c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">
=======================================================================================


<table border="1">
	
<tr>
	<td>���ǹ�ȣ</td>
	<td>${O.CANCEL_NUMBER }</td>
	</tr>
	
	<tr>
	<td>��ǰ��ȣ</td>
	<td>${O.ORDER_NUMBER }</td>
	</tr>
	
	<tr>
	<td>��������</td>
	<td>${O.CANCEL_CATEGORY }</td>
	</tr>
	
	
	<tr>
	<td>��������</td>
	<td>${O.CANCEL_TITLE }</td>
	</tr>
	
	<tr>
	<td>���ǳ���</td>
	<td>${O.CANCEL_CONTENT }</td>
	</tr>
	
	<tr>
	<td>���ǳ�¥</td>
	<td>${O.CANCEL_REGDATE }</td>
	</tr>
</table>

		<input type="hidden" name=cancelNumber${status.index } id="CANCEL_NUMBER" value="${O.CANCEL_NUMBER }">
				

	
		<input type="button" value="����" onclick="modify1(cancelNumber${status.index});">				
		<input type="button" value="����" onclick="delete1(cancelNumber${status.index});">
	
	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"���� ������ �����ϴ�."</H3>	
	</c:otherwise>
</c:choose>

		

</form>
</body>
</html>