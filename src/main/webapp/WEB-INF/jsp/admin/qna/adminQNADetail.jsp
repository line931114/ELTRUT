<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${qnaDetail.CS_NUMBER }</td>
				<th scope="row">조회수</th>
				<td>${qnaDetail.CS_HITCOUNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${qnaDetail.MEMBER_ID }</td>
				<th scope="row">작성시간</th>
				<td>${qnaDetail.CS_REGDATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${qnaDetail.CS_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${qnaDetail.CS_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="${path}/ELTRUT/adminQna/adminQnaList" class="btn" id="list">목록으로</a>
	<a href="${path}/ELTRUT/adminQna/adminQnaReply" class="btn" id="update">답변달기</a>
	
	
</body>
</html>