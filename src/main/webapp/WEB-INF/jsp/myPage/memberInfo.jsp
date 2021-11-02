<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}
.w-100 {
    width: 100%!important;
}
.btn-group-lg>.btn, .btn-lg {
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
    border-radius: 0.3rem;
}
.btn-primary {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
}
.btn {
    display: inline-block;
    font-weight: 400;
    line-height: 1.5;
    color: rgb(239 239 239);
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    background-color: #212529;
    border: #212529;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 0.25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
button {
    border-radius: 0;
}
*, ::after, ::before {
    box-sizing: border-box;
}
사용자 에이전트 스타일시트
button {
    appearance: auto;
    -webkit-writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
    margin: 0em;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
    border-radius: 2px;
}
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
*, ::after, ::before {
    box-sizing: border-box;
}
사용자 에이전트 스타일시트
input[type="text" i] {
    padding: 1px 2px;
}
사용자 에이전트 스타일시트
input {
    -webkit-writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
    border-radius: 2px;
}
.form-label {
    margin-bottom: 0.5rem;
}
label {
    display: inline-block;
}
사용자 에이전트 스타일시트
label {
    cursor: default;
}
.col-7 {
    flex: 0 0 auto;
    width: 58.33333333%;
}
form {
    display: block;
    margin-top: 0em;
}
.mb-3 {
    margin-bottom: 1rem!important;
}
.h4, h4 {
    font-size: calc(1.275rem + .3vw);
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 500;
    line-height: 1.2;
}
*, ::after, ::before {
    box-sizing: border-box;
}
사용자 에이전트 스타일시트
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.col-md-7 {
    flex: 0 0 auto;
    width: 58.33333333%;
}
.row>* {
    flex-shrink: 0;
    width: 60%;
    max-width: 60%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-top: var(--bs-gutter-y);
}
.g-5, .gy-5 {
    justify-content: center;
}
.g-5, .gx-5 {
    --bs-gutter-x: 3rem;
}

.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
}
.h2, h2 {
    font-size: calc(1.325rem + .9vw);
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.text-center {
    text-align: center!important;
}
.py-5 {
    padding-top: 3rem!important;
    padding-bottom: 3rem!important;
}
*, ::after, ::before {
    box-sizing: border-box;
}

사용자 에이전트 스타일시트
div {
    display: block;
}
.bg-light {
    --bs-bg-opacity: 1;
    background-color: rgba(var(--bs-light-rgb),var(--bs-bg-opacity))!important;
}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
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
        <form class="needs-validation" novalidate="">
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