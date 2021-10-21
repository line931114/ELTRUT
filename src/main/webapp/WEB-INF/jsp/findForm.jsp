<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <%request.setCharacterEncoding("UTF-8"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>

if('${message}' != ""){
	alert('${message}');
}

function findform_check() {
var name = document.getElementById("MEMBER_NAME");
var email = document.getElementById("MEMBER_EMAIL");

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

	<form method="post" name="find_form" action="/ELTRUT/findForm1" >	
	<table border="1">
	
	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
	</tr>
	
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="이메일"></td>
	</tr>
	
	</table>
	
	<input type="button" value="이전페이지로" onclick="location.href='loginForm'">
    <input type="button" value="아이디찾기" onclick="findform_check()">
	
</form>
</body>
</html>