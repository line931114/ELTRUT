<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ page import= "b21.spring.adminOrder.AdminOrderDAO"%>
    <%@ page import= "b21.spring.adminOrder.AdminOrderService" %>
<!DOCTYPE html>
<html>
<head>

  </head>
  <body>
  	<form action="/ELTRUT/order/adminOrderUpdate" method="post">
     <h1>수정</h1>
      
		주문번호:<input type="text" name="ORDER_NUMBER" value="${order.ORDER_NUMBER}"><br/>
		주문자명:<input type="text" name="buyer" value="${order.BUYER_NAME}"><br/>
		회원아이디:<input type="text" name="memid" value="${order.MEMBER_ID}"><br/>
		결제상태:
		<select name="ORDER_STATE">
			<option value="0">결제대기</option>
			<option value="1">결제완료</option>
			<option value="2">결제취소</option>
			</select>
		주문상태:
		<select name="ORDER_PAY_STATE">
			<option value="0">배송대기</option>
			<option value="1">배송중</option>
			<option value="2">배송완료</option>
			<option value="3">교환완료</option>
			<option value="4">교환신청</option>
			<option value="5">반품신청</option>
			<option value="6">반품완료</option>
			<option value="7">주문취소</option>
		</select>
			<input type="submit" value="수정완료">
	</form>
</body>
</html>
