<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

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

  if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
/*   if(form.idDuplication.value != "idCheck"){
      alert("아이디 중복체크를 해주세요.");
      return false;
  } */

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
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 4~25자리 사용해야 합니다.");
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
function idCheck(){ 
	//새창 만들기 
	window.open("idCheckForm", "idwin", "width=400, height=350"); }

/* //아이디 중복체크 팝업창(현재 공백문서)
function id_check() {
  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
  window.open("", "", "width=600, height=200, left=200, top=100");
}

//이메일 옵션 선택후 주소 자동 완성
function change_email() {
  var email_add = document.getElementById("email_add");
  var email_sel = document.getElementById("email_sel");

  //지금 골라진 옵션의 순서와 값 구하기
  var idx = email_sel.options.selectedIndex;
  var val = email_sel.options[idx].value;

  email_add.value = val;
}

//우편번호 검색 팝업창(현재 공백문서)
function search_address() {
  window.open("", "b", "width=600, height=300, left=200, top=100");
} */
</script>




<title>Insert title here</title>
</head>
<body>
	<form method="post" name="join_form" action="/ELTRUT/joinComplete">	
	<table border="1">
	<h3>회원정보</h3>
	
	<tr>
	<td><strong>아이디</strong></td>
	<td><input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" label="아이디">
	<input type="button" value="ID중복확인" onclick="idCheck()"></td>
	</tr>
	
	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="" maxlength="20" label="이름"></td>
	</tr>
	
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="" maxlength="20" label="이메일"></td>
	</tr>
	
	<tr>
	<td><strong>비밀번호</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="비밀번호"></td>
	</tr>
	<tr>
	<td><strong>비밀번호확인</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD2" id="MEMBER_PASSWORD2" value="" maxlength="21" label="비밀번호"></td>
	</tr>
	
	<tr>
	<td><strong>핸드폰번호</strong></td>
	<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="" maxlength="20" label="핸드폰번호"></td>
	</tr>

	<tr>
	<td><strong>
	<input type="button"value="주소찾기" onclick="sample6_execDaumPostcode()"></strong></td></tr>
	
	<tr>
	<td><input type="text" id="sample6_postcode"  name="MEMBER_ZIPCODE" readonly  value="" maxlength="6" required=""></td>
	</tr>
	<tr>
	<td><input type="text" id="sample6_address"  name="MEMBER_ADDRESS1"  readonly value="" size="48" readonly></td>
	<td><input type="text" id="sample6_address2"  name="MEMBER_ADDRESS2" value="" label="주소" ></td>
	</tr>

	<!-- <tr>
	<td><strong>우편번호</strong></td>
	<td><input type="text" name="MEMBER_ZIPCODE" id="MEMBER_ZIPCODE" value="" maxlength="20" label="우편번호"></td>
	</tr>
	
	<tr>
	<td><strong>주소</strong></td>
	<td><input type="text" name="MEMBER_ADDRESS1" id="MEMBER_ADDRESS1" value="" maxlength="20" label="주소"></td>
	<td><input type="text" name="MEMBER_ADDRESS2" id="MEMBER_ADDRESS2" value="" maxlength="20" label="주소"></td>
	</tr> -->


	</table>
	
	<input type="button" value="이전페이지로" onclick="history.back();">
    <input type="button" value="가입하기" onclick="joinform_check();">
	</form>
	
</body>
</html>