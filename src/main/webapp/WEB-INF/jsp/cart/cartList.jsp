<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">


<title>장바구니</title>

<style type="text/css">

.row-header{
   color:  #000000;
   font-weight: bold;
   font-size: 35px;
   font-family: Georgia, "맑은 고딕", serif;
}

.row-ttlnum{
   color:  #000000;
   font-size: 13px;
   padding-top: 10px;
   font-family: Georgia, "맑은 고딕", serif;
}

.imagebox{
   color:  #000000;
   background-color: white;
   font-size: 8px;
   padding-top: 60px;
   margin-left: 40px;
   font-family: Georgia, "맑은 고딕", serif;
}

.textbox{
   color:  #000000;
   background-color: white;
   font-size: 13px;
   padding-top: 60px;
   margin-left: 40px;
   font-family: Georgia, "맑은 고딕", serif;
}

.img-button {
        background: url( "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" ) no-repeat;
        border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;

</style>


</head>
<body>

<div class="container">

   <div class="row-header">
   
   장바구니
   <br>
   </div>
   <div class="row-ttlnum">
   총 상품
   <br>
   
   
   </div>
   
   <c:choose>
      <c:when test="${fn:length(cartList) > 0}">
   <div class="checkbox_group">
        <input type="checkbox" name="checkAll" id="check_all"  >
        <label>전체선택</label>
            
        <form class="cart" id="frm" action="/ELTRUT/order" >
   
   <div class="row">
      
      <c:forEach  items="${cartList }" var="C" varStatus="idx" >
               
      <div class="col-md-4 imagebox">
         
      <input type="checkbox" id="check${idx.index}" name="check" onClick="itemSum()"
         class="chkbox" value="${C.GOODS_PRICE*C.CART_AMOUNT}"  >
         
         <a href="/ELTRUT/goodsDetail?GOODS_NUMBER=${C.GOODS_NUMBER }">
         <img src="/ELTRUT/file/goodsFile/${C.GOODS_THUMBNAIL}" class="img-thumbnail" width="330" height="442"/>
         </a>
         <br>
         <br>
         <br>
      </div>
      
      <div class="col-md-6 textbox">
      <br>
      <br>
      <br>
         ${C.GOODS_NAME }
         <input type="hidden" id="GOODS_AMOUNT" name="GOODS_AMOUNT" value="${C.GOODS_AMOUNT }">
         <input type="hidden" id="CART_NUMBER" name="CART_NUMBER" value="${C.CART_NUMBER }">
         <input type="hidden" id="EA" name="EA" value="${C.CART_AMOUNT }">
         <input type="hidden" id="GOODS_NUMBER" name="GOODS_NUMBER" value="${C.GOODS_NUMBER }">
         <input type="hidden" name=currentNumber${idx.index}  value="${C.CART_NUMBER}"/>
         <input type="hidden" name=currentAmount${idx.index}  value="${C.CART_AMOUNT}"/>
         
         <br>${C.GOODS_COLOR }
         <br>${C.GOODS_SIZE }
         <%-- <br>${C.CART_AMOUNT }
         
         <br>변경 수량 :<input type="text" id="CART_AMOUNT${idx.count }" name="CART_AMOUNT" value="${C.CART_AMOUNT }"> --%>
         
         <br><input type=hidden id="sell_price"  value="${GD.GOODS_PRICE }">
            
            <img src="https://img.icons8.com/material-outlined/24/000000/minus-math.png" onclick="del();"/>
            <input type="text" id="CART_AMOUNT" name="CART_AMOUNT" value="1" size="3" onchange="change();">
            <img src="https://img.icons8.com/material-outlined/24/000000/plus-math--v1.png" onclick="add();"/><br>
            
         <br>${C.GOODS_PRICE*C.CART_AMOUNT}원
                  <%-- <input type="hidden" name="totalPrice" value="${C.GOODS_PRICE*C.CART_AMOUNT}"> --%>
         
         <br>
         
         <input type="button" class="img-button" onclick="cartDelete(currentNumber${idx.index})"/>
         
         <%-- <input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
         class="btn btn-default" aria-label="trash" onclick="cartDelete(currentNumber${idx.index})"/> --%>
    
          <br>
          <br>
          <br>
      </div>
      
      </c:forEach>
      </c:when>
      <c:otherwise>
      <h3>장바구니가 비어있습니다.</h3>
      </c:otherwise>
      
      </c:choose>
      
   </div>


   
      
      


</div>


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