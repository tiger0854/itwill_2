<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">
<title>조리지시목록</title>
<script>
var deptName = "${sessionScope.dept_name}";

function orderwrite() {
	if(deptName.includes('생산')){   
	// 새 창을 열기 위한 URL
	 var popupUrl = '/pro/cookorderWrite';
	// 새 창 열기
	 window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
}else{
	swal.fire("권한이 없습니다!");
	}
}


function orderedit(co_code) {
	if(deptName.includes('생산')){    	
	// 새 창을 열기 위한 URL
		var popupUrl = '/pro/cookorderEdit?co_code='+ co_code;
		  window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
		}else{
	swal.fire("권한이 없습니다!");
	}
}

function cookOrderDelete(co_code) {
	if(deptName.includes('생산')){  
		  Swal.fire({
			    title: "경고",
			    text: "정말로 삭제하시겠습니까?",
			    icon: "warning",
			    showCancelButton: true,
			    confirmButtonText: "네",
			    cancelButtonText: "취소"
			  }).then(result => {
			    if (result.isConfirmed) {
			      location.href = '/pro/cookOrderDelete?co_code='+co_code;
//			      Swal.fire("수동마감 완료!");
			    }
	  });
	}else{
	swal.fire("권한이 없습니다!");
	}
}


//품명 검색 팝업창
function openmaterial(){
    window.open("/pro/materialList","popup", "width=500, height=600,left=100, top=100");
}




//품명 검색 팝업창
function opensucode() {
  var childWindow = window.open("/pro/searchsuList", "popup", "width=500, height=600, left=100, top=100");
  childWindow.onunload = recodecheck;
}





</script>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 조리지시</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">


<!-- 작업지시목록 검색박스 -->

<form id="instr">
<!-- 작업지시목록 검색, 등록버튼 -->
<div class=btn-container>
<input class="btn btn-primary" type="submit" value="조회">
<input type="button" class="btn btn-outline-primary" onclick="orderwrite()" value="추가">
</div>
<table class="product-box2"style="margin-top: 20px; width: 100%; " border="1">
			<tr>
				<td>라인</td>
				<td><select name="line_code" class="line_code">
						<option value="" selected>전체</option>
						<c:forEach var="line" items="${lineList}">
							<option value="${line.line_code}">${line.line_name}</option>
						</c:forEach>
					</select></td>
				<td>지시일자</td>
				<!-- 시작시 기본 날짜 설정은 value를 이용 -->
				<td><input type="date" id="co_date" class="form-control" name="co_date" placeholder="날짜를 선택해주세요" />
				</tr>
				<tr>	
				<td>수주번호</td>
				<td><div class="input-group">
	   		<input style="width: 30%" type="text" name="so_code" id="re_code" placeholder="수주번호" class="form-control">
	    	<input type="button" class="btn btn-primary" onclick="opensucode();" value="검색">
				</div></td>
				<td>지시상태</td>
				<td colspan="8">
				<select name="co_status">
					<option value="">전체</option>
					<option value="지시">지시</option>
					<option value="시작">시작</option>
					<option value="마감">마감</option>
				</select>
				</td>
			</tr>
  </table>
</div>
</form>
<!-- 작업지시목록 리스트 -->
<!-- 작업지시상태 시작/지시 :  작업지시 현황 리스트 -->
<!-- 작업지시상태 마감 :  실적현황 -> 실적등록 -->
<%-- ${oderList} --%>
 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 조리지시 목록</h4>
  <span style="color: red; font-size: 13px">* 조리 지시 번호 클릭시 해당작업 실적등록 가능 </span>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>조리지시번호</th>
        <th>수주번호</th>
        <th>조리지시자</th>
        <th>지시상태</th>
        <th>라인이름</th>
        <th>상품이름</th>
        <th>자재이름</th>
        <th>지시수량</th>
        <th>생산수량</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="vo" items="${cookoderList }">
      <tr>
		<td><a href="/pro/cooketcstatusList?co_code=${vo.co_code}">${vo.co_code}</a></td>
		<td>${vo.so_code }</td>
		
        <td>${vo.employee_name}</td>
        <c:choose>
	  <c:when test="${vo.co_status eq '지시'}">
	    <td style="color: blue;">${vo.co_status}</td>
	  </c:when>
	  <c:when test="${vo.co_status eq '마감'}">
	    <td style="color: red;">${vo.co_status}</td>
	  </c:when>
	  <c:when test="${vo.co_status eq '시작'}">
	    <td style="color: green;">${vo.co_status}</td>
	  </c:when>
	  <c:otherwise>
	    <td>${vo.co_status}</td>
	  </c:otherwise>
	</c:choose>
        <td>${vo.line_name}</td>
        <td>${vo.item_name}</td>
        <th>${vo.material_name}</th>
        <td>${vo.material_con}</td>
        <td>${vo.cpQTY}</td>
		<c:choose>
		  <c:when test="${vo.co_status eq '지시'}">
		    <td><button class="btn-edit" onclick="orderedit('${vo.co_code}')"><i class="bx bx-edit"></i></button></td>
		    <td><button class="btn-delete" onclick="cookOrderDelete('${vo.co_code}')"><i class="bx bxs-trash"></i></button></td>
		  </c:when>
		  <c:otherwise>
		    <td>-</td>
		    <td>-</td>
		  </c:otherwise>
		</c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
<!-- 		instrSearch.put("line_code", line_code); -->
<!-- 		instrSearch.put("co_date", co_date); -->
<!-- 		instrSearch.put("so_code", so_code); -->
<!-- 		instrSearch.put("co_status", co_status); -->
<%-- ${Search.line_code} --%>
  <!-- 페이징처리 -->
<%--   		${Search} --%>
  <!-- 페이징처리 -->
<%--   		${Search} --%>
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/pro/cookorderList?line_code=${Search.line_code}&co_date=${Search.co_date}&so_code=${Search.so_code}&co_status=${Search.co_status}&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/pro/cookorderList?line_code=${Search.line_code}&co_date=${Search.co_date}&so_code=${Search.so_code}&co_status=${Search.co_status}&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pro/cookorderList?line_code=${Search.line_code}&co_date=${Search.co_date}&so_code=${Search.so_code}&co_status=${Search.co_status}&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>
  		



</body>
</html>