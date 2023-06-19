<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function etcwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/pro/etcWrite';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function etcEdit() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = '/pro/etcEdit';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}


</script>



</head>

<body>


<div class="height-100">
        <div class="container mt-3">
        
<div style="margin-top: 10px;">


<!-- 실적 리스트 -->
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 작업지시 현황</h4>  


  <table class="product-table"style="margin-top: 20px;width: 100%;">
   작업지시번호 : <span style="color: blue"><b>${param.wo_code}</b></span>
    <thead>
      <tr>
        <th>실적일자</th>
        <th>품명</th>
        <th>품번</th>
        <th>단위</th>
        <th>불량여부</th>
        <th>불량사유</th>
        <th>투입량</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>실적일자</td>
        <td>품명</td>
        <td>품번</td>
        <td>단위</td>
        <td>불량여부</td>
        <td>불량사유</td>
        <td>투입량</td>
      </tr>
      
      <tr>
        <td>실적일자</td>
        <td>품명</td>
        <td>품번</td>
        <td>단위</td>
        <td>불량여부</td>
        <td>불량사유</td>
        <td>투입량</td>
      </tr>
      
     
      
      <tr>
        <td>실적일자</td>
        <td>품명</td>
        <td>품번</td>
        <td>단위</td>
        <td>불량여부</td>
        <td>불량사유</td>
        <td>투입량</td>
      </tr>
      
      
      
      <tr>
        <td>실적일자</td>
        <td>품명</td>
        <td>품번</td>
        <td>단위</td>
        <td>불량여부</td>
        <td>불량사유</td>
        <td>투입량</td>
      </tr>
      
        
      
      <tr>
        <td>실적일자</td>
        <td>품명</td>
        <td>품번</td>
        <td>단위</td>
        <td>불량여부</td>
        <td>불량사유</td>
        <td>투입량</td>
      </tr>
      
    </tbody>
  </table>
   </div>
  
  <!-- 페이징처리 -->
  
<!--   		  	<div class="container" style="margin-top: 30px; margin-bottom: 30px"> -->
<!-- 			  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;"> -->
<%-- 		  <c:if test="${startPage > pageBlock }">  --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage-pageBlock} "><sapn> < </sapn></a></li> --%>
<%-- 			</c:if> --%>
<%-- 		    <c:forEach var="i" begin="1" end="5" step="1"> --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${i }"><span>${i }</span></a></li> --%>
<%-- 			</c:forEach> --%>
<%-- 		    <c:if test="${endPage<pageCount }"> --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage+pageBlock} "><span> > </span></a></li> --%>
<%-- 			</c:if> --%>
<!-- 		  </ul> -->
<!--   		</div> -->
  		
  		
  	<!-- 임시 페이징처리 출력용 -->
  		<div class="container" style="margin-top: 40px; margin-bottom: 30px">
  		<ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
  			<li class="page-item"><a class="page-link" href="#"><sapn> < </sapn></a></li>
  			<c:forEach var="i" begin="1" end="5" step="1">
			<li class="page-item"><a class="page-link" href="#"><span>${i }</span></a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="#"><span> > </span></a></li>
		 </ul>
  		</div>
  		
  		<br>
</div>
</div>



</body>
</html>