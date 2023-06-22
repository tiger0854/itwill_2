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
  <button type="button" class="btn btn-primary"style="margin-bottom: 50px;margin-right:50px; float: right;" onclick="openChildWindow(this);">거래처등록</button>
<h3 style="font-style: italic;">거래처LIST</h3>
<ul class="nav nav-tabs" id="myTab" role="tablist" style="flex-direction: row;justify-content: flex-start;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="notend-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">납입처</button>
  </li>
   <li class="nav-item" role="presentation">
    <button class="nav-link" id="end-tab" data-bs-toggle="tab" data-bs-target="#end" type="button" role="tab" aria-controls="profile" aria-selected="false">납품처</button>
  </li>
</ul>
<!-- Tab panes -->
<div class="tab-content" style="margin-top: 30px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">거래처명</option>
  <option value="2">종목</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary" onclick="openChild();">검색</button>
	</div>
 <table class="table table-hover" style="width: 1250px; cursor: pointer;">
    <thead style="border-bottom: 1px solid">
      <tr>
   		<th><input type="checkbox"  class="form-check-input" name='allCheck'value='selectall' onclick="selectAll(this);"></th>
   		<th>번호</th>
        <th>거래처코드</th>
        <th>거래처분류</th>
        <th>대표자명</th>
        <th>담당자명</th>
        <th>담당자연락처</th>        
        <th>주소</th>
        <th>업태</th>
        <th>종목</th>

      </tr>
      
      
    </thead>
    
</tbody>
      <c:forEach var="vo" items="${customerList}">
      <tr onclick="openChildWindow2(${vo.cus_id});">
        <td><input type="checkbox"  class="form-check-input" name='rowCheck' value="${vo.cus_id}" ></td>
        <td>${vo.cus_id}</td>
	    <td>${vo.cus_code}</td>
		<c:choose>
       		<c:when test="${vo.cus_stat == 1}">
       		  <td>납입처</td>
       		</c:when>
       		<c:otherwise>
  			 <td>납품처</td>	
    		 </c:otherwise>
        </c:choose>
	      <td>${vo.cus_rep}</td>
	      <td>${vo.cus_resp}</td>
	      <td>${vo.cus_phone}</td>
	      <td>${vo.cus_address}</td>
	      <td>${vo.cus_business}</td>
	      <td>${vo.cus_event}</td>
	   
      </tr>
   	</c:forEach>
    </tbody>
     
     
  </table>
</div>
<!-- 전체 -->

<!-- 납입처 -->
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">거래처명</option>
  <option value="2">종목</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
 <table class="table table-striped" style="width: 1250px;">
    <thead style="border-bottom: 1px solid">
      <tr>
   		<th><input type="checkbox"  class="form-check-input" ></th>
        <th>거래처코드</th>
        <th>거래처분류</th>
        <th>대표자명</th>
        <th>담당자명</th>
        <th>담당자연락처</th>        
        <th>주소</th>
        <th>업태</th>
        <th>종목</th>
      </tr>
      
      
    </thead>
    	</tbody>
      <c:forEach var="vo" items="${customerList}">
      <tr>
    
	      <td><input type="checkbox"></td>
	      <td>${vo.cus_code}</td>
	      <td>${vo.cus_stat}</td>
	      <td>${vo.cus_rep}</td>
	      <td>${vo.cus_resp}</td>
	      <td>${vo.cus_phone}</td>
	      <td>${vo.cus_address}</td>
	      <td>${vo.cus_business}</td>
	      <td>${vo.cus_event}</td>
	   
      </tr>
       </tbody>
   	</c:forEach>
   	
  </table>
  </div>
  <!-- 납입처 -->
  
  <!-- 발주완료 -->
    <div class="tab-pane" id="end" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
     <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
    <option value="1">거래처명</option>
  <option value="2">종목</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
	 <table class="table table-striped" style="width: 1250px;">
    <thead style="border-bottom: 1px solid">
      <tr>
   		<th><input type="checkbox"  class="form-check-input" ></th>
   		<th></th>
        <th>거래처코드</th>
        <th>거래처분류</th>
        <th>대표자명</th>
        <th>담당자명</th>
        <th>담당자연락처</th>        
        <th>주소</th>
        <th>업태</th>
        <th>종목</th>
      </tr>
      
      
    </thead>
    
	  <tbody>
      <c:forEach var="vo" items="${customerList}">
      <tr>
        <td><input type="checkbox"  class="form-check-input" ></td>
          <td>${vo.cus_id}</td>
	      <td>${vo.cus_code}</td>
	      <td>${vo.cus_stat}</td>
	      <td>${vo.cus_rep}</td>
	      <td>${vo.cus_resp}</td>
	      <td>${vo.cus_phone}</td>
	      <td>${vo.cus_address}</td>
	      <td>${vo.cus_business}</td>
	      <td>${vo.cus_event}</td>
	   
      </tr>
   	</c:forEach>
 	 </tbody>
     
     
  </table>
  
</div>
  <!-- 납품처 -->
      <div style="color: red; margin-bottom: 10px;">*원하는 목록을 선택하면 상세보기 및 수정페이지가 열립니다.</div>
  <button type="button" class="btn btn-danger"style="margin-bottom: 30px;" onclick="deleteInbound();">선택삭제</button>
 </div>
 </div>
    
 
 <script type="text/javascript">
	var popupWidth = 600;
	var popupHeight = 600;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
 function openChildWindow(button) {
   
    var childWindow = window.open("/customer/customerWrite", "customerWrite", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
   
 }// 거래처등록 팝업 
 
 function openChildWindow2(cus_id) {
		var popupWidth = 800;
		var popupHeight = 500;
	   
	    var childWindow = window.open("/customer/customerDetail?cus_id="+cus_id, "customerDetail", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
	   
	 }// 거래처등록 팝업

 	
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
	            title: "거래처를 삭제하겠습니까?",
	            text: "선택된 거래처목록 수 :"+valArr.length,
				icon: "warning",
	              
	           	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	           	   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	           	   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	           	   confirmButtonText: '예', // confirm 버튼 텍스트 지정
	           	   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
	           	   
	            }).then(result => {
	                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	          		  $.ajax({
	    				  url : "/customer/customerDelete",
	    				  type : 'POST',
	    				  traditional : true,
	    				  data: {
	    					  valArr : valArr
	    				  },
	    				  success:function(ddata){
	    				
	    						 Swal.fire({
	    				                title: "삭제가 완료되었습니다.",
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