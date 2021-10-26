<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ page import= "b21.spring.adminOrder.AdminOrderDAO"%>
    <%@ page import= "b21.spring.adminOrder.AdminOrderService" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문목록</title>
</head>
<body>
 <br>
  <style>
 
      table {
        width: 100%;
      }
      table, th, td {
        border: 1px solid #bcbcbc;
      }
      td {
        text-align: center;
      }

    </style>
  </head>
  <body>
    <table>
      <caption><h1>주문상세보기</h1></caption>
      <thead>
        <tr>
          <th>주문 번호</th>
          <th>구매한 날짜</th>
          <th>상품명</th>
          <th>사이즈</th>
          <th>상품 색상</th>
          <th>주문 수량</th>
          <th>주문자명</th>
          <th>주문자 주소</th>
          <th>총 결제 금액</th>
          <th>결제 상태</th>
          <th>주문 상태</th>
          <th>배송 메세지</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
       <c:when test="${fn:length(orderDetail)>0 }">
 		 	<c:forEach var="list" items="${orderDetail }" varStatus="status">
		        <tr>
		          <th><a href="/ELTRUT/order/adminOrderUpdateForm?ORDER_NUMBER=${list.ORDER_NUMBER }"> ${list.ORDER_NUMBER}> </a></th>
		 		  <td>${list.ORDER_DATE}</td>
		          <td>${list.GOODS_NAME}</td>
		          <td>${list.GOODS_SIZE}</td>
		          <td>${list.GOODS_COLOR}</td>
		          <td>${list.ORDER_AMOUNT}</td>
		          <td>${list.BUYER_NAME}</td>
		          <td>${list.BUYER_ADDRESS1} ${list.BUYER_ADDRESS2} ${list.BUYER_ZIPCODE }</td>
		          <td>${list.ORDER_TOTAL_PRICE}</td>
		          <td>${list.ORDER_PAY_STATE}</td>
		          <td>${list.ORDER_STATE}</td>
		          <td>${list.DELIVERY_MESSAGE }</td>
		        </tr>
	        </c:forEach>
	    </c:when>
	   
	     <c:otherwise>
		 	조회된결과 없음
		 </c:otherwise>
	    </c:choose>
	  </table>
	</body>
  </html>