<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
</head>
<body>


<%-- 
        <h3><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/h3_find_id.gif" alt="���̵� ã��" /></h3>
        <p class="desc">���� ���̵� ã�Ⱑ �Ϸ� �Ǿ����ϴ�.</p>
        <div class="memberInfo">
            <p class="info">���� ���θ��� �̿����ּż� �����մϴ�.<br />���������� ���Ե� ���̵� �� <span>{$idCnt}</span>�� �ֽ��ϴ�.</p>
            <p class="thumb"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif" alt="" /></p>
            <ul>
                <li>������ ID�� <strong>${findId.MEMBER_ID }</strong> �Դϴ�</li>
                <li><strong>${findId.MEMBER_NAME}</strong> ���� ��ſ� ���� �ϼ���!</li>
            </ul>
        </div>
        <p class="copy">
            ������ ���̵� ã�Ⱑ ���������� �̷�������ϴ�. �׻� ������ <br />
            ��̰� ���� ������ ���� �ּ��� ����� ���ϴ� ���θ��� �ǵ��� �ϰڽ��ϴ�.
        </p>
        <p class="button">
            <a href="javascript:go_findlogin('{$id}');"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="�α���" /></a>
            <a href="javascript:go_findpwd('{$id}','{$mtype}');"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif" alt="��й�ȣ ã��" /></a>
        </p>
 --%>




<div id="memberInfo">
<div id="findIdPwd_result" style="
    text-align: center;
">
<br>
<br>

                <h4 class="desc">���̵� ã�� ���</h4>
                    <br>
                                  <div id="find_Success">
                            <dl>
                                <dt>������ ���̵�� <strong>${findId.MEMBER_ID }</strong> �Դϴ�</dt>
                                <dd><strong>${findId.MEMBER_NAME }</strong> ���� ��ſ� ���� �ϼ���!</dd>
                            </dl>
                        </div>
        <p class="button">
                        <br>
                                        <div class="btn-area">
                        <a href="/ELTRUT/loginForm"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="�α���" /></a>
         			   <a href="/ELTRUT/findForm2"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif" alt="��й�ȣ ã��" /></a>
                 </div>
                </div>
                
                
                


</html>