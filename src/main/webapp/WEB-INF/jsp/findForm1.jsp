<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<body>
<h2>아이디 찾기</h2>

	회원님의 아이디는 ${findId.MEMBER_ID } 입니다.
	<br><br><br>
	<input type="button" value="비밀번호찾기" onclick="location.href='findForm2'">

<br>

<p> <a href="/ELTRUT/loginForm">로그인 페이지로 돌아가시겠습니까?</a></p>
</html>