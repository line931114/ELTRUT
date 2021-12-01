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
 group[2][3]=new Option("TOP","TOP");
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
 group[8][1]=new Option("HEELS","HEELS");
 group[8][2]=new Option("FLAT","FLAT")
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
	<main class="container" style="margin-left: 50px">
        <div class="row g-5">
            <div class="col-12">
                <h2 class="mb-3">상품추가</h2>
                <form name="frm" id="frm" novalidate="" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-6"style="margin-top: 2%; width:25%">
                            <label for="firstName" class="form-label">상품명</label>
                            <input type="text" class="form-control me-2" id="GOODS_NAME" name="GOODS_NAME" placeholder="" value="" required="">
                        
                         <div class="col-6">
                            <label for="lastName" class="form-label">가격</label>
                            <input type="text" class="form-control" id="GOODS_PRICE" name="GOODS_PRICE" placeholder="" value="" required="">
                        </div>
                       </div>
                        <div class="col-12"style="margin-top: 2%;">
                            <label for="firstName" class="form-label">카테고리</label>
                            <div class="d-flex">
                                <select id="GOODS_CATEGORY1" class="form-select me-3" name="GOODS_CATEGORY1" onchange="GOODS_CATEGORY1Change();" size="1">
                                    <option value="">대분류</option>
                                    <option value="OUTER">OUTER</option>
                                    <option value="TOP">TOP</option>
                                    <option value="T-SHIRTS">T-SHIRTS</option>
                                    <option value="KNIT">KNIT</option>
                                    <option value="DRESS">DRESS</option>
                                    <option value="PANTS">PANTS</option>
                                    <option value="SKIRTS">SKIRTS</option>
                                    <option value="SHOES">SHOES</option>
                                </select>
                                
                                <select id="GOODS_CATEGORY2" class="form-select" name="GOODS_CATEGORY2" size="1">
                                    <option value="">대분류를 먼저 선택하세요</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12" style="margin-top: 2%; ">
                            <label for="username" class="form-label">썸네일 이미지</label>
                            <div class="input-group has-validation">
                                
                            
                            <div class="mb-3">
								  <label for="formFileMultiple" class="form-label"></label>
								 <input class="form-control" type="file" id="GOODS_THUMBNAIL" name="GOODS_THUMBNAIL" multiple="">
								</div>
								</div>
                        </div>
						<div class="mb-3" style="margin-top: 2%; width:50%"> 
						  <label for="exampleFormControlTextarea1" class="form-label">기본 설명</label>
						<textarea class="form-control mt-3 me-3" id="GOODS_SHORTDESC" name="GOODS_SHORTDESC" rows="3" cols="25" placeholder="기본설명" style="margin-bottom: 3%; "></textarea>
						</div>
						<div class="col-12">
						
						</div>
                        <div class="col-12">
						<div class="d-flex mt-3" id="kindDiv" style="margin-top: 2%;">
							<select class="form-select me-2" id="GOODS_COLOR" name="GOODS_COLOR" size="1" style="height: 27px;">
								<option value="">색상</option>
								<option value="BLACK">BLACK</option>
								<option value="GRAY">GRAY</option>
								<option value="BROWN">BROWN</option>
								<option value="BURGUNDY">BURGUNDY</option>
								<option value="PINK">PINK</option>
								<option value="PURPLE">PURPLE</option>
								<option value="WHITE">WHITE</option>
								<option value="NAVY">NAVY</option>
								<option value="BLUE">BLUE</option>
								<option value="GREEN">GREEN</option>
								<option value="YELLOW">YELLOW</option>
								<option value="RED">RED</option>
								<option value="SKYBLUE">SKYBLUE</option>
								<option value="BEIGE">BEIGE</option>
							</select>
							
							<!-- <input type="text" placeholder='색상' id="text" name="GOODS_COLOR"> -->
							<input class="me-2" type="text" placeholder="사이즈" id="GOODS_SIZE" name="GOODS_SIZE"> 
							<input class="me-2" type="text" placeholder="수량" id="GOODS_AMOUNT" name="GOODS_AMOUNT">
							
						</div>
						</div>
                       

	                        <div class="mb-3">
							  <label for="formFileMultiple" class="form-label">이미지 1</label>
							  <input class="form-control" type="file" id="GOODS_IMAGE_1" name="GOODS_IMAGE_1"  style="width: 25%; height:auto;">
							</div>
							
							<div class="mb-3">
							  <label for="formFileMultiple" class="form-label">이미지 2</label>
							  <input class="form-control" type="file" id="GOODS_IMAGE_2" name="GOODS_IMAGE_2"  style="width: 25%; height:auto;">
							</div>
							 </div>
							<div class="row" style="margin-top: 3%;">
							<a href="#this" class="col btn btn-primary me-3" id="write">작성하기</a>
							<a href="#this" class="col btn btn-primary " id="list">목록으로</a>
							</div>
							
							
		                </form>
		            </div>
		        </div>
		    </main>
		</body>
	
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
			comSubmit.setUrl("<c:url value='/adminGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_insertGood(){
			var comSubmit = new ComSubmit("frm"); 
			//comSubmit.setUrl("<c:url value='/adminGoodsInsert' />");
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
</html>