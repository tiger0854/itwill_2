<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>





<style type="text/css">
.detail-Link{
 cursor: pointer;color: #2A1BB5!important;text-decoration: none;
 }
.detail-Link:hover{
 text-decoration: underline;
} 
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
<body id="body-pd" >
	
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
   

	
	${serch }
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 100px;max-width: 100% !important;">

<h3 style="font-style: italic;" onclick="location.href='/customer/customerList'">거래처LIST</h3>

<!-- Tab panes -->
<div class="tab-content" style="margin-top: 30px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
   <button type="button" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;" onclick="openChildWindow(this);">거래처등록</button>
  <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 60px;">
  <form action=""method="get">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;align-items: center; justify-content: space-between;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;" name="kind" id="kind">
  <option value="name">거래처명</option>
  <option value="code">거래처코드</option>
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
   		<th>번호</th>
        <th>거래처코드</th>
        <th>거래처명</th>
        <th>거래처분류</th>
        <th>대표자명</th>
        <th>담당자명</th>
        <th>담당자연락처</th>        
        <th>업태</th>
        <th>종목</th>

      </tr>
      
      
    </thead>
    
<tbody style="border-bottom:3px solid #E9E9E9; ">
      <c:forEach var="vo" items="${customerList}">
      <tr>
        <td><input type="checkbox"  class="form-check-input" name='rowCheck' value="${vo.cus_id}"></td>
        <td>${vo.cus_id}</td>
	    <td onclick="openChildWindow2(${vo.cus_id});"class="detail-Link">${vo.cus_code}</td>
	    <td>${vo.cus_name}</td>
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
	      <td>${vo.cus_business}</td>
	      <td>${vo.cus_event}</td>
	   
      </tr>
   	</c:forEach>
    </tbody>
     
     
  </table>
</div>
<!-- 전체 -->

      <div style="color: red; margin-bottom: 10px;">*거래처 코드를 클릭하면 상세보기 및 수정페이지가 열립니다.</div>
  <button type="button" class="btn btn-danger"style="margin-bottom: 10px;" onclick="deleteInbound();">선택삭제</button>

 </div>
   <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	<div class="container">
	 	<ul class="pagination"style="justify-content: center;">			
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<li class="page-item"><a class="page-link" href="/customer/customerList?pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">◀</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/customer/customerList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<li class="page-item"><a class="page-link" href="/customer/customerList?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">▶</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
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
		var popupHeight = 600;
	   
	    var childWindow = window.open("/customer/customerDetail?cus_id="+cus_id, "customerDetail", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
	   
	 }// 거래처상세보기 팝업

 	
 function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('rowCheck');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}//체크박스 전체선택

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