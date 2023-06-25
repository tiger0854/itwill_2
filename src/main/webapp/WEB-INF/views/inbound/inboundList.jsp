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


<!-- 판매목록 drop 기능 -->
<style type="text/css">

td{height: 50px; vertical-align: middle; text-align: center;}
  
</style>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
   

	
	
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 100px;">
  <button type="button" class="btn btn-outline-primary"style="margin-bottom: 50px;margin-right:50px; float: right;" onclick="location.href='/inbound/inboundWrite'">입고등록</button>
<h3 style="font-style: italic;">입고현황</h3>
<ul class="nav nav-tabs" id="myTab" role="tablist" style="flex-direction: row;justify-content: flex-start;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="notend-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">입고대기</button>
  </li>
   <li class="nav-item" role="presentation">
    <button class="nav-link" id="end-tab" data-bs-toggle="tab" data-bs-target="#end" type="button" role="tab" aria-controls="profile" aria-selected="false">입고완료</button>
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
  <option value="3">입고번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary" onclick="openChild();">검색</button>
	</div>
 <table class="table table-striped" style="width: 1250px;">
    <thead style="border-bottom: 1px solid;text-align: center;">
      <tr>
   		<th><input type="checkbox"  class="form-check-input" name='allCheck'value='selectall' onclick="selectAll(this);"></th>
        <th>입고예정번호</th>
        <th>품목명</th>
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
    
    <c:forEach var="vo" items="${inboundList}">
    
      <tr>
   		<c:choose>
       		<c:when test="${vo.in_state == 0 }">
       			<th><input type="checkbox" class="form-check-input" value="${vo.in_id }" name="rowCheck" ></th>
       		</c:when>
       		<c:otherwise>
    	   		<th><input type="checkbox" disabled="disabled"  class="form-check-input"style="margin-top: 15px;"  ></th>
       		</c:otherwise>
        </c:choose>
      
        <td>${vo.in_number }</td>
        <td>${vo.orderVO.material_name }</td>
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
     
  </table>
</div>
<!-- 전체 -->

<!-- 발주대기 -->
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">입고번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
 <table class="table table-striped" style="width: 1250px;">
   <thead style="border-bottom: 1px solid">
      <tr>
 
        <th>입고예정번호</th>
        <th>품목명</th>
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
    <tbody>
      <c:forEach var="vo" items="${inboundList}">
   		 <c:if test="${vo.in_state == 0 }">
      <tr>
    
        <td>${vo.in_number }</td>
        <td>${vo.orderVO.material_name }</td>
        <td>${vo.orderVO.order_piece }개</td>
        <td>${vo.in_piece }개</td>
      	 <td>${vo.in_piece - vo.in_Epiece }개</td>
        <td>${vo.in_Epiece }개</td>
        <td>${vo.in_date }</td>
        <td>${vo.in_resp }</td>
        <td>${vo.wh_code }</td>
        <td>${vo.in_expir }</td>
        <td style="color: red;">입고대기</td>
       	<td>
       	  <button type="button" class="btn btn-primary btn-sm">입고처리</button>
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
  <option value="3">입고번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
	 <table class="table table-striped" style="width: 1250px;">
   	 <thead style="border-bottom: 1px solid">
      <tr>
		
        <th>입고예정번호</th>
        <th>품목명</th>
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
    <tbody>
      <c:forEach var="vo" items="${inboundList}">
   		 <c:if test="${vo.in_state == 1 }">
      <tr>
        
        <td>${vo.in_number }</td>
        <td>${vo.orderVO.material_name }</td>
        <td>${vo.orderVO.order_piece }개</td>
        <td>${vo.in_piece }개</td>
        <td>${vo.in_piece - vo.in_Epiece }개</td>
        <td>${vo.in_Epiece }개</td>
        <td>${vo.in_date }</td>
        <td>${vo.in_resp }</td>
        <td>${vo.wh_code }</td>
        <td>${vo.in_expir }</td>
        <td style="color: blue;">입고완료<br>(${vo.in_Edate })</td>
       	<td>
       	  <button type="button" class="btn btn-primary btn-sm" disabled="disabled">입고처리</button>
        </td>
      </tr>
     	 </c:if>
      </c:forEach>
    </tbody>
  </table>
  
</div>
  <!-- 발주완료 -->
      <div style="color: red; margin-bottom: 10px;">*입고완료된 건은 수정/취소가 불가합니다.</div>
  <button type="button" class="btn btn-danger"style="margin-bottom: 30px;" onclick="deleteInbound();">선택취소</button>
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
		var popupHeight = 400;

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