<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

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
function updateform_check() {
  //변수에 담아주기
  var email = document.getElementById("MEMBER_EMAIL");
  var phone = document.getElementById("MEMBER_PHONE");
  var pw = document.getElementById("MEMBER_PASSWORD");
  var repw = document.getElementById("MEMBER_PASSWORD2");
  

  
  if (email.value == "") {
	    alert("이메일 주소를 입력하세요.");
	    email.focus();
	    return false;
	}
  if (phone.value == "") {
	    alert("전화번호를 입력하세요.");
	    phone.focus();
	    return false;
	}


/* 	  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	  var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/;

	  if (!pwCheck.test(pw.value)) {
	    alert("비밀번호는 영문자+숫자 조합으로 4~25자리 사용해야 합니다.");
	    pw.focus();
	    return false;
	  };

	  if (pw.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pw.focus();
		    return false;
		};
	  
	  
	  if (repw.value !== pw.value) {
	    alert("비밀번호가 일치하지 않습니다..");
	    repw.focus();
	    return false;
	  };
 */
	  
	  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
	  if (!reg.test(phone.value)) {
	    alert("전화번호는 숫자만 입력할 수 있습니다.");
	    phone.focus();
	    return false;
	  }

  
  
  
  document.updateForm.submit(); //유효성 검사의 포인트   
}
</script>

</head>
<body>
회원정보수정
	<form method="post" name="updateForm" action="memberUpdateForm">	
	<table border="1">
	
	<tr>
	<td><strong>아이디</strong></td>
	<td><input type="text" readonly name="MEMBER_ID" id="MEMBER_ID" value="${M.MEMBER_ID }" maxlength="20" label="이름"></td>
	</tr>

	<tr>
	<td><strong>이름</strong></td>
	<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="${M.MEMBER_NAME }" maxlength="20" label="이름"></td>
	</tr>
		
	<tr>
	<td><strong>이메일</strong></td>
	<td><input type="text"  name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="${M.MEMBER_EMAIL }" maxlength="20" label="이름"></td>
	</tr>
	<tr>
	<td><strong>핸드폰 번호</strong></td>
	<td><input type="text"  name="MEMBER_PHONE" id="MEMBER_PHONE" value="${M.MEMBER_PHONE }" maxlength="20" label="이름"></td>
	</tr>
	
<!-- 	<tr>
	<td><strong>비밀번호</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" value="" maxlength="21" label="비밀번호"></td>
	</tr>
	<tr>
	<td><strong>비밀번호확인</strong></td>
	<td><input type="password" name="MEMBER_PASSWORD2" id="MEMBER_PASSWORD2" value="" maxlength="21" label="비밀번호"></td>
	</tr> -->
	
	<tr>
	<td><strong>
	<input type="button"value="주소찾기" onclick="sample6_execDaumPostcode()"></strong></td></tr>
	
	<tr>
	<td><input type="text" id="sample6_postcode"  name="MEMBER_ZIPCODE" readonly  value="${M.MEMBER_ZIPCODE }" maxlength="6" required=""></td>
	</tr>
	<tr>
	<td><input type="text" id="sample6_address"  name="MEMBER_ADDRESS1"  readonly value="${M.MEMBER_ADDRESS1 }" size="48" readonly></td>
	<td><input type="text" id="sample6_address2"  name="MEMBER_ADDRESS2" value="${M.MEMBER_ADDRESS2 }" label="주소" ></td>
	</tr>
	
	
	</table>
	</form>
	 <input type="button" value="회원정보수정하기" onclick="updateform_check()">
</body>
</html>