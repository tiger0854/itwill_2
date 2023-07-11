<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

var deptName = "${sessionScope.dept_name}";



function etcRemove(perfId,wo_code) {
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
			      location.href = '/pro/proOrderDelete?wo_code='+wo_code;
//			      Swal.fire("수동마감 완료!");
			    }
			  });		
	}else{
	swal.fire("권한이 없습니다!");
	}
}


	

	function etcwrite(woCode) {
		
		var wo_status = "${pvo.wo_status}";
		if (deptName.includes('생산')) {
			  if (wo_status === "마감") {
			    Swal.fire({
			      title: "마감된 지시입니다!",
			      text: "",
			      icon: "error"
			    });
			  } else {
			    console.log(woCode);
			    // 새 창을 열기 위한 URL
			    var popupUrl = '/pro/etcWrite?wo_code=' + woCode;
			    // 새 창 열기
			    window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
			  }
			} else {
				swal.fire("권한이 없습니다!");
			}
	}


		function wostatus(wo_code) {
			if(deptName.includes('생산')){  
				  Swal.fire({
					    title: "경고",
					    text: "수동마감 하시겠습니까?",
					    icon: "warning",
					    showCancelButton: true,
					    confirmButtonText: "네",
					    cancelButtonText: "취소"
					  }).then(result => {
					    if (result.isConfirmed) {
					      window.location.href = '/pro/wostatusEnd?wo_code=' + wo_code;
					      // Swal.fire("수동마감 완료!");
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

			<div style="margin-top: 10px;">

				<!-- 실적 리스트 -->
				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 생산 실적 현황
					<button style="margin-left: 20px" type="button" class="btn btn-primary btn-sm" onclick="location.href='/pro/orderList'">작업 지시 목록</button>
				</h4>

			<!-- 품번, 품명, 단위 , 투입량 -->
		<table class="product-table"style="margin-top: 20px;width: 100%;">
		    <thead>
		      <tr>
		        <th>작업지시번호</th>
		        <th>수주번호</th>
		        <th>작업지시자</th>
		        <th>지시상태</th>
		        <th>납품예정일</th>
		        <th>라인번호</th>
		        <th>상품번호</th>
		        <th>상품이름</th>
		        <th>지시수량</th>
		        <th>생산수량</th>
		      </tr>
		    </thead>
		    <tbody>
		    
		      <tr>
				<td><a href="/pro/etcstatusList?wo_code=${pvo.wo_code}">${pvo.wo_code}</a></td>
		        <td>${pvo.so_code}</td>
		        <td>${pvo.employee_name}</td>
		        <c:choose>
			  <c:when test="${pvo.wo_status eq '지시'}">
			    <td style="color: blue;">${pvo.wo_status}</td>
			  </c:when>
			  <c:when test="${pvo.wo_status eq '마감'}">
			    <td style="color: red;">${pvo.wo_status}</td>
			  </c:when>
			  <c:when test="${pvo.wo_status eq '시작'}">
			    <td style="color: green;">${pvo.wo_status}</td>
			  </c:when>
			  <c:otherwise>
			    <td>${pvo.wo_status}</td>
			  </c:otherwise>
			</c:choose>
		        <td>${pvo.delivery_date}</td>
		        <td>${pvo.line_code}</td>
		        <td>${pvo.item_code}</td>
		        <td>${pvo.item_name}</td>
		        <td>${pvo.oQTY}</td>
		        <td>${pvo.pQTY}</td>
		      </tr>
		    </tbody>
		  </table>
				<!-- 작업지시목록 검색, 등록버튼 -->
			
		<div class=btn-container>
		<input class="btn btn-primary" type="button" value="수동 마감" onclick="wostatus('${param.wo_code }')">
		<input type="button" class="btn btn-outline-primary" onclick="etcwrite('${param.wo_code }')" value="실적 등록">
		</div>	
				<table class="product-table"
					style="margin-top: 20px; width: 100%; text-align: center;">

					<thead>
						<tr>
							<th>품번</th>
							<th>품명</th>
							<th>단위</th>
							<th>투입량</th>
							<th>불량여부</th>
<!-- 							<th>수정</th> -->
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prmList" items="${prodPerfList }">
							<tr>
								<td>${prmList.item_code }</td>
								<td>${prmList.item_name }</td>
<%-- 								<td>${prmList.unit }</td> --%>
								<td>EA</td>
								<td>${prmList.pfQTY }</td>
								<td>${prmList.perf_gobd }</td>
<!-- 								<td><button class="btn-edit" -->
<%-- 										onclick="etcEdit('${prmList.perf_id}');"> --%>
<!-- 										<i class="bx bx-edit"></i> -->
<!-- 									</button></td> -->
								<td><button class="btn-delete"
										onclick="etcRemove('${prmList.perf_id}','${param.wo_code}')">
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
	      <li class="page-item"><a class="page-link" href="/pro/etcstatusList?wo_code=${param.wo_code }&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/pro/etcstatusList?wo_code=${param.wo_code }&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pro/etcstatusList?wo_code=${param.wo_code }&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>

			<br>
		</div>
	</div>



</body>
</html>