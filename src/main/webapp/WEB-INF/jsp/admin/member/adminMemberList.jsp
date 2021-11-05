<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import= "b21.spring.adminMember.AdminMemberDAO" %>
<%@ page import= "b21.spring.adminMember.AdminMemberService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ�� ��� ��ȸ</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<br>
<br>
<style>
 
      table {
        width: 100%;
      }
     
      }
      td {
        text-align: center;
      }

    </style>
<body>
<table class="table table-striped">

      <caption><h1>ȸ�� ��ü ���</h1></caption>
      <thead>
        <tr>
          <th>ȸ�� ��ȣ</th>
          <th>ȸ�� �̸�</th>
          <th>ȸ�� ���̵�</th>
          <th>�̸���</th>
          <th>�޴��� ��ȣ</th>
          <th>ȸ�� �ּ�</th>
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
		 ��ȸ�Ȱ�� ����
		 </c:otherwise>
	   </c:choose>
      </tbody>
</tbody>
</table>
<div class="paging">
         	<ul class="inline">
                  ${pagingHtml}
                  <div id="dataTables-example_filter" class="dataTables_filter" style="width:600px;">
								<form action=""> 
									<div style="float: left; width: 20%">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">���̵�</option>
										<option value="1">�̸�</option>
										<option value="2">�޴��� ��ȣ</option>
										<option value="3">�̸���</option>
									</select> 
									</div>
									<div style="float: left; width: 70%;">
									<input class="form-control" type="text" name="isSearch" id="isSearch" /> 
									</div>
									<span>
									<div style="float: left; width: 10%;">
										<button type="submit" class="btn btn-default">�˻�</button>
									</div>
									</span>
									
								</form>
							</div>					
            </ul>
        </div>
</body>
</html>