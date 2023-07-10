<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

<script>


	//품명 검색 팝업창
	function openItem() {
		window.open("/pro/itemList", "popup",
				"width=500, height=600,left=100, top=100");
	}
	function opensucode() {
		  var childWindow = window.open("/pro/cosuList", "popup", "width=500, height=600,left=100, top=100");
		  childWindow.addEventListener("beforeunload", function() {
		    getRelatedMaterials();
		    recodecheck();
		  });
		}	
	
	  function recodecheck() {
		  var re_code = $("#re_code").val(); // re_code 값 가져오기
		  console.log(re_code);
		  $.ajax({
		    url: "/pro/checkcooksuList", // 첫 번째 요청을 보낼 서버의 URL
		    type: "GET", // HTTP 요청 방식 (GET)
		    data: { re_code: re_code }, // 전송할 데이터
		    success: function(response) {
		      if (response === true) {
			     // 존재하지 않는 경우
			     $("#add").prop("disabled", false);
			     $('#ipmsg').show();
			     $('#ipmsg').css('color', 'green');
			     $('#ipmsg').text("*수주 등록이 가능합니다");  

		      } else {
			        // 이미 존재하는 경우
			        $("#add").prop("disabled", true);
			        $('#ipmsg').show();
			        $('#ipmsg').css('color', 'red');
			        $('#ipmsg').text("*중복된 수주는 등록 불가능합니다 ");  
		      }
		    },
		    error: function(xhr, status, error) {
		      console.error("첫 번째 요청 에러 발생:", error);
		    }
		  });
		}
	
	
		$(document).ready(function() {
			$('#material_item').hide();
			$('#item_code').click(function() {
				if ($('#item_code').val() != '') {
					$('#material_item').show()
				}
			});
		});


		
		function onInsert() {


			var frObj = $("#fr");
			var formData = frObj.serialize(); // 폼 데이터를 직렬화합니다.
			
			
				if (frObj[0].checkValidity()) {
				    Swal.fire({
				      title: "작성 성공!",
				      text: "작성이 성공하였습니다.",
				      icon: "success",
				      showCancelButton: false,
				      confirmButtonText: "확인"
				    }).then(function() {
				      $.ajax({
				        url: "/pro/cookorderWrite",
				        type: "POST",
				        data: formData,
				        success: function(response) {
				          opener.location.reload();
				          window.close();
				        },
				        error: function(xhr, status, error) {
				          Swal.fire("작성실패!");
				        }
				      });
				    });
				  } else {
				    Swal.fire("입력란을 채워주세요!");
				  }
				
		}
		
		
		
		
		

		// 상품 검색 후 자재 가져오기
		function getRelatedMaterials() {
			var itemCode = document.getElementById("item_code").value;
			if (!itemCode) {
// 				alert("상품 검색을 해주세요!");
				return;
			}
			$.ajax({
				url : "/foundation/itemrecipe/materials/"+itemCode,
				method : "GET",
				data : {
					item_code : itemCode
				},
				success : function(response) {
					console.log(response);
					var materials = response;
					if (materials.length > 0) {
						receiveCheckboxValues(materials); // 자재 배열 업데이트
					} else {
// 						alert("해당 상품에 관련된 자재가 없습니다.");
					}
				},
				error : function(xhr, status, error) {
					alert("자재 가져오기 실패: " + error);
				}
			});

		}

		//상품 검색
		function itemSearch() {
			window.open("/pro/itemList", "popup",
					"width=500, height=600,left=100, top=100");
		}

		//자재 검색
		function materialSearch() {
			var itemCode = $("#item_code").val();
			if (itemCode !== null && itemCode !== "") {
				var popup = window.open(
						"/foundation/itemrecipe/materialSearch", "popup",
						"width=500, height=600,left=100, top=100");
				popup.materialArray = materialArray;
			} else {
// 				alert("상품 코드부터 검색해주세요.");
				return false;
			}
		}

		//자재 배열
		var materialArray = []; // 자재 배열 초기화

		//자재 파라미터로 받아옴
		function receiveCheckboxValues(checkedValues) {
			// 전달받은 데이터 처리 로직
			console.log(checkedValues);
			materialArray = JSON.parse(checkedValues);
			changeArraySize(materialArray.length);
		}

		function tbodyBuilder() {
			var tbody = $("#tbody");
			var materialHeader = $("#materialHeader");
			
			// 기존 내용 초기화
			tbody.empty();
			materialHeader.empty();
			
			// 체크된 값들을 테이블에 추가
			for (var i = 0; i < materialArray.length; i++) {
				var vo = materialArray[i];
				var re_qty = $("#re_qty").val();	
				
				var row = $("<tr>");
// 				row.append("<td></td>");
				row.append("<td><input type='hidden'style='width: 40%' name='cookListvo[" + i + "].material_code' value='" + vo.material_code + "'>");
				row.append("<input type='text' name='cookListvo[" + i + "].material_name' value='" + vo.material_name + "' readonly='readonly'></td>");
				row.append("<td><input type='text' style='width: 40%' name='cookListvo[" + i + "].material_con' value='" + vo.material_con*re_qty + "' placeholder='" + vo.material_code + "의 소모량' required></td>");
				tbody.append(row);

			}

			//materialHeader가 없고 자재가 있을 경우 작동 자재 코드 자재 소모량 칸도 append
			if (materialHeader.children().length == 0) {
				if (tbody.children().length > 0) {
					materialHeader.append("<td></td>");
					materialHeader.append("<td>자재 명</td>");
					materialHeader.append("<td>자재소모량</td>");
				}
			}
		}
		
		
		// 배열 사이즈를 받아와서 배열 크기 만큼 .append 해줌
		function changeArraySize(newSize) {
			materialArray = materialArray.slice(0, newSize);
			console.log(materialArray.length);
			tbodyBuilder(); //tbody 만들기 실행
		}
	
	
	
	
	
	
