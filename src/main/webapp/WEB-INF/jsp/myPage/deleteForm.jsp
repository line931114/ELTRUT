<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴</title>
<script>

if('${message}' == "2"){
	alert('비밀번호가 일치하지 않습니다.');
}
if('${message}' == "1"){
	alert('회원탈퇴 되었습니다.')
	location.href="/ELTRUT/main";
}

function deleteform_check() {
	var pw = document.getElementById("pw");

	if (pw.value == "") {
	    alert("비밀번호를을 입력하세요.");
	    pw.focus();
	    return false;
	  };
	  document.frm.submit();
	}

</script>
    

</head>
<body>

			<h3>알려드립니다</h3>
		
			<ul class="list">
				<li>제7조(회원 탈퇴 및 자격 상실 등) <br/>
						① 회원은 “ELTRUT”에 언제든지 탈퇴를 요청할 수 있으며 “ELTRUT”은 즉시 회원탈퇴를 처리합니다.<br/>
						② 회원이 다음 각 호의 사유에 해당하는 경우, “ELTRUT”은 회원자격을 제한 및 정지시킬 수 있습니다.<br/>
						&nbsp;&nbsp;1. 가입 신청 시에 허위 내용을 등록한 경우<br/>
						&nbsp;&nbsp;2. “ELTRUT”을 이용하여 구입한 재화 등의 대금, 기타 “ELTRUT”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br/>
						&nbsp;&nbsp;3. 다른 사람의 “ELTRUT” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br/>
						&nbsp;&nbsp;4. “ELTRUT”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br/>
						③ “ELTRUT”이 회원 자격을 제한?정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가<br/>
 						&nbsp;&nbsp;시정되지 아니하는 경우 “ELTRUT”은 회원자격을 상실시킬 수 있습니다.<br/>
						④ “ELTRUT”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고,<br/>
 						&nbsp;&nbsp;회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
				</li>
			</ul>
	<table border=1>
		<tr>
	<td><h4>아이디 =${sessionScope.MEMBER_ID}</h4></td>
		</tr>
		<tr>
	<td><h5>${sessionScope.MEMBER_NAME} '회원님' 회원탈퇴를 진행하시려면 아래 비밀번호를 넣고 확인해버튼을 눌러주세요</h5></td>
		</tr>
		</table>
		
<form method="post" id="frm"  name="frm" action="/ELTRUT/deleteMember">
<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">
		
<table>
 	<tr>
	<td><strong>비밀번호</strong></td>
	<td><input type="password"  name="pw" id="pw" size="28" type="text" required="required"> </td>
	</tr>
</table>


	<input type="button" value="확인" onclick="deleteform_check()">
	<input type="button" value="마이페이지로 돌아가기" onclick="location.href='myPage'"> 
	</form>
</body>
</html>