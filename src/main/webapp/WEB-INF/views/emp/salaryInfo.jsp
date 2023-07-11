<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사원 급여지급</title>
<jsp:include page="../common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#update').on('click',function(){
		alert('수정 진행');
		var button = '<input type="submit" value="저장" id="save">';
		$('#save_button_place').html(button)

		$('#bank_name').attr('readonly',false);
		$('#sal_account').attr('readonly',false);


// 		$('#save').on('click',function(){
// 			location.reload();
// 		})// save click function end
		
	})// update click function end
	
	$("#gender").val("${evo.gender}").prop("selected", true); 
	$("#marriage").val("${evo.marriage}").prop("selected", true); 
	$("#position").val("${evo.position}").prop("selected", true); 
	$("#department_name").val("${evo.department_name}").prop("selected", true); 
	$("#employee_status").val("${evo.employee_status}").prop("selected", true); 
	
	var dateData = "${evo.emp_date}";
	console.log(dateData.substring(8,10));
	$('#sal_date_tmp').val(dateData.substring(8,10)+'일');
	
	$('#salaryPayInfoAlert').on('click',function(){
		Swal.fire({
			title: "지급일 안내",
			text: "지급예정일은 사원의 입사일을 기준으로하여 지정되고, 만약 지급일이 월 내에 없거나 주말인 경우, 해당일에서 가장 가까운 일이 예정일이 됩니다.",
			icon: "info",
			  
// 				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
// 				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
// 				  cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
			})
// 			.then(result => {
// 				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
// 					location.href="/inbound/orderDelete?order_number="+rowData[0];
					
// 				} else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
// 					// ...실행
// 				}
// 			});
	})// click end
	
	$('#salDate').on('change',function(){
		
		var employee_id ="${evo.employee_id}";
		var dateData = $('#salDate').val()+"-01";
		
		var formdata = {
				'employee_id': employee_id ,
				'dateData': dateData
		};
		
		$.ajax({
			url:"/emp_ajax/salaryInfoAJAX",
			data:formdata,
			type:"POST",
			success:function(vo){
				console.log(vo);
				var table= '';
				for(var i=0;i<vo.length;i++){
					// ms단위 시간 표기 변환
					var tmp = new Date(vo[i].sal_date - (60*60*1000)*9); // 9시간 빼기.
					var sal_date =  tmp.getFullYear() +
					'-' + ( (tmp.getMonth()+1) < 9 ? "0" + (tmp.getMonth()+1) : (tmp.getMonth()+1) )+
					'-' + ( (tmp.getDate()) < 9 ? "0" + (tmp.getDate()) : (tmp.getDate()) );
					
					// 금액 변환
					var salary = (vo[i].salary)*10000
					
					table += '<tr>';
					table += '<td>'+sal_date+'</td>';
					table += '<td>'+salary.toLocaleString()+' 원 </td>';
					table += '<td>'+'지급완료'+'</td>';
					table += '<td>'+'<a href="/emp/salaryDetail?employee_id=${evo.employee_id}&sal_date='+sal_date+'"><i class="bx bx-detail"></i></a><a href="#"></a>'+'</td>';
					table += '</tr>';
				}// for end
				$('#salInfoTable').html(table);
			}// success
		});// ajax end

	})// change end
	
	});// jQ end

</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">

	<div>
	<br>
	    <h1>사원 급여 정보</h1>
<%-- 	    	    ${evo } --%>
	    	    <hr>
	    	     ${svo }
	    <form action="" method="post">
	    <input type="hidden" name="employee_id" value="${evo.employee_id }">
	    <!-- 권한제어 -->
	    	<c:if test="${sessionScope.dept_name eq '인사과'}">
			    <input type="button" value="등록" onclick="location.href='/emp/salaryInsert?employee_id=${evo.employee_id }'">
			    <span id="save_button_place"></span>
              	<input type="button" value="뒤로가기" onclick="location.href='/emp/salary'">
            </c:if>
            <c:if test="${sessionScope.dept_name ne '인사과'}">
			    <input type="button" value="조회" onclick="location.href='/emp/salaryInsert?employee_id=${evo.employee_id }'">
			    <span id="save_button_place"></span>
            </c:if>
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td rowspan="4"><img src="../../resources/${evo.employee_id}.png"
						onerror="this.onerror=null; this.src='../../resources/default_profile_photo.png';" width="150" height="150"></td>
		            <td>성명</td>
		            <td><input type="text" size="50" value="${evo.employee_name }" id="employee_name" name="employee_name" readonly></td>
		            <td>주민등록번호</td>
		            <td><input type="text" size="50" value="${evo.jumin}" id="jumin" name="jumin" readonly></td>
		        </tr>
		        <tr>
		            <td>부서/직급</td>
		            <td><select name="department_name" id="department_name" disabled>
			            <optgroup label="생산">
			            	<option value="생산과">생산과</option>
			            	<option value="생산 1팀">생산 1팀</option>
			            	<option value="생산 2팀">생산 2팀</option>
			            </optgroup>
			            <optgroup label="유통">
			            	<option value="유통과">유통과</option>
			            	<option value="입고팀">입고팀</option>
			            	<option value="출고팀">출고팀</option>
			            </optgroup>
			            <optgroup label="관리">
			            	<option value="인사과">인사과</option>
			            </optgroup>
		            </select>
		            <select name="position" id="position" disabled>
			            	<option value="이사">이사</option>
			            	<option value="과장">과장</option>
			            	<option value="팀장">팀장</option>
			            	<option value="주임">주임</option>
			            	<option value="사원">사원</option>
			            	<option value="일용">일용</option>
			            	<option value="외주">외주</option>
		            </select></td>
		            <td>재직여부</td>
		        	<td><select name="employee_status" id="employee_status" disabled>
		        		<option value="재직중">재직중</option>
		        		<option value="퇴사">퇴사</option>
		        		<option value="휴직중">휴직중</option>
		        	</select></td>
		        </tr>
		        <tr>
		            <td>휴대폰 번호</td>
		            <td><input type="text" size="50" value="${evo.phone_num }" id="phone_num" name="phone_num" readonly></td>
		            <td>지급예정일</td>
		            <td><input type="text" value="30일" id="sal_date_tmp" readonly><a href="#" id="salaryPayInfoAlert"> <i class='bx bx-info-circle nav-icon'></i></a></td>
		            
		        </tr>
		        <tr>
		            <td>이메일</td>
		            <td><input type="text" size="50" value="${evo.email }" id="email" name="email" readonly></td>
		            <td>계좌번호</td>
		            <td><input type="text" size="8" value="${evo.bank_name}" id="bank_name" name="bank_name" readonly>
		            <input type="text" size="40" value="${evo.sal_account}" id="sal_account" name="sal_account" readonly></td>
		        </tr>
		    </table>
	    </form>

	 </div>
	    
	 <div>
		<table class="table table-striped" style="margin-top: 10px;" >
			<thead>
				<tr>
					<td><input type="month" name="salDate" id="salDate"></td>
					<td>지급액수</td>
					<td>지급현황</td>
					<td>상세조회</td>
				</tr>
			</thead>
			<tbody id="salInfoTable"></tbody>
		</table>
	 </div>

    
</body>
</html>