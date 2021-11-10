<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>

.container{
    display: flex;
    flex-flow: row;
    background-color: skyblue;
    height: 100vh;

    justify-content: center;
    align-items: flex-start;
    align-content: flex-start;
}


.item{
    width: 100%;
    height: 50px;
    background-color: pink;
    border: 1px solid black;
}




body{
    margin:0;
}

.grid{
    display: grid;
    grid-template-columns: 1fr 3fr 1fr;
}

.sidebar-a{
    border-top: 1px solid rgb(253, 171, 19);
    border-bottom: 1px solid rgb(253, 171, 19);
    height: 100vh;  
}

.main{
    border: 1px solid rgb(253, 171, 19);
    height: 100vh; 
}

.sidebar-b{
    border-top: 1px solid rgb(253, 171, 19);
    border-bottom: 1px solid rgb(253, 171, 19);
    height: 100vh;  
}

h1{
    text-align: center;    
}

body{
    background-color: #EFE7E3;
}

.frame{
    margin: 30px 150px;
    display: flex;
    flex-direction: column;
}


/*navigator*/

.navigator{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

li{
    display: inline;
    align-self: center;
    margin:0;
    margin-left: 15px;
}

ul{
    margin:0;
}

.site-name{
    margin:0;
    font-family: 'Montserrat', sans-serif;
    font-size: 24px;
    color: #C2B4AB;
}

.nav-menu{
    font-family: 'Montserrat', sans-serif;
    font-weight: 400;
    font-size: 16px;
}

a{
    color: black;
    text-decoration: none;
}

a:hover{
    color: white;
    transition: 0.3s;
}


/*dashboard*/


.dashboard{
    display: flex;
    flex-direction: column;
    margin-top: 100px;
    margin-bottom: 70px;
}

.korean-comment{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    font-size: 30px;
}

.sample{
    background-color: pink;
    -webkit-text-stroke: 1px black;
}

.sample:hover{
    background-color: transparent;
    color: white;
    -webkit-text-stroke: 1px black;
    transition: none;
}

.highlight{
    color: white;
    -webkit-text-stroke: 1px black;
}

.highlight:hover{
    background-color: pink;
    color: black;
    transition: none;
}

.type1:hover{
    background-color: yellowgreen;
}

.type2:hover{
    background-color: skyblue;
}

.type3:hover{
    background-color: orange;
}

.english-comment{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 15px;
    font-style: italic;

    letter-spacing: -0.3px;
}


/*recent works*/

.recent-menu{
    font-family: 'Montserrat', sans-serif;
    font-size: 15px;
    font-weight: 700;
    color: #C2B4AB;
    
    text-align: right;
    margin-top: 100px;
}



/*footer*/


.footer{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 200px;
}

.contact{
    font-family: 'Montserrat', sans-serif;
    font-size: 50px;
    font-weight: 700;
    color: black;
    margin-bottom: 40px;
    border-bottom: 2px solid black;
}

.links>a{
    font-family: 'Montserrat', sans-serif;
    font-size: 30px;
    font-weight: 400;
    margin-left: 15px;
}

.footer>p{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 15px;
    font-style: italic;
    margin: 0;
    margin-top: 5px;
}




/* INFO Section*/


/*profile-section*/

.profile-section{
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;

    margin: 100px 100px;
}


#profile-picture{
    width: 400px;
    margin-right: 60px;
}

.introduction>h2{
    margin: 0px;
    font-family: 'Montserrat', sans-serif;
    font-size: 35px;
}

.introduction>p{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: 16px;

    margin-bottom: 40px;
}

#capability{
    font-family: 'Montserrat', sans-serif;
    font-weight: 400;
    font-size: 20px;
    font-style: italic;

    line-height: 30px;
}


/*value section*/

.value-menu{
    font-family: 'Montserrat', sans-serif;
    font-size: 35px;
    margin: 30px 100px;
}

.value-section{
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-content: center;
    margin: 100px 150px;
    margin-top: 20px;
}

.value{
    display: flex;
    flex-direction: row;
    margin-bottom: 40px;
    align-items: center;

}


.value-icon{
    width: 100px;
    height: 100px;

    border: 2px solid #C2B4AB;
    border-radius: 100px;
    padding: 15px;
}

.value-intro{
    margin-left: 30px;
}


.value-name{
    font-family: 'Montserrat', sans-serif;
    font-weight: 700px;
    margin-top: 0px;
    margin-bottom: 10px;
}

