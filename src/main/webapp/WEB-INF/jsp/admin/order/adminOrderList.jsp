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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
      
      

    </style>
  </head>
  <body>
    <table class="table table-striped">
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
		          <td><c:choose>
		          

					<c:when test="${list.ORDER_PAY_STATE eq '0'}">결제대기 </c:when>
					<c:when test="${list.ORDER_PAY_STATE eq '1'}">결제완료 </c:when>
					<c:when test="${list.ORDER_PAY_STATE eq '3'}">결제취소 </c:when>
					
					<c:otherwise> ... </c:otherwise>
					</c:choose>
					
					</td>
					
		          <td><c:choose>
		          

					<c:when test="${list.ORDER_STATE eq '0'}">배송대기 </c:when>
					<c:when test="${list.ORDER_STATE eq '1'}">배송중 </c:when>
					<c:when test="${list.ORDER_STATE eq '2'}">배송완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '3'}">교환완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '4'}">교환신청 </c:when>
					<c:when test="${list.ORDER_STATE eq '5'}">반품신청 </c:when>
					<c:when test="${list.ORDER_STATE eq '6'}">반품완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '7'}">주문취소 </c:when>

					<c:otherwise> ... </c:otherwise>

					</c:choose> </td>
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
                  <div id="dataTables-example_filter" class="dataTables_filter" style="width:600px;">
								<form action=""> 
									<div style="float: left; width: 20%">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">아이디</option>
										<option value="1">이름</option>
										<option value="2">휴대폰 번호</option>
										<option value="3">이메일</option>
									</select> 
									</div>
									<div style="float: left; width: 70%;">
									<input class="form-control" type="text" name="isSearch" id="isSearch" /> 
									</div>
									<span>
									<div style="float: left; width: 10%;">
										<button type="submit" class="btn btn-default">검색</button>
									</div>
									</span>
									
								</form>
							</div>
							
            </ul>
        </div>
</body>
</html>