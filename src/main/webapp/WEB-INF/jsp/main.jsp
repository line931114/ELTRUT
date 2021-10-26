<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<script>
if('${message}' != ""){
	alert('${message}');
}
</script>
</head>
<body>
<center><h1>ELTRUT</h1></center>
<%-- <div align="right">
<c:if test="${empty sessionScope.MEMBER_ID }"> <!-- sessionScopre.id가 없으면 -->
	<a href="/ELTRUT/loginForm">로그인</a><br/>
</c:if>
<c:if test="${not empty sessionScope.MEMBER_ID }"> <!-- sessionScopre.id가 있으면 -->
	${sessionScope.MEMBER_NAME } 님 <br/>
	<a href="/ELTRUT/logout">로그아웃</a><br/>
</c:if>
</div> --%>
<table align="center" border="1">
<tr>
			<th>상품번호</th>
			<th>ThumbNail</th>
			<th>상품이름</th>
			<th>Category1</th>
			<th>Category2</th>
			<th>가격</th>
			<th>판매량</th>
			<th>사이즈</th>
			<th>컬러</th>
			<th>등록날짜</th>
		</tr>
<%-- <c:set var="goods" value="#{goods }"/> --%>
<c:choose>
			<c:when test="${fn:length(goods) > 0}">
				<c:forEach items="${goods }" var="G">
					<tr>
						<td>${G.GOODS_NUMBER }</td>
						<td><img src="/ELTRUT/file/goodsFile/${G.GOODS_THUMBNAIL}" width="60" height="60" alt=""  onerror="this.src='/ELTRUT/file/noimg_130.gif'" /></td>
						<td>
							<a href="#this" id="GoodsName" name="GoodsName">${G.GOODS_NAME }</a>
							<input type="hidden" id="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
						</td>
						<td>${G.GOODS_CATEGORY1 }</td>
						<td>${G.GOODS_CATEGORY2 }</td>
						<td>${G.GOODS_PRICE }</td>
						<td>${G.GOODS_SELLCOUNT }</td>
						<td>${G.GOODS_SIZE }</td>
						<td>${G.GOODS_COLOR }</td>
						<td>${G.GOODS_DATE }</td>

					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
</table>
		<script type="text/javascript">
		function ComSubmit(){
		this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key,value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"'>"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
		
		$(document).ready(function(){
			$("a[name='GoodsName']").on("click",function(e){
				e.preventDefault();
				fn_openGoodsDetail($(this));
		});
			function fn_openGoodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/GoodsDetail'/>");
			comSubmit.addParam("GOODS_NUMBER",obj.parent().find("#GOODS_NUMBER").val());
			comSubmit.submit();
		}
		</script>
</body>
</html>