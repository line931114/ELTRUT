<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내문의사항</title>

<script>
function modify1(number){
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/enquirymodify?CANCEL_NUMBER="+number.value; 
}

function delete1(number){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/enquirydelete?CANCEL_NUMBER="+number.value; 
	}else{
	}
}

</script>

</head>
<body>
<h3>문의사항 확인하는 곳입니다.</h3>

<form>

<c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">
=======================================================================================


<table border="1">
	
<tr>
	<td>문의번호</td>
	<td>${O.CANCEL_NUMBER }</td>
	</tr>
	
	<tr>
	<td>상품번호</td>
	<td>${O.ORDER_NUMBER }</td>
	</tr>
	
	<tr>
	<td>문의종류</td>
	<td>${O.CANCEL_CATEGORY }</td>
	</tr>
	
	
	<tr>
	<td>문의제목</td>
	<td>${O.CANCEL_TITLE }</td>
	</tr>
	
	<tr>
	<td>문의내용</td>
	<td>${O.CANCEL_CONTENT }</td>
	</tr>
	
	<tr>
	<td>문의날짜</td>
	<td>${O.CANCEL_REGDATE }</td>
	</tr>
</table>

		<input type="hidden" name=cancelNumber${status.index } id="CANCEL_NUMBER" value="${O.CANCEL_NUMBER }">
				

	
		<input type="button" value="수정" onclick="modify1(cancelNumber${status.index});">				
		<input type="button" value="삭제" onclick="delete1(cancelNumber${status.index});">
	
	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"문의 내용이 없습니다."</H3>	
	</c:otherwise>
</c:choose>

		

</form>
</body>
</html>