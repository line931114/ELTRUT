<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <%request.setCharacterEncoding("UTF-8"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
var id = document.getElementById("MEMBER_ID");

if (name.value == "") {
    alert("이름를 입력하세요.");
    name.focus();
    return false;
  };
  
if (id.value == "") {
    alert("아이디를 입력하세요.");
    id.focus();
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

</head>
<body>
<h4 style="
    text-align: center;
">비밀번호 찾기</h4>

<form name="find_form" action="/ELTRUT/findForm3" method="post" style="text-align: -webkit-center;"> 

 <div class="container">
 	<div class="row" style="justify-content: center;margin-top: 20px;width: 50%;">
 		<div class="col-sm-7">
            <div class="input-box">
               	 	<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="  userName">
               	 	<label for="username">이름</label>
            </div>
		</div>	
		<div class="col-sm-7"> 		
			<div class="input-box">
               	 	<input type="text" id="MEMBER_ID" name="MEMBER_ID" placeholder="  userID">
               	 	<label for="userid">아이디</label>
            </div>
            </div>
			<div class="col-sm-7"> 
            	<div class="input-box">
                	<input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="  email@">
                <label for="EMAIL">EMAIL</label>
           	   </div> 
			</div>
		</div>
		
		<div class="row" style="width: 50%; ">	
			<div class="col-sm-6" style="text-align: right;">
			<input type="button" value="로그인" onclick="location.href='loginForm'">
			</div>
           <div class="col-sm-6" style="text-align: left;">
           <input type="button" value="비밀번호찾기" onclick="findform_check()">
			</div>
		</div>
</div>
</form>
</body>
</html>