<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import= "b21.spring.adminMember.AdminMemberDAO" %>
<%@ page import= "b21.spring.adminMember.AdminMemberService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
</head>
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
<body>
<table>
      <caption><h1>탈퇴회원 목록</h1></caption>
      <thead>
        <tr>
          <th>회원 번호</th>
          <th>회원 이름</th>
          <th>회원 아이디</th>
          <th>이메일</th>
          <th>휴대폰 번호</th>
          <th>회원 주소</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
 		<c:when test="${fn:length(memberList)>0 }">
 		 	<c:forEach var="list" items="${memberList }" varStatus="status">
		        <tr>
		 		  <td>${list.MEMBER_NUMBER}</td>
		          <td>${list.MEMBER_NAME}</td>
		          <td>${list.MEMBER_ID}</td>
		          <td>${list.MEMBER_EMAIL}</td>
		          <td>${list.MEMBER_PHONE}</td>
		          <td>${list.MEMBER_ADDRESS1} ${list.MEMBER_ADDRESS2}</td>
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
<div class="paging">
         	<ul class="inline">
                  ${pagingHtml}
                  <div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">아이디</option>
										<option value="1">이름</option>
										<option value="2">휴대폰 번호</option>
										<option value="3">이메일</option>
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