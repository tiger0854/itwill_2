<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 휴가관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"href="../../resources/css/css.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/css.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="../../resources/css/product.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 휴가 삭제하기
		function vacationdelete(vacation_id, employee_id) {
		    if (confirm("정말 휴가를 취소하시겠습니까?")) {
		        // 삭제 작업 수행
		        $.ajax({
		            url: '/emp/vacationdelete',
		            type: 'GET',
		            data: {
		                vacation_id: vacation_id,
		                employee_id: employee_id
		            },
		            success: function(response) {
		                // 삭제 작업이 성공한 경우
		                alert('휴가가 삭제되었습니다.');
		                // vacationlist 페이지로 이동
		                location.href = '/emp/vacationlist';
		            },
		            error: function() {
		                // 삭제 작업이 실패한 경우
		                alert('휴가 삭제에 실패하였습니다.');
		            }
		        });
		    }
		}
</script>
<script>
    $(document).ready(function() {

	// 휴가 수정하기
     $(".btn-modify").on("click", function() {
    	    var vacationId = $(this).data("vacation-id");
    	    // 휴가 정보 가져오기
    	    var employeeId = $(this).closest("tr").find("td:eq(0) a").text();
    	    var employeeName = $(this).closest("tr").find("td:eq(1)").text();
    	    var propDate = $(this).closest("tr").find("td:eq(2)").text();
    	    var approveDate = $(this).closest("tr").find("td:eq(3)").text();
    	    var vacationStart = $(this).closest("tr").find("td:eq(4)").text();
    	    var vacationFinish = $(this).closest("tr").find("td:eq(5)").text();
    	    var vacationReason = $(this).closest("tr").find("td:eq(7)").text();
    	  
    	    // 수정 페이지로 데이터 전달
    	    var popupUrl = "/emp/vacationmodify?vacation_id=" + vacationId +
    	                   "&employee_id=" + employeeId +
    	                   "&employee_name=" + employeeName +
    	                   "&prop_date=" + propDate +
    	                   "&approve_date=" + approveDate +
    	                   "&vacation_start=" + vacationStart +
    	                   "&vacation_finish=" + vacationFinish +
    	                   "&vacation_reason=" + vacationReason;

    	    window.open(popupUrl, "_blank", "width=500,height=600,left=100,top=100");
    	    
    	 	// vacationlist로 이동 후 새로 고침
    	    window.onunload = function() {
//     	        window.opener.location.reload(); // 부모 창 새로 고침
    	    };
    	    window.close(); // 팝업 창 닫기
    	});
     

     	// 승인하기 버튼 클릭 
        $(document).on("click", ".btn-approve", function() {
            var vacationId = $(this).data("vacation-id");
            
         // 확인 대화상자 표시
//             var confirmMessage = "승인하시겠습니까?";
//             if (confirm(confirmMessage)) {
//                 // 확인 버튼이 눌렸을 때의 동작
//                 approveVacation(vacationId); // 승인 처리 함수 호출
//             } else {
//                 // 취소 버튼이 눌렸을 때의 동작
//                 cancelApproval(vacationId); // 취소 처리 함수 호출
            });

      // 승인 처리 함수
// 		function approveVacation(vacationId) {  
// 		    if (confirm("휴가를 승인하시겠습니까?")) {
// 		        // 삭제 작업 수행
// 		        $.ajax({
// 		            url: '/emp/vacationapprove',
// 		            type: 'GET',
// 		            data: {
// 		                vacation_id: vacationId
// 		            },
// 		            success: function(response) {
// 		                // 삭제 작업이 성공한 경우
// 		                alert('휴가가 승인되었습니다.');
// 		                // vacationlist 페이지로 이동
// 		                location.href = '/emp/vacationlist';
// 		                // 승인자 값을 가져와서 스팬 요소에 설정
// 		                var approveEmp = response.approve_emp;
// 		                $("#approveEmp_" + vacationId).text(approveEmp);
// 		            },
		            
// 		            error: function() {
// 		                // 삭제 작업이 실패한 경우
// 		                alert('휴가 승인에 실패하였습니다.');
// 		            }
// 		        });
// 		    }
// 		    console.log("승인 처리 - vacationId: " + vacationId);
// 		}
//         // 반려 처리 함수
//         function cancelApproval(vacationId) {
// 		    if (confirm("휴가를 반려하시겠습니까?")) {
// 		        // 취소 작업 수행
// 		        $.ajax({
// 		            url: '/emp/vacationcancel',
// 		            type: 'GET',
// 		            data: {
// 		                vacation_id: vacationId
// 		            },
// 		            success: function(response) {
// 		                // 취소 작업이 성공한 경우
// 		                alert('휴가 반려 처리되었습니다.');
// 		                // vacationlist 페이지로 이동
// 		                location.href = '/emp/vacationlist';
// 		                // 승인자 값을 초기화
// 		                $("#approveEmp_" + vacationId).text("");
// 		            },
// 		            error: function() {
// 		                // 취소 작업이 실패한 경우
// 		                alert('휴가 반려에 실패하였습니다.');
// 		            }
// 		        });
// 		    }
//     console.log("반려 처리 - vacationId: " + vacationId);
// }

       
   
//         // 반려하기 버튼 클릭 
        $(document).on("click", ".btn-return", function() {
        	 var vacationId = $(this).data("vacation-id");
        });
        
  }); // jquary end
</script>
	<style>
	
	body {
/* 		display: table-row-group; */
	}
	
	
 tbody, td, tfoot, th, thead, tr { 
     border-color: inherit; 
     border-style: solid; 
     border-width: 0; 
 } 
	
	.table table-striped {
    --bs-table-accent-bg: var(--bs-table-striped-bg);
       
    color: var(--bs-table-striped-color);
}

	
	.table-striped tr:nth-child(even) {
        background-color: #f2f2f2;
    }
