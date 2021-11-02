<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container-fluid" style="min-height: calc(100vh - 136px);">
<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
	<div class="panel panel-default">
	<div class="panel-heading" role="tab">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
		상품관리
	</a>
		</div>
			<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body">
				<a href ="adminGoodsList">상품 목록</a>
				</div>
				<div class="panel-body">
				<a href ="adminGoodsInsertForm">상품 추가</a>
				</div>
			</div>
		</div>
<!-- -->
<!-- 하나의 item입니다. -->
	<div class="panel panel-default">
	<div class="panel-heading" role="tab">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
	회원 관리
	</a>
	</div>
	<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body">
				<a href ="adminMemberList">회원 목록 </a>
				</div>
				<div class="panel-body">
				<a href ="adminMemberList1">탈퇴한 회원 목록 </a>
				</div>
	</div>
	</div>
	<div class="panel panel-default">
	<div class="panel-heading" role="tab">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false">
	매출 관리
	</a>
	</div>
	<div id="collapse3" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body">
				<a href ="adminSales">매출 정산</a>
				</div>
	</div>
	
	
	
	
	
	</div>
	<div class="panel panel-default">
	<div class="panel-heading" role="tab">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false">
		게시판 관리
	</a>
		</div>
			<div id="collapse5" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body">
				<a href ="adminReviewList">구매후기</a>
				</div>
				<div class="panel-body">
				<a href="adminQNAList">Q&A</a>
				</div>
			</div>
		</div>
		
	<div class="panel panel-default">
	<div class="panel-heading" role="tab">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="false">
		주문 관리
	</a>
		</div>
			<div id="collapse6" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body">
				<a href="orderList">주문 목록</a>
				</div>
				<div class="panel-body">
				<a href="index">취소 관리</a>
				</div>
			</div>
	
	<a href="logout">관리자 계정 로그 아웃</a>
	
	
	
	
	
	
	
	
	</div>
	</div>
	</body>
	</html>