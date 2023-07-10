<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
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
		  $("#pfQTY").keyup(function() {
		    var pfQTY = parseFloat($("#pfQTY").val()); // 실적수량
		    var oQTY = parseFloat($("#oQTY").val()); // 지시수량
		    var pQTY = parseFloat($("#pQTY").val()); // 생산수량
		    var result = oQTY * 1.2 < (pfQTY + pQTY);
		    // console.log(pfQTY);
		    // console.log(oQTY);
		    // console.log(pQTY);

		    if (oQTY * 1.2 < (pfQTY + pQTY)) {
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
		<form id="fr" role="form" method="post" action="">
		<span id="ipmsg" style="font-size: 12px"></span>
		<input type="hidden" id="pQTY" value="${pvo.pQTY }" readonly>
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<tr>
						<td>품번</td>
						<td><input type="text" name="item_code" value="${pvo.item_code }" readonly required></td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" name="item_name" value="${pvo.item_name }" readonly required></td>
					</tr>
					<tr>
						<td>지시수량</td>
						<td><input type="number" name="oQTY" id="oQTY" value="${pvo.oQTY }" readonly required></td>
					</tr>
					<tr>
						<td>실적수량</td>
						<td><input type="number" name="pfQTY" id="pfQTY" min="0" required>
						</td>
					</tr>
					<tr>
						<td>실적일</td>
						<td><input class="perf_date" type="date" name="perf_date" required></td>
					</tr>
					<tr>
						<td>불량여부</td>
						<td><select class="gobd" name="perf_gobd"
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
						<td>비고</td>
						<td><input type="text" name="remark" ></td>
					</tr>
				</tbody>
			</table>
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button class="btn btn-primary" id="add" onclick=" onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class=btn-search onclick="window.close()">X 취소</button>
			</div>
		</form>
		<br>
	</div>


<script type="text/javascript">
	
	function onInsert() {
		  var frObj = $("#fr");
		  var formData = frObj.serialize();
		    Swal.fire("작성완료!");
		    if (frObj[0].checkValidity()) {
		    
		      $.ajax({
		        url: "/pro/etcWrite", // 요청을 보낼 서버의 URL
		        type: "POST", // HTTP 요청 방식 (POST)
		        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
		        success: function(response) {
		          opener.location.reload();
		          window.close(); // 윈도우 창을 닫습니다.
		        },
		        error: function(xhr, status, error) {
// 		          alert("모든 칸을 입력해 주세요!");
		          console.error("에러 발생:", error);
		        }
		      });
		    } else {
		      // 필수 필드가 비어있을 경우 처리할 내용
		      Swal.fire("모든 칸을 입력해 주세요!");
		    }
		}
</script>





</body>
</html>
