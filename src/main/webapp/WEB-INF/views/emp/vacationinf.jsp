<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>사원휴가 정보</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function vacationmodify(vacation_id) {
	  var popupUrl = '/emp/vacationmodify?vacation_id='+vacation_id;
	  window.open(popupUrl, '_blank', 'width=500,height=600,left=100, top=100');
	}
</script>
<script>
function vacationdelete(vacation_id,employee_id) {
	
// 	alert("vacation_id"+vacation_id);
	if(confirm("정말 휴가를 취소하시겠습니까?")){
		location.href='/emp/vacationdelete?vacation_id='+vacation_id+"&employee_id="+employee_id;
	}
	
}
</script>
<script type="text/javascript">

$(document).ready(function(){
	$('#update').on('click',function(){
		alert('수정 진행');
		var button = '<input type="submit" value="저장" id="save">';
		$('#save_button_place').html(button)
		
		$('#employee_name').attr('readonly',false);
		$('#jumin').attr('readonly',false);
		$('#phone_num').attr('readonly',false);
		$('#extraAddress').attr('readonly',false);
		
		$('#position').attr('disabled',false);
		$('#department_name').attr('disabled',false);
		$('#address_find').attr('disabled',false);
		$('#employee_status').attr('disabled',false);

// 		$('#save').on('click',function(){
// 			location.reload();
// 		})// save click function end
		
	})// update click function end
	 
	$("#position").val("${evo.position}").prop("selected", true); 
	$("#department_name").val("${evo.department_name}").prop("selected", true); 
	$("#employee_status").val("${evo.employee_status}").prop("selected", true); 
	

	$('#btn_vreg').on('click', function(){
	  var employee_id = '${evo.employee_id}';
	  var position = '${evo.position}';
	  var department_name = '${evo.department_name}';
	  var phone_num = '${evo.phone_num}';
	  var employee_name = '${evo.employee_name}';
		    
	  var url = '/emp/vacationregist?employee_id=' + employee_id +
		        '&position=' + position +
		        '&department_name=' + department_name +
		        '&phone_num=' + phone_num + '&employee_name=' + employee_name;  
	    window.open(
	    		
	    url,'_blank', 'width=600,height=500');
	  });

	   
	});// jQ end

	
	
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp" />
	<div>
		<br>
		<h1>사원 정보</h1>

		<%-- 	    ${evo.employee_id} --%>
		<%-- 	    ${evo.position} --%>
		<%-- 	    ${evo.department_name} --%>
		<%-- 	    ${evo.phone_num} --%>


		<%-- 	    	    ${evo } --%>
		<form action="" method="post">
			<input type="hidden" name="employee_id" value="${evo.employee_id }">
			<!-- 권한제어 -->
			<%-- 	    <c:if test="${sessionScope.department_name eq '인사팀' }"> --%>
			<input type="button" value="수정" id="update"> <span
				id="save_button_place"></span>
			<%-- 	    </c:if> --%>
			<input type="button" value="뒤로가기" onclick="location.href='/emp/list'">

			<table class="table table-striped" style="margin-top: 10px;">

				<tr>
					<td rowspan="4"><img src="../../resources/css/test.png"
						alt="profile_photo" width="150" height="150"></td>
					<td>성명</td>
					<td><input type="text" size="50" value="${evo.employee_name }"
						id="employee_name" name="employee_name" readonly></td>
					<td>주민등록번호</td>
					<td><input type="text" size="50" value="${evo.jumin}"
						id="jumin" name="jumin" readonly></td>

				</tr>
				<tr>
					<td>부서/직급</td>
					<td><select name="department_name" id="department_name"
						disabled>
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
					</select> <select name="position" id="position" disabled>
							<option value="이사">이사</option>
							<option value="과장">과장</option>
							<option value="팀장">팀장</option>
							<option value="주임">주임</option>
							<option value="사원">사원</option>
							<option value="일용">일용</option>
							<option value="외주">외주</option>
					</select></td>
					<td>재직여부</td>
					<td><select name="employee_status" id="employee_status"
						disabled>
							<option value="재직중">재직중</option>
							<option value="퇴사">퇴사</option>
							<option value="휴직중">휴직중</option>
					</select></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" size="50" value="${evo.phone_num }"
						id="phone_num" name="phone_num" readonly></td>
<!-- 					<td>주소</td> -->
<!-- 					<td><input type="text" size="30" placeholder="주소" id="address" -->
<%-- 						name="address" value="${evo.address }" readonly> <input --%>
<!-- 						type="text" size="18" placeholder="상세주소" id="extraAddress" -->
<%-- 						name="extraaddress" value="${evo.extraaddress }" readonly></td> --%>
<!-- 					<td><input type="button" value="우편번호 찾기" -->
<!-- 						onclick="execDaumPostcode()" id="address_find" disabled></td> -->
<!-- 					<td><input type="text" size="10" placeholder="우편번호" -->
<%-- 						id="postcode" name="post_num" value="${evo.post_num }" readonly></td> --%>
					<td>휴가상태</td>	
					<td><select name="vacation_status" id="employee_status"
						disabled>
							<option value="휴가전">휴가전</option>
							<option value="휴가중">휴가중</option>
							<option value="휴가완료">휴가완료</option>
					</select></td>
				</tr>

			</table>
		</form>

	</div>

	

	<div class="table table-striped">
		<h1>나의휴가 내역</h1>
		<table class="table table-striped" style="margin-top: 10px;">
			<thead>
				<tr>
					<th>사원아이디</th>
					<th>직위</th>
					<th>부서</th>
					<th>휴대폰번호</th>
					<th>휴가관리</th>
					<th>휴가시작일</th>
					<th>휴가종료일</th>
					<td>승인여부</td>
					<td>수정</td>
					<td>취소</td>
				</tr>
			</thead>
			<c:forEach var="mvc" items="${myvacationList }">
				<tbody>
					<tr>
						<td><a href="/emp/vacationinf?employee_id=${mvc.employee_id}">${mvc.employee_id}</a></td>
						<td>${mvc.position }</td>
						<td>${mvc.department_name }</td>
						<td>${mvc.phone_num }</td>
						<td>${mvc.vacation_management }</td>
						<td>${mvc.vacation_start }</td>
						<td>${mvc.vacation_finish}</td>
			            <td><c:choose>
			                    <c:when test="${mvc.approve == '승인'}">승인</c:when>
			                    <c:when test="${mvc.approve == '반려'}">반려</c:when>
			                    <c:otherwise>미처리</c:otherwise>
			            </c:choose></td>
						<c:set var="currentDate" value="<%= new java.util.Date() %>" />
						<c:choose>
							<c:when test="${mvc.vacation_start.time < currentDate.time}">
							    <td>
							        <button onclick="vacationmodify('${mvc.vacation_id}')" disabled>수정하기</button>
							    </td>
							    <td>
							        <button onclick="vacationdelete('${mvc.vacation_id}')" disabled>취소하기</button>
							    </td>
							</c:when>
							
							<c:otherwise>
								<td>
									<button onclick="vacationmodify('${mvc.vacation_id}')">수정하기</button>	
								</td>
								<td>
									<button onclick="vacationdelete('${mvc.vacation_id}','${mvc.employee_id}')">취소하기</button>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<!-- 다른 휴가 내역을 여기에 추가 -->
				</tbody>
			</c:forEach>
		</table>
	</div>
	<%--   ${new Date().getTime()}  --%>
	<%-- 	  ${start}  --%>

	<input type="button" value="휴가신청하기" id="btn_vreg">




</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;

                document.getElementById("extraAddress").focus();
            }
        }).open();
    }
</script>
</html>