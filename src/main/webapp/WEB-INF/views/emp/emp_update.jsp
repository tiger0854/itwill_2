<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>사원 정보</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<div>
	<br>
	    <h1>사원 정보 수정</h1>
	    <!-- 권한제어 -->
	    <input type="button" value="등록">
	    <input type="button" value="뒤로가기" onclick="history.back()">
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td rowspan="4">사진</td>
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
		            <td><select>
			            <optgroup label="생산">
			            	<option>생산과</option>
			            	<option>생산 1팀</option>
			            	<option>생산 2팀</option>
			            </optgroup>
			            <optgroup label="유통">
			            	<option>유통과</option>
			            	<option>입고팀</option>
			            	<option>출고팀</option>
			            </optgroup>
			            <optgroup label="관리">
			            	<option>인사과</option>
			            </optgroup>
		            </select></td>
		            <td>직급</td>
		        	<td><select>
			            	<option>이사</option>
			            	<option>과장</option>
			            	<option>팀장</option>
			            	<option>주임</option>
			            	<option>사원</option>
			            	<option>일용</option>
			            	<option>외주</option>
		            </select></td>
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

    
</body>
</html>