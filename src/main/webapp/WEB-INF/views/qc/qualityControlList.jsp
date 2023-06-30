<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>품질 검사</h2>

	<form>
		<label for="product-name">제품명:</label> <input type="text"
			id="product-name" name="product-name"> <label
			for="inspection-date">검사일:</label> <input type="date"
			id="inspection-date" name="inspection-date"> <label
			for="inspection-result">검사 결과:</label> <select id="inspection-result"
			name="inspection-result">
			<option value="pass">합격</option>
			<option value="fail">불합격</option>
		</select> <label for="inspection-details">검사 세부 내용:</label>
		<textarea id="inspection-details" name="inspection-details"></textarea>

		<button type="submit">검사 보고서 제출</button>
	</form>

	<table>
		<caption>검사 이력</caption>
		<thead>
			<tr>
				<th>검사일</th>
				<th>제품명</th>
				<th>결과</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2023-06-30</td>
				<td>제품 A</td>
				<td>합격</td>
			</tr>
			<tr>
				<td>2023-06-28</td>
				<td>제품 B</td>
				<td>불합격</td>
			</tr>
			<!-- 추가적인 검사 이력을 표시할 수 있습니다. -->
		</tbody>
	</table>
</body>
</html>