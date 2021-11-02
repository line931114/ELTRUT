<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<header style="height: 10%;">
	<tiles:insertAttribute name="header"/>
	
</header>


<nav style="width: 20%; float: left; margin-top: 70px">
<tiles:insertAttribute name="left"/> 
</nav>


<div style="width: 80%; float: left;">
<tiles:insertAttribute name="body"/> 
</div>


<footer style="width: 100%; float: left;">
 	<tiles:insertAttribute name="footer"/> 
 </footer> 
      
</body>
</html>