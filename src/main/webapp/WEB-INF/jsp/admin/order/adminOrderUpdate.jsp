<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>adminOrderUpdate</title>
</head>

<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">주문 / 결제상태 수정페이지</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">주문 / 결제상태 수정페이지입니다.</div>
		<div class="panel-body">
		<form action="/ELTRUT/adminOrderUpdate" method="post">
			<form:form id="frm" name="frm" action="frm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>주문번호</label> 
					<input type="text" class="form-control" name="ORDER_NUMBER" value="${order.ORDER_NUMBER}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>주문자명</label> 
					<input type="text" class="form-control" name="buyer" value="${order.BUYER_NAME}" style="width: initial;" readonly />
				</div>
				<div class="form-group">
					<label>회원 ID</label> 
					<input type="text" class="form-control" name="memid" value="${order.MEMBER_ID}" style="width: initial;" readonly />
				</div>
				<div class="form-group">
					<label>결제상태</label> 
					<select class="form-control" name="ORDER_PAY_STATE"  style="width: 30%;">
						<option value="0">결제대기</option>
						<option value="1">결제완료</option>
						<option value="2">결제취소</option>
					</select>
				</div>
				<div class="form-group">
					<label>주문상태</label> 
					<select class="form-control" name="ORDER_STATE"  style="width: 30%;">
						<option value="0">배송대기</option>
						<option value="1">배송중</option>
						<option value="2">배송완료</option>
						<option value="3">교환완료</option>
						<option value="4">교환신청</option>
						<option value="5">반품신청</option>
						<option value="6">반품완료</option>
						<option value="7">주문취소</option>
					</select>
				</div>
					<button type="submit" class="btn btn-success" >수정완료</button>
			</form:form>
			</form>
		</div>
	</div>
</div>
