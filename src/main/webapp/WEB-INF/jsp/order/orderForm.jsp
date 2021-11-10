<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
<style>
/* #form{
position: fixed;
right: 150px;
bottom:100px;
top:20px;
} */

</style>
<!-- 주소API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('RECEIVER_ZIPCODE').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('RECEIVER_ADDRESS1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('RECEIVER_ADDRESS2').focus();
            }
        }).open();
    }
    
    function orderform_check() {
    	  //변수에 담아주기
    	  var RECEIVER_NAME = document.getElementById("RECEIVER_NAME");
    	  var RECEIVER_PHONE = document.getElementById("RECEIVER_PHONE");
    	  var RECEIVER_ZIPCODE = document.getElementById("RECEIVER_ZIPCODE");
    	  var RECEIVER_ADDRESS2 = document.getElementById("RECEIVER_ADDRESS2");
    	 
    	  if (RECEIVER_NAME.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    	    alert("이름을 입력하세요.");
    	    RECEIVER_NAME.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    	  };
    	 
    	  var phoneRegExp = /^[0-9]{11}$/; //아이디 유효성 검사
    	  if (!phoneRegExp.test(RECEIVER_PHONE.value)) {
    	      alert("연락처를 알맞게 입력해주세요.");
    	      RECEIVER_PHONE.value = "";
    	      RECEIVER_PHONE.focus();
    	      return false;
    	  };

    	  if (RECEIVER_ZIPCODE.value == "") {
    	    alert("우편번호를 입력해주세요.");
    	    RECEIVER_ZIPCODE.focus();
    	    return false;
    	  };
    	  if (RECEIVER_ADDRESS2.value == "") {
    	    alert("상세주소를 입력하세요.");
    	    RECEIVER_ADDRESS2.focus();
    	    return false;
    	  }
    	  document.order_form.submit();
    	  };

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-light">
<div class="container">
  <main>
    
    <c:choose>
	<c:when test="${fn:length(goods) > 0}">
        <div class="row mb-2" style="justify-content: left;-webkit-text-stroke-width: medium;width: 70%;">
    <div class="col-md-6">
        <div class="col p-4 d-flex flex-column position-static">
		<c:forEach  items="${goods }" var="G" varStatus="idx">

        <form class="needs-validation" name="order_form" action="/ELTRUT/orderDetail">
        
          <label for="firstName" class="form-label">상품</label>
              <input type="text" class="form-control" value="${G.GOODS_NAME }" readonly>
              <input type="image"  class="img-thumbnail"  src="/ELTRUT/file/goodsFile/${G.GOODS_THUMBNAIL}"  width="330" height="442" alt="" onerror="this.src='/ELTRUT/file/noimg_130.gif'" /> 
        	<label for="lastName" class="form-label">색상</label>
              <input type="text" class="form-control" value="${G.GOODS_COLOR }" readonly>
       		 <label for="username" class="form-label">사이즈</label>
                <input type="text" class="form-control" value="${G.GOODS_SIZE }" readonly>
        <label for="email" class="form-label">상품금액</label>
              <input type="email" class="form-control" value="${G.GOODS_PRICE }" readonly>
              <label for="address" class="form-label">수량</label>
              <input type="text" class="form-control" value="${G.EA }" readonly>
              <label for="address2" class="form-label">주문금액</label>
              <input type="text" class="form-control" value="${G.TOTALPRICE }" readonly>
              <input type="hidden" name="EA" value="${G.EA }">
			<input type="hidden" name="GOODS_NUMBER" value="${G.GOODS_NUMBER }">
			<input type="hidden" name="CART_NUMBER" value="${CART_NUMBER }">
			<hr class="my-4">
		</c:forEach>
        </div>
    </div>
  </div>
	</c:when>
	<c:otherwise>
		<H3>주문상품이 없습니다.</H3>	
	</c:otherwise>
</c:choose>

    <c:choose>
	<c:when test="${fn:length(orderMember) > 0}">
		<c:set var="OM" value="${orderMember }"/>

    <div class="row g-5" style="width: 100%; position: fixed; left: 300px; top: 100px;">
      <h2>배송</h2>
      <div class="col-md-7 col-lg-8">
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">정보가져오기</label>
              <input  type="checkbox"  name="check"  onclick="memberOn();">
              <button class="btn btn-primary btn-lg" type="button" onclick="orderform_check();" style="float: right;">주문하기</button>
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">이름</label>
              <input type="text" class="form-control" id="RECEIVER_NAME" name="RECEIVER_NAME">
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">연락처</label>
                <input type="text" class="form-control" id="RECEIVER_PHONE" name="RECEIVER_PHONE">
              
              </div>

            <div class="col-7">
              <label for="email" class="form-label">배송주소</label>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">우편번호</label>
              <button class="btn btn-primary btn-lg" type="button" onclick="sample6_execDaumPostcode()" style="float: right;">주소찾기</button>
              <input type="text" class="form-control" id="RECEIVER_ZIPCODE"  name="RECEIVER_ZIPCODE" readonly  value="" maxlength="6" required="">
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">상세주소</label>
              <input type="text" class="form-control" id="RECEIVER_ADDRESS1"  name="RECEIVER_ADDRESS1"  readonly value="" size="48" readonly>
              <input type="text" class="form-control" id="RECEIVER_ADDRESS2"  name="RECEIVER_ADDRESS2" value="">
            </div>
            
            <div class="col-7">
              <label for="address" class="form-label">배송 요청사항</label>
              <input type="text" class="form-control" id="DELIVERY_MESSAGE" name="DELIVERY_MESSAGE" style="width:400px; height:100px;">
              
            </div>
            
            <div class="col-7">
              <label for="address" class="form-label">총가격</label>
              <input type="text" class="form-control" value="${sum}">
              
            </div>
          </div>
      </div>
    </div>
	</form>
	</c:when>
	<c:otherwise>
		<H3>주문상품이 없습니다.</H3>	
	</c:otherwise>
</c:choose>
  </main>
</div>
				

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function memberOn() {
    var name = "${OM.MEMBER_NAME}";
    var phone = "${OM.MEMBER_PHONE}";
    var zipcode = "${OM.MEMBER_ZIPCODE}";
    var address1 = "${OM.MEMBER_ADDRESS1}";
    var address2 = "${OM.MEMBER_ADDRESS2}";
   	 if($("input:checkbox[name=check]").is(":checked") == true){
       	
    $("#RECEIVER_NAME").val(name);
    $("#RECEIVER_PHONE").val(phone);
    $("#RECEIVER_ZIPCODE").val(zipcode);
    $("#RECEIVER_ADDRESS1").val(address1);
    $("#RECEIVER_ADDRESS2").val(address2);
    }else if($("input:checkbox[name=check]").is(":checked") != true){
       	
    $("#RECEIVER_NAME").val("");
    $("#RECEIVER_PHONE").val("");
    $("#RECEIVER_ZIPCODE").val("");
    $("#RECEIVER_ADDRESS1").val("");
    $("#RECEIVER_ADDRESS2").val("");
    }
            
            
}

</script>
</html>