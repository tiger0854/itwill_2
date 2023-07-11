<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css"
	href="../../resources/css/product.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
	function handlegobdchange() {
		if (document.querySelector('.gobd').value === "n") {
			document.querySelector('.gobd-reason').disabled = true;
		} else {
			document.querySelector('.gobd-reason').disabled = false;
		}
	}

	function disableFutureDates() {
		var today = new Date().toISOString().split('T')[0];
		document.querySelector('.perf_date').max = today;
	}

	window.addEventListener('DOMContentLoaded', function() {
		disableFutureDates();
	});

	$(document).ready(function() {
		  $("#cfQTY").keyup(function() {
		    var cfQTY = parseFloat($("#cfQTY").val()); // 실적수량
		    var coQTY = parseFloat($("#coQTY").val()); // 지시수량
		    var cpQTY = parseFloat($("#cpQTY").val()); // 생산수량
		    var result = coQTY * 1.2 < (cfQTY + cpQTY);
		    // console.log(pfQTY);
		    // console.log(oQTY);
		    // console.log(pQTY);

		    if (coQTY * 1.2 < (cfQTY + cpQTY)) {
		      $("#add").prop("disabled", true);
		      $('#ipmsg').show();
		      $('#ipmsg').css('color', 'red');
		      $('#ipmsg').text("*해당 지시수량의 120% 이상 생산이 불가능합니다.");
		    } else {
		      $("#add").prop("disabled", false);
		      $('#ipmsg').show();
		      $('#ipmsg').css('color', 'green');
		      $('#ipmsg').text("*생산 가능합니다.");
		    }
		  });
		});
	

	
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
		        url: "/pro/cooketcWrite",
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
	
	
	
	
</script>
</head>
<body>

	<!-- 생산실적등록 폼 -->
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i>생산실적 등록
		</h4>
	</div>
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
		<img src="../../resources/css/logo.png">
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->
		<!--         <hr width="100%" style="border: 2px solid black"> -->
		<!-- 품번, 품명, 실적일, 실적수량, 불량여부, 불량사유 , 비고 -->
		<form role="form" id="fr" method="post">
		<input type="hidden" name="cpQTY" id="cpQTY" value="${cvo.cpQTY }"
							readonly required></td>
			<span id="ipmsg"></span>				
			<table class="box" style="margin-top: 30px; width: 100%">
			<input type="hidden" name="co_code" value="${param.co_code }" readonly>
				<tbody>
					<tr>
						<td>품번</td>
						<td><input type="text" name="item_code"
							value="${cvo.item_code }" readonly required></td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" name="item_name"
							value="${cvo.item_name }" readonly required></td>
					</tr>
					<tr>
						<td>자재코드</td>
						<td><input type="text" name="material_code"
							value="${cvo.material_code }" readonly required></td>
					</tr>
					<tr>
						<td>자재이름</td>
						<td><input type="text" name="material_name"
							value="${cvo.material_name }" readonly required></td>
					</tr>
					<tr>
						<td>지시수량</td>
						<td><input type="number" name="coQTY" id="coQTY" value="${cvo.material_con }"
							readonly  required="required"></td>
					</tr>
					<tr>
						<td>실적수량</td>
						<td><input type="number" name="cfQTY" id="cfQTY" min="0"  required="required"></td>
					</tr>
					<tr>
						<td>실적일</td>
						<td><input class="perf_date" type="date" name="cerf_date" required></td>
					</tr>
					<tr>
						<td>불량여부</td>
						<td><select class="gobd" name="cerf_gobd"
							onchange="handlegobdchange();" required>
								<option value="n">정상</option>
								<option value="y">불량</option>
						</select></td>
					</tr>
					<tr>
						<td>불량사유</td>
						<td><input class="gobd-reason" type="text" name="err_reason" ></td>
					</tr>
					<tr>
						<td>조리시간</td>
						<td>
							<select name="co_time" required>
								<c:forEach var="minute" begin="1" end="360" step="1">
									<option value="${minute}">${minute}분</option>
								</c:forEach>
							</select></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->

			
			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class="btn btn-outline-primary" id="add" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class="btn btn-danger" onclick="window.close()">X 취소</button>
			</div>
		</form>
		<br>
	</div>


</body>
</html>
