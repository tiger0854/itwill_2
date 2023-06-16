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
function orderwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = 'productorderWrite.jsp';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function orderedit() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = 'productorderEdit.jsp';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}


</script>


</head>

<body>


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 기초등록 - 자재</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 자재목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<!-- <button class=btn-add onclick="orderwrite()"><i class='bx bx-plus-medical'></i> 추가</button> -->
<button class=btn-add onclick="location.href='materialdetailUpload';"><i class='bx bx-plus-medical'></i> 추가</button>
</div>


<!-- 작업지시목록 검색박스 -->
<table class="product-box2"style="margin-top: 20px; width: 100%; " border="1">
 	
     <tr>
        <th>품목코드</th>
        <td>
		<input type="text" value="" placeholder="품번">
        </td>
        <th>품목이름</th>
        <td>
        <input type="text" value="" placeholder="품명">
        </td>
        <th>품목속성</th>
        <td>
        <select>
        	<option>원자재</option>
        	<option>부자재</option>
        </select>
        <td>
		</td>
      </tr>
  </table>
</div>

<!-- 작업지시목록 리스트 -->
<!-- 품목코드 , 식자재이름, 수량, 창고코드(냉장,냉동,상온) (페이징처리,검색기능)  -->
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 자재 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>품목코드</th>
        <th>품목이름</th>
        <th>품목속성</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${mdList }">
    <script>
      function materialDelete(){
    		if(confirm("자재명 : ${vo.material_code}를/을 정말로 삭제하시겠습니까?")){
    			location.href='materialdetailUpdate?material_code=${vo.material_code}';
    		}
    	}
      </script>
      <tr>
        <td>${vo.material_code }</a></td>
        <td>${vo.material_name }</td>
        <td>${vo.material_type }</td>
        <td><button class=btn-edit onclick="location.href='materialdetailUpdate?material_code=${dto.material_code}'"><i class='bx bx-edit'></i></button></td>
<!--         <td><button class=btn-edit onclick="orderedit()"><i class='bx bx-edit'></i></button></td> -->
        <td><button class=btn-delete onclick=materialDelete()><i class='bx bxs-trash'></i></button></td>
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