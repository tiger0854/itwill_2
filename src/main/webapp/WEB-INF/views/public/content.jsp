<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 조회</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#contentUpdate').click(function() {
			alert('수정하기');
			
			$('#title').attr('readonly', false);
			$('#content').attr('readonly', false);
			
			$('#contentDelete').attr('disabled', true);
			$('#submitButtonHere').html('<input type="submit" value="저장하기">');
		})//contentUpdate click end
		$('#contentDelete').click(function(){
			if(confirm('정말 삭제 하시겠습니까?')){
				location.href="/public/contentDelete?emp_bno=${boardContent.emp_bno }";
			}else{
				alert('취소하셨습니다.');
			}//i-e end
		})// contentDelete click end
		
		// 권한제어에 따른 수정 불가 처리
		if("${login_id}" != "${boardContent.employee_id }"){
			$('#contentUpdate').attr('disabled', true);
			$('#contentDelete').attr('disabled', true);
		}// if end
		
	}); // jQ end
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">

	<h1>글 조회</h1>
	<form action="" method="post">
		<input type="hidden" name="emp_bno" value="${boardContent.emp_bno }">
		<button onclick="location.href='/public/boardList'">목록으로</button>
		<input type="button" value="수정하기" id="contentUpdate">
		<span id="submitButtonHere"></span>
		<input type="button" value="삭제하기" id="contentDelete">
		<table class="table table-striped" style="margin-top: 10px;">
			<tr>
				<td>제목: <input type="text" name="title"
					value="${boardContent.title }" id="title" size="40" readonly></td>
				<td>조회수: ${boardContent.read_count }</td>
			</tr>
			<tr>
				<td><b>작성자: </b>${boardContent.position}
					${boardContent.employee_name }</td>
				<td><b>작성일시: </b> ${boardContent.regdate }</td>
			</tr>
		</table>

		<table>
			<tr>
				<td><textarea cols="180" rows="20" id="content" name="content" readonly>${boardContent.content }</textarea></td>
			</tr>
		</table>

	</form>

</body>
</html>