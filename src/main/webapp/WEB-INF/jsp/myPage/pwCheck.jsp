<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ Ȯ��</title>

<script>

if('${message}' != ""){
	alert('${message}');
}

function pw_check() {
var pw = document.getElementById("MEMBER_PASSWORD");

if (pw.value == "") {
    alert("��й�ȣ�� �Է��ϼ���.");
    pw.focus();
    return false;
  };

  document.info_form.submit();
}
</script>

</head>
<body>
<h3>��й�ȣ�� �Է��Ͻø� ȸ������ ������������ �Ѿ�ϴ�.</h3>
<form method="post" name="info_form" action="/ELTRUT/pwCheck" >	
	<table border="1">
	
	<tr>
	<td><strong>��й�ȣ</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="20" label="�̸���"></td>
	</tr>
	</table>
	
</form>
<input type="button" value="ȸ����������" onclick="pw_check()">
</body>
</html>