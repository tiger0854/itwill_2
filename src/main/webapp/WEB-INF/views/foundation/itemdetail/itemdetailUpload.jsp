<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
</head>
<script type="text/javascript">
function onInsert() {
	  var frObj = $("#fr");
	  var formData = frObj.serialize();

	  if (frObj[0].checkValidity()) {
	    Swal.fire({
	      title: "작성 성공!",
	      text: "작성이 성공하였습니다.",
	      icon: "success",
	      showCancelButton: false,
	      confirmButtonText: "확인"
	    }).then(function() {
	      $.ajax({
	        url: "/foundation/itemdetail/itemdetailUpload",
	        type: "POST",
	        data: formData,
	        success: function(response) {
	          opener.location.reload();
	          window.close();
	        },
	        error: function(xhr, status, error) {
	          Swal.fire("빈칸을 입력해주세요!");
	        }
	      });
	    });
	  } else {
	    Swal.fire("입력란을 채워주세요!");
	  }
	}

	
	function changeForm(){
		$("tbody").html(
		"<tr><td></td><td>레시피용 상품 등록의 경우<br> 자재 검색을 통한 등록만 가능합니다</td></tr>"
		+"<tr><td></td><td><input type='button' value='자재 검색' onclick='materialSearch();'></td>"
		+"<tr><td>품번</td><td><input type='text' name='item_code' id='material_code' readonly><input type='hidden' id='material_type'></td></tr>"
		+"<tr><td>품명</td><td><input type='text' name='item_name' id='material_name' readonly></td></tr>"
		+"<tr><td>재고단위</td><td><input type='text' name='unit'value='레시피용' readonly></td></tr>"
		+"<tr><td>단가</td><td><input type='number' name='item_price' value='0' readonly></td></tr>"
		);
	}
	
	function materialSearch() {
		// 새 창을 열기 위한 URL
		var popupUrl = '/foundation/materialdetail/materialItemList';
		// 새 창 열기
		window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}
	
</script>
<body>
	<!-- 상품등록 폼 -->
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>상품등록
		</h4>
	</div>
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->
		<!-- 품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록 -->
		<form id="fr" action="" method="post">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>품번</td>
						<td>품번은 레시피용 상품이 아닐 경우<br> I001 형식으로 자동으로 입력됩니다.</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" value="레시피용 상품 등록으로 전환" onclick="changeForm();"></td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" name="item_name" required></td>
					</tr>
					<tr>
						<td>재고단위</td>
						<td><input type="text" name="unit" required></td>
					</tr>
					<tr>
						<td>단가</td>
						<td><input type="number" name="item_price" required></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 자재등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger"  onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
