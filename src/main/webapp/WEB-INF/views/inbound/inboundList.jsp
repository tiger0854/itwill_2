<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>



<!-- 판매목록 drop 기능 -->
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
<body id="body-pd">
	
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
   

	
	
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" onclick="location.href='/customer/customerList'"><i class="bx bx-book"></i>입고현황</h4>
<hr style="border: 2px solid black;">

<div class="tab-content" style="margin-top: 20px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <button type="button" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;"  onclick="location.href='/inbound/inboundWrite'">입고등록</button>
  <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 60px;">
  <form action=""method="get">
   
   <div class="input-group mb-3"style="width: 600px;justify-content: flex-start;align-items: center; justify-content: space-between;">
   
      	<select class="form-select"style="max-width: 150px;margin-right: 5px;" name="state" id="state" >
			  <option value="all">전체</option>
			  <option value="ready">입고대기</option>
			  <option value="finish">입고완료</option>
		</select>
   
   	  <select class="form-select" style="max-width: 150px;" name="kind" id="kind">
  <option value="number" id="number">입고예정번호</option>
  <option value="code" id="code">창고코드</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="search" value="${pageVO.search }">
	 <button type="submit" class="btn btn-primary">검색</button>
	</div>
   </form>
   </div>
 <table class="table table-bordered" style="width: 100%;">
    <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
      <tr>
   		<th><input type="checkbox"  class="form-check-input" name='allCheck'value='selectall' onclick="selectAll(this);"></th>
        <th>입고예정번호</th>
        <th>자재명</th>
        <th>자재코드</th>
        <th>발주수량</th>
        <th>입고예정수량</th>
        <th>미입고수량</th>        
        <th>최종 입고 수량</th>
        <th>입고예정일</th>
        <th>담당자</th>
        <th>창고코드</th>
        <th>유통기한</th>
        <th style="width: 140px;">상태</th>
        <th>관리</th>
      </tr>
      
      
    </thead>
   <tbody style="border-bottom:3px solid #E9E9E9; ">
    
    <c:forEach var="vo" items="${inboundList}">
    
      <tr>
   		<c:choose>
       		<c:when test="${vo.in_state == 0 }">
       			<td><input type="checkbox" class="form-check-input" value="${vo.in_id }" name="rowCheck" ></td>
       		</c:when>
       		<c:otherwise>
    	   		<td><input type="checkbox" disabled="disabled"  class="form-check-input" ></td>
       		</c:otherwise>
        </c:choose>
      
        <td>${vo.in_number }</td>
        <td>${vo.orderVO.material_name }</td>
        <td>${vo.orderVO.material_code }</td>
        <td  style="text-align: right;" >${vo.orderVO.order_piece }</td>
        <td style="text-align: right;">${vo.in_piece }</td>
        <c:choose>
       		<c:when test="${vo.in_state == 0 }">
       		  <td style="text-align: right;">-</td>
       		  <td style="text-align: right;">-</td>
       		</c:when>
       		<c:otherwise>
  			   <td style="text-align: right;">${vo.in_piece - vo.in_Epiece }</td>     
  			   <td style="text-align: right;">${vo.in_Epiece }</td>  		
    		 </c:otherwise>
        </c:choose>
   
        <td>${vo.in_date }</td>
        <td>${vo.in_resp }</td>
        <td>${vo.wh_code }</td>
        <td>${vo.in_expir }</td>
        <c:choose>
       		<c:when test="${vo.in_state == 0 }">
       		<td style="color: red;">입고대기</td>
       		</c:when>
       		<c:otherwise>
       		<td style="color: blue;">입고완료<br>(${vo.in_Edate })</td>
       		</c:otherwise>
        </c:choose>
         <td>
         <c:choose>
         <c:when test="${vo.in_state == 0 }">
      <button type="button" class="btn btn-primary btn-sm" onclick="openChildWindow2(this);" >수정</button>
      <button type="button" class="btn btn-primary btn-sm" onclick="openChildWindow(this);">입고처리</button>
        </c:when>
        <c:otherwise>
          <button type="button" class="btn btn-primary btn-sm" disabled="disabled" >수정</button>
          <button type="button" class="btn btn-primary btn-sm" disabled="disabled">입고처리</button>
        </c:otherwise>
        </c:choose>
        </td>
      </tr>
  
      </c:forEach>
    </tbody> 
  </table>
</div>
<!-- 전체 -->
 <div style="color: red; margin-bottom: 10px;">*입고완료된 건은 수정/취소가 불가합니다.</div>
  <button type="button" class="btn btn-danger"style="margin-bottom: 30px;" onclick="deleteInbound();">선택취소</button>
  
    <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	<div class="container">
	 	<ul class="pagination" style="justify-content: center;">			
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<li class="page-item"><a class="page-link" href="/inbound/inboundList?pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">◀</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/inbound/inboundList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}&state=${pageVO.state}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/inbound/inboundList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<li class="page-item"><a class="page-link" href="/inbound/inboundList?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">▶</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
 </div>
  
  
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
	var popupHeight = 400;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
    var childWindow = window.open("/inbound/InboundProcess", "InboundProcess", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
   
   // 자식 창이 로드된 후에 데이터를 전송합니다.
   childWindow.addEventListener("load", function() {
     childWindow.postMessage(rowData, "*");
   
   });
 }//입고처리 팝업 
 
 function openChildWindow2(button) {
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
	    var childWindow = window.open("/inbound/inbountModify", "inbountModify", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
	   
	   // 자식 창이 로드된 후에 데이터를 전송합니다.
	   childWindow.addEventListener("load", function() {
	     childWindow.postMessage(rowData, "*");
	   
	   });
	 }//수정 팝업 
 
 function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('rowCheck');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
 
 
 function deleteInbound() {
	var valArr = new Array();
	var list = $("input[name='rowCheck']");
	
	for(var i=0; i<list.length;i++){
		if(list[i].checked){
		valArr.push(list[i].value);
	  }	
	}

	if(valArr.length == 0){
    	Swal.fire("선택된 목록이 없습니다.")
     
	}else{
      	Swal.fire({
            title: "입고를 취소하겠습니까?",
            text: "선택된 입고목록 수 :"+valArr.length,
			icon: "warning",
              
           	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
           	   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
           	   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
           	   confirmButtonText: '예', // confirm 버튼 텍스트 지정
           	   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
           	   
            }).then(result => {
                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
          		  $.ajax({
    				  url : "/inbound/InboundDelete",
    				  type : 'POST',
    				  traditional : true,
    				  data: {
    					  valArr : valArr
    				  },
    				  success:function(ddata){
    				
    						 Swal.fire({
    				                title: "취소가 완료되었습니다.",
    				                text: "",
    				                icon: "success"
    				              }).then(function() {
    				            	  location.reload()
    				              
    				              });
    					 
    					 
    					  
    				  }//success 
    			  });// ajax
            	    
                } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
                	// ...실행
                }
            });
		
	}
}// 입고취소

</script>
  
    
    
</body>
</html>