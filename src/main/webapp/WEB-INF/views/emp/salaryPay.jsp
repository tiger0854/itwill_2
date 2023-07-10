<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>사원 급여관리</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp" />
	<!-- 사원 개인이 들어오는 경우 > 급여명세서 페이지 출력 -->
	<%-- ${empList } --%>
	<h1>사원 급여 지급</h1>

	<!-- 관리자가 들어오는 경우 > 사원리스트 + 급여 대시보드 출력 -->
	<!-- 검색/필터용 -->
<!-- ---------------------필터링------------------- -->
 <div style="background-color: #E9E9E9;height: 80px;padding: 20px;border-radius:10px;margin-bottom: 30px;margin-top: 60px;">
		<table>
			<tr>
				<td><select name="department_name" id="department_name_search" class="form-select">
							<option value="선택없음">선택없음</option>
						<optgroup label="생산">
							<option value="생산과">생산과</option>
							<option value="생산 1팀">생산 1팀</option>
							<option value="생산 2팀">생산 2팀</option>
							<option value="조리팀">조리팀</option>
			            	<option value="품질팀">품질팀</option>
						</optgroup>
						<optgroup label="유통">
							<option value="유통과">유통과</option>
							<option value="입고팀">입고팀</option>
							<option value="출고팀">출고팀</option>
						</optgroup>
						<optgroup label="관리">
							<option value="인사과">인사과</option>
						</optgroup>
				</select></td>
				<td><select name="position" id="position_search" class="form-select">
						<option value="선택없음">선택없음</option>
						<option value="이사">이사</option>
						<option value="과장">과장</option>
						<option value="팀장">팀장</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
						<option value="일용">일용</option>
						<option value="외주">외주</option>
				</select></td>
				<td><select name="employee_status" id="employee_status_search" class="form-select">
						<option value="선택없음">선택없음</option>
						<option value="재직중">재직중</option>
						<option value="퇴사">퇴사</option>
						<option value="휴직중">휴직중</option>
				</select></td>
				<td>
				 <div class="input-group"style="width: 400px;justify-content: flex-start;align-items: center; justify-content: space-between;">
				<input type="text" size="15" placeholder="이름" id="employee_name_search" class="form-select">
				<input type="button" value="검색" id="search_button" class="btn btn-primary">
				</div>
				</td>
			</tr>
		</table>
		</div>
		<!-- ---------------------필터링------------------- -->
	<!-- 검색/필터용 -->
	<form action="" method="post">
		<input type="submit" value="급여 지급"> <input type="button"
			value="뒤로가기" onclick="location.href='/emp/salary'">
		<table class="table table-striped" style="margin-top: 10px;">
			<thead>
				<tr>
					<td>선택</td>
					<td>성명</td>
					<td>부서</td>
					<td>직급</td>
					<td>작업시간</td>
				</tr>
			</thead>
			<tbody id="empSalaryPayBody">
				<c:forEach var="vo" items="${empList }">
					<tr>
							<td>
							<c:if test="${empty vo.sal_account }">
								<input type="checkbox" value="${vo.employee_id }"
									name="employee_id" disabled>
							</c:if> 
							<c:if test="${!empty vo.sal_account }">
								<input type="checkbox" value="${vo.employee_id }"
									name="employee_id">
							</c:if>
							</td>
						<td><a href="/emp/salaryInfo?employee_id=${vo.employee_id}">${vo.employee_name }</a></td>
						<td>${vo.department_name }</td>
						<td>${vo.position }</td>
						<td>${vo.working_hours }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<!-- -------------------------------------------------------------------------------페이징 구현부------------------------------------------------------------------------ -->
	<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/emp/salaryPay?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/emp/salaryPay?pageNum=${i}" class="page-link">${i}</a>
			</li>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/emp/salaryPay?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
	<!-- -------------------------------------------------------------------------------페이징 구현부--------------------------------------------------------------------------- -->


</body>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#search_button').on('click',function(){
		var department_name = $('#department_name_search').val();
		var position = $('#position_search').val();
		var employee_status = $('#employee_status_search').val();
		var employee_name = $('#employee_name_search').val();
		
		if(department_name == "선택없음" && position == "선택없음" &&
				employee_status == "선택없음" && employee_name == ""){
			Swal.fire({
				title: "검색 내용을 입력해주세요!",
				icon: "warning",
					  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				}) // swal end
			return;
		}// datacheck if end
		
		var formdata = {'department_name': department_name, 'position': position, 
				'employee_status':employee_status , 'employee_name':employee_name };
		$.ajax({
			url: '/emp_ajax/filter', // 클라이언트가 요청을 보낼 서버의 URL 주소
			data: formdata,        // HTTP 요청과 함께 서버로 보낼 데이터
			type: 'POST',          // HTTP 요청 방식(GET, POST)
			success : function(filtetList_dupVal) {
				var table = '';
				if(filtetList_dupVal.length !== 0){
					for(var i=0;i<filtetList_dupVal.length;i++){
						table += '<tr>';
						if(filtetList_dupVal[i].sal_account == null){
							table += '<td><input type="checkbox" value="'+filtetList_dupVal[i].employee_id+'"name="employee_id" disabled></td>';
						}else{
							table += '<td><input type="checkbox" value="'+filtetList_dupVal[i].employee_id+'"name="employee_id"></td>';
						} // i-e end
						table += '<td><a href="/emp/salaryInfo?employee_id=' + filtetList_dupVal[i].employee_id + '">'+filtetList_dupVal[i].employee_name+'</a></td>';
						table += '<td>'+filtetList_dupVal[i].department_name+'</td>';
						table += '<td>'+filtetList_dupVal[i].position+'</td>';
						
						if(filtetList_dupVal[i].working_hours == null){
							table += '<td></td>';
						}else{
							table += '<td>'+filtetList_dupVal[i].working_hours+'</td>';
						} // i-e end
						
						
						table += '</tr>';
					}// for end
				}else{
					table += '<tr>';
					table += '<td colspan="5">';
					table += '내용이 없습니다.';
					table += '</td>';
					table += '</tr>';
				}// i-e end
				
				$('#pagination').remove();
				$('#empSalaryPayBody').html(table);

			}// success end
		}); // ajax end
	}); // click end	
});// jQ end
</script>
</html>