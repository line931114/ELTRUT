<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>idCheckForm.jsp</title>
   <script> 
   
   window.onload = function(){
	   var x = opener.document.getElementById("MEMBER_ID").value;
	   document.getElementById("checkId").value = x;
   };
   function blankCheck(f){ 
	   var id=f.checkId.value; checkId=id.trim(); 
	   if(id.length<5){ 
		   alert("아이디는 5자 이상 입력해주십시오."); return false; 
		   }
	   //if end 
	   return true; 
	   }
   window.addEventListener('load', function() {
       document.getElementById("clickme").onclick = function(){
           var checkId = document.getElementById("checkId").value;
           window.opener.document.getElementById("MEMBER_ID").value = checkId;
           window.opener.document.getElementById("idDuplication").value ="idCheck";
           window.close();
	 }});
	   </script> 
   
</head> 
<body> 
<div style="text-align: center">
 <h3>* 아이디 중복확인 *</h3>
  <form  name="idCheck" action="/ELTRUT/checkId" onsubmit="return blankCheck(this)">
   아이디 : <input type="text" id="checkId" name="checkId" value="${checkId }" maxlength="10" autofocus>     
   			<input type="submit" value="중복확인" >
   </form>
   <br>
   <input type="button" id="clickme"  value="사용하기"> 
   </div>

</body> 
</html>