/*     .table { */
/*         width: 100%; */
/*         border-collapse: collapse; */
/*     } */

    .table th,
    .table td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .table th {
        background-color: #f5f5f5;
    }

    .table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .table a {
        color: #337ab7;
        text-decoration: none;
    }

    .table a:hover {
        text-decoration: underline;
    }

    .btn-add {
        padding: 5px 10px;
        background-color: #4caf50;
        border: none;
        color: white;
        cursor: pointer;
    }
    
    .btn-addd {
        padding: 5px 10px;
       background-color: #007bff;
        border: none;
        color: white;
        cursor: pointer;
    }
    
    .btn-addd > a {
    	color: white;
    }
    
    .btn-adds {
        padding: 5px 10px;
        background-color: #dc3545;
        border: none;
        color: white;
        cursor: pointer;
    }
	
	.btn-adds > a {
		color: white;
	}
	
    .btn-modify {
        background-color: #007bff;
    }

    #btn-delete {
        background-color: #dc3545;
    }

    .approve-cell {
        font-weight: bold;
    }
       .box {
        border: 1px solid #000;
        padding: 10px;
        margin-bottom: 10px;
    }
    
    tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    
   
}
    
</style>
		
	
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<h1>사원 휴가관리</h1>
<%-- 	${vacationList } --%>
<%-- ${vc.employee_id} --%>
<table class="table-striped">
<tr>
<td class="box">휴가 예정자 : ${pvacationCount}</td>
<td class="box">휴가자 : ${vacationCount}</td>
<td class="box">휴가 복귀자 : ${bvacountCount}</td>
</tr>
</table>
<!-- 휴가나간 인원일떄만 테이블에 값을 가져오도록 하는 코드 -->
<table class="table table-bordered" style="margin-top: 10px;">
   <thead>
	    <tr>
	        <td>사원번호</td>
	        <td>사원명</td>
	        <td>신청일</td>
	        <td>승인일</td>
	        <td>시작일</td>
	        <td>종료일</td>
	        <td>연차 일 수</td>
	        <td>사유</td>
	        <td>승인여부</td>
	        <td>승인자</td>
	        <td>대체인</td>
	<!--         <td>휴가번호</td> -->
	        <td>승인</td>
	        <td>반려</td>
	        <td>수정</td>
	        <td>삭제</td>
	    </tr>
   </thead>
   <tbody>
	   <c:forEach var="vc" items="${vacationList}">
	   	
         <tr>
            <td><a href="/emp/vacationinf?employee_id=${vc.employee_id}">${vc.employee_id}</a></td>
            <td>${vc.employee_name}</td>
            <td>${vc.prop_date}</td>
            <td>${vc.approve_date}</td>
            <td>${vc.vacation_start}</td>
            <td>${vc.vacation_finish}</td>

<!-- 			<td><script> -->
<%-- //             var vacationStart = new Date('${vc.vacation_start}'); --%>
<%-- //             var vacationFinish = new Date('${vc.vacation_finish}'); --%>
<!-- //             var vacationDate = (Math.ceil((vacationFinish - vacationStart) / (1000 * 60 * 60 * 24))+1); -->
<!-- //             document.write(vacationDate); -->
<!--         	</script></td> -->
			<td>${vc.vacation_date}</td>

            <td>${vc.vacation_reason}</td>
             <td class="approve-cell"><c:choose>
                    <c:when test="${vc.approve == '승인'}"><span style="color:blue;">승인</span></c:when>
                    <c:when test="${vc.approve == '반려'}"><span style="color:red;">반려</span></c:when>
                    <c:otherwise>미처리</c:otherwise>
                    
             </c:choose></td>
             <c:choose>
			    <c:when test="${vc.approve != '승인' && vc.approve != '반려' }">
			        <td>승인 처리중</td>
			    </c:when>
			    <c:otherwise>
			         <td><span id="approveEmp_${vc.vacation_id}">${vc.approve_emp}</span></td>
			    </c:otherwise>
			 </c:choose>
             
            
            <td>${vc.subsitute}</td>
<%--             <td>${vc.vacation_id}</td> --%>
<%-- ${approve_emp} --%>
<%-- ${login_id} --%>

<%-- 				 <td><a href="vacationcheck?vacation_id=${vc.vacation_id}&approve=승인">승인</a></td> --%>
<%--             	 <td><a href="vacationcheck?vacation_id=${vc.vacation_id}&approve=반려">반려</a></td> --%>
	
            	 <td><button class="btn-addd"><a href="vacationcheck?vacation_id=${vc.vacation_id}&approve=승인">승인</a></button></td>
            	 <td><button class="btn-adds"><a href="vacationcheck?vacation_id=${vc.vacation_id}&approve=반려">반려</a></button></td>


            <td><button class="btn-add btn-modify" data-vacation-id="${vc.vacation_id}">수정하기</button></td>
            <td><button id="btn-delete" class="btn-add" onclick="vacationdelete('${vc.vacation_id}','${vc.employee_id}')">삭제하기</button></td>
        </tr>
    </c:forEach>
   </tbody>
</table>

<!-- -------------------------------------------------------------------------------페이징 구현부------------------------------------------------------------------------ -->
	<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/emp/vacationlist?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/emp/vacationlist?pageNum=${i}" class="page-link">${i}</a>
			</li>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/emp/vacationlist?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
	<!-- -------------------------------------------------------------------------------페이징 구현부--------------------------------------------------------------------------- -->

</body>
</html>
