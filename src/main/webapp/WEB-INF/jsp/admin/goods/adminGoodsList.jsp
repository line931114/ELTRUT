<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ���</title>
</head>
<body>
    <form method="post" name="frm" action="/ELTRUT/adminGoodsList">    
    <table border="1">
    <h3>��ǰ���</h3>
    
    <tr>
    <td><strong>��ǰ��ȣ</strong></td>
    <td><input type="text" name="" id="GOODS_NUMBER" value="" maxlength="20" label="��ǰ��ȣ"></td>
    </tr>
    
    <tr>
    <td><strong>��ǰ ����</strong></td>
    <td><input type="text" name="GOODS" id="MEMBER_NAME" value="" maxlength="20" label="��ǰ����"></td>
    </tr>
    
    <tr>
    <td><strong>ī�װ�</strong></td>
    <td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="ī�װ�"></td>
    </tr>
    
    <tr>
    <td><strong>��ǰ��</strong></td>
    <td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="��ǰ��"></td>
    </tr>
    
    <tr>
    <td><strong>����</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="����"></td>
    </tr>
    
    <tr>
    <td><strong>����</strong></td>
    <td><input type="text" name="MEMBER_ADDRESS1" id="MEMBER_ADDRESS1" value="" maxlength="20" label="����"></td>
    </tr>
    
    <tr>
    <td><strong>������</strong></td>
    <td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="������"></td>
    </tr>
    </table>
    
    <tr>
    <td><strong>����</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="����"></td>
    </tr>
    
    <tr>
    <td><strong>�Ǹŷ�</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="�Ǹŷ�"></td>
    </tr>
    
    <tr>
    <td><strong>�����</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="�����"></td>
    </tr>
    
    <input type="submit" value="����">
    </form>
</body>
</html>