<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
function orderwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/pro/orderWrite';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function orderedit(wo_code) {
	  var popupUrl = '/pro/orderEdit?wo_code='+ wo_code;
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

if("${result}" == "CREATEOK"){
	alert("작업지시 삭제완료!");
}


</script>

</head>
<body>


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 작업지시</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 작업지시목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<button class=btn-add onclick="orderwrite()"><i class='bx bx-plus-medical'></i> 추가</button>
</div>

<!-- 작업지시목록 검색박스 -->
<table class="product-box"style="margin-top: 20px; width: 100%; " border="1">
 	
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
        <td><input type="date" value=""><td>
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
<!-- 작업지시상태 시작/지시 :  작업지시 현황 리스트 -->
<!-- 작업지시상태 마감 :  실적현황 -> 실적등록 -->
<%-- ${oderList} --%>
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 작업지시 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>작업지시번호</th>
        <th>수주번호</th>
        <th>작업지시자</th>
        <th>지시상태</th>
        <th>납품예정일</th>
        <th>라인코드</th>
        <th>품목코드</th>
        <th>지시수량</th>
        <th>생산수량</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="vo" items="${oderList }">
      <tr>
		<c:choose>
		  <c:when test="${vo.wo_status eq '지시' or vo.wo_status eq '시작'}">
		    <td><a href="/pro/orderstatusList?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
		  </c:when>
		  <c:when test="${vo.wo_status eq '마감'}">
		    <td><a href="/pro/etcstatusList?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
		  </c:when>
		  <c:otherwise>
		    <td>${vo.wo_code}</td>
		  </c:otherwise>
		</c:choose>
        <td>${vo.so_code}</td>
        <td>${vo.employee_id}</td>
        <c:choose>
	  <c:when test="${vo.wo_status eq '지시'}">
	    <td style="color: blue;">${vo.wo_status}</td>
	  </c:when>
	  <c:when test="${vo.wo_status eq '마감'}">
	    <td style="color: red;">${vo.wo_status}</td>
	  </c:when>
	  <c:when test="${vo.wo_status eq '시작'}">
	    <td style="color: green;">${vo.wo_status}</td>
	  </c:when>
	  <c:otherwise>
	    <td>${vo.wo_status}</td>
	  </c:otherwise>
	</c:choose>
        <td>${vo.delivery_date}</td>
        <td>${vo.line_code}</td>
        <td>${vo.item_code}</td>
        <td>${vo.oQTY}</td>
        <td>${vo.pQTY}</td>
		<c:choose>
		  <c:when test="${vo.wo_status eq '지시'}">
		    <td><button class="btn-edit" onclick="orderedit('${vo.wo_code}')"><i class="bx bx-edit"></i></button></td>
		    <td><button class="btn-delete" onclick="ProOrderDelete()"><i class="bx bxs-trash"></i></button></td>
		  </c:when>
		  <c:otherwise>
		    <td></td>
		    <td></td>
		  </c:otherwise>
		</c:choose>
      </tr>
      
    <script>
      function ProOrderDelete(){
    		if(confirm("정말로 삭제하시겠습니까?")){
    			location.href='/pro/proOrderDelete?wo_code=${vo.wo_code}';
    		}
    	}
	</script>
      
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