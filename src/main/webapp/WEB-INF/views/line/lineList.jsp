<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	
var deptName = "${sessionScope.dept_name}";

function lineAdd() {
	if(deptName.includes('생산')){   
	// 새 창을 열기 위한 URL
		 var popupUrl = '/line/lineAdd';
		  // 새 창 열기
		  window.open(popupUrl, '_blank', 'width=500,height=500,resizable=yes');
}else{
	swal.fire("권한이 없습니다!");
	}
}


function lineEdit(line_code) {
	if(deptName.includes('생산')){    	
	// 새 창을 열기 위한 URL
		  var popupUrl = '/line/lineEdit?line_code='+line_code;
		  // 새 창 열기
		  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
		}else{
	swal.fire("권한이 없습니다!");
	}
}

function LineDelete(line_code) {
	if(deptName.includes('생산')){  
		  Swal.fire({
			    title: "경고",
			    text: "라인 : " + line_code + "를/을 정말로 삭제하시겠습니까?",
			    icon: "error",
			    showCancelButton:true,
			    confirmButtonText: '확인',
			    cancelButtonText: '취소'
			  })
			  .then(result => {
			    if (result.isConfirmed) { // 만약 모달창에서 확인 버튼을 눌렀다면
			      location.href = '/line/lineDelete?line_code=' + line_code;
			    } 
			  });
	}else{
	swal.fire("권한이 없습니다!");
	}
}
	
	
	
	
	
	
</script>



</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
   

<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 라인정보 관리</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<form>
<!-- 라인목 검색, 등록버튼 -->
<div class=btn-container>
<button type="submit" class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<button type="button" class=btn-add onclick="lineAdd()"><i class='bx bx-plus-medical'></i> 추가</button>
</div>

<!-- 품목 검색박스 -->
<table class="product-box3"style="margin-top: 20px; width: 100%; " border="1">
<!-- 라인코드,라인명,작업장,비고	 -->
     <tr>
        <th>라인코드</th>
        <td><input type="text" name="line_code" placeholder="라인코드"><td>
        <th>라인명</th>
        <td>
        <input type="text" name="line_name" placeholder="라인명">
        </td>
     </tr>
  </table>
</div>
</form>
<%-- ${lineList } --%>
<!-- 라인 리스트 -->
<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
 <h4 style="margin-top: 50px;"><i class='bx bx-list-ol icon'></i> 라인 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>라인코드</th>
        <th>라인명</th>
        <th>작업장</th>
        <th>라인등록자</th> 
        <th>비고</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${lineList}">
      <tr>
        <td>${vo.line_code}</td>
        <td>${vo.line_name}</td>
        <td>${vo.factory_code }</td>
        <td>${vo.employee_name }</td>
        <td>${vo.remark }</td>
        <td><button class=btn-edit onclick="lineEdit('${vo.line_code}')"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete onclick="LineDelete('${vo.line_code}');"><i class='bx bxs-trash'></i></button></td>
      </tr>
      
      
     </c:forEach>
        
      
    </tbody>
  </table>
  
  
  <!-- 페이징처리 -->
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/line/lineList?line_code=${Search.line_code }&line_name=${Search.line_name }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/line/lineList?line_code=${Search.line_code }&line_name=${Search.line_name }&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/line/lineList?line_code=${Search.line_code }&line_name=${Search.line_name }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>
  		<br>
</div>
</div>



</body>
</html>