.value-exp{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: 16px;

    margin: 0px;
}




/*footer section*/

.footer-comment{
    text-align: center;
}


a[title="Freepik"]:hover{
    color: black;
    text-decoration: underline;
}

a[title="Flaticon"]:hover{
    color: black;
    text-decoration: underline;
}


/* RECENT WORKS */

.recent-works{
    display: flex;
    flex-direction: column;
}

.article{
    display: flex;
    flex-direction: row;
    margin-bottom: 120px;
    align-items: center;
}

.thumbnail{
    width: 600px;
}

.article-info{
    margin: 0px 20px;
}

.article-name{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 50px;
    margin-top: 0px;
    margin-bottom: 30px;
}

.article-name:hover{
    color: pink;
    -webkit-text-stroke: 1px black;
    transition: 0.3s;
}



.article-comment{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
    font-weight: 100;
}

.more{
    width: content;
    height: content;
    float: right;
    margin-right: 10px;


    font-family: 'Montserrat', sans-serif;
    font-size: 14px;
    background-color: transparent;
    border: none;
    outline: none;
    padding: 0px;
}


#name1{
    position: relative;
    right: 70px;
}

#name1:hover{
    color: skyblue;
}

#name2-1{
    text-align: right;
    position: relative;
    left: 0px;
    margin-bottom: 0px;
}

#name2-2{
    text-align: right;
    position: relative;
    left: 100px;
}

#name2-2:hover{
    color: orange;
}

</style>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PORTFOLIO</title>

    <link rel="stylesheet" type="text/css" href="style.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,400;0,500;0,600;0,800;0,900;1,200;1,400;1,500;1,600;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>

<body>
    
    <div class="frame">

        <nav class="navigator">
            <h3 class="site-name">ELTRUT 개요</h3>
            <ul>
                <li><a class="nav-menu" href="main0">페이지돌아가기</a></li>
                </ul>
        </nav>
        

        <div class="dashboard">
            <h1 class="korean-comment">안녕하세요! 저희 팀은 <a class="sample">#21B</a>라는 팀명을 사용합니다! </h1>
             <h1 class="korean-comment">소개해드릴 프로젝트 이름은 <a class="sample">ELTRUT</a>입니다! <br></h1>        
        </div>

        <h5 class="recent-menu">프로젝트개요</h5>

        <div class="recent-works">
            <div class="article" id="arti1">
                <img class="thumbnail" id="zara" src="file/zara.png">
                <div class="article-info">
                    <h3 class="article-name" id="name1" style="right:auto">벤치마킹 ZARA</h3>
                    <p class="article-comment">저희 팀은 <strong>여성쇼핑몰</strong>을 주제로 프로젝트를 진행했습니다.<br>
벤치마킹한 사이트는 <strong>ZARA</strong> 라는 사이트로 정하였고,  ZARA에서 사용되는 UI를 토대로 프로젝트의 설계를 시작했습니다.<br>
개발 프레임워크로는 <strong>Spring 4.0과 Mybatis</strong>을 사용하였으며,  6주간 진행되는 프로젝트에 구현할 수 있는 기능들을 최대화하여 1차 프로젝트를 진행했습니다.
이 과정에서 기본적인 유효성검사, <strong>오픈 API</strong> (다음지도,카카오페이,카카오로그인) 등을 활용하며 자바스크립트를 통한 백엔드 과정도 많이 연결지어 작업을 했습니다.<br>
                    </p>

                </div>
            </div>
	
            <div class="article" id="arti2">
                <div class="article-info">
                    <h3 class="article-name" id="name2-1" style="text-align:left">구현기능</h3>
                    <p class="article-comment" id="comment2"><strong>1) 계정관련</strong> - 회원가입, 로그인, 로그아웃,  회원탈퇴, 마이페이지(주문&반품&교환조회/구매후기/상품문의/1:1문의/개인정보확인)<br><br>

<strong>2) 회원/상품관련 </strong>- 신상&인기별 상품 리스트, 대분류 카테고리별 리스트, 소분류 카테고리별 리스트, 상품명 검색(타일즈 헤더 메뉴바 기능), 장바구니 기능구현, 상품페이지에서의 상품문의, 상품후기 확인 기능<br><br>

