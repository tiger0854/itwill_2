<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 리스트</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp" />
	<div>
		<br>
		<h1>사원 리스트</h1>
		<h2>대시보드</h2>
		<table class="table table-bordered" style="margin-top: 10px;">
			<tr>
				<td>임직원 수</td>
				<td>${empCount}명</td>
				<td>일용근로자 수</td>
				<td>${alCount}명</td>
				<td>전일근무자</td>
				<td>${alCount_all}명</td>
				<td>오전/오후근무자</td>
				<td>${alCount_am}/ ${alCount_pm}명</td>
			</tr>
			<tr>
				<td><a href="#" onclick="emp_inList();">현재 출근자</a></td>
				<td id="in_empNum"></td>
				<td><a href="#" onclick="emp_outList();">현재 퇴근자</a></td>
				<td id="out_empNum"></td>
				<td>휴가자</td>
				<td>3명</td>
				<td>휴가신청자</td>
				<td>1명</td>
			</tr>
		</table>
		<!-- 권한제어 -->
		<input type="button" value="사원 정보등록"
			onclick="location.href='/emp/insert'"> 
		<input type="button"
			value="일용직 일괄등록" onclick="location.href='/emp/insert_al'">
		<input type="button"
			value="사원 정보 내려받기" id="excelDown" onclick="location.href='/emp/excelDown'">
		
		<!-- ---------------------필터링------------------- -->
		<table class="table table-striped" style="margin-top: 10px;">
			<tr>
				<td><select name="department_name" id="department_name_search">
							<option value="선택없음">선택없음</option>
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
						<option value="선택없음">선택없음</option>
						<option value="이사">이사</option>
						<option value="과장">과장</option>
						<option value="팀장">팀장</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
						<option value="일용">일용</option>
						<option value="외주">외주</option>
				</select></td>
				<td><select name="employee_status" id="employee_status_search">
						<option value="선택없음">선택없음</option>
						<option value="재직중">재직중</option>
						<option value="퇴사">퇴사</option>
						<option value="휴직중">휴직중</option>
				</select></td>
				<td><input type="text" size="15" placeholder="이름" id="employee_name_search">
				<input type="button" value="검색" id="search_button"></td>
			</tr>
		</table>
		<!-- ---------------------필터링------------------- -->
		
		<table class="table table-bordered" style="margin-top: 10px;">
			<thead>
			<tr>
				<td>사원번호</td>
				<td>성명</td>
				<td>부서</td>
				<td>직급</td>
				<td>내선번호</td>
				<td>재직현황</td>
			</tr>
			</thead>
			<tbody id="empInfoBody">
			<c:forEach var="vo" items="${empList }">
				<tr>
					<td>${vo.employee_id}</td>
					<td><a href="/emp/info?employee_id=${vo.employee_id}">${vo.employee_name }</a></td>
					<td>${vo.department_name }</td>
					<td>${vo.position }</td>
					<td>
					<c:if test="${empty vo.line_num }">
						미등록
					</c:if>
					<c:if test="${!empty vo.line_num }">
						${vo.line_num }
					</c:if>
					</td>
					<td>${vo.employee_status }</td>
				</tr>
				<c:if test="${empty empList }">
					<td rowspan="5">검색 결과가 없습니다.</td>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		<!-- -------------------------------------------------------------------------------페이징 구현부------------------------------------------------------------------------ -->
		<div id="pagingHere">
			<ul class="pagination" id="pagination">
				<c:choose>
					<c:when test="${pageVO.startPage > pageVO.pageBlock}">
						<li class="page-item"><a href="/emp/list?pageNum=${pageVO.startPage - pageVO.pageBlock}"
							class="page-link">이전</a></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
	
				<c:forEach var="i" begin="${pageVO.startPage}"
					end="${pageVO.endPage}" step="1">
					<li class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
					<a href="/emp/list?pageNum=${i}" class="page-link">${i}</a></li>
				</c:forEach>
	
				<c:choose>
					<c:when test="${pageVO.endPage < pageVO.pageCount}">
						<li class="page-item"><a href="/emp/list?pageNum=${pageVO.startPage + pageVO.pageBlock}"
							class="page-link">다음</a></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- -------------------------------------------------------------------------------페이징 구현부--------------------------------------------------------------------------- -->
	</div>
	<div></div>
</body>
<script>
	function startInterval(seconds, callback) {
		callback();
		return setInterval(callback, seconds * 1000);
	}
	// 전체 임직원 출퇴근 현황
	$(document).ready(function() {
		startInterval(6, function() {
			// 출근
			$.ajax({
				url : '/emp_ajax/inCheck',
				type : 'POST',
				success : function(in_emp) {
					$('#in_empNum').html(in_emp + '명');
				}// success end
			}) // ajax end
		}); // startInterval() method end

		startInterval(6, function() {
			// 퇴근
			$.ajax({
				url : '/emp_ajax/outCheck',
				type : 'POST',
				success : function(out_emp) {
					$('#out_empNum').html(out_emp + '명');
				}// success end
			}) // ajax end
		}); // startInterval() method end

		// ----------------------- 필터링 ----------------------------------------
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
							$('thead').html('<tr><td width="50">순번</td><td>사원번호</td><td>성명</td><td>부서</td><td>직급</td><td>내선번호</td><td>재직현황</td></tr>');
							table += '<tr>';
							table += '<td id="pageIdx'+(i+1)+'">'+(i+1)+'</td>';
							table += '<td>'+filtetList_dupVal[i].employee_id+'</td>';
							table += '<td><a href="/emp/info?employee_id=' + filtetList_dupVal[i].employee_id + '">' + filtetList_dupVal[i].employee_name + '</a></td>'
							table += '<td>'+filtetList_dupVal[i].department_name+'</td>';
							table += '<td>'+filtetList_dupVal[i].position+'</td>';	
							if(filtetList_dupVal[i].line_num == null){
								table += '<td>미등록</td>';
							}else{
								table += '<td>'+filtetList_dupVal[i].line_num+'</td>';
							} // i-e end
							table += '<td>'+filtetList_dupVal[i].employee_status+'</td>';
							table += '</tr>';

						}// for end
					}else{
						table += '<tr>';
						table += '<td colspan="6">';
						table += '내용이 없습니다.';
						table += '</td>';
						table += '</tr>';
					}// i-e end
					
					$('#pagination').remove();
					$('#pagingHere').html('<b> 검색결과: '+filtetList_dupVal.length+'명</b>'); // swal로도 출력할까 고민중.
					$('#empInfoBody').html(table);
					
					
				}// success end
			}); // ajax end
		}); // click end
		// -------------------------필터링-----------------------------------------
		
// 		$('#excelDown').on('click',function(){
// 			$.ajax({
// 				url:"/emp_ajax/excelDown",
// 				type: 'GET',
// 				success:function(){
// 					alert('hi');
					
// 				}// success end
// 			});// ajax end
// 		});// eClick end
		
		
	}); // jQ end

	    	// 출퇴근자 팝업 열기
	        function emp_inList(){
	        	  		window.open('/emp/inEmp_list','출근자 리스트','width=500,height=500,resizable=no');                 
	        	    };
	    	function emp_outList(){
	    				window.open('/emp/outEmp_list','퇴근자 리스트','width=500,height=500,resizable=no');                 
	    	    	};	

</script>
</html>