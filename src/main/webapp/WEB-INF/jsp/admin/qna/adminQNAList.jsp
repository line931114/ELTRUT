<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>qna</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>QNA 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<div class="row" style="margin-bottom:5px;">
	<div class="col-sm-6">
							<a href="/ELTRUT/qna/adminQNAList">
								<button type="button" class="btn btn-outline btn-default">전체</button>
							</a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--카테고리--</option>
								<option value ="/ELTRUT/qna/adminQnaList?categoryNum=1">상품문의</option>
								<option value ="/ELTRUT/qna/adminQnaList?categoryNum=2">배송문의</option>
								<option value ="/ELTRUT/qna/adminQnaList?categoryNum=3">입금문의</option>
								<option value ="/ELTRUT/qna/adminQnaList?categoryNum=4">교환&반품문의</option>
								<option value ="/ELTRUT/qna/adminQnaList?categoryNum=5">기타문의</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--답변상태--</option>
								<option value ="/ELTRUT/qna/adminQnaList?repState=1">답변대기</option>
								<option value ="/ELTRUT/qna/adminQnaList?repState=2">답변완료</option>
								<option value ="/ELTRUT/qna/adminQnaList?repState=3">문의종료</option>
							</select>
						</div>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.CS_NUMBER }</td>
							<td><a href="${path}/ELTRUT/adminQna/adminQnaDetail?CS_NUMBER=${row.CS_NUMBER}">${row.CS_TITLE}</a></td>
							<td>${row.MEMBER_ID }</td>
							<td>${row.CS_HITCOUNT }</td>
							<td>${row.CS_REGDATE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
	
	<%-- <%@ include file="/WEB-INF/include/include-body.jspf" %>
	 --%>
</body>
</html>