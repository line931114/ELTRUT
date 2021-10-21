<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>

    <style>
    div {
        width: 100%;
        height: 200px;

    }
    div.left {
        width: 50%;
        float: left;

    }
    div.right {
        width: 50%;
        float: right;

    }
    div.top{
    	width="50%"
    	text-align:center;
    }
    </style>

</head>
<body>
<div class="top">
<h2>마이페이지- 구매내역 확인</h2>
</div>

<c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O">
		=====================================================================================
			
			<div class="left">
		<img src="file/${O.GOODS_THUMBNAIL }" width="200" height="200">
			</div>
			<div class="right">
				<table border="1">
				<tr>
				<td><h3><strong>배송상태</strong></h3></td>
				</tr>
				
				<tr>
				<td>주문번호 : ${O.ORDER_NUMBER }</td>
				</tr>
				
				<tr>
				<td>주문상태 : ${O.ORDER_STATE}</td>
				</tr>
				
				<tr>
				<td>주문날짜 : ${O.ORDER_DATE }</td>
				</tr>
				
				<tr>
				<td>주문 총 가격 : ${O.ORDER_TOTAL_PRICE}</td>
				</tr>
				
				
				</table>
				<!--제품 상세보기를 누르면, 해당상품의 상품detail로 넘어가도록 맵핑하는 방법을 시도하면좋을듯. 상품번호로 매칭을 시켜서??  -->
				<input type="button" value="제품상세보기">
</div>	
		</c:forEach>
		</c:when>
		<c:otherwise>
		"구매한 상품이 없습니다."
		</c:otherwise>
</c:choose>

</body>
</html>