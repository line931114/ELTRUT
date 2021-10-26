<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<script language="Javascript">

function GOODS_CATEGORY1Change() {
 var x = document.frm.GOODS_CATEGORY1.options.selectedIndex;
 var groups=document.frm.GOODS_CATEGORY1.options.length;
 var group=new Array(groups);
 for (i=0; i<groups; i++)
  group[i]=new Array();
 
 group[0][0]=new Option("대분류를 먼저 선택하세요","");
 group[1][0]=new Option("OUTER 소분류 선택","");
 group[1][1]=new Option("COAT","COAT");
 group[1][2]=new Option("PUFF","PUFF");
 group[1][3]=new Option("JACKET","JACKET");
 group[1][4]=new Option("BLAZER","BLAZER");
 group[2][0]=new Option("TOP 소분류 선택","");
 group[2][1]=new Option("SHIRTS","SHIRTS");
 group[2][2]=new Option("BLOUSE","BLOUSE");
 group[3][0]=new Option("T-SHIRTS 소분류 선택","");
 group[3][1]=new Option("LONG SLEEVE","LONG SLEEVE");
 group[3][2]=new Option("HALF SLEEVE","HALF SLEEVE");
 group[3][3]=new Option("TOP","TOP");
 group[4][0]=new Option("KNIT 소분류 선택","");
 group[4][1]=new Option("TOP","TOP");
 group[4][2]=new Option("BOTTOM","BOTTOM");
 group[4][3]=new Option("DRESS","DRESS");
 group[5][0]=new Option("DRESS 소분류 선택","");
 group[5][1]=new Option("MINI","MINI");
 group[5][2]=new Option("MIDI","MIDI");
 group[5][3]=new Option("LONG","LONG");
 group[6][0]=new Option("PANTS 소분류 선택","");
 group[6][1]=new Option("SHORTS","SHORTS");
 group[6][2]=new Option("JEAN","JEAN");
 group[6][3]=new Option("PANTS","PANTS");
 group[7][0]=new Option("SKIRT 소분류 선택","");
 group[7][1]=new Option("MINI","MINI");
 group[7][2]=new Option("MIDI","MIDI")
 group[8][0]=new Option("SHOES 소분류 선택","");
 group[8][1]=new Option("HEELS","MINI");
 group[8][2]=new Option("FLAT","MIDI")
 group[8][3]=new Option("BOOTS","BOOTS")
 
 temp = document.frm.GOODS_CATEGORY2;
 for (m = temp.options.length-1 ; m > 0 ; m--)
  temp.options[m]=null
 for (i=0;i<group[x].length;i++){
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
}


</script>



</head>
<body> 
<div class="row" style="padding-left:15px;width:900px;">
	<h1 class="page-header">상품수정</h1>
</div>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="13%">
				<col width="*"/>
			</colgroup>
			<caption>상품 수정</caption>
			<tbody>
				<tr>
					<th scope="row">상품번호</th>
					<td colspan="3">${adminGoodsDetail.GOODS_NUMBER}<input type="hidden" id="GOODS_NUMBER" name="GOODS_NUMBER" class="wdp_90" value="${adminGoodsDetail.GOODS_NUMBER}"></input></td>
				</tr>
				<tr>
					<th scope="row">상품명</th>
					<td colspan="3"><input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90" value="${adminGoodsDetail.GOODS_NAME}"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td ><input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90" value="${adminGoodsDetail.GOODS_PRICE}"></input></td>
				</tr>
				
				<tr>
					<th scope="row">카테고리</th>
					<td colspan="3">
						<select name="GOODS_CATEGORY1" onchange="GOODS_CATEGORY1Change();" size=1>
						<OPTION value=''>대분류</OPTION>
						<c:choose>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'OUTER'  }">
							<OPTION value='OUTER' selected>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'TOP'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP' selected>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'T-SHIRTS'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS' selected>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'KNIT'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT' selected>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'DRESS'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS' selected>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'PANTS'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS' selected>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:when test="${adminGoodsDetail.GOODS_CATEGORY1 eq 'SKIRTS'  }">
							<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS' selected>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						</c:when>
						<c:otherwise>
						<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES' selected>SHOES</OPTION>
						</c:otherwise>
						</c:choose> 
						</select>
						<SELECT name="GOODS_CATEGORY2" size=1>
						 <OPTION value=''>소분류를 바꾸시려면 대분류를 먼저 선택하세요</OPTION>
						 <c:if test="${adminGoodsDetail.GOODS_CATEGORY2 ne null }">
						 <OPTION value="${adminGoodsDetail.GOODS_CATEGORY2}" selected>${adminGoodsDetail.GOODS_CATEGORY2}</OPTION>
						 </c:if>
						</SELECT>
					</td>
				</tr>
				
				<tr>
					<th scope="row">썸네일<br/>이미지</th>
					<td colspan="3">기존 썸네일 이미지 : <img src="/ELTRUT/file/goodsFile/${adminGoodsDetail.GOODS_THUMBNAIL}" width="60" height="60" alt=""  onerror="this.src='/ELTRUT/file/noimg_130.gif'" />
					<br/><br/><input type="file" id="file" name="GOODS_THUMBNAIL"><br/>
					<input type="hidden" name="ORIGINAL_THUMBNAIL" value="${adminGoodsDetail.GOODS_THUMBNAIL }">
					※파일 업로드시 기존 이미지는 삭제됩니다.</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="5" cols="100" title="내용" id="CONTENTS" name="GOODS_SHORTDESC" >${goodsBasic.GOODS_SHORTDESC}</textarea>
						<br/><br/>
						<textarea rows="10" cols="100" title="내용" id="CONTENTS" name="GOODS_DESC" >${goodsBasic.GOODS_DESC}</textarea>
					</td>
				</tr>
	
				<tr>
					<td colspan="2">
					<a href="#this" class="btn" id="addKind">컬러/사이즈/재고 추가</a><br/>
						<div id="kindDiv">
							<p>
							<br>
							기존 칼러 = ${adminGoodsDetail.GOODS_COLOR } 사이즈 = ${adminGoodsDetail.GOODS_SIZE } 수량 = ${adminGoodsDetail.GOODS_AMOUNT }
							<br>
							<select id="GOODS_COLOR" name="GOODS_COLOR" size=1 >
								<OPTION value=''>색상</OPTION>
								<OPTION value='BLACK'>BLACK</OPTION>
								<OPTION value='GRAY'>GRAY</OPTION>
								<OPTION value='BROWN'>BROWN</OPTION>
								<OPTION value='BURGUNDY'>BURGUNDY</OPTION>
								<OPTION value='PINK'>PINK</OPTION>
								<OPTION value='PURPLE'>PURPLE</OPTION>
								<OPTION value='WHITE'>WHITE</OPTION>
								<OPTION value='NAVY'>NAVY</OPTION>
								<OPTION value='BLUE'>BLUE</OPTION>
								<OPTION value='GREEN'>GREEN</OPTION>
								<OPTION value='YELLOW'>YELLOW</OPTION>
								<OPTION value='RED'>RED</OPTION>
								<OPTION value='SKYBLUE'>SKYBLUE</OPTION>
								<OPTION value='BEIGE'>BEIGE</OPTION>
							</select>
							
							<!-- <input type="text" placeholder='색상' id="text" name="GOODS_COLOR"> -->
							<input type="text" placeholder='사이즈' id="GOODS_SIZE" name="GOODS_SIZE"> 
							<input type="text" placeholder='수량' id="GOODS_AMOUNT" name="GOODS_AMOUNT">
							<a href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
					</td>
				</tr>
	
				<tr>
				<td>	
							
				기존 이미지1 : <img src="/ELTRUT/file/goodsFile/${goodsImage.GOODS_IMAGE_1}" width="60" height="60" alt=""  onerror="this.src='/ELTRUT/file/goodsFile/noimg_130.gif'" />
				</td>
		
				<th scope="row">이미지 1
					<input type="file" id="GOODS_IMAGE_1" name="GOODS_IMAGE_1"></th>
				</tr>
				
				
					
				
				<tr>
				<td>		
				기존 이미지2 : <img src="/ELTRUT/file/goodsFile/${goodsImage.GOODS_IMAGE_2}" width="60" height="60" alt=""  onerror="this.src='/ELTRUT/file/goodsFile/noimg_130.gif'" />
				</td> 

				<th scope="row">이미지 2
					<input type="file" id="GOODS_IMAGE_2" name="GOODS_IMAGE_2"></th>
				</tr>				
				
				
	
	<%-- 			<tr>
					<td colspan="4">
					
					<a href="#this" class="btn" id="addFile">이미지 추가</a>
						<div id="fileDiv">
							<c:forEach var="goodsImage"  items="${goodsImage}" varStatus="stat">
								<input type="hidden" name="ORIGINAL_IMAGE" value="${goodsImage.GOODS_IMAGE_2}">
								<p>
								기존 이미지 : <img src="/ELTRUT/file/goodsFile/${goodsImage.GOODS_IMAGE_2}" width="60" height="60" alt=""  onerror="this.src='/ELTRUT/file/goodsFile/noimg_130.gif'" /> 
								<a href="#this" class="btn" id="delete" name="delete">삭제</a><br/>
								<input type="file" id="file" name="MODIFY_IMAGE_${goodsImage.GOODS_IMAGE_2}">
								<input type="hidden" name="${goodsImage.GOODS_IMAGE_2}" value="1">
								※업로드시 기존 이미지는 삭제됩니다.
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
 --%>			</tbody>
		</table>
		
		<br/><br/>
		<a href="#this" class="btn" id="write">수정하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	<br/>
	<br/>
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		var gfv_count = 1;
		var gfc_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				 if($('#GOODS_NAME').val()==""){
					alert("상품명을 입력해 주세요.");
					return false;
				 } else if($('#GOODS_PRICE').val()==""){
					 alert("상품가격을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_CATEGORY1').val()==''){
					 alert("상품 대분류를 선택해 주세요.");
						return false;
				 } else if($('#GOODS_CATEGORY2').val()==''){
					 alert("상품 소분류를 선택해 주세요.");
						return false;
				 } else if($('#GOODS_THUMBNAIL').val()==""){
					 alert("썸네일이미지를 등록해 주세요.");
						return false;
				 } else if($('#GOODS_SHORTDESC').val()==""){
					 alert("상품 간략설명을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_DESC').val()==""){
					 alert("상품 상세설명을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_COLOR').val()==''){
					 alert("상품 색상을 선택해 주세요.");
						return false;
				 } else if($('#GOODS_SIZE').val()==""){
					 alert("상품 사이즈를 입력해 주세요.");
						return false;
				 } else if($('#GOODS_AMOUNT').val()==""){
					 alert("상품 수량을 입력해 주세요.");
						return false;
				 } else if($('#GOODS_IMAGE_1').val()==""){
					 alert("상품이미지1를 등록해 주세요.");
						return false;
				 }else if($('#GOODS_IMAGE_2').val()==""){
					 alert("상품이미지2를 등록해 주세요.");
						return false;
				 }
				 else{
				fn_insertGood();
				}
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("#addKind").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addKind();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteKind($(this));
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminGoods/adminGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_insertGood(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/adminGoods/adminGoodsModify' />");
			comSubmit.submit();
		}
		
		function fn_addKind(){
			var str = "<p><select name='GOODS_COLOR' size=1><OPTION value=''>색상</OPTION><OPTION value='BLACK'>BLACK</OPTION><OPTION value='GRAY'>GRAY</OPTION><OPTION value='BROWN'>BROWN</OPTION><OPTION value='BURGUNDY'>BURGUNDY</OPTION><OPTION value='PINK'>PINK</OPTION><OPTION value='PURPLE'>PURPLE</OPTION><OPTION value='WHITE'>WHITE</OPTION><OPTION value='NAVY'>NAVY</OPTION><OPTION value='BLUE'>BLUE</OPTION><OPTION value='GREEN'>GREEN</OPTION><OPTION value='YELLOW'>YELLOW</OPTION><OPTION value='RED'>RED</OPTION><OPTION value='SKYBLUE'>SKYBLUE</OPTION><OPTION value='BEIGE'>BEIGE</OPTION> </select> <input type='text' placeholder='사이즈' name='GOODS_SIZE'> <input type='text' placeholder='수량' name='GOODS_AMOUNT'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#kindDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteKind($(this));
			});
		}
		
		function fn_deleteKind(obj){
			obj.parent().remove();
		}
		
		function fn_addFile(){
			var str = "<p><input type='file' name='GOODS_IMAGE_2'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
		
	</script>
</body>
</html>