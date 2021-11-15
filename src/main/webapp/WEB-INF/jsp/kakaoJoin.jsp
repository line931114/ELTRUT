<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../cssUrl.jsp"/>
<style> .centered { position: absolute; left: 40%; transform: translateX(-50%); } </style>
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
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>



<script>
function joinform_check() {
  //변수에 담아주기
  var id = document.getElementById("MEMBER_ID");
  var pw = document.getElementById("MEMBER_PASSWORD");
  var repw = document.getElementById("MEMBER_PASSWORD2");
  var name = document.getElementById("MEMBER_NAME");
  var email = document.getElementById("MEMBER_EMAIL");
  var phone = document.getElementById("MEMBER_PHONE");
  var idDuplication = document.getElementById("idDuplication");
  var agreement = document.getElementById("agreement");
  
  if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
   if(idDuplication.value != "idCheck"){
      alert("아이디 중복체크를 해주세요.");
      return false;
  } 
   
   if(agreement.value != "agCheck"){
	      alert("이용약관을 동의 해주세요.");
	      return false;
	  }; 
	  
	  var idRegExp = /^[a-zA-Z0-9]{4,12}$/; //아이디 유효성 검사
	  if (!idRegExp.test(id.value)) {
	      alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	      id.value = "";
	      id.focus();
	      return false;
	  };
	  
  if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
    return false;
  }
  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/;

  if (!pwCheck.test(pw.value)) {
    alert("비밀번호는 영문자+숫자 조합으로 4~25자리 사용해야 합니다.");
    pw.focus();
    return false;
  };

  if (repw.value !== pw.value) {
    alert("비밀번호가 일치하지 않습니다..");
    repw.focus();
    return false;
  };

  
  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  if (!reg.test(phone.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    phone.focus();
    return false;
  }

  
  //입력 값 전송
  document.join_form.submit(); //유효성 검사의 포인트   
}
//id 중복체크 
	var winObject = null;
function idCheck(){ 
	var uid = document.getElementById("MEMBER_ID").value;
	 if (uid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("아이디를 입력하세요.");
		    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		  };
	winObject = window.open("idCheckForm", "idCheck", "width=400, height=350"); 

	}
function inputIdChk(){
    document.getElementById("idDuplication").value ="idUncheck";
}

function moveAgreement(){ 
	winObject = window.open("agreement", "agCheck", "width=400, height=350, scrollbars = yes"); 

	}
function agreementCheck(){
    document.getElementById("agreement").value ="agUncheck";
}
</script>
<title>Insert title here</title>
</head>
<body>



<body class="bg-light"> 
    
<div class="container">
  <main>
    <div class="py-5 text-center">
       <h2>카카오,네이버회원으로 가입</h2>
      <p class="lead">ELTRUT 페이지에서 오신 것을 환영합니다, 상품을 구매하기 위해선 회원가입을 진행해주세요.</p>
    </div>
		    <hr class="my-4">
      <div class="col-md-7 col-lg-8" style="line-height: 2;">
        <h4 class="mb-3">카카오,네이버회원정보</h4>
      <form method="post" name="join_form" action="/ELTRUT/joinComplete">	
	   <div class="row g-5">
            <div class="col-sm-6">
              	<label for="firstName" class="form-label">아이디</label>
              	<input type="text" class="form-control" name="MEMBER_ID" id="MEMBER_ID" maxlength="20" label="아이디" onkeydown="inputIdChk()"> 
            </div>
            
            <div class="col-sm-6" style="width:100%; word-break:break-all;word-wrap:break-word; margin-top: 7px;"">
            <br>
              <input type="button" value="ID중복확인" onclick="idCheck()" class="btn btn-secondary btn-sm">
			  <input type="hidden" id="idDuplication" name="idDuplication" value="idUncheck" >   
            </div>
        	
            <div class="col-sm-6 "> &nbsp;
              <label for="username" class="form-label">이름</label>
              <div>
            	  <input type="text" class="form-control" maxlength="100" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
              </div>
            </div>
	
			<div class="col-sm-6"></div>

            <div class="col-sm-6">
              <label for="email" class="form-label">이메일</label>
               <div>
              	<input type="email" class="form-control" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="${user_email }" maxlength="20" readonly>  
               </div>
            </div>
            
            <div class="col-sm-6"></div>
            
            <div class="col-sm-6">
              <label for="text" class="form-label">핸드폰번호</label>
             	 <div>
           		   <input type="text" class="form-control" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="핸드폰번호"> 
            	</div>
            </div>
            
            <div class="col-sm-6"></div>
           

            <div class="col-sm-6">
              <label for="text" class="form-label">비밀번호</label>
              	<div>
             		 <input type="password" class="form-control" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="비밀번호"> 
            	</div>
            </div>
            
            <div class="col-sm-6"></div>
           
            
            
            <div class="col-sm-6">
              <label for="text" class="form-label">비밀번호확인</label>
              	<div>
              		<input type="password" class="form-control" name="MEMBER_PASSWORD2" id="MEMBER_PASSWORD2" value="" maxlength="21" label="비밀번호확인"> 
            	</div>
            </div>
            
            <div class="col-sm-6"></div>
            			
            <div class="col-12" style="margin-top:1px;">
            <br>
            <input type="button"value="주소찾기" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm" >
            </div>
            
            
            <div class="col-sm-6">
              <label for="text" class="form-label">우편번호</label>
              	<div>
            	  	<input type="text" id="sample6_postcode"  name="MEMBER_ZIPCODE" readonly  value="" maxlength="6" required="">  	
            	</div>
            </div>
            
            <div class="col-sm-6"></div>
            
            
            <div class="col-sm-8">
              <label for="text" class="form-label">주소</label>
              	<div>
            	  	<input type="text" id="sample6_address"  name="MEMBER_ADDRESS1"  readonly value="" size="48" readonly>  	
            	</div>
            </div>
                   
            <div class="col-sm-3">
              <label for="text" class="form-label">상세 주소</label>
              	<div>
            	  	<input type="text" id="sample6_address2"  name="MEMBER_ADDRESS2" value="" label="주소" placeholder="나머지주소"> 	
            	</div>
            </div>
          </div>


		<div class="row gy-3" style="margin-top:30px"> 
        
          <hr class="my-4">

            <div class="col-sm-8"> 
           		 	<input type="button" value="이용약관동의" onclick="moveAgreement()" class="btn btn-secondary btn-sm" >
					<input type="hidden" id="agreement" name="agreement" value="agUncheck" >
			</div>
			
            <div class="col-sm-2" >
         	  	<input type="button" value="이전페이지로" onclick="history.back();" class="btn btn-secondary btn-sm">
   			</div>
			
            <div class="col-sm-2" > 
       			 <input type="button" value="가입하기" onclick="joinform_check();" class="btn btn-secondary btn-sm">
			</div>
		</div>
	</form>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2021–2022 #21B ELTRUT</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

</body>
</html>