<strong>3) 관리자관련</strong> - 관리자 홈, 상품등록, 상품수정, 상품삭제, 회원목록조회,탈퇴회원조회, 전체주문목록조회, 주문/배송상태 변경, 주문취소/반품/교환 목록
             Q&A 관리(상품/1:1문의 답변기능), 구매후기 관리(수정,삭제,답글달기가능), 매출정산 확인기능<br><br>
            
<strong>4) 기타</strong> - 전체적인 웹 구현을 <strong>tiles</strong>로 작업하며 main_footer 에서 사용되는 FOLLOW US의 이름을 클릭했을 때 본인은 소개할 글로 이동할 수 있도록 되어있습니다<br>
		<strong>4-1) Interceptor 기능</strong>을 용도에 맞게 활용하여 장바구니에 있는 상품 수량을 모든페이지에 적용
<br>
                    </p>
                </div>
                <img class="thumbnail" id="thumb2" src="file/info.png">
            </div>
            
            
            <div class="article" id="arti1">
                <img class="thumbnail" id="zara" src="file/info2.jpg">
                <div class="article-info">
                    <h3 class="article-name" id="name1" style="right:auto">설계의 주안점</h3>
                    <p class="article-comment">
<strong>1. ELTRUT는 벤치마킹한 ZARA</strong>를 토대로 구현된 프로젝트이며, ZARA의 기능들을 고려하며 첫 프로토타입 UI를 만들었고,  프론트엔드 과정에서도 최대한 깔끔하고 UI에 맞는 프론트엔드를 구현하려고 노력했습니다.<br><br>

<strong>2. 저희 팀은 시작의 목표를 '모든 것들을 다 같이 해보자' </strong>라는 것을 설정하고 설계부터 프로토타입 만들기, 프론트엔드, 백엔드 모든 것들을 골고루 분배해 작업했습니다.  그래서 팀원 중 한명이 혼자서 프로젝트를 진행해도 스스로 하나부터 열까지 설계하고,작업할 수 있는 능력을 갖출 수 있도록 적절한 작업분배를 통해 프로젝트를 진행했습니다.<br><br>

<strong>3. 백엔드 과정</strong>에서 가장 기본적인 <strong>MVC패턴</strong>을 활용했고, DAO,SERVICE,CONTROLLER,VIEW 페이지로 이동하는 모든 과정들을 이해하며, 그에 맞는 기능들을 사용하고 활용했습니다.<br>
<strong>3-1. DAO와 연결되는 Mybatis를 적극 활용 </strong>하여,  사용했기 떄문에 기본적인 DB의 연결 구조와, 생성방법을 정확히 알고 메소드를 만들고 활용했습니다.<br>
<strong>3-2  View(JSP)페이지에서 사용되는 자바스크립트와 jQuery </strong>를 적극 활용하여 기본적인 유효성검사를 진행했으며, 자바스크립트를 통한 오픈 API 연결하는 과정 또한 숙지하여 카카오페이, 다음지도, 카카오로그인을 활용하여 특정 JSP 페이지를 구성했습니다.<br><br>

<strong>4 프론트엔드 과정</strong>에서는 어려움을 많이 느낀 것이 사실이지만 Css(Style)는 부트스트랩(Css프레임워크)을 활용하여 전체적인 틀을 잡았으며,  https://getbootstrap.com/ 사이트를 활용한 처음 설계해놓은 프로토타입 UI에 맞는 깔끔한 UI를 만들기 위해 노력했습니다.<br>
저희 조원들은 이번 프로젝트를 통해서 기본적인 프로젝트 설계부터, 백엔드, 프론트 엔드 모든 과정을 겪어보며 현업 프로젝트의 바로 투입 될 수 있을 정도의 많은 기술들을 익혔습니다.<br>
                   </p>

                </div>
            </div>
            
             <div class="article" id="arti2">
                <div class="article-info">
                    <h3 class="article-name" id="name2-1" style="text-align:left">사용기술 및 개발환경</h3>
                    <p class="article-comment" id="comment2">
                    <strong>사용기술</strong> - spring framework 4.0, Mybatis 3.2.3, JAVA, JSP, HTML/CSS(+Bootstrap) JavaScript(+jQuery), json, xml<br>	<br>
					<strong>개발환경</strong> - 이클립스(+퀀텀db), 톰켓6.0 , oracle 11g<br>
                    </p>
                </div>
                <img class="thumbnail" id="thumb2" src="file/info3.png">
            </div>
            
                  
        </div>


    </div>


</body>
</html>