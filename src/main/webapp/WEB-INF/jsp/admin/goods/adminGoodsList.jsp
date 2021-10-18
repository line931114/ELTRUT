<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 목록</title>
</head>
<body>
    <form method="post" name="frm" action="/ELTRUT/adminGoodsList">    
    <table border="1">
    <h3>상품목록</h3>
    
    <tr>
    <td><strong>상품번호</strong></td>
    <td><input type="text" name="" id="GOODS_NUMBER" value="" maxlength="20" label="상품번호"></td>
    </tr>
    
    <tr>
    <td><strong>상품 사진</strong></td>
    <td><input type="text" name="GOODS" id="MEMBER_NAME" value="" maxlength="20" label="상품사진"></td>
    </tr>
    
    <tr>
    <td><strong>카테고리</strong></td>
    <td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="카테고리"></td>
    </tr>
    
    <tr>
    <td><strong>상품명</strong></td>
    <td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="상품명"></td>
    </tr>
    
    <tr>
    <td><strong>가격</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="가격"></td>
    </tr>
    
    <tr>
    <td><strong>색상</strong></td>
    <td><input type="text" name="MEMBER_ADDRESS1" id="MEMBER_ADDRESS1" value="" maxlength="20" label="색상"></td>
    </tr>
    
    <tr>
    <td><strong>사이즈</strong></td>
    <td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="사이즈"></td>
    </tr>
    </table>
    
    <tr>
    <td><strong>수량</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="수량"></td>
    </tr>
    
    <tr>
    <td><strong>판매량</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="판매량"></td>
    </tr>
    
    <tr>
    <td><strong>등록일</strong></td>
    <td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="등록일"></td>
    </tr>
    
    <input type="submit" value="전송">
    </form>
</body>
</html>