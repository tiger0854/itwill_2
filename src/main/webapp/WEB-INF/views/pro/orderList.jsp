<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/product.css">

<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">
<title>작업지시목록</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var deptName = "${sessionScope.dept_name}";

function orderwrite() {
	if(deptName.includes('생산')){   
	// 새 창을 열기 위한 URL
		  var popupUrl = '/pro/orderWrite';
		  // 새 창 열기
		  window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
}else{
	swal.fire("권한이 없습니다!");
	}
}


function orderedit(wo_code) {
	if(deptName.includes('생산')){    	
		  var popupUrl = '/pro/orderEdit?wo_code='+ wo_code;
		  window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
		}else{
	swal.fire("권한이 없습니다!");
	}
}

function  ProOrderDelete(wo_code) {
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




//품명 검색 팝업창
function openItem(){
    window.open("/pro/itemList","popup", "width=500, height=600,left=100, top=100");
}




function itemrecipeList(item_code,item_name){ // 해당 작업지시번호에 맞는 생산실적 ajax로 불러오기
// 	var item_code = item_code;
// 	item_name = item_name;
// 	console.log(item_name);
// 	alert(instrId);

	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/pro/itemrecipeList",
		data : {"item_code" : item_code},
// 			   {"item_name" : item_name},
		dataType : "json",
		async : false, 
		/* 동기는 응답을 받을 때까지 기다렸다가 다음 작업을 하는 것 */
		/* 비동기는 요청에 대한 응답이 끝나기 전에 다음 작업을 먼저 함 */
		/* asyns는 기본 값이 true, false이면 응답이 끝나면 다음 작업을 수행하라는 의미 */
		success : function(array,item_name){
// 			alert("성공");
// 			console.log(array,item_name);
// 			alert("array.length"+ array.length);
			itemrecipeListPrint(array);

		} //function(array) 
		
	}); // ajax
} 

function itemrecipeListPrint(array) {
	  var oQTY = $("#oQTY").val();
	  var item_name = $("#item_name").val();
	  console.log(item_name);
	  var output = "";
	  output += "<table class='product-table' style='margin-top: 20px; margin-bottom: 20px; width: 100%;'>";
	  output += "<tr id='th'><tr><th colspan='3'>" + item_name + "해당 레시피</th></tr><th>자재코드</th><th>자재이름</th><th>투입량</th></tr>";
	  
	  for (var i = 0; i < array.length; i++) {
	    output += "<tr id='con'>";
	    output += "<td>" + array[i].material_code + "</td>";
	    output += "<td>" + array[i].material_name + "</td>";
	    output += "<td>" + array[i].material_con * oQTY + "</td>";
	    output += "</tr>";
	  }

	  output += "</table>";
	  $("#Require_ajax").html(output);
	}



</script>




</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 작업지시</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">


<!-- 작업지시목록 검색박스 -->
<%-- ${login_id } --%>
<%-- ${dept_name } --%>
<form id="instr">
<!-- 작업지시목록 검색, 등록버튼 -->
<div class=btn-container>
<input class="btn btn-primary" type="submit" value="조회">
<input type="button" class="btn btn-outline-primary" onclick="orderwrite()" value="추가">
</div>
<table class="product-box" style="margin-top: 20px; width: 100%; " border="1">
			<tr>
				<td >라인</td>
				<td ><select name="line_code" class="line_code"  style="width: 40%">
						<option value="" selected>전체</option>
						<c:forEach var="line" items="${lineList}">
							<option value="${line.line_code}">${line.line_name}</option>
						</c:forEach>
					</select></td>
<!-- 	<td>작업 지시자</td> -->
<!-- 	<td><div class="input-group"> -->
<!-- 	    <input type="text" style="width: 40%" placeholder="상품 이름" class="form-control" name="employee_id" id="employee_id"> -->
<!-- 	    <input type="button" class="btn btn-primary" onclick="openItem()" value="검색"> -->
<!-- 	</div></td> -->
				<td>지시상태</td>
				<td>
				<select name="wo_status">
				<option value="">전체</option>
				<option value="지시">지시</option>
				<option value="시작">시작</option>
				<option value="마감">마감</option>
				</select>
				</td>
			<td>지시일자</td>
				<!-- 시작시 기본 날짜 설정은 value를 이용 -->
				<td><input type="date" id="wo_date" class="form-control" name="wo_date" placeholder="날짜를 선택해주세요" />
			</tr>
			<tr>	
				<td >품번</td>
		<td colspan="5"><div class="input-group" >
	    <input type="text"  placeholder="상품 코드" class="form-control" name="item_code" id="item_code" readonly>
	    <input type="text"  placeholder="상품 이름" class="form-control" name="item_name" id="item_name" readonly>
	    <input type="button" class="btn btn-primary" onclick="openItem()" value="검색">
	</div></td>
	
			</tr>
  </table>
</div>
</form>



<!-- 작업지시목록 리스트 -->
<!-- 작업지시상태 시작/지시 :  작업지시 현황 리스트 -->
<!-- 작업지시상태 마감 :  실적현황 -> 실적등록 -->

 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 작업지시 목록</h4>    
 <span style="color: red; font-size: 13px">* 작업 지시 번호 클릭시 해당작업 실적등록 가능</span> 
  <table class="product-table" style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>작업지시번호</th>
        <th>수주번호</th>
        <th>작업지시자</th>
        <th>지시상태</th>
        <th>납품예정일</th>
        <th>라인코드</th>
        <th>상품코드</th>
        <th>상품이름</th>
        <th>지시수량</th>
        <th>생산수량</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="vo" items="${oderList }">
      <tr>
		<td><a href="/pro/etcstatusList?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
        <td>${vo.so_code}</td>
        <td>${vo.employee_name}</td>
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
        <td onclick="itemrecipeList('${vo.item_code}','${vo.item_name}');"> ${vo.item_code}</td>
        <td><input type="hidden" id="item_name" value="${vo.item_name}" >${vo.item_name}</td>
        <td><input type="hidden" id="oQTY" value="${vo.oQTY}" >${vo.oQTY}</td>
        <td>${vo.pQTY}</td>
		<c:choose>
		  <c:when test="${vo.wo_status eq '지시'}">
		    <td><button class="btn-edit" onclick="orderedit('${vo.wo_code}')"><i class="bx bx-edit"></i></button></td>
		    <td><button class="btn-delete" onclick="ProOrderDelete('${vo.wo_code}')"><i class="bx bxs-trash"></i></button></td>
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

  <i class="bi bi-box-arrow-in-down-right"></i>
  <!-- 페이징처리 -->
<%--   		${Search} --%>
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>
  		
</div>
</div>

	
<br><br><br>
    <div id="Require_ajax" style="margin-top: 50px">
	<table class="product-table" style="margin-top: 50px;margin-bottom:20px; width: 100%;">
<!-- 	<tr id="th"><th>자재코드</th><th>자재이름</th><th>투입량</th></tr> -->
	<tr id="con"><td> 레시피를 확인하려면 해당 상품코드를 클릭해주세요 </td></tr>
    </table>
    </div>

<br><br>


</body>
</html>