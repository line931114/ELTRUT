<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품교환,환불 페이지</title>
<script>
 function cancel_Exchange() {
	var title = document.getElementById("CANCEL_TITLE");	
	var content = document.getElementById("CANCEL_CONTENT");
	
	if(title.value == ""){
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	if(content.value == ""){
		alert("취소사유를 입력해주세요");
		content.focus();
		return false;
	}
} 
/* 
function cancle_Exchange() {
	var form = document.order_Exchange;
	
	if(form.CANCLE_TITLE.value.length ==0){
		alert("제목을 입력하세요");
		form.CANCLE_TITLE.focus();
		return;
	}
} */

</script>
</head>
<body>
<h3>상품교환,환불 페이지</h3>
	<form method="post" name="cancel" action="/ELTRUT/cancel" onsubmit ="return cancel_Exchange()">
		<table border="1" height="100%">

			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>주문금액</th>
				<th>배송비</th>
				<th>수량</th>
			</tr>

			<tr>
				<strong>
					<td>${oc.GOODS_NUMBER }</td>
					<td>${oc.GOODS_NAME }</td>
					<td>${oc.ORDER_TOTAL_PRICE }</td>	
					<td>3000</td>
					<td>${oc.GOODS_NUMBER }</td>			
				</strong>
			</tr>			
</table>
=============================================
<br>
<table border="1">
	<tr>
	<th>사유선택</th>
	<td>
		<select name="CANCEL_CATEGORY" id="CANCEL_CATEGORY">
		<option id="CANCEL_CATEOGRY">교환</option>
		<option id="CANCEL_CATEOGRY">환불</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<th>제목</th>
	<td><textarea id="CANCEL_TITLE" name="CANCEL_TITLE" rows="1" cols="33"></textarea></td>
	</tr>
	
	
	<tr>
	<th>사유입력</th>
	<td><textarea id="CANCEL_CONTENT" name="CANCEL_CONTENT" rows="5" cols="33"></textarea></td>
	</tr>
	<tr>
	<th>환불예정금액</th>
	<td>${oc.ORDER_TOTAL_PRICE-3000 }</td>
	</tr>
	
</table>
 
<input type="hidden" name="ORDER_NUMBER" id="ORDER_NUMBER" value="${oc.ORDER_NUMBER }"> 

<input type="submit" value="글 작성하기" >
<input type="button" value="이전 페이지로 이동" onclick="location.href='/ELTRUT/orderInfo'">
</form>
</body>
</html>