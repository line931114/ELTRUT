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
                font-size: 10pt;
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

function findform_check() {
var name = document.getElementById("MEMBER_NAME");
var email = document.getElementById("MEMBER_EMAIL");

if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
    return false;
  };
  document.find_form.submit();
}
</script>
<title>아이디 찾기</title>
</head>
<body>
<body>
                    <header>
            <h4>아이디 찾기</h4>
        </header>

       <form name="find_form" action="/ELTRUT/findForm1" method="post" style="text-align: -webkit-center;"> 

 <div class="container">
 	<div class="row" style="justify-content: center;margin-top: 20px;width: 50%;">
 		<div class="col-sm-7">
            <div class="input-box">
               	 	<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="  userName"/>
               	 	<label for="username">이름</label>
            </div>
		</div>			
			<div class="col-sm-7"> 
            	<div class="input-box">
                	<input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="  email@"/>
                <label for="EMAIL">EMAIL</label>
           	   </div> 
			</div>
		</div>
		
		<div class="row" style="width: 50%; ">	
			<div class="col-sm-6" style="text-align: right;">
			<input type="button" value="이전페이지" onclick="location.href='loginForm'">
			</div>
           <div class="col-sm-6" style="text-align: left;">
           <input type="button" value="아이디찾기"  onclick="findform_check()">
			</div>
		</div>
</div>
</form>
</body>
</html>