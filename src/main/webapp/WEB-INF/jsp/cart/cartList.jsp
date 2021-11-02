<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
#form{
position: fixed;
right: 150px;
bottom:100px;
top:20px;
}
</style>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<div id="form">
	<table>
		<tr>
			<td>주문상품 총금액</td>
		</tr>
		<tr>
			<td id="total_sum" >0원</td>
		</tr>
		<tr>
			<td><input type="button" value="장바구니 주문하기" onclick='return submit2();'></td></tr>
		</table>
</div>
<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">장바구니<input type="button" value="장바구니 주문하기" onclick='return submit2();'></h1></div>
<c:choose>
			<c:when test="${fn:length(cartList) > 0}">
<div >
<div class="checkbox_group">
				  <input type="checkbox" name="checkAll" id="check_all"  >
				<label>전체선택</label>
				
					<form class="cart" id="frm" action="/ELTRUT/order" >
				<c:forEach  items="${cartList }" var="C" varStatus="idx">
					<table id="cart${idx.count}" >
					<tr>
					<td><input type="checkbox" id="check${idx.index}" name="check" onClick="itemSum()"
                      class="chkbox" value="${C.GOODS_PRICE*C.CART_AMOUNT}"  >
					<label>선택</label>
					</td></tr>
					<tr>
						<tr><td>${C.ROWNUM }</td></tr>
						<tr><td><a href="/ELTRUT/goodsDetail?GOODS_NUMBER=${C.GOODS_NUMBER }">
						<img src="/ELTRUT/file/goodsFile/${C.GOODS_THUMBNAIL}"  width="200" height="200" alt="" onerror="this.src='/ELTRUT/file/noimg_130.gif'" />
						</a>
						</td></tr>
						<tr><td>
							${C.GOODS_NAME }
							<input type="hidden" id="GOODS_AMOUNT" name="GOODS_AMOUNT" value="${C.GOODS_AMOUNT }">
							<input type="hidden" id="CART_NUMBER" name="CART_NUMBER" value="${C.CART_NUMBER }">
							<input type="hidden" id="EA" name="EA" value="${C.CART_AMOUNT }">
							<input type="hidden" id="GOODS_NUMBER" name="GOODS_NUMBER" value="${C.GOODS_NUMBER }">
							<input type="hidden" name=currentNumber${idx.index}  value="${C.CART_NUMBER}"/>
							<input type="hidden" name=currentAmount${idx.index}  value="${C.CART_AMOUNT}"/>
						</td></tr>
						<tr><td>${C.GOODS_COLOR }</td></tr>
						<tr><td>${C.GOODS_SIZE }</td></tr>
						<tr><td>기존 수량: ${C.CART_AMOUNT }
						변경 수량 :<input type="text" id="CART_AMOUNT${idx.count }" name="CART_AMOUNT" value="${C.CART_AMOUNT }">
						</td></tr>
						<tr><td>금액: ${C.GOODS_PRICE*C.CART_AMOUNT}원
						<%-- <input type="hidden" name="totalPrice" value="${C.GOODS_PRICE*C.CART_AMOUNT}"> --%>
						</td></tr>
						<tr><td>${C.CART_REG_DATE }</td></tr>
						<tr><td>
						<input type="button" value="수량변경" onclick="cartUpdate(this.form);">
						<input type="button" value="장바구니 삭제" onclick="cartDelete(currentNumber${idx.index})"/>
				
						</td></tr>
					</table>
						<br/><br/>
				</c:forEach>
					</form>
				</div>
				</div>
				
			</c:when>
				
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function allOrder(){
	$('#frm1').attr("action","/ELTRUT/order").submit();
	$('#frm2').attr("action","/ELTRUT/order").submit();
}
function submit2() { 
	if(confirm("해당 상품을 주문하시겠습니까?")){
		$('#frm').attr("action","/ELTRUT/order").submit();
    return true; 
  }else{}
}
  
$(function(){
    var responseMessage = "<c:out value="${message}" />";
    if(responseMessage != ""){
        alert(responseMessage)
        history.back();
    }
}) 
function cartUpdate(frm){
	if(confirm("해당 상품 수량을 변경하시겠습니까?")){
		$(frm).attr("action","/ELTRUT/optionModify").submit();
	}else{
		
	}
		
};
function cartDelete(cartNumber){
	if(confirm("정말 장바구니에서 삭제하시겠습니까?")){
	location.href="/ELTRUT/cartDelete?CART_NUMBER="+cartNumber.value;+"&MEMBER_ID=${MEMBER_ID}";
	}else{
		
	}
		
};
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find("input").prop("checked", $(this).is(":checked"));
    itemSum();
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".chkbox", function() {
    var is_checked = true;

    $(".checkbox_group .chkbox").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
    itemSum();
});

 function itemSum() {
     var str = "";
     var sum = 0;
     var count = $(".chkbox").length;
     for (var i = 0; i < count; i++) {
         if ($(".chkbox")[i].checked == true) {
             sum += parseInt($(".chkbox")[i].value);
         }
     }
     $("#total_sum").html(sum + " 원");
     $("#amount").val(sum);
 }
 
</script>
</body>
</html>