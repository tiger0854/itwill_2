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


<style type="text/css">

td{
height: 30px; vertical-align: middle; text-align: center;
}
th{
height: 50px; vertical-align: middle; text-align: center;
}
    table td:first-child,
    table th:first-child {
        border-left: none;
    }

    table td:last-child,
    table th:last-child {
        border-right: none;
    }    
</style>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">

	
 	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->  

	
	
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 100px;max-width: 100% !important;">
<h3 style="font-style: italic;">발주현황</h3>

<!-- Tab panes -->
<div class="tab-content" style="margin-top: 30px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <button type="button" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;" onclick="location.href='/inbound/orderWrite'">발주등록</button>
  <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 60px;">
  <form action=""method="get">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;align-items: center; justify-content: space-between;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 150px;" name="kind" id="kind">
  <option value="number">발주번호</option>
  <option value="code">상품코드</option>
  <option value="name">상품명</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="search" value="${pageVO.search }">
	 <button type="submit" class="btn btn-primary">검색</button>
	</div>
   </form>
   </div>
  <table class="table table-bordered" style="width: 100%;">
    <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
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
     <tbody style="border-bottom:3px solid #E9E9E9; ">
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
     </tbody>
  </table>
</div>
<!-- 전체 -->

    </div>
     <div style="color: red;">*발주완료된 건은 수정/취소가 불가합니다.</div>
  
    <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	<div class="container">
	 	<ul class="pagination"style="justify-content: center;">			
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<li class="page-item"><a class="page-link" href="/inbound/orderList?pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">◀</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/inbound/orderList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/inbound/orderList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<li class="page-item"><a class="page-link" href="/inbound/orderList?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">▶</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
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
	var popupHeight = 600;

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