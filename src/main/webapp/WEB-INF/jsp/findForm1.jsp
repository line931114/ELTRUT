<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<body>


<%-- 
        <h3><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/h3_find_id.gif" alt="아이디 찾기" /></h3>
        <p class="desc">고객님 아이디 찾기가 완료 되었습니다.</p>
        <div class="memberInfo">
            <p class="info">저희 쇼핑몰를 이용해주셔서 감사합니다.<br />다음정보로 가입된 아이디가 총 <span>{$idCnt}</span>개 있습니다.</p>
            <p class="thumb"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif" alt="" /></p>
            <ul>
                <li>고객님의 ID는 <strong>${findId.MEMBER_ID }</strong> 입니다</li>
                <li><strong>${findId.MEMBER_NAME}</strong> 고객님 즐거운 쇼핑 하세요!</li>
            </ul>
        </div>
        <p class="copy">
            고객님의 아이디 찾기가 성공적으로 이루어졌습니다. 항상 고객님의 <br />
            즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
        </p>
        <p class="button">
            <a href="javascript:go_findlogin('{$id}');"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="로그인" /></a>
            <a href="javascript:go_findpwd('{$id}','{$mtype}');"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif" alt="비밀번호 찾기" /></a>
        </p>
 --%>




<div id="memberInfo">
<div id="findIdPwd_result" style="
    text-align: center;
">
<br>
<br>

                <h4 class="desc">아이디 찾기 결과</h4>
                    <br>
                                  <div id="find_Success">
                            <dl>
                                <dt>고객님의 아이디는 <strong>${findId.MEMBER_ID }</strong> 입니다</dt>
                                <dd><strong>${findId.MEMBER_NAME }</strong> 고객님 즐거운 쇼핑 하세요!</dd>
                            </dl>
                        </div>
        <p class="button">
                        <br>
                                        <div class="btn-area">
                        <a href="/ELTRUT/loginForm"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="로그인" /></a>
         			   <a href="/ELTRUT/findForm2"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif" alt="비밀번호 찾기" /></a>
                 </div>
                </div>
                
                
                


</html>