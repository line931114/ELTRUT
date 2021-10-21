<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 확인</title>

<script>

if('${message}' != ""){
	alert('${message}');
}

function pw_check() {
var pw = document.getElementById("MEMBER_PASSWORD");

if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  document.info_form.submit();
}
</script>

</head>
<body>
<h3>비밀번호를 입력하시면 회원정보 수정페이지로 넘어갑니다.</h3>
<form method="post" name="info_form" action="/ELTRUT/pwCheck" >	
	<table border="1">
	
	<tr>
	<td><strong>비밀번호</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="20" label="이메일"></td>
	</tr>
	</table>
	
</form>
<input type="button" value="회원정보수정" onclick="pw_check()">
</body>
</html>