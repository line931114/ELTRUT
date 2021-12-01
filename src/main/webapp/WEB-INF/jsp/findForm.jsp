<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include-header.jspf" %>

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
<script type="text/javascript">

if('${message}' != ""){
	alert('${message}');
}

function findform_check() {
var name = document.getElementById("MEMBER_NAME");
var email = document.getElementById("MEMBER_EMAIL");
var check = document.getElementById("check");

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
  if(check.value != "Checksuccess"){
    alert("이메일인증을 해주세요");
    return false;
  };
  
  document.find_form.submit();
}

var email="";
$( document ).ready(function() {
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$("#emailBtn").on("click", function(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if($('#email').val().length==0){
			alert("이메일을 입력해주세요");
			$('#email').focus();
			return false;
		}else if(!reg_email.test($('#email').val())){
			alert("잘못된 이메일 형식입니다.");
			$('#email').focus(); 
			return false;
		}
		
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		
		$.ajax({
			type:"get",
			url : "<c:url value='/join/createEmailCheck'/>",/*선생님 근데 여기서 통신이되면 이쪽 url로 값을 전송하는거아닌가요? 애초에 이메일값이 전송이 안돼요 sysout찍었을때 안나와요  */
			data : "userEmail=" + $("#email").val() + "&random=" + $("#random").val(),
			//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
			/* encodeURIComponent
			예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
					email=$('#email').val();
					alert("이메일을 보냈습니다. 인증번호를 입력해주세요.");
				
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$("#emailAuthBtn").on("click", function(){
		$.ajax({
			type:"get",
			url:"<c:url value='/join/emailAuth'/>",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					$('#email').attr("readonly", true); 
					$('#emailAuth').attr("readonly", true);  
					$('#email').attr("check", "1");
					$('#emailBtn').hide(); 
					$('#emailAuthBtn').hide(); 
					$('#email').val(email);
					document.getElementById("check").value ="Checksuccess";
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			complete: function(){
				$('#loadingImg').hide();
				   $('#mask').hide();
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
});
</script>

<style>
	#mask {  
	  position:absolute;  
	  left:0;
	  top:0;
	  z-index:100;  
	  background-color:#000;  
	  display:none;  
	}
       #loadingImg {
	  position:absolute;
	  left:45%;
	  top:50%;
	  z-index:120;
	}
</style>
<!-- 로딩 검은색 스크립트 -->
<script>
function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':maskWidth,'height':maskHeight});  
	
	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	//$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.6);    
}
/*화면정가운데오는 이미지  */
function beforeSend() {
        var width = 0;
        var height = 0;
        var left = 0;
        var top = 0;



        width = 50;
        height = 50;
        top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
        left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

        if($("#loadingImg").length != 0) {
               $("#loadingImg").css({
                      "top": top+"px",
                      "left": left+"px"
               });
               $("#loadingImg").show();
        }
        else {
               $('body').append('<div id="loadingImg" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="<c:url value='/resources/icon-img/ajax-loader.gif'/>"></div>');
        }

 }
jQuery(function($) {
	
	/* 로딩 리사이즈 */
	$(window).resize(function(){
		var left = ( $(window).width() - 50 ) / 2 + $(window).scrollLeft();
        var top = ( $(window).height() - 50 ) / 2 + $(window).scrollTop();
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width(); 
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$("#loadingImg").css({
            "top": top+"px",
            "left": left+"px"
     	});
	 });

	$(document).ajaxStart(function(){
		   beforeSend();
		   wrapWindowByMask();
		})
		.ajaxStop(function(){
		   $('#loadingImg').hide();
		   $('#mask').hide();
		});
});
</script>



<title>아이디 찾기</title>
</head>
<div id = "mask"></div>

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
		
		
				
			<div class="col-sm-7"> 
    
       
	<div class="col-md-6 mb-3 input-group" >
        <input type="text" class="form-control" check="0" id="email" name="MEM_EMAIL" placeholder="이메일을 입력하세요" class="form-control" />
		<button type="button" class="btn btn-info" id="emailBtn">인증메일 발송</button>
		
		<label id="MEM_EMAILW"></label> 
		</div>
		<div class="col-md-6 mb-3 input-group">
		<input type="text" class="form-control" id="emailAuth" placeholder="인증번호 입력" class="form-control" />
		<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
	</div>
	
	<input type="hidden" id="check" name="check" value="" >
	

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