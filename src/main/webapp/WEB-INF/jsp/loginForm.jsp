<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
if('${message}' != ""){
	alert('${message}');
}
function loginform_check() {
var id = document.getElementById("MEMBER_ID");
var pw = document.getElementById("MEMBER_PASSWORD");

if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };

  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };
  document.login_form.submit();
}
</script>

<title>로그인</title>
</head>
<body>
<form name="login_form" action="/ELTRUT/login" method="post">
<h2>로그인</h2>
<table border="1">
<tr>
	<td>로그인ID</td>
	<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"/></td>
</tr>
<tr>
	<td>패스워드</td>
	<td><input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD"/></td>
</tr>
<tr>
<td><input type="button" value="로그인" onclick="loginform_check();"></td>
<td><input type="button" value="회원가입" onclick="location.href='/ELTRUT/joinStep1'">
</tr>
</table>
<p>아이디/비밀번호를 잊으셨나요? <a href="/ELTRUT/findform" data-label="아이디/비밀번호 찾기">여기를 클릭</a>하여 확인하실 수 있습니다.</p>
</form>
</body>
</html>