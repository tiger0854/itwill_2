<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function itemUpload() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/foundation/itemdetail/itemdetailUpload';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

	function itemUpdate(item_code) {
		// 새 창을 열기 위한 URL
		if(!item_code.includes("M")){
		var popupUrl = '/foundation/itemdetail/itemdetailUpdate?item_code='
				+ item_code;
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
		}else{
			Swal.fire("레시피용 상품은 수정할 수 없습니다");
		}
	}

	function itemDelete(item_code, item_name) {
		  Swal.fire({
		    title: "경고",
		    text: "품명 : " + item_name + "를/을 정말로 삭제하시겠습니까?",
		    icon: "warning",
		    showCancelButton: true,
		    confirmButtonText: "삭제",
		    cancelButtonText: "취소"
		  }).then(result => {
		    if (result.isConfirmed) {
		      location.href = '/foundation/itemdetail/itemdetailDelete?item_code=' + item_code;
		    }
		  });
		}


	//품명 검색 팝업창
	function openItem() {
		window.open("/pro/itemList", "popup",
				"width=500, height=600,left=100, top=100");
	}
</script>



</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
	<div class="height-100">
		<div class="container mt-3">
			<form id="instr">

				<h4 style="margin-top: 150px;">
					<i class="bx bx-book"></i> 품목정보 관리
				</h4>
				<div style="margin-top: 10px;">
					<hr width="100%" style="border: 2px solid black">
					<!-- 상품목록 검색, 등록버튼 -->
					<div class=btn-container>
						<input type="submit" class="btn btn-primary" value="품목 조회">
						<input type="button" class="btn btn-outline-primary" onclick="itemUpload();" value="품목 추가">
					</div>

					<!-- 품목 검색박스 -->
					<table class="product-box3" style="margin-top: 20px; width: 100%;"
						border="1">
						<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
						<%-- 					<c:set var="sc" value="${resultlist }" /> --%>
						<tr>
							<th>품번</th>
							<td><input type="text" name="item_code" id="item_code"
								placeholder="품번" ></td>
							<th>품명</th>
							<td><input type="text" name="item_name" id="item_name"
								placeholder="품명" ></td>
							<td><input type="button" onclick="openItem();" value="상세 검색" class="btn btn-primary"></td>
						</tr>
					</table>
				</div>
			</form>
			<!-- 품목 리스트 -->
			<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
			<h4 style="margin-top: 50px;">
				<i class='bx bx-list-ol icon'></i> 품목 목록
			</h4>
			<table class="product-table" style="margin-top: 20px; width: 100%;">
				<thead>
					<tr>
						<th>품번</th>
						<th>품명</th>
						<th>단위</th>
						<th>상품가격</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${itemList}">
						<tr>
							<td>${vo.item_code}</td>
							<td>${vo.item_name}</td>
							<td>${vo.unit }</td>
							<td>${vo.item_price }원</td>
							<td><button type="button" class=btn-edit
									onclick="itemUpdate('${vo.item_code}');">
									<i class='bx bx-edit'></i>
								</button></td>
							<td><button class=btn-delete
									onclick="itemDelete('${vo.item_code}','${vo.item_name}');">
									<i class='bx bxs-trash'></i>
								</button></td>
						</tr>
					</c:forEach>


				</tbody>
			</table>


			<%--   		${Search} --%>
			<div class="container" style="margin-top: 30px; margin-bottom: 30px">
				<ul class="pagination justify-content-center" id="pagination"
					style="margin-top: 20px;">
					<c:if test="${pageVO.startPage > pageVO.pageBlock}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${pageVO.startPage - pageVO.pageBlock}">
								</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${i}"><span>${i}</span></a></li>
					</c:forEach>
					<c:if test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="/foundation/itemdetail/itemdetailList?item_code=${Search.item_code}&item_name=${Search.item_name}&pageNum=${pageVO.startPage + pageVO.pageBlock}">
								</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>