<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style> .centered { position: absolute; left: 50%; transform: translateX(-50%); } </style>
<style>
 header{
                display:flex;
                justify-content: center;
            }
            form{
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 0;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            input::placeholder{
                color:transparent;
            }
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            input[type=button]{
                background-color: #8aa1a1;
                border:none;
                color:white;
                border-radius: 5px;
                width:60%;
                height:35px;
                font-size: 14pt;
                margin-top:25px;
                
            }
            #forgot{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
</style>
<script>
if('${message}' != ""){
	alert('${message}');
}
function loginform_check() {
var id = document.getElementById("MEMBER_ID");
var pw = document.getElementById("MEMBER_PASSWORD");

if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };

  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };
  document.login_form.submit();
}
</script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init("a002b580fa3347283a090730a39fb5f8");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname,account_email,talk_message', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                   var user_email =res.kakao_account.email;
                    window.location.href='/ELTRUT/kakaoLogin?user_email='+user_email //리다이렉트 되는 코드
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
</script>



<title>로그인</title>
</head>
<body>
<body>
                    <header>
            <h2>LOGIN</h2>
        </header>

        <form name="login_form" action="/ELTRUT/login" method="post" style="text-align: -webkit-center;"> 

 <div class="container">
 	<div class="row" style="justify-content: center;margin-top: 20px;width: 50%;">
 		<div class="col-sm-7">
            <div class="input-box">
               	 	<input type="text" id="MEMBER_ID" name="MEMBER_ID" placeholder="  userID"/>
               	 	<label for="username">아이디</label>
            </div>
		</div>			
			<div class="col-sm-7"> 
            	<div class="input-box">
                	<input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" placeholder="  userPassword"/>
                <label for="password">비밀번호</label>
           	   </div> 
			</div>
		</div>
		
		<div class="row" style="width: 50%; ">	
			<div class="col-sm-6" style="text-align: right;">
			<input type="button" value="로그인" onclick="loginform_check();">
			</div>
           <div class="col-sm-6" style="text-align: left;">
           <input type="button" value="회원가입"  onclick="location.href='/ELTRUT/joinStep1'">
			</div>
		</div>
		
		<div>
			<a href="javascript:kakaoLogin();"><img src="/ELTRUT/file/kakao_login.png" alt="카카오계정 로그인" style="height: 50px;margin-top: 1%;"/></a>
		</div>
		
		
</div>

<div class="centered">
<br><br>
<p>아이디/비밀번호를 잊으셨나요? <a href="/ELTRUT/findForm" data-label="아이디/비밀번호 찾기" style="color: royalblue;">여기</a>를 클릭 하여 확인하실 수 있습니다.</p>
</div>

        </form>

</body>
</html>