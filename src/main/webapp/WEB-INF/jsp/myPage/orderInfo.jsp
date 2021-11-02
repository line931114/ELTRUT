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



<script>
function orderCancle(number,state){

	var os = document.getElementById("ORDER_STATE");
	var on = document.getElementById("ORDER_NUMBER").value;
	
	if (state.value =="0"){
		if(confirm("상품을 정말 취소하시겠습니까?")){
			alert("구매하신 상품을 취소처리하겠습니다.");
			location.href="/ELTRUT/orderCancle?ORDER_NUMBER="+number.value+"&ORDER_STATE="+state.value; 
		}else{
		}
		
	}else{
		alert("배송중,배송완료 상품을 주문취소가 불가능합니다.")
	}

}

function orderExchange(number,state){
	var os = document.getElementById("ORDER_STATE");
	var on = document.getElementById("ORDER_NUMBER").value; 
	
	if (state.value =="2"){
		alert("환불,교환 페이지로 이동하겠습니다.");
		location.href="/ELTRUT/orderExchange?ORDER_NUMBER="+number.value+"&ORDER_STATE="+state.value; 
	}else{
		alert("배송이 완료되지 않은 상품은 환불,교환이 불가능합니다.")
	}
}

function orderDetail(number){
	var gn = document.getElementById("GOODS_NUMBER");
	location.href="/ELTRUT/goodsDetail?GOODS_NUMBER="+number.value;
}

</script>
</head>


<body>
<div class="top">
<h2>마이페이지- 구매내역 확인</h2>
</div>
<form method="post" name="order_Exchange" action="/ELTRUT/orderExchange">
<c:choose>
	<c:when test="${not empty O}">
		<c:forEach items="${O }" var="O" varStatus="status">
		=====================================================================================
			
			<div class="left">
		<img src="/ELTRUT/file/goodsFile/${O.GOODS_THUMBNAIL}" width="200" height="200" alt=""  onerror="this.src='/ELTRUT/file/noimg_130.gif'" />
					
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
				<td>
					<c:choose>
						<c:when test="${O.ORDER_STATE==0 }">
						주문상태 : 배송대기
						</c:when>
						
						<c:when test="${O.ORDER_STATE==1 }">
						주문상태 : 배송중
						</c:when>
					
						<c:when test="${O.ORDER_STATE==2 }">
						주문상태 : 배송완료
						</c:when>
					
						<c:when test="${O.ORDER_STATE==3 }">
						주문상태 : 교환신청
						</c:when>
					
						<c:when test="${O.ORDER_STATE==4 }">
						주문상태 : 교환완료
						</c:when>
						
						<c:when test="${O.ORDER_STATE==5 }">
						주문상태 : 반품신청
						</c:when>
						
						<c:when test="${O.ORDER_STATE==6 }">
						주문상태 : 반품완료
						</c:when>
						
						<c:when test="${O.ORDER_STATE==7 }">
						주문상태 : 주문취소
						</c:when>
					</c:choose>	
				</td>
			</tr>
				
				<tr>
				<td>주문날짜 : ${O.ORDER_DATE }</td>
				</tr>
				
				<tr>
				<td>주문 총 가격 : ${O.ORDER_TOTAL_PRICE}</td>
				</tr>
				
				
				</table>
				<input type="hidden" name=currentState${status.index} id="ORDER_STATE" value="${O.ORDER_STATE }">
				
				<input type="hidden" name="GOOD_THUMBNAIL" id="GOOD_THUMBNAIL" value="${O.GOOD_THUMBNAIL }">
				
				<input type="hidden" name=currentNumber${status.index } id="ORDER_NUMBER" value="${O.ORDER_NUMBER }">
				
				<input type="hidden" name="ORDER_TOTAL_PRICE" id="ORDER_TOTAL_PRICE" value="${O.ORDER_TOTAL_PRICE }">
				
				<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${O.MEMBER_ID }">
				
				<input type="hidden" name="goodsNumber${status.index }" id="GOODS_NUMBER" value="${O.GOODS_NUMBER }">
				
				<!--제품 상세보기를 누르면, 해당상품의 상품detail로 넘어가도록 맵핑하는 방법을 시도하면좋을듯. 상품번호로 매칭을 시켜서??  -->
				<input type="button" value="제품상세보기" onclick="orderDetail(goodsNumber${status.index });">
				<input type="button" value="주문취소" onclick="orderCancle(currentNumber${status.index },currentState${status.index});">				
				<input type="button" value="반품,교환" onclick="orderExchange(currentNumber${status.index },currentState${status.index});">
				
</div>	
		</c:forEach>
		</c:when>
		<c:otherwise>
		"구매한 상품이 없습니다."
		</c:otherwise>
</c:choose>
</form>
</body>
</html>