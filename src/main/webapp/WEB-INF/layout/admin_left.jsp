<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<ul>
	<li><a href ="main">쇼핑몰로 이동</a>
		</li>
    <li>상품관리
    	 <ul>
            <li><a href ="adminGoodsList">상품 목록</a></li>
            <li><a href ="adminGoodsInsertForm">상품 추가</a></li>
        </ul>   
     </li>
    <li>
        회원 관리
        <ul>
            <li><a href ="adminMemberList">회원 목록 </a></li>
            <li><a href ="adminMemberList1">탈퇴한 회원 목록 </a></li>
           
        </ul>   
    </li>
    <li>
       매출 관리
        <ul>
            <li><a href ="adminSales">매출 정산</a></li>
        </ul>   
    </li>
   <li>
       게시판 관리
        <ul>
            <li><a href ="adminReviewList">구매후기</a></li>
             <li><a href="adminQNAList">Q&A</a></li>
        </ul>   
    </li>    
    <li>
       주문 관리
        <ul>
            <li><a href="orderList">주문 목록</a></li>
        </ul>   
    </li> 
</ul>
</div>
<a href="logout">관리자 계정 로그 아웃</a>
</body>
</html>