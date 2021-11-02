<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>

<title>비밀번호 확인</title>

<script>

if('${message}' != ""){
   alert('${message}');
}

function pw_check() {
var pw = document.getElementById("MEMBER_PASSWORD");

if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  document.info_form.submit();
}
</script>

</head>
<body>
<h4 class="mb-3">비밀번호를 입력하시면 회원정보 수정페이지로 넘어갑니다.</h4>
<form class="needs-validation" method="post" name="info_form" action="/ELTRUT/pwCheck" >   
   <div class="row g-3">
         <div class="col-md-7 col-lg-8" style="text-align: -webkit-center;">
   
            <div class="col-7">
              <label for="firstName" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="MEMBER_PASSWORD" style="max-width: max-content;">
            </div>
            <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="submit" style="max-width: max-content;">개인정보 수정하기</button>
        </div>
      </div>
        </form>
</body>
</html>