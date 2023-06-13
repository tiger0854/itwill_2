<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function openPopup() {
	  // 팝업 창의 URL
	  var popupURL = "http://localhost:8088/ret/productList";

	  // 팝업 창의 크기와 위치
	  var popupWidth = 1000;
	  var popupHeight = 400;
	  var popupLeft = (window.innerWidth - popupWidth) / 2;
	  var popupTop = (window.innerHeight - popupHeight) / 2;

	  // 팝업 창 열기
	  window.open(popupURL, "", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + popupLeft + ",top=" + popupTop);
	}
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
<h3>발주등록</h3>
<span style="color: gray">order register</span>
<table class="table table-borderless" style="margin-top: 30px;">
  <tr>
    <td>상품코드</td>
    <td>
    <div class="input-group">
    <input type="text"placeholder="상품코드 검색하기" class="form-control">
    <button class="btn btn-primary" onclick="openPopup()">검색</button>

    </div>
    </td>
    <td>상품명</td>
    <td><input type="text" placeholder="코드검색시 자동입력" class="form-control"></td>
  </tr>
  <tr>
    <td>발주수량</td>
     <td><input type="number" class="form-control"></td>
    <td>단가</td>
     <td><input type="text" class="form-control"></td>
  </tr>
  <tr>
    <td>납기일자</td>
        <td><input type="date" class="form-control"></td>
    <td>발주일자</td>
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
    
    <td>거래처</td>
    <td>
  <div class="input-group">
    <input type="text"placeholder="거래처 검색하기" class="form-control">
    <button class="btn btn-primary">검색</button>
    </div>
	</td>
  </tr>
</table>
<div style="float: right;margin-bottom: 20px;">
<button class="btn btn-secondary" style="width: 200px; margin-right: 10px;" >초기화</button>
<button class="btn btn-primary" style="width: 200px; " >발주하기</button>
</div>
</div>

</body>
</html>