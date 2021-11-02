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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
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
	<main class="container">
        <div class="row g-5">
            <div class="col-12">
                <h2 class="mb-3">상품추가</h2>
                <form class="needs-validation" novalidate="">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="firstName" class="form-label">상품명</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                        </div>
                        
                         <div class="col-12">
                            <label for="lastName" class="form-label">가격</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                        </div>
                       
                        <div class="col-12">
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
                                    <option value="OUTER">COAT</option>
                                    <option value="OUTER">PUFF</option>
                                    <option value="OUTER">JACKET</option>
                                    <option value="OUTER">BLAZER</option>
                                    <option value="TOP">SHIRTS</option>
                                    <option value="TOP">BLOUSE</option>
                                    <option value="T-SHIRTS">LONG SLEEVE</option>
                                    <option value="T-SHIRTS">HALF SLEEVE</option>
                                    <option value="T-SHIRTS">TOP</option>
                                    <option value="KNIT">TOP</option>
                                    <option value="KNIT">BOTTOM</option>
                                    <option value="KNIT">DRESS</option>
                                    <option value="DRESS">MINI</option>
                                    <option value="DRESS">MIDI</option>
                                    <option value="DRESS">LONG</option>
                                    <option value="PANTS">SHORTS</option>
                                    <option value="PANTS">JEAN</option>
                                    <option value="PANTS">PANTS</option>
                                    <option value="SKIRT">MINI</option>
                                    <option value="SKIRT">MIDI</option>
                                    <option value="SHOES">HEELS</option>
                                    <option value="SHOES">FLAT</option>
                                    <option value="SHOES">BOOTS</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <label for="username" class="form-label">썸네일 이미지</label>
                            <div class="input-group has-validation">
                                
                            </div>
                            <div class="mb-3">
								  <label for="formFileMultiple" class="form-label"></label>
								  <input class="form-control" type="file" id="formFileMultiple" multiple>
								</div>
                        </div>
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">기본 설명</label>
						  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="기본설명"></textarea>
						</div>

                        <div class="col-12">
                            <a href="#this" class="btn btn-primary" id="addKind">컬러/사이즈/재고 추가</a><br/>
						<div class="d-flex mt-3" id="kindDiv">
							<select class="form-select me-2" id="GOODS_COLOR" name="GOODS_COLOR" size=1>
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
							<input class="form-control me-2" type="text" placeholder='사이즈' id="GOODS_SIZE" name="GOODS_SIZE"> 
							<input class="form-control me-2" type="text" placeholder='수량' id="GOODS_AMOUNT" name="GOODS_AMOUNT">
							<a href="#this" class="btn" id="delete" name="delete">삭제</a>
						</div>
                        </div>

	                        <div class="mb-3">
							  <label for="formFileMultiple" class="form-label">이미지 1</label>
							  <input class="form-control" type="file" id="formFileMultiple" multiple>
							</div>
							
							<div class="mb-3">
							  <label for="formFileMultiple" class="form-label">이미지 2</label>
							  <input class="form-control" type="file" id="formFileMultiple" multiple>
							</div>
							<div class="row">
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
			var comSubmit = new ComSubmit("frm");/* 
			comSubmit.setUrl("<c:url value='/adminGoodsInsert' />"); */
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