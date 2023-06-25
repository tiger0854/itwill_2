<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

function orderDelete(button) {
		   var row = button.parentNode.parentNode;
		   var cells = row.getElementsByTagName("td");
		   var rowData = [];
		   
		   for (var i = 0; i < cells.length - 1; i++) {
		     rowData.push(cells[i].innerText);
		   }
		  
		   
	      	Swal.fire({
                title: "발주를 취소하겠습니까?",
                text: "",
				icon: "warning",
	              
	           	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	           	   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	           	   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	           	   confirmButtonText: '예', // confirm 버튼 텍스트 지정
	           	   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
	            }).then(result => {
	                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	                	location.href="/inbound/orderDelete?order_number="+rowData[0];
	            	    
	                } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	                	// ...실행
	                }
	            });
		   

	 
};
	
	

</script>

<!-- 판매목록 drop 기능 -->
<style type="text/css">
td{
height: 50px; vertical-align: middle;
}
  
</style>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">

	
 	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->  

	
	
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 100px;">
<h3 style="font-style: italic;">발주현황</h3>
<ul class="nav nav-tabs" id="myTab" role="tablist" style="flex-direction: row;justify-content: flex-start;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="notend-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">발주대기</button>
  </li>
   <li class="nav-item" role="presentation">
    <button class="nav-link" id="end-tab" data-bs-toggle="tab" data-bs-target="#end" type="button" role="tab" aria-controls="profile" aria-selected="false">발주완료</button>
  </li>
</ul>
<!-- Tab panes -->
<div class="tab-content" style="margin-top: 30px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
 <table class="table table-striped" style="width: 1200px;">
    <thead style="border-bottom: 1px solid">
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>거래처</th>
        <th>진행상황</th>
        <th>관리</th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${orderList}">
    
      <tr>
      	
        <td>${vo.order_number }</td>
        <td>${vo.material_code }</td>
        <td>${vo.material_name }</td>
        <td>${vo.order_piece }</td>
        <td>${vo.order_date }</td>
        <td>${vo.pay_date }</td>
        <td><fmt:formatNumber>${vo.material_price }</fmt:formatNumber>원</td>
        <td><fmt:formatNumber>${vo.material_price*vo.order_piece }</fmt:formatNumber>원</td>
        <td>${vo.order_resp }</td>
        <td>${vo.order_trade }</td>
        <c:choose>
       		<c:when test="${vo.order_state == 0 }">
       		<td style="color: red;">발주대기</td>
       		</c:when>
       		<c:otherwise>
       		<td style="color: blue;">발주완료</td>
       		</c:otherwise>
        </c:choose>
         <td>
         <c:choose>
         <c:when test="${vo.order_state == 0 }">
      <button type="button" class="btn btn-primary btn-sm" onclick="openChildWindow(this);" >수정</button>
        <button type="button" class="btn btn-secondary btn-sm" onclick="orderDelete(this);">취소</button>
        </c:when>
        <c:otherwise>
       	<button type="button" class="btn btn-primary btn-sm" disabled="disabled">수정</button>
        <button type="button" class="btn btn-secondary btn-sm" disabled="disabled">취소</button>
        </c:otherwise>
        </c:choose>
        </td>
      </tr>
  
      </c:forEach>
     
  </table>
</div>
<!-- 전체 -->

<!-- 발주대기 -->
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
  <table class="table table-striped" style="width: 1200px;">
    <thead >
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>거래처</th>
        <th>진행상황</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${orderList}">
    <c:if test="${vo.order_state == 0 }">
      <tr >
 		<td>${vo.order_number }</td>
        <td>${vo.material_code }</td>
        <td>${vo.material_name }</td>
        <td>${vo.order_piece }</td>
        <td>${vo.order_date }</td>
        <td>${vo.pay_date }</td>
        <td><fmt:formatNumber>${vo.material_price }</fmt:formatNumber>원</td>
        <td><fmt:formatNumber>${vo.material_price*vo.order_piece }</fmt:formatNumber>원</td>
        <td>${vo.order_resp }</td>
        <td>${vo.order_trade }</td> 
        <td style="color: red;">발주대기</td>
        <td>    
       	 <button type="button" class="btn btn-primary btn-sm" onclick="openChildWindow(this);">수정</button>
       	 <button type="button" class="btn btn-secondary btn-sm">취소</button>
        </td>
      </tr>
	  </c:if>
      </c:forEach>

    </tbody>
  </table>
  </div>
  <!-- 발주대기 -->
  
  <!-- 발주완료 -->
    <div class="tab-pane" id="end" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
     <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
	 <table class="table table-striped" style="width: 1200px;">
    <thead >
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>거래처</th>
        <th>진행상황</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${orderList}">
    <c:if test="${vo.order_state == 1 }">
      <tr >
 		<td>${vo.order_number }</td>
        <td>${vo.material_code }</td>
        <td>${vo.material_name }</td>
        <td>${vo.order_piece }</td>
        <td>${vo.order_date }</td>
        <td>${vo.pay_date }</td>
        <td><fmt:formatNumber>${vo.material_price }</fmt:formatNumber>원</td>
        <td><fmt:formatNumber>${vo.material_price*vo.order_piece }</fmt:formatNumber>원</td>
        <td>${vo.order_resp }</td>
        <td>${vo.order_trade }</td> 
        <td style="color: blue;">발주완료</td>
        <td>     	
        <button type="button" class="btn btn-primary btn-sm" disabled="disabled">수정</button>
        <button type="button" class="btn btn-secondary btn-sm" disabled="disabled">취소</button>
        </td>
      </tr>
	  </c:if>
      </c:forEach>

    </tbody>
  </table>
</div>
  <!-- 발주완료 -->
    </div>
     <div style="color: red;">*발주완료된 건은 수정/취소가 불가합니다.</div>
  <button type="button" class="btn btn-outline-primary"style="margin-bottom: 30px;margin-right:50px; float: right;" onclick="location.href='/inbound/orderWrite'">발주등록</button>
 
    </div>
 
 <script type="text/javascript">
 
 function openChildWindow(button) {
   var row = button.parentNode.parentNode;
   var cells = row.getElementsByTagName("td");
   var rowData = [];
   
   for (var i = 0; i < cells.length - 1; i++) {
     rowData.push(cells[i].innerText);
   }
   
	var popupWidth = 600;
	var popupHeight = 500;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
    var childWindow = window.open("/inbound/orderModify", "orderModify",'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
   
   // 자식 창이 로드된 후에 데이터를 전송합니다.
   childWindow.addEventListener("load", function() {
     childWindow.postMessage(rowData, "*");
   
   });
 }
 

</script><!-- 수정창 부르기 -->
    
  
    
    
</body>
</html>