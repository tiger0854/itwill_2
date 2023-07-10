<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>


function onUpdate() {
	  var frObj = $("#fr");
	  var formData = frObj.serialize();
	    Swal.fire("수정완료!");
	    if (frObj[0].checkValidity()) {
	    
	      $.ajax({
	        url: "/pro/cookorderEdit", // 요청을 보낼 서버의 URL
	        type: "POST", // HTTP 요청 방식 (POST)
	        data: formData, // 전송할 데이터 (직렬화된 폼 데이터)
	        success: function(response) {
	          opener.location.reload();
	          window.close(); // 윈도우 창을 닫습니다.
	        },
	        error: function(xhr, status, error) {
//	          alert("모든 칸을 입력해 주세요!");
	          console.error("에러 발생:", error);
	        }
	      });
	    } else {
	      // 필수 필드가 비어있을 경우 처리할 내용
	      Swal.fire("모든 칸을 입력해 주세요!");
	    }
	}



</script>

</head>
<body>
<!-- 작업지시수정 폼 -->
<div class="black-bar"> <h4 style="text-align: center; color: white; padding-top: 8px">  <i class='bx bx-edit'></i> 작업지시 수정</h4></div>
		<div style="display: flex; justify-content: center; margin-bottom: 15px" >
		  <img src="../../resources/css/logo.png">
		</div>



<div class="container mt-3">
<!--         <hr width="100%" style="border: 2px solid black"> -->
<%-- ${pvo} --%>
<form id="fr" method="post" action="">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<%-- ${lineList} --%>
					<tr>
						<td>조리지시자</td>
						<td><input type="text" name="employee_id" value="${cvo.employee_id }" readonly></td>
					</tr>
					<tr>
						<td>라인명</td>
						<td><select name="line_code" class="line_code">
								<c:forEach var="line" items="${lineList}">
									<option value="${line.line_code}" ${cvo.line_code eq line.line_code ? 'selected' : ''}>${line.line_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>품목코드</td>
						<td><input type="text" id="item_code" name="item_code" value="${cvo.item_code }"
							placeholder="품번검색" onclick="openItem()" width="50%" readonly>
						</td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" id="item_name" name="item_name" value="${cvo.item_name }"
							placeholder="품명" style="border: 1px solid" width="50%" readonly></td>
						</td>
					</tr>
					<tr>
						<td>자재코드</td>
						<td><input type="text" id="item_code" name="material_code" value="${cvo.material_code }"
							placeholder="자재검색" width="50%" readonly>
						</td>
					</tr>
					<tr>
						<td>자재이름</td>
						<td><input type="text" id="item_name" name="material_name" value="${cvo.material_name }"
							style="border: 1px solid" width="50%" readonly></td>
						</td>
					</tr>
					<tr>
						<td>지시상태</td>
						<td><input type="text" name="co_status" value=${cvo.co_status } readonly></td>
					</tr>	
					<tr>
						<td>지시수량</td>
						<td><input type="number" name="coQTY" value=${cvo.coQTY } readonly></td>
					</tr>										
				</tbody>
			</table>
<!--     <hr width="100%" style="border: 2px solid black"> -->


<!-- 작업지시등록, 취소 버튼 -->
<div style="text-align: center; margin-top: 50px">
<button class=btn-add onclick="onUpdate();"> <i class='bx bx-edit'></i> 수정</button>
<button class=btn-search onclick="window.close()">X 닫기</button>
</div>

</form>

<br>
</div>
</body>
</html>
