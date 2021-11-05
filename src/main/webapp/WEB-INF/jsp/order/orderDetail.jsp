<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
function orderPay(){
	window.open("/ELTRUT/orderPay","","width=400, height=600, scrollbars = yes");
}
</script>
<meta charset="UTF-8">
<title>주문결제</title>
</head>
<body>
<center><h1>주문</h1></center>
<div style="float:left; width:30%">
<c:choose>
	<c:when test="${fn:length(goods) > 0}">
		<c:forEach  items="${goods }" var="G" varStatus="idx">
		
<form action="/ELTRUT/orderEnd">
	<table class="table table-borderless">
		<tr>
		<th>주문상품</th>
			<td>${G.GOODS_NAME } 
			<input type="hidden" name="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			<input type="hidden" name="CART_NUMBER" value="${CART_NUMBER }">
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
	
	</c:forEach>
	</c:when>
		<c:otherwise>
		주문상품이 없습니다.
		</c:otherwise>
</c:choose>
</div>
<div style="float:left;width:20%; ">
<button type="button" class="btn btn-link"></button>
 </div>
	<div style="float:left; width:50%; ">
<c:choose>
	<c:when test="${fn:length(orderMember) > 0}">
		<c:set var="OM" value="${orderMember }"/>
		<table class="table table-borderless">
		<tr><input type="hidden" name="CHECK" value="${CHECK }"  >
		<th>이름</th>
			<td><input type="text" id="RECEIVER_NAME" name="RECEIVER_NAME" value="${RECEIVER_NAME }" readonly>
			</td>
			
		</tr>
		<tr>
		<th>연락처</th>
			<td><input type="text" id="RECEIVER_PHONE" name="RECEIVER_PHONE" value="${RECEIVER_PHONE }" readonly>
			</td>
		</tr>
		<th>배송주소</th>
		</tr>
		<tr>
		<th>우편번호</th>
				<td><input type="text" id="RECEIVER_ZIPCODE"  name="RECEIVER_ZIPCODE" readonly  value="${ RECEIVER_ZIPCODE}" maxlength="6" required="">
				</td>
		</tr>
		<tr>
			<th>상세주소</th>	
				<td><input type="text" id="RECEIVER_ADDRESS1"  name="RECEIVER_ADDRESS1"  readonly value="${RECEIVER_ADDRESS1 }" size="48" readonly></td>
				<td><input type="text" id="RECEIVER_ADDRESS2"  name="RECEIVER_ADDRESS2" value="${RECEIVER_ADDRESS2 }" label="주소"  readonly></td>
		</tr>
		<tr>
		<th>배송 요청사항</th>
			<td><input type="text" name="DELIVERY_MESSAGE" cols="50" rows="10" value="${DELIVERY_MESSAGE }">
			</td>
		</tr>
		<tr>
		</table>
		</c:when>
		</c:choose>
</div>
	<div style="float:right; margin-right:20px;">
		<img src="/ELTRUT/file/kakaopay.png" onclick="orderPay(); this.onclick=null;">
		<input type="submit" value="결제완료" style="margin-left:20px;" class="btn btn-dark">
	</div>
</form>

<c:forEach  items="${goods }" var="G" varStatus="idx">
<div style="margin-top:600px">
<button type="button" class="btn btn-link"></button>
</div>
</c:forEach>
		
</body>
</html>