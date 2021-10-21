<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function search() {
	if(search1.isSearch.value==""){
	alert('내용을 입력해주세요');
	return false;
	}
}
</script>
</head>
<body>
<div>

<input type="button" onclick= "location.href='main';">
</div>
<div style="float:right;">

<form name="search1"  action="main"  method="post">
<input type="text" id="isSearch" name="isSearch">
<input type="submit" value="검색" onclick="search()">

</form>

 <c:choose>
	<c:when test="${empty MEMBER_ID}">
	<a href="loginForm">로그인</a> 도움말
	</c:when>
	<c:otherwise>
	<a href="myPage">${MEMBER_ID}</a> 도움말 <a href="main">바스켓백(${header_basket.C})</a> <a href="logout">로그아웃</a> 
 </c:otherwise>
</c:choose>


</div> 
</body>
</html>