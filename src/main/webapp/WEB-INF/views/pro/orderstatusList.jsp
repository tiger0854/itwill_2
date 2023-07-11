<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<jsp:include page="../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function etcwrite() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/pro/etcWrite';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function etcEdit() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/pro/etcEdit';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}
</script>



</head>

<body>


	<div class="height-100">
		<div class="container mt-3">

			<div style="margin-top: 10px;">


				<!-- 실적 리스트 -->
				<h4 style="margin-top: 100px;">
					<i class='bx bx-list-ol icon'></i> 작업지시 현황
				</h4>
				<table class="product-table" style="margin-top: 20px; width: 100%;">
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
							<!--         <th>수정</th> -->
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="/pro/etcstatusList?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
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
									<%-- 		    <td><button class="btn-edit" onclick="orderedit('${vo.wo_code}')"><i class="bx bx-edit"></i></button></td> --%>
									<td><button class="btn-delete"
											onclick="ProOrderDelete('${vo.wo_code}')">
											<i class="bx bxs-trash"></i>
										</button></td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>

				<table class="product-table" style="margin-top: 20px; width: 100%;">
					작업지시번호 :
					<span style="color: blue"><b>${param.wo_code}</b></span>
					<thead>
						<tr>
							<th>실적일자</th>
							<th>품명</th>
							<th>품번</th>
							<th>단위</th>
							<th>불량여부</th>
							<th>불량사유</th>
							<th>투입량</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>실적일자</td>
							<td>품명</td>
							<td>품번</td>
							<td>단위</td>
							<td>불량여부</td>
							<td>불량사유</td>
							<td>투입량</td>
						</tr>

						<tr>
							<td>실적일자</td>
							<td>품명</td>
							<td>품번</td>
							<td>단위</td>
							<td>불량여부</td>
							<td>불량사유</td>
							<td>투입량</td>
						</tr>



						<tr>
							<td>실적일자</td>
							<td>품명</td>
							<td>품번</td>
							<td>단위</td>
							<td>불량여부</td>
							<td>불량사유</td>
							<td>투입량</td>
						</tr>



						<tr>
							<td>실적일자</td>
							<td>품명</td>
							<td>품번</td>
							<td>단위</td>
							<td>불량여부</td>
							<td>불량사유</td>
							<td>투입량</td>
						</tr>



						<tr>
							<td>실적일자</td>
							<td>품명</td>
							<td>품번</td>
							<td>단위</td>
							<td>불량여부</td>
							<td>불량사유</td>
							<td>투입량</td>
						</tr>

					</tbody>
				</table>
			</div>

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
				<ul class="pagination justify-content-center" id="pagination"
					style="margin-top: 20px;">
					<li class="page-item"><a class="page-link" href="#"><sapn>
							< </sapn></a></li>
					<c:forEach var="i" begin="1" end="5" step="1">
						<li class="page-item"><a class="page-link" href="#"><span>${i }</span></a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#"><span>
								> </span></a></li>
				</ul>
			</div>

			<br>
		</div>
	</div>



</body>
</html>