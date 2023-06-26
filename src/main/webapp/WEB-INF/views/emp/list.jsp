<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    		<td>${empCount} 명</td>
	    		<td>일용근로자 수</td>
	    		<td>${alCount}명</td>
	    		<td>전일근무자</td>
	    		<td>${alCount_all}명</td>
	    		<td>오전/오후근무자</td>
	    		<td>${alCount_am} / ${alCount_pm}명</td>
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
	    <input type="button" value="사원 정보등록" onclick="location.href='/emp/insert'">
	    <input type="button" value="일용직 일괄등록" onclick="location.href='/emp/insert_al'">
		    <table class="table table-striped" style="margin-top: 10px;" >
		        <tr>
		            <td><select name="department_name">
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
		            <td><select name="position">
			            	<option value="이사">이사</option>
			            	<option value="과장">과장</option>
			            	<option value="팀장">팀장</option>
			            	<option value="주임">주임</option>
			            	<option value="사원">사원</option>
			            	<option value="일용">일용</option>
			            	<option value="외주">외주</option>
		            </select></td>
		            <td><select name="employee_status" id="employee_status">
		        		<option value="재직중">재직중</option>
		        		<option value="퇴사">퇴사</option>
		        		<option value="휴직중">휴직중</option>
		        	</select></td>
		            <td><input type="text" size="15" placeholder="이름"><input type="button" value="검색"></td>
		        </tr>
		    </table>
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td>사원번호</td>
		            <td>성명</td>
		            <td>부서</td>
		            <td>직급</td>
		            <td>내선번호</td>
		        </tr>
		        <c:forEach var="vo" items="${empList }">
		        <tr>
		            <td>${vo.employee_id}</td>
		            <td><a href="/emp/info?employee_id=${vo.employee_id}">${vo.employee_name }</a></td>
		            <td>${vo.department_name }</td>
		            <td>${vo.position }</td>
		            <td>${vo.line_num }</td>
		        </tr>
		        <c:if test="${empty empList }">
		        	<td rowspan="5">검색 결과가 없습니다.</td>
		        </c:if>
		        </c:forEach>
		    </table>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 	<div class="pagination">			
			<c:choose>
				<c:when test="${pageVO.startPage > pageVO.pageBlock}">
					<a href="/emp/list?pageNum=${pageVO.startPage - pageVO.pageBlock}" style="margin: 0.5em;">◀</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<a href="/emp/list?pageNum=${i}" <c:if test="${pageVO.pageNum eq i}">class="active"</c:if> style="margin: 0.5em;">${i}</a>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageVO.endPage < pageVO.pageCount}">
					<a href="/emp/list?pageNum=${pageVO.startPage + pageVO.pageBlock}" style="margin: 0.5em;">▶</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 </div>
    <div>
    </div>
</body>
</html>