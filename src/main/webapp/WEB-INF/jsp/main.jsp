<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<jsp:include page="../cssUrl.jsp"/>

</head>
<body>


<div class="row" style="place-content: center;">
<c:set var="goods" value="#{goods }"/>
<c:choose>
         <c:when test="${fn:length(goods) > 0}">
            <c:forEach  items="${goods }" var="G" varStatus="idx">
               <tr id="goods${idx.count}">
          <div class="col-xs-4 col-md-3">
          <a href="goodsDetail?GOODS_NUMBER=${G.GOODS_NUMBER }" id="GoodsName" name="GoodsName" class="thumbnail" >
            <img src="/ELTRUT/file/goodsFile/${G.GOODS_THUMBNAIL}" class="img-thumbnail" style="width:300px; height:400px;">
            </a>       
        <a href="goodsDetail?GOODS_NUMBER=${G.GOODS_NUMBER }  id="GoodsName" name="GoodsName" style="color: black;">
        <br>${G.GOODS_NAME } <br> ${G.GOODS_PRICE }원 </a>
          </div>
                   
               </tr>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="4">조회된 결과가 없습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>
    </div>
   
   
    
      <script type="text/javascript">
      
      window.onload = function(){
      var goods_number = document.getElementById('GOODS_NUMBER').value;
      
         document.getElementById("goods_name").onclick = function(){
            location.href="goodsDetail?GOODS_NUMBER="+goods_number;
         }
      };
      </script> 
      
      
      

      
      
      
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 --> 
<script src="js/bootstrap.min.js"></script>
      
      
</body>
</html>