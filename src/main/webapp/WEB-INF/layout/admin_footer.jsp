<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<table border="0" style="border-right:none;  border-left:none; border-top:none ;border-bottom:none">
	<tr>
		<td>회사</td>
		<td>회사번호</td>
		<td>FOLLOW US</td>
		<td>페이지 메인기능</td>
	</tr>
	<tr>
		<td>이용약관</td>
		<td>MON-FRI AM 10:00~PM 06:00</td>
		<td>#21B_이광호</td>
	<c:choose>
		<c:when test="${empty MEMBER_ID}">
		<td><a href="/ELTRUT/loginForm">로그인</a></td>
		</c:when>
	</c:choose>		
	</tr>
	<tr>
		<td>개인정보보호</td>
		<td></td>
		<td>#21B_정혜림</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>SAT,SUN,HOLI CLOSED</td>
		<td>#21B_손수완</td>
		<td><a href="/ELTRUT/main">메인페이지이동</a></td>
	</tr>
	<tr>
		<td>사업정보확인</td>
		<td></td>
		<td>#21B_장세영</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>#21B_정원철</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>#21B_이지수</td>
		<td></td>
	</tr>
		
	
	
	
    </table>


</body>
</html>


