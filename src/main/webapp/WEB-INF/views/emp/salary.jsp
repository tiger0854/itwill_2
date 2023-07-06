<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 급여관리</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp" />
	<!-- 사원 개인이 들어오는 경우 > 급여명세서 페이지 출력 -->
	<%-- ${empList } --%>
	<h1>사원 급여관리</h1>
	<table>
		<tr>
			<td><input type="button" value="월별 급여대장 조회"></td>
			<td><input type="button" value="연별 급여대장 조회"></td>
			<td><input type="button" value="급여 지급"
				onclick="location.href='/emp/salaryPay'"></td>
		</tr>
	</table>
	<!-- 관리자가 들어오는 경우 > 사원리스트 + 급여 대시보드 출력 -->
	<!-- ---------------------필터링------------------- -->
	<table class="table table-striped" style="margin-top: 10px;">
		<tr>
			<td><select name="department_name" id="department_name_search">
					<option>선택없음</option>
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
			</select></td>
			<td><select name="position" id="position_search">
					<option>선택없음</option>
					<option value="이사">이사</option>
					<option value="과장">과장</option>
					<option value="팀장">팀장</option>
					<option value="주임">주임</option>
					<option value="사원">사원</option>
					<option value="일용">일용</option>
					<option value="외주">외주</option>
			</select></td>
			<td><select name="employee_status" id="employee_status_search">
					<option>선택없음</option>
					<option value="재직중">재직중</option>
					<option value="퇴사">퇴사</option>
					<option value="휴직중">휴직중</option>
			</select></td>
			<td><input type="text" size="15" placeholder="이름"
				id="employee_name_search"> <input type="button" value="검색"
				id="search_button"></td>
		</tr>
	</table>
	<!-- ---------------------필터링------------------- -->

	<table class="table table-striped" style="margin-top: 10px;">
		<thead>
			<tr>
				<td>사원번호</td>
				<td>성명</td>
				<td>부서</td>
				<td>직급</td>
				<td>계좌번호</td>
			</tr>
		</thead>
		<tbody id="empInfoBody">
			<c:forEach var="vo" items="${empList }">
				<tr>
					<td>${vo.employee_id}</td>
					<td><a href="/emp/salaryInfo?employee_id=${vo.employee_id}">${vo.employee_name }</a></td>
					<td>${vo.department_name }</td>
					<td>${vo.position }</td>
					<td><c:if test="${empty vo.sal_account }">
			           	 	미등록
			            </c:if> <c:if test="${!empty vo.sal_account }">
			            	${vo.sal_account }
			            </c:if></td>
				</tr>
				<c:if test="${empty empList }">
					<td rowspan="4">검색 결과가 없습니다.</td>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<!-- -------------------------------------------------------------------------------페이징 구현부------------------------------------------------------------------------ -->
	<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/emp/salary?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/emp/salary?pageNum=${i}" class="page-link">${i}</a>
			</li>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/emp/salary?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
	<!-- -------------------------------------------------------------------------------페이징 구현부--------------------------------------------------------------------------- -->
	<!-- 사원리스트에서 사원 이름 클릭 > 사원 급여명세서 조회 / 수정 가능 -->


</body>
<script>
	$(document)
			.ready(
					function() {
						$('#search_button')
								.on(
										'click',
										function() {
											var department_name = $(
													'#department_name_search')
													.val();
											var position = $('#position_search')
													.val();
											var employee_status = $(
													'#employee_status_search')
													.val();
											var employee_name = $(
													'#employee_name_search')
													.val();

											if (department_name == "선택없음"
													&& position == "선택없음"
													&& employee_status == "선택없음"
													&& employee_name == "") {
												alert('검색 내용을 입력해주세요!');
												return;
											}// datacheck if end

											var formdata = {
												'department_name' : department_name,
												'position' : position,
												'employee_status' : employee_status,
												'employee_name' : employee_name
											};
											$
													.ajax({
														url : '/emp_ajax/filter', // 클라이언트가 요청을 보낼 서버의 URL 주소
														data : formdata, // HTTP 요청과 함께 서버로 보낼 데이터
														type : 'POST', // HTTP 요청 방식(GET, POST)
														success : function(
																filtetList_dupVal) {
															console
																	.log(filtetList_dupVal)
															var table = '';
															if (filtetList_dupVal.length !== 0) {
																for (var i = 0; i < filtetList_dupVal.length; i++) {
																	table += '<tr>';
																	table += '<td>'
																			+ filtetList_dupVal[i].employee_id
																			+ '</td>';
																	table += '<td><a href="/emp/salaryInfo?employee_id='
																			+ filtetList_dupVal[i].employee_id
																			+ '">'
																			+ filtetList_dupVal[i].employee_name
																			+ '</a></td>';
																	table += '<td>'
																			+ filtetList_dupVal[i].department_name
																			+ '</td>';
																	table += '<td>'
																			+ filtetList_dupVal[i].position
																			+ '</td>';
																	if (filtetList_dupVal[i].sal_account == null) {
																		table += '<td>미등록</td>';
																	} else {
																		table += '<td>'
																				+ filtetList_dupVal[i].sal_account
																				+ '</td>';
																	}// i-e end
																}// for end
																table += '</tr>';
															}// for end
															else {
																table += '<tr>';
																table += '<td colspan="5">';
																table += '내용이 없습니다.';
																table += '</td>';
																table += '</tr>';
															}// i-e end

															$('#pagination')
																	.remove();
															$('#empInfoBody')
																	.html(table);

														}// success end
													}); // ajax end
										});// button click end >> paging end
					}); // jQ end
</script>
</html>