<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">

<script>
function itemwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/item/itemWrite';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function itemedit() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = '/item/itemEdit';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}



</script>



</head>

<body>



<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 품목 관리</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 상품목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<button class=btn-add onclick="itemwrite()"><i class='bx bx-plus-medical'></i> 추가</button>
</div>

<!-- 품목 검색박스 -->
<table class="product-box3"style="margin-top: 20px; width: 100%; " border="1">
<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
     <tr>
        <th>품명</th>
        <td><input type="text" value="" placeholder="품명"><td>
        <th>품번</th>
        <td>
        <input type="text" value="" placeholder="품번">
        </td>
        <th>자재유형</th>
        <td>
        <select>
        <option>전체</option>
        <option>완제품</option>
        <option>부자재</option>
        </select>
        </td>
        <th>사용여부</th>
        <td>
        <select>
        <option>전체</option>
        <option>Y</option>
        <option>N</option>
        </select>
		</td>
      </tr>
  </table>
</div>

<!-- 품목 리스트 -->
<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
 <h4 style="margin-top: 50px;"><i class='bx bx-list-ol icon'></i> 품목 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>품번</th>
        <th>품명</th>
        <th>자재유형</th>
        <th>재고단위</th>
        <th>사용여부</th>
        <th>단가</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="productorderstatus.jsp">품번</a></td>
        <td>품명</td>
        <td>자재유형</td>
        <td>재고단위</td>
        <td>사용여부</td>
        <td>단가</td>
        <td><button class=btn-edit onclick="itemedit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
      <tr>
        <td><a href="productorderstatus.jsp">품번</a></td>
        <td>품명</td>
        <td>자재유형</td>
        <td>재고단위</td>
        <td>사용여부</td>
        <td>단가</td>
        <td><button class=btn-edit onclick="itemedit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
            
       <tr>
        <td><a href="productorderstatus.jsp">품번</a></td>
        <td>품명</td>
        <td>자재유형</td>
        <td>재고단위</td>
        <td>사용여부</td>
        <td>단가</td>
        <td><button class=btn-edit onclick="itemedit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
       <tr>
        <td><a href="productorderstatus.jsp">품번</a></td>
        <td>품명</td>
        <td>자재유형</td>
        <td>재고단위</td>
        <td>사용여부</td>
        <td>단가</td>
        <td><button class=btn-edit onclick="itemedit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
        
       <tr>
        <td><a href="productorderstatus.jsp">품번</a></td>
        <td>품명</td>
        <td>자재유형</td>
        <td>재고단위</td>
        <td>사용여부</td>
        <td>단가</td>
        <td><button class=btn-edit onclick="itemedit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
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