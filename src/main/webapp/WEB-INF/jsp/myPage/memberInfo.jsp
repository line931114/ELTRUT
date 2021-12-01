<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="/ELTRUT/css/myPage.css"/>
</head>
<body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>개인정보 조회</h2>
      
    </div>
    <div class="row g-5">
      
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">개인정보</h4>
        <form class="needs-validation" >
          <div class="row g-3">
            <div class="col-7">
              <label for="firstName" class="form-label">회원 ID</label>
              <input type="text" class="form-control" id="firstName" value="${M.MEMBER_ID }" readonly>
              
            </div>

            <div class="col-7">
              <label for="lastName" class="form-label">회원 이름</label>
              <input type="text" class="form-control" id="lastName" value="${M.MEMBER_NAME }" readonly >
              
            </div>

            <div class="col-7">
              <label for="username" class="form-label">회원 연락처</label>
                <input type="text" class="form-control" id="username" value="${M.MEMBER_PHONE }" readonly>
              
              </div>

            <div class="col-7">
              <label for="email" class="form-label">Email </label>
              <input type="email" class="form-control" id="email" value="${M.MEMBER_EMAIL }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address" class="form-label">우편번호</label>
              <input type="text" class="form-control" id="address" value="${M.MEMBER_ZIPCODE }" readonly>
              
            </div>

            <div class="col-7">
              <label for="address2" class="form-label">주소</label>
              <input type="text" class="form-control" id="address2" value="${M.MEMBER_ADDRESS1 }-${M.MEMBER_ADDRESS2}" readonly>
            </div>
          </div><br/>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="button" onclick="location.href='pwCheck';">개인정보 수정하기</button>
        </form>
      </div>
    </div>
  </main>

  
</div>


    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  

</body>
</html>