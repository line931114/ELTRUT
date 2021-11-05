<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<script language="JavaScript">

var sell_price;
var amount;

window.onload = function init () {
   sell_price = document.form.sell_price.value;
   amount = document.form.CART_AMOUNT.value;
   document.form.sum.value = sell_price;
   change();
}

function add () {
   hm = document.form.CART_AMOUNT;
   sum = document.form.sum;
   if(${goodsDetail.GOODS_AMOUNT}>hm.value){
         hm.value ++ ;
         sum.value = parseInt(hm.value) * sell_price;
   }
}

function del () {
   hm = document.form.CART_AMOUNT;
   sum = document.form.sum;
      if (hm.value > 1) {
         hm.value -- ;
         sum.value = parseInt(hm.value) * sell_price;
      }
}

function change () {
   hm = document.form.CART_AMOUNT;
   sum = document.form.sum;

      if (hm.value < 0) {
         hm.value = 0;
      }
   sum.value = parseInt(hm.value) * sell_price;
}  
</script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

function Throw(){
        if(confirm("장바구니에 담으시겠습니까?")){
        $('#cartIn').submit();
        }else{
           
           location.href="/ELTRUT/goodsDetail?GOODS_NUMBER="+${goodsDetail.GOODS_NUMBER};
        }
    }

    function Qna(){     
           location.href="/ELTRUT/goodsQna?GOODS_NUMBER="+${goodsDetail.GOODS_NUMBER};    
    }

    function Review(){
           location.href="/ELTRUT/goodsReview?GOODS_NUMBER="+${goodsDetail.GOODS_NUMBER};
    }

</script>


<style>
        .textbox{
            border: black;
            background-color: white;
            margin:5px;
         font-size: 8px;
         padding-top: 60px;
         margin-left: 30px;
        }
        .imagebox{
            border: black;
            background-color: white;
            margin:5px;
         padding-top: 60px;
         margin-left: 30px;
        }
        .cartbox{
            border: black;
            background-color: white;
            padding-top: 60px;
         
        }
        
</style>


<title>상품 상세보기</title>

</head>
<body>
<c:set var="GD" value="${goodsDetail}"/>
<div class="container">
   <div class="row">
      <div class="col-md-3 textbox">
      
소재, 세탁 방법 및 원산지
JOIN LIFE<br>
Care for fiber: 50% 이상 ECOVERO™ 비스코스 사용.<br>
<br>
환경에 미치는 영향을 줄일 수 있는 기법과 원자재를 이용하여 제조되는 제품에 Join Life라는 이름의 태그를 부착합니다.<br>
<br>
ECOVERO™ 비스코스<br>
ECOVERO™는 섬유 생산 과정에서 환경에 미치는 영향을 줄이는 원자재와 기술을 이용하여 Lenzing사가 생산하는 비스코스입니다.<br>

이 섬유는 통제된 방식으로 나무를 재배하고, 더욱 지속 가능한 방법으로 관리한 산림 출처 목재를 사용합니다. 또한 섬유 생산업체는 비영리 단체 Canopy가 개발한 Hot Button Report에서 "Green Shirt"로 분류되며, 원시림과 멸종 위기에 있는 산림 보호를 보장합니다.
<br>
<br>
또한 생산 공정에서 유럽 연합이 규정한 소비 매개변수 및 더욱 책임 있는 에너지, 물 관리 그리고 CO2 배출 감소를 준수하는 기술을 사용합니다.<br>
인증
</div>



   <div class="col-md-4 imagebox">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
             <div class="carousel-item active">
            <img class="d-block w-100" src="/ELTRUT/file/goodsFile/${GD.GOODS_THUMBNAIL}" alt="First slide" style="width:300px; height:500px;">
              </div>
              
              <div class="carousel-item">
            <img class="d-block w-100" src="/ELTRUT/file/goodsFile/${GD.GOODS_IMAGE_1}" alt="Third slide" style="width:300px; height:500px;">
            </div>
            
             <div class="carousel-item">
            <img class="d-block w-100" src="/ELTRUT/file/goodsFile/${GD.GOODS_IMAGE_2 }" alt="Third slide" style="width:300px; height:500px;">
           </div>
    </div>
     <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
     </a>
     <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
     </a>
      </div>
   </div>


   <div class="col-md-4 cartbox">
   
   <form id="cartIn" name="form" action="/ELTRUT/cart/cartIn">
         <br>
         <p class="fs-2">${GD.GOODS_NAME }</p>
                     <input type="hidden" id="GOODS_NUMBER" name="GOODS_NUMBER" value="${GD.GOODS_NUMBER }">
                     <input type="hidden" name="CART_NUMBER" value="28">

         <br>
         
         <td>${GD.GOODS_SHORTDESC}</td>

         <br>
         
         <td>${GD.GOODS_PRICE }</td>
         </br>
         <br>
         
         <td>${GD.GOODS_COLOR }</td>
         </br>
         <td>
         <br>
         <select id="option" style="width:225px">
                     <option value="">사이즈 선택</option>
                     <option
                     value="${GD.GOODS_COLOR }-${GD.GOODS_SIZE }">
                     ${GD.GOODS_COLOR } - ${GD.GOODS_SIZE }
                     (${GD.GOODS_AMOUNT }개)</option>
                       </select>
                       </br>
            
            <br>
         수량 : <input type=hidden id="sell_price"  value="${GD.GOODS_PRICE }">
            <input type="text" id="CART_AMOUNT" name="CART_AMOUNT" value="1" size="3" onchange="change();">
            <a role="button" onclick="add();">
            <span class="glyphicon glyphicon-plus" ></span>
            </a>
            <a role="button" onclick="del();">
            <span class="glyphicon glyphicon-minus" ></span>
            </a>
            <br>
         </br>
         <br>
            금액 : <input type="text" id="sum"  size="11" readonly>원
         </td>
         </br>
         <td>
         
         </td>
         </br>
         <br>
         
         </br>

              <button class="btn btn-dark btn-block" type="button" id="cart" onclick="Throw()">장바구니</button>
         
            <br>
            </br>
            
            <input type="button" class="btn btn-link" id="review" value="상품후기" onclick="Review()">
            <input type="button" class="btn btn-link" id="qna" value="문의사항" onclick="Qna()">   

         </form>
   
   </div>

</div>
</div>








          
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 --> 
<script src="js/bootstrap.min.js"></script>
      
</body>
</html>