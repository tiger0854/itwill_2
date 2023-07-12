<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>출고 리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
 
 
</head>
<body id="body-pd">
<jsp:include page="../common/header.jsp"/>
<div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>출고현황</h4>
<hr style="border: 2px solid black;">

 <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
 <button type="button" class="btn btn-primary"style="float: right;margin-top: 20px;margin-right: 30px;"  onclick="location.href='/outbound/outboundInsert'">출고예정등록</button>
  
  <form action="" method="get" id="searchFrm">
  <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 35px;">
	<div class="input-group mb-3" style="width: 600px;">
  <button id="allButton" class="btn btn-primary" name="state"  value="all" >전체</button>
  <button id="ongoingButton" class="btn btn-primary" name="state"  value="ongoing" >진행중</button>
  <button id="completedButton" class="btn btn-primary" name="state"  value="completed" >출고완료</button>
<%-- 	  출고번호 &nbsp;  <input type="text" class="form-control" id="search" name="search" value="${pageVO.search}">  --%>
<!--   	<button type="submit" class="btn btn-primary" >검색</button> -->

  </div>
  </div>
  </form>
  </div>
  <table id="table" border="1" class="table table-bordered"  style="width: 100%;">
  <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
  <tr>
  <td></td>
  <th>출고번호</th>
  <th>거래처명</th>
  <th>품목명</th>
  <th>수량</th>
  <th>상세</th>
  <th>납기일자</th>
  <th>진행상태</th>
  <th>출고일자</th> 
  <th>담당자</th>
  <th>출고처리</th>  
  <th>수정</th>  
  </tr>
  </thead>
  <tbody style="border-bottom:3px solid #E9E9E9; ">
  <c:forEach var="vo" items="${outList }">
  <tr>
  	
  <c:choose>
  	<c:when test="${vo.out_state == 1 }">
  		<td class="text_ct"><input type="checkbox" name="rowCheck" value="${vo.out_num }"/></td>
 	</c:when>
 	<c:otherwise>
 		<td class="text_ct"><input type="checkbox" name="rowCheck" disabled /></td>
 	</c:otherwise>
  </c:choose>
  
  <td id="hidden" style="display:none;">${vo.re_code }</td>
  <td>${vo.out_num }</td>
  <td>${vo.out_customerNm }</td>
  
  <c:choose>
     <c:when test="${vo.outNumCount > 1}">
        <td> ${vo.item_name} </td>
     </c:when>
     <c:otherwise>
       <td> ${vo.item_name} </td>
     </c:otherwise>
  </c:choose>
  
  <td>${vo.out_qty }</td>
  <td><a href='/outbound/outboundStock?out_num=${vo.out_num}'><i class='bx bx-search-alt-2'></i></a></td> 
  <td>${vo.due_date }</td> 
  
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td>진행중</td>
    </c:when>
    <c:otherwise>
		 <td><font color="red">출고완료</font></td>
    </c:otherwise>
 </c:choose>
 
 <c:choose>
 <c:when test="${vo.out_state==1 }">
   		<td></td>
    </c:when>
    <c:otherwise>
        <td><font color="red">${vo.out_date }</font></td>
    </c:otherwise>
 </c:choose>
 
  <td>${vo.out_empNm }</td>
  
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td><button type="button" class="btn-primary" onclick="openChildWindow2(this);">출고</button></td> 
   		<td><button type="button" class="btn-primary" onclick="openChildWindow(this);" >수정</button></td>
    </c:when>
    <c:otherwise>
   		 <td></td>
		 <td></td>
    </c:otherwise>
 </c:choose>
  </tr>
  </c:forEach>
  </tbody>
  </table>
  </div>
  <button type="button" class="btn btn-danger" onclick="outboundRemove(this);">출고 취소</button>
  
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	<div class="container">
	 	<ul class="pagination"style="justify-content: center;">		
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<li class="page-item"><a class="page-link" href="/outbound/outboundList?pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">이전</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.search != null}">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/outbound/outboundList?pageNum=${i}&search=${pageVO.search}&state=${state}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/outbound/outboundList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<li class="page-item"><a class="page-link" href="/outbound/outboundList?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">다음</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
  
  
  
  
  
  
<!--   <button type="button" class="btn btn-outline-info" onclick="location.href='/outbound/outboundInsert';">출고 예정 등록</button> -->
  
  <!-- 진행상태 체크한것 일괄 변경 셀렉트버튼 추가 -->
  
  
 


  <script type="text/javascript">
  
  
  
	 function outboundRemove() {
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
		            title: "출고를 취소하겠습니까?",
		            text: "선택된 출고 목록 수 :"+valArr.length,
					icon: "warning",
		           	   showCancelButton: true, 
		           	   confirmButtonColor: '#3085d6', 
		           	   cancelButtonColor: '#d33',
		           	   confirmButtonText: '예', 
		           	   cancelButtonText: '아니오', 
		            }).then(result => {
		                if (result.isConfirmed) { 
		          		  $.ajax({
		    				  url : "/outbound/outboundDelete",
		    				  type : 'POST',
		    				  traditional : true,
		    				  data: {
		    					  valArr : valArr
		    				  },
		    				  success:function(data){
		    						 Swal.fire({
		    				                title: "출고 취소가 완료되었습니다.",
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
	 
	 
	 
  
	// 출고 처리 popUp
	 function openChildWindow2(button) {
		   var row = button.parentNode.parentNode;
		   var cells = row.getElementsByTagName("td");
		   var rowData = [];
		   
		   for (var i = 0; i < cells.length - 1; i++) {
		     rowData.push(cells[i].innerText);
		   }
		   
			var popupWidth = 500;
			var popupHeight = 400;

			var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
			var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
		    var childWindow = window.open("/outbound/outProcess", "outboundUpdate",'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		   
		   // 자식 창이 로드된 후에 데이터를 전송합니다.
		   childWindow.addEventListener("load", function() {
		     childWindow.postMessage(rowData, "*");
		   
		   });
		 } // 출고 처리 popUp end


	// 출고 상태 변경
	function updateOutState(out_num, out_state) {
	
	    // AJAX 요청을 통해 서버로 데이터 전송
	    $.ajax({
	      url: "/outbound/outboundList",
	      method: "GET",
	      data: { out_num: out_num, out_state: out_state },
	      success: function(response) {
	  
    	      alert("출고 상태 업데이트 성공");

    	      // 해당 행을 "ongoingButton" 목록에서 찾아서 투명하게 애니메이션 적용 후 사라지도록 함
    	      var row = $("td").filter(function() {
    	        return $(this).text() == out_num; // 출고 번호와 일치하는 행 찾기
    	      }).closest("tr");

    	      // 투명한 애니메이션 효과 적용 후 행을 완전히 숨김
    	      row.fadeOut(function() {
    	      // 애니메이션이 완료된 후 행을 "completedButtonTable"로 이동
    	        row.find("td:nth-child(7)").text("완료");
    	     // row.appendTo("#completedButtonTable");
    	      });
    	  },
	      error: function(xhr, status, error) {
	        // 업데이트 중 오류가 발생한 경우 오류 처리
	        alert("출고 상태 업데이트 오류");
	        alert(xhr.responseText);
	      }
	    });
	  }
	

	// 테이블 상태별 출력
// 	function getOutBoundList(state) {
// 		if(state == 1 || state == 0){
// 			location.href = '/outbound/outboundList?state='+state;
// 		}else{
// 			location.href = '/outbound/outboundList';
// 		}
// 	}
	function getOutBoundList(state) {
		if(state != 2){
			location.href = '/outbound/outboundList?state='+state;
		}else{
			location.href = '/outbound/outboundList';
		}
	}
	

	
	
	// 수정 popUp
	 function openChildWindow(button) {
		   var row = button.parentNode.parentNode;
		   var cells = row.getElementsByTagName("td");
		   var rowData = [];
		   
		   for (var i = 0; i < cells.length - 1; i++) {
		     rowData.push(cells[i].innerText);
		   }
		   
			var popupWidth = 900;
			var popupHeight = 400;

			var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
			var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
		    var childWindow = window.open("/outbound/outboundUpdate", "outboundUpdate",'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		   
		   // 자식 창이 로드된 후에 데이터를 전송합니다.
		   childWindow.addEventListener("load", function() {
		     childWindow.postMessage(rowData, "*");
		   
		   });
		 } // 수정 popUp end
		 
		 
	

  </script>
 </body>
  </html>