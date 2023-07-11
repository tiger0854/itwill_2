<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<meta charset="UTF-8">
<title> </title>

<script>


var deptName = "${sessionScope.dept_name}";
function etcRemove(cook_id, co_code) {
  if (deptName.includes('생산')) {
    Swal.fire({
      title: "경고",
      text: "정말로 삭제하시겠습니까?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "네",
      cancelButtonText: "취소"
    }).then(result => {
      if (result.isConfirmed) {
        location.href = '/pro/cooketcRemove?cook_id=' + cook_id + '&co_code=' + co_code;
      }
    });
  } else {
    swal.fire("권한이 없습니다!");
  }
}
function etcwrite(co_code) {
  var co_status = "${cvo.co_status}";
  if (deptName.includes('생산')) {
    if (co_status === "마감") {
      Swal.fire({
        title: "마감된 지시입니다!",
        text: "",
        icon: "error"
      });
    } else {
      console.log(co_code);
      var popupUrl = '/pro/cooketcWrite?co_code=' + co_code;
      window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
    }
  } else {
    swal.fire("권한이 없습니다!");
  }
}
function costatus(co_code) {
  if (deptName.includes('생산')) {
    Swal.fire({
      title: "경고",
      text: "수동마감 하시겠습니까?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "네",
      cancelButtonText: "취소"
    }).then(result => {
      if (result.isConfirmed) {
        location.href = '/pro/costatusEnd?co_code=' + co_code;
      }
    });
  } else {
    swal.fire("권한이 없습니다!");
  }
}

</script>

</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
	<div class="height-100">
		<div class="container mt-3">

			<div style="margin-top: 10px;">

				<!-- 실적 리스트 -->
				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 조리 실적 현황
<button style="margin-left: 20px" type="button" class="btn btn-primary btn-sm" onclick="location.href='/pro/cookorderList'">조리 지시 목록</button>
					
				</h4>
				
				
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>조리지시번호</th>
        <th>조리지시자</th>
        <th>지시상태</th>
        <th>라인코드</th>
        <th>상품이름</th>
        <th>자재이름</th>
        <th>지시수량</th>
        <th>생산수량</th>
      </tr>
    </thead>
    <tbody>
      <tr>
		<td><a href="/pro/cooketcstatusList?co_code=${cvo.co_code}">${cvo.co_code}</a></td>
        <td>${cvo.employee_name}</td>
        <c:choose>
	  <c:when test="${cvo.co_status eq '지시'}">
	    <td style="color: blue;">${cvo.co_status}</td>
	  </c:when>
	  <c:when test="${cvo.co_status eq '마감'}">
	    <td style="color: red;">${cvo.co_status}</td>
	  </c:when>
	  <c:when test="${cvo.co_status eq '시작'}">
	    <td style="color: green;">${cvo.co_status}</td>
	  </c:when>
	  <c:otherwise>
	    <td>${cvo.co_status}</td>
	  </c:otherwise>
	</c:choose>
        <td>${cvo.line_code}</td>
        <td>${cvo.item_name}</td>
        <th>${cvo.material_name}</th>
        <td>${cvo.material_con}</td>
        <td>${cvo.cpQTY}</td>
      </tr>
    </tbody>
  </table>
				<!-- 작업지시목록 검색, 등록버튼 -->
			
		<div class="btn-container">
		<input class="btn btn-primary" type="button" value="수동 마감" onclick="costatus('${param.co_code }')">
		<input type="button" class="btn btn-outline-primary" onclick="etcwrite('${param.co_code }')" value="실적 등록">
		</div>	
				<!-- 품번, 품명, 단위 , 투입량 -->
				<table class="product-table"
					style="margin-top: 20px; width: 100%; text-align: center;">
					<thead>
						<tr>
							<th>품번</th>
							<th>품명</th>
							<th>자재코드</th>
							<th>자재이름</th>
							<th>단위</th>
							<th>투입량</th>
							<th>소요시간</th>
							<th>불량여부</th>
<!-- 							<th>수정</th> -->
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cvo" items="${cookEtcList }">
							<tr>
								<td>${cvo.item_code }</td>
								<td>${cvo.item_name }</td>
								<td>${cvo.material_code }</td>
								<td>${cvo.material_name }</td>
<%-- 								<td>${prmList.unit }</td> --%>
								<td>EA</td>
								<td>${cvo.cfQTY }</td>
								<td>${cvo.co_time } 분</td>
								<td>${cvo.cerf_gobd }</td>
<!-- 								<td><button class="btn-edit" -->
<%-- 										onclick="etcEdit('${prmList.perf_id}');"> --%>
<!-- 										<i class="bx bx-edit"></i> -->
<!-- 									</button></td> -->
								<td><button class="btn-delete"
										onclick="etcRemove('${cvo.cook_id}','${param.co_code}')">
										<i class="bx bxs-trash"></i>
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 페이징처리 -->

	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/pro/cooketcstatusList?co_code=${param.co_code }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/pro/cooketcstatusList?co_code=${param.co_code }&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pro/cooketcstatusList?co_code=${param.co_code }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>

			<br>
		</div>
	</div>



</body>
</html>