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
<title></title>
</head>
<body>
<br>
<br>
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
      <caption><h1>주문목록</h1></caption>
      <thead>
        <tr>
          <th>주문 번호
          <br>(클릭시 상세보기)</th>
          <th>회원 아이디</th>
          <th>상품명</th>
          <th>구매한 날짜</th>
          <th>결제상태</th>
          <th>주문상태</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
 		<c:when test="${fn:length(orderList)>0 }">
 		 	<c:forEach var="list" items="${orderList }" varStatus="status">
		        <tr>
		          <th><a href="adminOrderDetail?ORDER_NUMBER=${list.ORDER_NUMBER }"> ${list.ORDER_NUMBER} </a></th>
		 		  <td>${list.MEMBER_ID}</td>
		 		  <td>${list.GOODS_NAME}</td>
		          <td>${list.ORDER_DATE}</td>
		          <td>${list.ORDER_PAY_STATE}</td>
		          <td>${list.ORDER_STATE}</td>
		        </tr>
	        </c:forEach>
	    </c:when>
	     <c:otherwise>
		 조회된결과 없음
		 </c:otherwise>
	   </c:choose>
      </tbody>
      <tfoot>
      </tfoot>
    </table>
    	<div class="paging">
         	<ul class="inline">
                  ${pagingHtml}
                  <div id="dataTables-example_filter" class="dataTables_filter">
								<form action="/ELTRUT/order/orderList" method="get">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">주문번호</option>
										<option value="1">아이디</option>
										<option value="2">상품명</option>
										<option value="3">결제상태</option>
										<option value="4">주문상태</option>
									</select> 
									<input class="form-control" type="text" name="isSearch" id="isSearch" />
										 <span>
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
							</div>
            </ul>
        </div>
</body>
</html>