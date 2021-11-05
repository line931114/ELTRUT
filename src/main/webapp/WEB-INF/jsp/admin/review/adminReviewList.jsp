<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>


<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
</head>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">REVIEW</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
			REVIEW 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <!-- <a href="/ELTRUT/adminReview/adminReviewInsertForm">리뷰추가</a> -->
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/ELTRUT/adminReviewList">
								<button type="button" class="btn btn-outline btn-default">전체</button>
							</a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--별점 순--</option>
								<option value ="adminReviewList?scoreNum=1">★</option>
								<option value ="adminReviewList?scoreNum=2">★★</option>
								<option value ="adminReviewList?scoreNum=3">★★★</option>
								<option value ="adminReviewList?scoreNum=4">★★★★</option>
								<option value ="adminReviewList?cscoreNum=5">★★★★★</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--답변상태--</option>
								<option value ="adminReviewList?repState=1">미답변</option>
								<option value ="adminReviewList?repState=2">답변완료</option>
								</select>
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 리뷰수 : ${totalCount}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped" id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">리뷰번호</th>
										<th style="width: 11%; text-align:center;">별점</th>
										<th style="width: 8%; text-align:center;">아이디</th>
										<th style="width: 35%; text-align:center;">리뷰제목</th>
										<th style="width: 10%; text-align:center;">작성날짜</th>
										<th style="width: 10%; text-align:center;">답변상태</th>
										<th style="width: 10%; text-align:center;">답변날짜</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="adminReviewList"  items="${adminReviewList}" varStatus="stat">
									<c:url var="viewURL" value="adminReviewDetail" >
										<c:param name="REVIEW_NUMBER" value="${adminReviewList.REVIEW_NUMBER }" />
									</c:url>								
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${adminReviewList.REVIEW_NUMBER}</td>
										<td style="text-align:center;vertical-align:middle;">${adminReviewList.REVIEW_SCORE}</td>
										<td style="text-align:center;vertical-align:middle;">${adminReviewList.MEMBER_ID}</td>
										<td style="text-align:center;vertical-align:middle;">${adminReviewList.REVIEW_TITLE}</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${adminReviewList.REVIEW_REGDATE}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">${adminReviewList.REVIEW_REPSTATE }</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${adminReviewList.REVIEW_REPDATE}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">
											<a href="${viewURL}">
												<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">
											</a>&nbsp;&nbsp;
										
										
										<c:url var="URL2" value="/adminReview/ReplyDelete" >
											<c:param name="REVIEW_NUMBER" value="${adminReviewList.REVIEW_NUMBER}" />
										</c:url>
										<a href="${URL2}">
											<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">
										</a> 
										
										
										</td>									
									</tr>
								</c:forEach>
								<!-- 리뷰가 없을때 -->
								<c:if test="${fn:length(adminReviewList) le 0}">
									<tr><td colspan="9" style="text-align:center;">등록된 리뷰가 없습니다.</td></tr>
								</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
					<div class="row">
						<div style="text-align:center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">아이디</option>
										<option value="1">제목</option>
									</select>
									<input class="form-control" type="text" name="isSearch" id="isSearch"/>
									<span>
									<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
							</div>							
						</div>
					</div>		
				</div>
			</div>
			<!-- /.table-responsive -->		
		</div>
	</div>
        <!-- /.panel -->   
</div>

