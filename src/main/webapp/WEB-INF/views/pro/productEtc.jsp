<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/product.css">
<script>

function etcwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = 'productEctWrite.jsp';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

</script>



</head>

<body>


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 실적등록</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 실적등록 검색버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
</div>

<!-- 작업지시목록 검색박스 -->
<table class="product-box"style="margin-top: 20px; width: 100%;" border="1">
 	
     <tr>
        <th>라인</th>
        <td>
        <select>
        <option>전체</option>
        <option>A</option>
        <option>B</option>
        </select>
        <td>
        <th>품번</th>
        <td>
		<input type="text" value="" placeholder="품번 검색하기"><input type="text" value="" placeholder="품명">
		</td>
      </tr>

      <tr>
        <th>지시일자</th>
        <td><input type="date" value="" width="100px"><td>
        <th>지시상태</th>
        <td>
        <select>
        <option>전체</option>
        <option>지시</option>
        <option>시작</option>
        <option>마감</option>
        </select>
		</td>
      </tr>
  </table>
</div>

<!-- 작업지시목록 리스트 -->
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 작업지시 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>작업지시번호</th>
        <th>수주번호</th>
        <th>작업지시자</th>
        <th>납품예정일</th>
        <th>라인명</th>
        <th>품목명</th>
        <th>지시수량</th>
        <th>생산수량</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="productEtcList.jsp">작업지시번호</a></td>
        <td>수주번호</td>
        <td>작업지시자</td>
        <td>납품예정일</td>
        <td>라인명</td>
        <td>품목명</td>
        <td>지시수량</td>
        <td>생산수량</td>
      </tr>
      
        <tr>
        <td><a href="productEtcList.jsp">작업지시번호</a></td>
        <td>수주번호</td>
        <td>작업지시자</td>
        <td>납품예정일</td>
        <td>라인명</td>
        <td>품목명</td>
        <td>지시수량</td>
        <td>생산수량</td>
      </tr>
      
         </tr>
      
        <tr>
        <td><a href="productEtcList.jsp">작업지시번호</a></td>
        <td>수주번호</td>
        <td>작업지시자</td>
        <td>납품예정일</td>
        <td>라인명</td>
        <td>품목명</td>
        <td>지시수량</td>
        <td>생산수량</td>
      </tr>
      
         </tr>
      
        <tr>
        <td><a href="productEtcList.jsp">작업지시번호</a></td>
        <td>수주번호</td>
        <td>작업지시자</td>
        <td>납품예정일</td>
        <td>라인명</td>
        <td>품목명</td>
        <td>지시수량</td>
        <td>생산수량</td>
      </tr>
      
         </tr>
      
        <tr>
        <td><a href=productEtcList.jsp">작업지시번호</a></td>
        <td>수주번호</td>
        <td>작업지시자</td>
        <td>납품예정일</td>
        <td>라인명</td>
        <td>품목명</td>
        <td>지시수량</td>
        <td>생산수량</td>
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