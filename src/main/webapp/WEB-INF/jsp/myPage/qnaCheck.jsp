<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 -QNA</title>

<script>
function modify1(number){
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/qnaModify?CS_NUMBER="+number.value; 
}

function delete1(number){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/qnaDelete?CS_NUMBER="+number.value; 
	}else{
	}
}
</script>
</head>
<body>
<h2>문의사항 - QNA확인하는 곳입니다.</h2>

<form>

<c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">
=======================================================================================


<table border="1">
	
<tr>
	<td>문의번호</td>
	<td>${O.CS_NUMBER }</td>
	</tr>
	
	<tr>
	<td>상품번호</td>
	<td>${O.GOODS_NUMBER }</td>
	</tr>
	
	<tr>
	<td>문의종류</td>
	<td>${O.CS_CATEGORY }</td>
	</tr>
	
	
	<tr>
	<td>문의 이미지</td>
	<td><img src="/ELTRUT/file/qnaFile/${O.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" /></td>
	</tr>
	
	
	<tr>
	<td>문의제목</td>
	<td>${O.CS_TITLE }</td>
	</tr>
	
	<tr>
	<td>문의내용</td>
	<td>${O.CS_CONTENT }</td>
	</tr>
	
	<tr>
	<td>문의날짜</td>
	<td>${O.CS_REGDATE }</td>
	</tr>
</table>

		<input type="hidden" name=csNumber${status.index } id="CS_NUMBER" value="${O.CS_NUMBER }">
				

	
		<input type="button" value="수정" onclick="modify1(csNumber${status.index});">				
		<input type="button" value="삭제" onclick="delete1(csNumber${status.index});">
	
	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"문의 내용이 없습니다."</H3>	
	</c:otherwise>
</c:choose>

</form>

</body>
</html>