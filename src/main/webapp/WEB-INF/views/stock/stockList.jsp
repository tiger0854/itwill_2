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
function stockwrite() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = '/stock/stockWrite';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function stockEdit() {
		  // 새 창을 열기 위한 URL
		  var popupUrl = '/stock/stockEdit';
		  // 새 창 열기
		  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
		}

</script>



</head>

<body>



<div class="height-100">
        <div class="container mt-3">
<!-- 일자, 품목코드, 품목명, 창고명, 수량, 비고, (검색 기능)         -->
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 재고 관리</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 재고목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 재고 조회</button>
<button class=btn-add onclick="stockwrite()"><i class='bx bx-plus-medical'></i> 재고 추가</button>
</div>

<!-- 재고목록 검색박스 -->
<table class="product-box3"style="margin-top: 20px; width: 100%; " border="1">
 
     <tr>
        <th>품목코드</th>
        <td><input type="text" value="" placeholder="품목명"></td>
        <th>품목명</th>
        <td><input type="text" value="" placeholder="품목코드"></td>
        <th>품목명</th>
        <td><input type="date" value=""><td>
        <th>창고명</th>
        <td>
        <select>
        <option>전체</option>
        <option>자재</option>
        <option>재고</option>
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

<!-- 재고 리스트 -->
<!-- 일자, 품목코드, 품목명, 창고명, 수량, 비고, (검색 기능) -->
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i>재고 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>일자</th>
        <th>품목코드</th>
        <th>품목명</th>
        <th>창고명</th>
        <th>수량</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>일자</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>창고명</td>
        <td>수량</td>
        <td><button class=btn-edit onclick="stockEdit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
        <tr>
         <td>일자</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>창고명</td>
        <td>수량</td>
        <td><button class=btn-edit onclick="stockEdit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
       </tr>
      
       
       <tr>
         <td>일자</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>창고명</td>
        <td>수량</td>
        <td><button class=btn-edit onclick="stockEdit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
        
      
       <tr>
        <td>일자</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>창고명</td>
        <td>수량</td>
        <td><button class=btn-edit onclick="stockEdit()"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
      
        
      
       <tr>
        <td>일자</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>창고명</td>
        <td>수량</td>
        <td><button class=btn-edit onclick="stockEdit()"><i class='bx bx-edit'></i></button></td>
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