</script>


</head>
<body>
	<div class="black-bar">
		<h4 style="text-align: center; color: white; padding-top: 8px">
			<i class='bx bx-edit'></i> 조리지시 등록
		</h4>
	</div>
	
	<span id="ipmsg" ></span>
	<!-- 작업지시등록 폼 -->
	<div
		style="display: flex; justify-content: center; margin-bottom: 15px">
<!-- 		<img src="../../resources/css/logo.png"> -->
	</div>
	<div class="container mt-3">
		<!--  		<hr width="100%" style="border: 2px solid black"> -->

		<!--         <hr width="100%" style="border: 2px solid black"> -->

		<form role="form" id="fr">
			<table class="box" style="margin-top: 30px; width: 100%">
				<tbody>
					<%-- ${lineList} --%>
					<td><input type="hidden" name="pQTY" value=0 required></td>
			    <tr>
			      <td>수주번호</td>
			     <td><div class="input-group">
				    <input style="width: 40%" type="text" name="so_code" onclick="recodecheck()" id="re_code" placeholder="수주번호" class="form-control" required>
				    <input type="button" class="btn btn-primary" onclick="opensucode()" value="검색">
				</div></td>
			    </tr>
					<tr>
						<td>조리지시자</td>
						<td><input type="text" name="employee_id" id="employee_id" required></td>
					</tr>
					<tr>
						<td>라인명</td>
						<td><select name="line_code" class="line_code" required>
								<c:forEach var="line" items="${lineList}">
									<option value="${line.line_code}">${line.line_name}</option>
								</c:forEach>
						</select></td>
					</tr>
				    <tr>
				   <td>상품코드</td>
				  <td>
				  	<div class="input-group"> 
					    <input type="text" style="width: 40%" placeholder="상품 코드" class="form-control" name="item_code" id="item_code" onclick="getRelatedMaterials();" required>
					    <input type="text" style="width: 40%" placeholder="상품 이름" class="form-control" name="item_name" id="item_name" readonly required>
					</div>
					</td>
				    </tr>

<!-- 					<tr> -->
<!-- 						<td>자재코드</td> -->
<!-- 						<td><input type="text" name="material_code" -->
<!-- 							placeholder="자재검색" width="50%"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td>자재이름</td> -->
<!-- 						<td><input type="text" name="material_name"  -->
<!-- 							placeholder="자재이름" style="border: 1px solid" width="50%"></td> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td>수주수량</td>
						<td><input type="number" name="coQTY" id="re_qty" read></td>
					</tr>	
					
					<tr id="materialHeader">
					</tr>	
				<tbody id="tbody">
				</tbody>
														
				</tbody>
			</table>
			

			

			

			
			
			
			<!--     <hr width="100%" style="border: 2px solid black"> -->


			<!-- 작업지시등록, 취소 버튼 -->
			<div style="text-align: center; margin-top: 50px">
				<button type="button" class=btn-add id="add" onclick="onInsert();">
					<i class='bx bx-edit'></i> 등록
				</button>
				<button class=btn-search onclick="window.close()">X 취소</button>
			</div>

		</form>

		<br>
	</div>
</body>
</html>
