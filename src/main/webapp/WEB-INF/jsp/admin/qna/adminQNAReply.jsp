<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>

<!-- 메뉴 시작 -->

<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">Q&A등록</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">Q&A등록 페이지입니다.</div>
		<form:form>
					<label>QNA 글번호</label> 
					<input type="text" class="form-control" value="${AdminQnaDetail.CS_NUMBER}" style="width: initial;" readonly />
				</div>
				
				<div class="form-group">
					<label>제목</label> 
					<input type="text" class="form-control" id="CS_TITLE" name="CS_TITLE" value="${AdminQnaDetail.CS_TITLE}" style="width: initial;" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" id="CS_CONTENT" name="CS_CONTENT" rows="10" cols="30" readonly>${AdminQnaDetail.CS_CONTENT}</textarea>
				</div>

				
				
				<a href="/admin/qna/adminQNAList">
					<button type="button" class="btn btn-outline btn-default">목록으로</button>
				</a>
			</form:form>
		</div>
	</div>
</div>
