<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 



	
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
<div style="margin-bottom: 20px;">
<caption><h1> 매출 정산</h1></caption>
</div>


<form action="adminSales" method="post">
<input type="date" value="<c:out value="${sysYear}" />" min="1900-01-01" max="9999-12-31" name="order_date_start" id="order_date_start">
~
<input type="date" value="<c:out value="${sysYear}" />" min="1900-01-01" max="9999-12-31" name="order_date_end" id="order_date_end">
<span>
<input type="hidden" value="5" name="jung">
<input type="submit" value="검색" onsubmit="check();">
</span>
</form>
<div style="width:200px; margin-top: 5px; margin-bottom: 100px;">
<div style="width: 25%; float: left;">
<form action="adminSales" method="post">
<input type="hidden" value="1" name="jung">
<input type="submit" value="1주일">
</form>
</div>
<div style="width: 25%; float: left;">
<form action="adminSales" method="post">
<input type="hidden" value="2" name="jung">
<input type="submit" value="1개월" onclick="">
</form>
</div>
<div style="width: 25%; float: left;">
<form action="adminSales" method="post">
<input type="hidden" value="3" name="jung">
<input type="submit" value="3개월" onclick="">
</form>
</div>
<div style="width: 25%; float: left;">
<form action="adminSales" method="post">
<input type="hidden" value="4" name="jung">
<input type="submit" value="전체" onclick="">
</form>
</div>
</div>




<table class="table table-striped">
<tr>
<th>매출액</th>
</tr>
<tr>
<td>${totalsales}</td>
</table>

 <table class="table table-striped">
      
      <thead>
        <tr>
          <th>날짜</th>
          <th>매출액</th>
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
		
		 </c:otherwise>
	   </c:choose>
      </tbody>
      </tbody>
      </table> 
</html>