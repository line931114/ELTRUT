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

h1, p{
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
    font-weight: 500;
    font-size: 50px;
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
    <title>INFO</title>

    <link rel="stylesheet" type="text/css" href="style.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,400;0,500;0,600;0,800;0,900;1,200;1,400;1,500;1,600;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


</head>
<body>

    <div class="frame">
        
        <nav class="navigator">
            <a href="main0"><h3 class="site-name">ELTRUT- 손수완</h3></a>
        </nav>

		<nav class="navigator">
        
        <a href="INFO"><h3 class="site-name">프로젝트개요</h3></a>
        </nav>
		

        
        <div class="profile-section">
            <img id="profile-picture" src="file/green.png">
            <div class="introduction">
                <h2>ABOUT ME</h2>
                <p>""
                <br>@@ 
                <br>@@</p>
                <h2>CAPABILITY</h2>
                <p  id="capability" style="text-align: left;">

    -프로젝트 시작 전 문서화작업(유스케스 다이어그램, 프로젝트 흐름도, jsp경로 흐름도)<br>
	-프로젝트 간 관리자 파트 작업(주문관리,멤버관리,관리자 페이지,관리자 tiles)<br>
	-프로젝트간 관리자 UI작업 <br>
	-DB 테이블 설계 및 쿼리작업<br>
    
                

            </div>
        </div>

        <h5 class="value-menu">TOGEHER EXPERIENCE</h5>

        <div class="value-section">
            
            <div class="value">
                <img class="value-icon" src="file/together.png">
                <div class="value-intro">
                    <h4 class="value-name">ELTRUT 프로젝트를 통해 경험한 것</h4>
                    <p class="value-exp" style="text-align: left;">
                   <br> 
	- 요구사항명세서, DB설계, 자료사전 제작<br> 
	- DB설계를 토대로 테이블 생성<br> 
	- 카카오오븐을통한 화면구성(UI) 설계 <br> 
	- 작업 툴 설정(메이븐 디렉토리 설계, POM.xml)<br> 
	- web.xml, tiles.xml 설정<br> 
	- MapArgumentResolver(argument-resolvers),CommandMap,AbstractDAO(기본CRUD쿼리 추상DAO) 제작<br> 
	- 부트스트랩,CSS 활용한 프론트엔드 제작 
					</p>
                </div>
            </div>




        <footer class="footer">
            <h3 class="contact">CONTACT ME</h3>
            <div class="links">
                <a class="blog" href="#">BLOG</a>
                <a class="instagram" href="#">INSTAGRAM</a>
                <a class="blog" href="https://github.com/line931114/ELTRUT">GIT HUB</a>
            </div>
            <p class="footer-comment"><br>Feel free to contact me!<br>Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a></p>
        </footer>
        

    </div>
</div>
</body>
</html>
