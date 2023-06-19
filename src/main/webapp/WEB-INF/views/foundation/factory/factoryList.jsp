<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function factoryUpload() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/foundation/factory/factoryUpload';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function factoryUpdate() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = '/foundation/factory/factoryUpdate';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

function factoryDelete(factory_code, factory_name) {
	  if (confirm("공장명 : " + factory_name + "를/을 정말로 삭제하시겠습니까?")) {
	    location.href = 'factoryDelete?factory_code=' + factory_code;
	  }
	}
</script>



</head>

<body>

<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 공장관리</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 창고목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 공장 조회</button>
<!-- <button class=btn-add onclick="location.href='warehouseWrite'"><i class='bx bx-plus-medical'></i> 창고 추가</button> -->
<button class=btn-add onclick=factoryUpload()><i class='bx bx-plus-medical'></i> 공장 추가</button>
</div>

<!-- 창고목록 검색박스 -->
<table class="product-box3"style="margin-top: 20px; width: 100%; " border="1">
 
     <tr>
        <th>공장명</th>
        <td><input type="text" value="" placeholder="창고명"></td>
        <th>공장 코드</th>
        <td><input type="text" value="" placeholder="창고코드"></td>
      </tr>
  </table>
</div>

<!-- 창고 리스트 -->
<!-- 	창고명, 창고코드, 관리자명, 사용여부, 구분 ,수정/삭제 표시 -->
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 공장 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>공장코드</th>
        <th>공장명</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${factoryList }" >
      <tr>
        <td>${vo.factory_code }</td>
        <td>${vo.factory_name }</td>
        <td><button class=btn-edit onclick="location.href='factoryUpdate?factory_code=${vo.factory_code}';" ><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete onclick="factoryDelete('${vo.factory_code}', '${vo.factory_name}')" ><i class='bx bxs-trash'></i></button></td>
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
  
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