<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
</head>
<body>

<div id="memberInfo">
<div id="findIdPwd_result" style="
    text-align: center;
">
<br>
<br>

                <h4 class="desc">비밀번호 찾기 결과</h4>
                    <br>
                                  <div id="find_Success">
                            <dl>
                                <dt>고객님의 비밀번호는 <strong>${findPw.MEMBER_PASSWORD }</strong> 입니다.</dt>
                                <dd><strong>고객님</strong>의 즐거운 쇼핑을 위해 노력하겠습니다.</dd>
                            </dl>
                        </div>
        <p class="button">
                        <br>
                                        <div class="btn-area">
                        <a href="/ELTRUT/loginForm"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="로그인" /></a>
                 </div>
                </div>
                
                
                


</html>
</html>