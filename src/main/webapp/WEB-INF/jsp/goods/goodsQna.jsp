<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품QNA페이지</title>
<script>
if('${message}' != ""){
	alert('${message}');
}

function insertCheck(){
	var member = document.getElementById("MEMBER");
		if(member.value == ""){
			alert("qna작성을 위해선 로그인이 필수입니다.");
			return false;
		}else{
			location.href="/ELTRUT/goodsQnaInsert?GOODS_NUMBER="+${Q.GOODS_NUMBER }+"&MEMBER_ID="+member.value; 
		}
	}


function modify1(number,id){
	var member = document.getElementById("MEMBER");
	if(member.value == id.value){
		
	alert("수정 페이지로 이동하겠습니다.");
	location.href="/ELTRUT/goodsQnaModify?CS_NUMBER="+number.value+"&MEMBER_ID="+id.value; 
	}else{
		alert("해당 게시물의 작성자가 아니기때문에 수정,삭제가 불가능합니다.");
		return false;
	}
}

function delete1(number,id,goods){
	var member = document.getElementById("MEMBER");
	if(member.value == id.value){
	if(confirm("문의내용을 정말 삭제하시겠습니까?")){
		alert("문의 내용을 삭제하겠습니다.");
		location.href="/ELTRUT/goodsQnaDelete?CS_NUMBER="+number.value+"&MEMBER_ID="+id.value+"&GOODS_NUMBER="+goods.value;
	}else{
	}

	}else{
		alert("해당 게시물의 작성자가 아니기때문에 수정,삭제가 불가능합니다.");
		return false;
	}
}

</script>

</head>
<body>
<h2 align="center"> 상품QNA 페이지</h2> 

<form>
<h4 align="right">
<input type="button" value="QNA작성" onclick="insertCheck();">
<input type="hidden" id="MEMBER" name="MEMBER" value="${sessionScope.MEMBER_ID }">		
</h4>
<c:choose>
	<c:when test="${not empty goodsQna}">
		<c:forEach items="${goodsQna }" var="Q" varStatus="status">
=======================================================================================
	
	<table border="1">
	
	<tr>
	<td>문의번호</td>
	<td>${Q.CS_NUMBER }</td>
	</tr>
	
	<tr>
	<td>작성자</td>
	<td>${Q.MEMBER_ID }</td>
	</tr>
	<tr>
	<td>문의 제목</td>
	<td>${Q.CS_TITLE }</td>
	</tr>
	
	<tr>
	<td>문의 이미지</td>
	<td><img src="/ELTRUT/file/qnaFile/${Q.CS_IMAGE1}" width="100" height="100" alt=""  onerror="this.src='/ELTRUT/file/noimg.png'" /></td>
	</tr>
	
	<tr>
	<td>문의 내용</td>
	<td>${Q.CS_CONTENT }</td>
	</tr>

	<tr>
	<td>관리자 댓글</td>
	<td>${Q.CS_REPCONTENT }</td>
	</tr>	
</table>
		<input type="hidden" name="goodsNumber${status.index }" id="GOODS_NUMBER" value="${Q.GOODS_NUMBER }">
		<input type="hidden" name="csNumber${status.index }" id="CS_NUMBER" value="${Q.CS_NUMBER }">
		<input type="hidden" name="memberId${status.index }" id="MEMBER_ID" value="${Q.MEMBER_ID }">
				
		<input type="button" value="수정" onclick="modify1(csNumber${status.index},memberId${status.index });">				
		<input type="button" value="삭제" onclick="delete1(csNumber${status.index},memberId${status.index },goodsNumber${status.index });">
	
		</c:forEach>
	</c:when>
	<c:otherwise>
		<H3>"해당 상품의 QNA가 없습니다."</H3>	
	</c:otherwise>
</c:choose>

</form>
</body>
</html>