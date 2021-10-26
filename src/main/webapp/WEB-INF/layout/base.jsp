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
	<tiles:insertAttribute name="header"/>

	<tiles:insertAttribute name="body"/>

	

	
<div style="float:left;">
<tiles:insertAttribute name="left"/> 
</div>
 	<tiles:insertAttribute name="footer"/>  
      
</body>
</html>