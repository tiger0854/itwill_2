<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
<div>
	<br>
	    <h1>사원 리스트</h1>
	    <h2>대시보드</h2>
	    <table class="table table-striped" style="margin-top: 10px;">
	    	<tr>
	    		<td>임직원 수</td>
	    		<td>11명</td>
	    		<td>일용근로자 수</td>
	    		<td>15명</td>
	    		<td>출근인원</td>
	    		<td>23명</td>
	    		<td>출근율</td>
	    		<td>90%</td>
	    	</tr>
	    	<tr>
	    		<td>채용 공고</td>
	    		<td>1건</td>
	    		<td>지원자</td>
	    		<td>10명</td>
	    		<td>휴가자</td>
	    		<td>3명</td>
	    		<td>휴가신청자</td>
	    		<td>1명</td>
	    	</tr>
	    </table>
	    <!-- 권한제어 -->
	    <input type="button" value="사원 정보등록" onclick="location.href='emp_add.jsp'">
		    <table class="table table-striped" style="margin-top: 10px;" >
		        <tr>
		            <td>xx순 정렬용</td>
		        </tr>
		    </table>
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td>사원번호</td>
		            <td>성명</td>
		            <td>부서</td>
		            <td>직급</td>
		            <td>재직현황</td>
		        </tr>
		        <tr>
		            <td>2020-0009</td>
		            <td><a href="emp_view.jsp">톰하디</a></td>
		            <td>생산1팀</td>
		            <td>주임</td>
		            <td>재직중</td>
		        </tr>
		        <tr>
		            <td>2023-0001</td>
		            <td><a href="emp_view.jsp">윤찬우</a></td>
		            <td>생산2팀</td>
		            <td>사원</td>
		            <td>재직중</td>
		        </tr>
		        <tr>
		            <td>2021-0014</td>
		            <td><a href="emp_view.jsp">손흥민</a></td>
		            <td>인사팀</td>
		            <td>주임</td>
		            <td>출산휴가</td>
		        </tr>
		    </table>
	 </div>
    <div>
    </div>
</body>
</html>