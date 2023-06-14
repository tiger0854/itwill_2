<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("Date").setAttribute("min", today);
	
    };
</script>
<style type="text/css">
th{background-color:  #F3F2F2 !important;}
td{height: 80px !important; vertical-align: middle;}
</style>
</head>
<body  id="body-pd" style="font-family: 'TheJamsil5';">

	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->

<div class="container" style=" width: 1000px; margin: auto; margin-top:100px; ">
<h3>입고예정등록</h3>
<span style="color: gray">receive register</span>
<table class="table table-borderless" style="margin-top: 30px;">
  <tr>
    <td>발주서</td>
    <td>
    <div class="input-group">
    <input type="text"placeholder="발주서 검색하기" class="form-control">
    <button class="btn btn-primary">검색</button>
    </div>
    </td>
    <td>상품명</td>
    <td><input type="text" placeholder="발주서 검색 시 자동입력" class="form-control"></td>
  </tr>
  <tr>
    <td>입고수량</td>
     <td><input type="number" class="form-control"></td>
    <td>입고예정일자</td>
        <td><input type="date" class="form-control"></td>
  </tr>
  <tr>
    <td>담당자</td>
    <td>  
    <div class="input-group">
    <input type="text"placeholder="담당자 검색하기" class="form-control">
    <button class="btn btn-primary">검색</button>
    </div>
    </td>
    
    <td>입고창고</td>
    <td>
  <div class="input-group">
    <input type="text"placeholder="창고 검색하기" class="form-control">
    <button class="btn btn-primary">검색</button>
    </div>
	</td>
  </tr>
    <tr>
    <td>유통기</td>
        <td><input type="date"  id="Date" ></td>
  </tr>
</table>
<div style="float: right;margin-bottom: 20px;">
<button class="btn btn-secondary" style="width: 200px; margin-right: 10px;" >초기화</button>
<button class="btn btn-primary" style="width: 200px;" >입고 등록하기</button>
</div>
</div>



</body>
</html>