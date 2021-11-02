<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body>
<center><h1>결제완료</h1></center>
<div style="float:left; margin-left:100px; margin-right:100px;">
<c:choose>
	<c:when test="${fn:length(goods) > 0}">
		<c:forEach  items="${goods }" var="G" varStatus="idx">
<form action="/ELTRUT/orderEnd">
	<table>
		<tr>
		<th>주문상품</th>
			<td>${G.GOODS_NAME } 
			<input type="hidden" name="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			</td>
		</tr>
		<tr>
		<th>상품 이미지</th>
			<td><img src="/ELTRUT/file/goodsFile/${G.GOODS_THUMBNAIL}"  width="200" height="200" alt="" onerror="this.src='/ELTRUT/file/noimg_130.gif'" />
			</td>
		</tr>
		<tr>
		<th>주문색상</th>
			<td>${G.GOODS_COLOR }
			</td>
		</tr>
		<tr>
		<th>주문사이즈</th>
			<td>${G.GOODS_SIZE }
			</td>
		</tr>
		<tr>
		<th>상품금액</th>
			<td>${G.GOODS_PRICE }
			</td>
		</tr>
		<tr>
		<th>주문수량</th>
			<td><input type="hidden" name="EA" value="${G.EA }">${G.EA }
			</td>
		</tr>
		<tr>
		<th>주문금액</th>
			<td><input type="hidden" name="goods_total" value="${G.TOTALPRICE }">${G.TOTALPRICE }
			</td>
		</tr>
			
	</table>
	</div>
	</c:forEach>
	</c:when>
		<c:otherwise>
		주문상품이 없습니다.
		</c:otherwise>
</c:choose>
	<div style="float:left;  margin-left:100px; margin-right:100px;">
		<c:set var="OM" value="${orderMember }"/>
		<table>
		<tr>
		<th>주문번호</th>
			<td>${ORDER_NUMBER }
			</td>
		</tr>
		<tr>
		<th>주문자</th>
			<td>${BUYER_NAME }
			</td>
		</tr>
		<tr>
		<th>주문자 연락처</th>
			<td>${BUYER_NUMBER }
			</td>
		</tr>
		<tr>
		<th>수령인</th>
			<td>${RECEIVER_NAME }
			</td>
		</tr>
		<tr>
		<th>수령자 연락처</th>
			<td>${RECEIVER_PHONE }
			</td>
		</tr>
		<th><h4>배송주소</h4></th>
		</tr>
		<tr>
		<th>우편번호</th>
				<td>${RECEIVER_ZIPCODE }
				</td>
		</tr>
		<tr>
			<th>상세주소</th>	
				<td>${RECEIVER_ADDRESS1 }</td>
				<td>${ RECEIVER_ADDRESS2}</td>
		</tr>
		<tr>
		<th>배송 요청사항</th>
			<td>${DELIVERY_MESSAGE }
			</td>
		</tr>
		<tr>
		</table>
</div>
		<input type="button" value="메인으로" onclick="location.href='/ELTRUT/main'">
</form>
		
</body>
</html>