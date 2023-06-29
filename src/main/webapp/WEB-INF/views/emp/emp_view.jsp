<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>사원 정보</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<div>
	<br>
	    <h1>사원 정보</h1>
	    
	    <!-- 권한제어 -->
	    <input type="button" value="수정" onclick="location.href='emp_update.jsp'">
	    <input type="button" value="저장">
	    <input type="button" value="뒤로가기" onclick="history.back()">
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td rowspan="4"><img src="../css/test.png" alt="profile_photo" width="200" height="200"></td>
		            <td>성명</td>
		            <td><input type="text" size="50"></td>
		            <td>주민등록번호</td>
		            <td><input type="text" size="50"></td>
		            <td>성별</td>
		            <td>
		                <select>
		                    <option>남</option>
		                    <option>여</option>
		                </select></td>
		        </tr>
		        <tr>
		            <td>부서</td>
		            <td><input type="text" size="50"></td>
		            <td>직위</td>
		            <td><input type="text" size="50"></td>
		            <td>입사일</td>
		            <td><input type="date"></td>
		        </tr>
		        <tr>
		            <td>휴대폰 번호</td>
		            <td><input type="text" size="50"></td>
		            <td>내선번호</td>
		            <td><input type="text" size="50" placeholder="내선"></td>
		            <td>결혼여부</td>
		            <td>
		                <select>
		                    <option>미혼</option>
		                    <option>기혼</option>
		                </select></td>
		        </tr>
		        <tr>
		            <td>이메일</td>
		            <td><input type="text" size="50"></td>
		            <td>주소</td>
		            <td><input type="text" size="50" placeholder="주소"></td>
		            <td><input type="button" value="우편번호 찾기"></td>
		            <td><input type="text" size="10" placeholder="우편번호"></td>
		
		        </tr>
		    </table>
	 </div>
	 <div>
		<table class="table table-striped" style="margin-top: 10px;" >
			<tr>
				<td>일자</td>
				<td>출근일시</td>
				<td>퇴근일시</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
			</tr>
		</table>
	 </div>

    
</body>
</html>