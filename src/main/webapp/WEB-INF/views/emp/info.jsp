<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>사원 정보</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#update')
								.on(
										'click',
										function() {
											alert('수정 진행');
											var button = '<input type="submit" value="저장" id="save">';
											$('#save_button_place')
													.html(button)

											$('#employee_name').attr(
													'readonly', false);
											$('#jumin').attr('readonly', false);
											$('#phone_num').attr('readonly',
													false);
											$('#line_num').attr('readonly',
													false);
											$('#emp_date').attr('readonly',
													false);
											$('#email').attr('readonly', false);
											$('#extraAddress').attr('readonly',
													false);

											$('#gender')
													.attr('disabled', false);
											$('#marriage').attr('disabled',
													false);
											$('#position').attr('disabled',
													false);
											$('#department_name').attr(
													'disabled', false);
											$('#address_find').attr('disabled',
													false);
											$('#employee_status').attr(
													'disabled', false);

										})// update click function end

						$("#gender").val("${evo.gender}")
								.prop("selected", true);
						$("#marriage").val("${evo.marriage}").prop("selected",
								true);
						$("#position").val("${evo.position}").prop("selected",
								true);
						$("#department_name").val("${evo.department_name}")
								.prop("selected", true);
						$("#employee_status").val("${evo.employee_status}")
								.prop("selected", true);

						// 원하는 날의 출퇴근 정보를 확인할 수 있도록 하는 기능
						$('#checkDate')
								.change(
										function() {
											var dateData = $('#checkDate')
													.val()
													+ ' 00:00:00';
											var employee_id = '${evo.employee_id}';
											var formdata = {
												'date_time' : dateData,
												'employee_id' : employee_id
											};
											var thead = '<tr><td>일자</td>';
											thead += '<td>시간</td>';
											thead += '<td>사유</td></tr>';

											// 		console.log(formdata);
											$
													.ajax({
														url : '/emp_ajax/check', // 클라이언트가 요청을 보낼 서버의 URL 주소
														data : formdata, // HTTP 요청과 함께 서버로 보낼 데이터
														type : 'POST', // HTTP 요청 방식(GET, POST)
														// 			dataType: 'html',      // 호출 했을 때 결과타입
														success : function(
																voList) {
															console.log(voList)
															var table = '';
															if (voList.length !== 0) {
																for (var i = 0; i < voList.length; i++) {
																	var timeMS = new Date(
																			voList[i].date_time)
																	const year = timeMS
																			.getFullYear(); //0000년 가져오기
																	const month = timeMS
																			.getMonth() + 1; //월은 0부터 시작하니 +1하기
																	const date = timeMS
																			.getDate(); //일자 가져오기
																	const hour = timeMS
																			.getHours();
																	const min = timeMS
																			.getMinutes();

																	table += '<tr>';
																	table += '<td>';
																	table += year
																			+ '년 '
																			+ month
																			+ '월 '
																			+ date
																			+ '일';
																	table += '</td>';
																	table += '<td>';
																	table += hour
																			+ '시 '
																			+ min
																			+ '분 ';
																	table += '</td>';
																	table += '<td>';
																	if (voList[i].emp_in == null) {
																		table += voList[i].emp_out;
																	} else {
																		table += voList[i].emp_in;
																	}
																	table += '</td>';
																	table += '</tr>';
																} // for end
															} // if end
															else {
																table += '<tr>';
																table += '<td colspan="4">';
																table += '내용이 없습니다.';
																table += '</td>';
																table += '</tr>';
															}// else end
															$('#theadHere')
																	.html(thead);
															$(
																	'#checkResultHere')
																	.html(table);
														}// success end
													}); // ajax end

										}); // check end

					});// jQ end
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	<div>
		<br>
		<h1>사원 정보</h1>
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
					<td rowspan="4"><img src="/img/${evo.employee_id}.png"
						alt="profile_photo" width="150" height="150"></td>
					<td>성명</td>
					<td><input type="text" size="40" value="${evo.employee_name }"
						id="employee_name" name="employee_name" readonly></td>
					<td>주민등록번호</td>
					<td><input type="text" size="50" value="${evo.jumin}"
						id="jumin" name="jumin" readonly></td>
					<td>성별</td>
					<td><select id="gender" name="gender" disabled>
							<option value="남">남</option>
							<option value="여">여</option>
					</select></td>
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
					<td>입사일</td>
					<td><input type="date" value="${evo.emp_date }" id="emp_date"
						name="emp_date" readonly></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" size="40" value="${evo.phone_num }"
						id="phone_num" name="phone_num" readonly></td>
					<td>내선번호</td>
					<td><input type="text" size="50" value="${evo.line_num }"
						id="line_num" name="line_num" readonly></td>
					<td>결혼여부</td>
					<td><select id="marriage" name="marriage" disabled>
							<option value="미혼">미혼</option>
							<option value="기혼">기혼</option>
					</select></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" size="40" value="${evo.email }"
						id="email" name="email" readonly></td>
					<td>주소</td>
					<td><input type="text" size="30" placeholder="주소" id="address"
						name="address" value="${evo.address }" readonly> <input
						type="text" size="18" placeholder="상세주소" id="extraAddress"
						name="extraaddress" value="${evo.extraaddress }" readonly></td>
					<td><input type="button" value="우편번호 찾기"
						onclick="execDaumPostcode()" id="address_find" disabled></td>
					<td><input type="text" size="10" placeholder="우편번호"
						id="postcode" name="post_num" value="${evo.post_num }" readonly></td>
				</tr>
			</table>
		</form>

	</div>

	<div>
		<p>출퇴근 확인</p>
		<input type="date" id="checkDate">
		<table class="table table-striped" style="margin-top: 10px;">
			<thead id="theadHere">
			</thead>
			<tbody id="checkResultHere">
			</tbody>
		</table>
	</div>


</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
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