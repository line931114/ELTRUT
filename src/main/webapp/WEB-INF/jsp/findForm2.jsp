<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <%request.setCharacterEncoding("UTF-8"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

if('${message}' != ""){
	alert('${message}');
}

function findform_check() {
var name = document.getElementById("MEMBER_NAME");
var email = document.getElementById("MEMBER_EMAIL");
var id = document.getElementById("MEMBER_ID");

if (id.value == "") {
    alert("아이디를 입력하세요.");
    id.focus();
    return false;
  };
  
if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
    return false;
  };

  document.find_form.submit();
}
</script>

</head>
<body>

<h5>아이디 찾기</h5>

	<form method="post" name="find_form" action="/ELTRUT/findForm3" >	
	<table border="1">
	
	<tr>
	<td><strong>아이디</strong></td>
	<td><input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" label="아이디"></td>
	</tr>
	
	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
	</tr>
	
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="이메일"></td>
	</tr>
	
	</table>
	<p> <a href="/ELTRUT/loginForm">로그인 페이지로 돌아가시겠습니까?</a></p>
	<input type="button" value="비밀번호 찾기" onclick="findform_check()">
</form>
</body>
</html>