<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>수주 리스트</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">


	
	$(document).ready(function(){
	// 디비 - 서비스 - 컨트롤러 -> 뷰(jsp) -> JS -> AJAX
		
		var data = "${result}";
		
		if(data == "CREATEOK"){
	
			callModal("글 쓰기 완료");
		}	
		if(data == "MODOK"){
			callModal("수주 수정 완료");
		}
		if(data == "DELOK"){
			callModal("글 삭제 완료");
		}
		
	function callModal(txt){
		$(".modal-body").html(txt);
		$("#myModal").modal("show");
		}
	});

	
	function receiveRemove() {
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
	            title: "선택된 수주를 삭제하겠습니까?",
	            text: "선택된 수주 목록 수 :"+valArr.length,
				icon: "warning",
	           	   showCancelButton: true, 
	           	   confirmButtonColor: '#3085d6', 
	           	   cancelButtonColor: '#d33',
	           	   confirmButtonText: 'Yes', 
	           	   cancelButtonText: 'No', 
	            }).then(result => {
	                if (result.isConfirmed) { 
	          		  $.ajax({
	    				  url : "/receive/receiveRemove",
	    				  type : 'POST',
	    				  traditional : true,
	    				  data: {
	    					  valArr : valArr
	    				  },
	    				  success:function(data){
	    						 Swal.fire({
	    				                title: "수주 삭제 완료",
	    				                text: "",
	    				                icon: "success"
	    				              }).then(function() {
	    				            	  location.reload()
	    				              });
	    				  }
	    			  });
	                } else if (result.isDismissed) { 
	                }
	            });
			}
		}

</script>



</head>
<body id="body-pd" >
<jsp:include page="../common/header.jsp"/>



<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">
	        Modal body..
	      </div>

	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>

	    </div>
	  </div>
	</div>
	  <!-- 모달창 -->


 <div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>수주목록</h4>
<hr style="border: 2px solid black;">

 <div class="tab-content" style="margin-top: 20px;" >
 <button type="button" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;"  onclick="location.href='/receive/receiveInsert'">수주등록</button>
  <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 60px;">
 
   <!-- select box 검색 품목명, 수주업체 -->
  <form action="" method="get">
  <div class="input-group mb-3"style="width: 600px;justify-content: flex-start;align-items: center; justify-content: space-between;">
  	<select class="form-select" style="max-width: 150px;" name="kind" id="kind">
  		<option value="itemName">품목명</option>
  		<option value="customerName">수주업체명</option>
  	</select>
  <input type="text" placeholder="검색어를 입력하세요" class="form-control" name="search" value="${pageVO.search }"> 
  <button type="submit" class="btn btn-primary">검색</button>
  </div>
  </form>
  </div>
  <table class="table table-bordered" style="width: 100%;">
  <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
  <tr>
  <td></td>
  <th>수주번호</th>
  <th>상품명</th>
  <th>수주업체</th>
  <th>수주일자</th>
  <th>수주수량</th>
  <th>담당자</th>
  <th>진행상태</th>
  </tr>
  </thead>
  <tbody style="border-bottom:3px solid #E9E9E9; ">
  <c:forEach var="vo" items="${receiveList }">
    <tr>
	  <td class="text_ct"><input type="checkbox" name="rowCheck" value="${vo.re_code }"/></td>
	  <td><a href="/receive/receiveDetail?re_code=${vo.re_code}">${vo.re_code }</td> <!-- join 하면 concat item_code 되는지 확인 -->
	  <td>${vo.item_name }</td>
	  <td>${vo.re_customerNm }</td>
	  <td>${vo.re_date }</td>
	  <td>${vo.re_qty }</td> 
	  <td>${vo.re_empNm }</td> 
  <c:choose>
    <c:when test="${vo.re_state == 1}">
      <td>진행중</td>
    </c:when>
    <c:otherwise>
      <td><font color="blue">출고완료</font></td>
    </c:otherwise>
  </c:choose>
    </tr>
  </c:forEach>
  </tbody>
  </table>
</div>
<button type="button" class="btn btn-danger" style="margin-bottom: 30px;" onclick="receiveRemove(this);">수주 삭제</button>
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<div class="container">
	 		<ul class="pagination" style="justify-content: center;" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
  </div>
<!--   <button class="btn btn-outline-info" onclick="location.href='./receiveInsert';">등록</button> -->
 </div> 
 <script type="text/javascript">
 $(document).ready(function () {
  	 
		  var deptName = "${sessionScope.dept_name}";
		  var positionName = "${sessionScope.position_name}";	
		  
		  if(deptName.includes('유통')||deptName.includes('입고')||deptName.includes('출고')||positionName=='이사'){
		  }
		  else{
			Swal.fire("권한이 없습니다.").then(function() {
		    history.back() 
		    });
		  return false;
		  }

	});
 
 </script>
</body>
</html>