<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż��</title>
<script>

if('${message}' == "2"){
	alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
}
if('${message}' == "1"){
	alert('ȸ��Ż�� �Ǿ����ϴ�.')
	location.href="/ELTRUT/main";
}

function deleteform_check() {
	var pw = document.getElementById("pw");

	if (pw.value == "") {
	    alert("��й�ȣ���� �Է��ϼ���.");
	    pw.focus();
	    return false;
	  };
	  document.frm.submit();
	}

</script>
    

</head>
<body>

			<h3>�˷��帳�ϴ�</h3>
		
			<ul class="list">
				<li>��7��(ȸ�� Ż�� �� �ڰ� ��� ��) <br/>
						�� ȸ���� ��ELTRUT���� �������� Ż�� ��û�� �� ������ ��ELTRUT���� ��� ȸ��Ż�� ó���մϴ�.<br/>
						�� ȸ���� ���� �� ȣ�� ������ �ش��ϴ� ���, ��ELTRUT���� ȸ���ڰ��� ���� �� ������ų �� �ֽ��ϴ�.<br/>
						&nbsp;&nbsp;1. ���� ��û �ÿ� ���� ������ ����� ���<br/>
						&nbsp;&nbsp;2. ��ELTRUT���� �̿��Ͽ� ������ ��ȭ ���� ���, ��Ÿ ��ELTRUT���̿뿡 �����Ͽ� ȸ���� �δ��ϴ� ä���� ���Ͽ� �������� �ʴ� ���<br/>
						&nbsp;&nbsp;3. �ٸ� ����� ��ELTRUT�� �̿��� �����ϰų� �� ������ �����ϴ� �� ���ڻ�ŷ� ������ �����ϴ� ���<br/>
						&nbsp;&nbsp;4. ��ELTRUT���� �̿��Ͽ� ���� �Ǵ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ �ϴ� ���<br/>
						�� ��ELTRUT���� ȸ�� �ڰ��� ����?���� ��Ų ��, ������ ������ 2ȸ �̻� �ݺ��ǰų� 30�� �̳��� �� ������<br/>
 						&nbsp;&nbsp;�������� �ƴ��ϴ� ��� ��ELTRUT���� ȸ���ڰ��� ��ǽ�ų �� �ֽ��ϴ�.<br/>
						�� ��ELTRUT���� ȸ���ڰ��� ��ǽ�Ű�� ��쿡�� ȸ������� �����մϴ�. �� ��� ȸ������ �̸� �����ϰ�,<br/>
 						&nbsp;&nbsp;ȸ����� ���� ���� �ּ��� 30�� �̻��� �Ⱓ�� ���Ͽ� �Ҹ��� ��ȸ�� �ο��մϴ�.
				</li>
			</ul>
	<table border=1>
		<tr>
	<td><h4>���̵� =${sessionScope.MEMBER_ID}</h4></td>
		</tr>
		<tr>
	<td><h5>${sessionScope.MEMBER_NAME} 'ȸ����' ȸ��Ż�� �����Ͻ÷��� �Ʒ� ��й�ȣ�� �ְ� Ȯ���ع�ư�� �����ּ���</h5></td>
		</tr>
		</table>
		
<form method="post" id="frm"  name="frm" action="/ELTRUT/deleteMember">
<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">
		
<table>
 	<tr>
	<td><strong>��й�ȣ</strong></td>
	<td><input type="password"  name="pw" id="pw" size="28" type="text" required="required"> </td>
	</tr>
</table>


	<input type="button" value="Ȯ��" onclick="deleteform_check()">
	<input type="button" value="������������ ���ư���" onclick="location.href='myPage'"> 
	</form>
</body>
</html>