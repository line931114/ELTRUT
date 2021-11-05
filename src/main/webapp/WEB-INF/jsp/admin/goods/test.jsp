<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>adminGoodsInsertForm</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<script>

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
	<h1 class="page-header">상품등록</h1>
</div>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>상품 등록</caption>
			<tbody>
				<tr>
					<th scope="row">상품명</th>
					<td><input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">카테고리</th>
					<td>
						<select id="GOODS_CATEGORY1" name="GOODS_CATEGORY1" onchange="GOODS_CATEGORY1Change();" size=1>
						<OPTION value=''>대분류</OPTION>
						<OPTION value='OUTER'>OUTER</OPTION>
						<OPTION value='TOP'>TOP</OPTION>
						<OPTION value='T-SHIRTS'>T-SHIRTS</OPTION>
						<OPTION value='KNIT'>KNIT</OPTION>
						<OPTION value='DRESS'>DRESS</OPTION>
						<OPTION value='PANTS'>PANTS</OPTION>
						<OPTION value='SKIRTS'>SKIRTS</OPTION>
						<OPTION value='SHOES'>SHOES</OPTION>
						 
						</select>
						<SELECT id="GOODS_CATEGORY2" name="GOODS_CATEGORY2" size=1>
						 <OPTION value=''>대분류를 먼저 선택하세요</OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<th scope="row">썸네일 이미지</th>
					<td><input type="file" id="GOODS_THUMBNAIL" name="GOODS_THUMBNAIL"></td>
				</tr>
				
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="5" cols="100" title="내용" id="GOODS_SHORTDESC" name="GOODS_SHORTDESC" placeholder="기본 설명"></textarea>
						<br/><br/>
						<textarea rows="10" cols="100" title="내용" id="GOODS_DESC" name="GOODS_DESC" placeholder="상세 설명"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<a href="#this" class="btn" id="addKind">컬러/사이즈/재고 추가</a><br/>
						<div id="kindDiv">
							<p>
							<select id="GOODS_COLOR" name="GOODS_COLOR" size=1>
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
<!-- 				<tr>
					<td colspan="2">
					
					<a href="#this" class="btn" id="addFile">이미지 추가</a>
						<div id="fileDiv">
							<p>
							<input type="file" id="GOODS_IMAGE_1" name="GOODS_IMAGE_1">
							<a href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
					</td>
				</tr> -->
				
				<tr>
					<th scope="row">이미지 1</th>
					<td><input type="file" id="GOODS_IMAGE_1" name="GOODS_IMAGE_1"></td>
				</tr>
				
				<tr>
					<th scope="row">이미지 2</th>
					<td><input type="file" id="GOODS_IMAGE_2" name="GOODS_IMAGE_2"></td>
				</tr>
				
				
				
				
				
			</tbody>
		</table>
		
		<br/><br/>
		<a href="#this" class="btn" id="write">작성하기</a>
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
			comSubmit.setUrl("<c:url value='/adminGoods/adminGoodsInsert' />");
			comSubmit.submit();
		}
		
		function fn_addKind(){
			var str = "<p><select name='GOODS_COLOR' id='GOODS_COLOR' size=1><OPTION value=''>색상</OPTION><OPTION value='BLACK'>BLACK</OPTION><OPTION value='GRAY'>GRAY</OPTION><OPTION value='BROWN'>BROWN</OPTION><OPTION value='BURGUNDY'>BURGUNDY</OPTION><OPTION value='PINK'>PINK</OPTION><OPTION value='PURPLE'>PURPLE</OPTION><OPTION value='WHITE'>WHITE</OPTION><OPTION value='NAVY'>NAVY</OPTION><OPTION value='BLUE'>BLUE</OPTION><OPTION value='GREEN'>GREEN</OPTION><OPTION value='YELLOW'>YELLOW</OPTION><OPTION value='RED'>RED</OPTION><OPTION value='SKYBLUE'>SKYBLUE</OPTION><OPTION value='BEIGE'>BEIGE</OPTION> </select> <input type='text' placeholder='사이즈' name='GOODS_SIZE' id='GOODS_SIZE'> <input type='text' placeholder='수량' name='GOODS_AMOUNT' id='GOODS_AMOUNT'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#kindDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteKind($(this));
			});
		}
		
		function fn_deleteKind(obj){
			obj.parent().remove();
		}
		
		/* function fn_addFile(){
			var str = "<p><input type='file' name='GOODS_IMAGE_1'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		} */
		
	</script>
</body>
</html>