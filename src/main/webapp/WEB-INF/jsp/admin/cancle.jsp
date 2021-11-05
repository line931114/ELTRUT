<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cancle 목록 조회</title>


<script>
function chageLangSelect(id){
	
	 document.getElementById("cancle_ordernumber").value = id;
	 
	 var s = document.getElementById(id);
	 var solar_birth_yn = s.options[s.selectedIndex].value;
	 document.getElementById("cancle_cat").value = solar_birth_yn;
	

	
	document.frm.submit();
}

</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<br>
<br>
<style>
 
      
      td {
        text-align: center;
      }
      th {
        text-align: center;
      }

    </style>
<body>
<form action="admin" method="post" name="frm" id="frm">
<table class="table table-striped">
      <caption><h1>cancel 전체 목록</h1></caption>
      <thead>
        <tr>
          <th>주문번호</th>
          <th>글번호</th>
          <th>상품명</th>
          <th>등록날짜</th>
          <th>제목</th>
          <th>내용</th>
          <th>카테고리</th>
          <th>현재 상태</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
 		<c:when test="${fn:length(List)>0 }">
 		 	<c:forEach var="list" items="${List}" varStatus="status">
		        <tr>
		 		  <td>${list.ORDER_NUMBER}</td>
		          <td>${list.CANCEL_NUMBER}</td>
		          <td>${list.GOODS_NAME}</td>
		          <td>${list.CANCEL_REGDATE}</td>
		          <td>${list.CANCEL_TITLE}</td>
		          <td>${list.CANCEL_CONTENT}</td>
		          <td>${list.CANCEL_CATEGORY}</td>
		           <td>
		          <c:choose>

					<c:when test="${list.ORDER_STATE eq '0'}">배송대기 </c:when>
					<c:when test="${list.ORDER_STATE eq '1'}">배송중 </c:when>
					<c:when test="${list.ORDER_STATE eq '2'}">배송완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '3'}">교환완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '4'}">교환신청 </c:when>
					<c:when test="${list.ORDER_STATE eq '5'}">반품신청 </c:when>
					<c:when test="${list.ORDER_STATE eq '6'}">반품완료 </c:when>
					<c:when test="${list.ORDER_STATE eq '7'}">주문취소 </c:when>

					<c:otherwise> ... </c:otherwise>

					</c:choose> 
		          
		          </td> 
		         
		          <td><select  name="category" id="${list.ORDER_NUMBER}" onchange="chageLangSelect(this.id)" class="selectpicker">
		         						<option value="none" disabled selected>선택</option>
										<option value="4">교환신청</option>
										<option value="5">반품신청</option>
									</select> 
									
				
				  </td>
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
<input type="hidden" name="cancle_ordernumber" id="cancle_ordernumber">
<input type="hidden" name="cancle_cat" id="cancle_cat">

</form>
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