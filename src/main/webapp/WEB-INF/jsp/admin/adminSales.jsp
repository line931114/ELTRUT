<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출정산</title>


<style>
 
      
      td {
        text-align: center;
      }
      th {
        text-align: center;
      }

    </style>
</head>
<br>
<br>



<body>

	
    <script type="text/javascript">
    document.getElementById('order_date_start').valueAsDate = new Date();
    document.getElementById('order_date_end').valueAsDate = new Date();
    


    
    function check(){
    	var start = document.getElementById("order_date_start");
    	var end = document.getElementById("order_date_end");
    	if(start.valueAsDate==""){
    		return false;
    	}
    	if(end.valueAsDate==""){
    		return false;
    	}
    	
    	
    	
    }
    
    
    </script>
  
<body>
<form action="adminSales" method="post">
<input type="date" value="2021-10-26" min="1900-01-01" max="9999-12-31" name="order_date_start" id="order_date_start">
~
<input type="date" value="2021-10-26" min="1900-01-01" max="9999-12-31" name="order_date_end" id="order_date_end">
<span>
<input type="hidden" value="5" name="jung">
<input type="submit" value="검색" onsubmit="check();">
</span>
</form>
<form action="adminSales" method="post">
<input type="hidden" value="1" name="jung">
<input type="submit" value="1주일">
</form>
<form action="adminSales" method="post">
<input type="hidden" value="2" name="jung">
<input type="submit" value="1개월" onclick="">
</form>
<form action="adminSales" method="post">
<input type="hidden" value="3" name="jung">
<input type="submit" value="3개월" onclick="">
</form>
<form action="adminSales" method="post">
<input type="hidden" value="4" name="jung">
<input type="submit" value="전체" onclick="">
</form>



ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
<table class="table table-striped">
<tr>
<th>매출액</th>
<th>총 정산금액 쿼리문</th>
<th>매출 원가</th>
</tr>
<tr>
<td>${totalsales}</td>
</table>
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 <table class="table table-striped">
      <caption><h1>매출정산</h1></caption>
      <thead>
        <tr>
          <th>날짜</th>
          <th>순번</th>
          <th>매출액</th>
          <th>매출원가</th>
          <th>매출 총 이익</th>
          <th>관리</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
 		<c:when test="${fn:length(List)>0 }">
 		 	<c:forEach var="list" items="${List}" varStatus="status">
		         <tr>
		 		  <td>${list.ORDER_DATE}</td>
		          <td>${list.ORDER_TOTAL_PRICE}</td>
		        </tr> 
	        </c:forEach>
	    </c:when>
	     <c:otherwise>
		 조회된결과 없음
		 </c:otherwise>
	   </c:choose>
      </tbody>
      </tbody>
      </table> 
</html>