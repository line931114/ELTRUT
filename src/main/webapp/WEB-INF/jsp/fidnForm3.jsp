<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
</head>
<body>
<h2>비밀번호 찾기</h2>
회원님의 비밀번호는 ${findPw.MEMBER_PASSWORD } 입니다.
<br>

<p> <a href="/ELTRUT/loginForm">로그인 페이지로 돌아가시겠습니까?</a></p>
</html>