<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
<script type="text/javascript">

function datepicker_view(obj) {
	 $(obj).datepicker().datepicker("show");
	 
	}

function clearInputs() {
	//이름 clear()로 했었으나 안되는 이유 --> javascript의 내장객체 이름과 겹쳐서 실행이 안됐던 것.
	document.forms[0].reset();
}
</script>	
	
<style type="text/css">
 .date-wrap {
          width: 300px;
          margin: 0 auto;
        }
    
        input {
          margin: 0 auto;
          width: 100%;
          position: relative;
        }
 ::-webkit-calendar-picker-indicator {
  -webkit-appearance: none;
            position: absolute;
            right: -10px;
            top: 0;
            transform: translateX(-10px);
            padding-left: 3000px;
            height: 100%;}
i           
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
} 
       
th{background-color:  #F3F2F2 !important;}
td{height: 80px !important; vertical-align: middle;}


</style>
</head>
<body  id="body-pd" style="font-family: 'TheJamsil5';">

	
<div class="container" style=" width: 1000px; margin: auto; margin-top:100px; ">
<h3>발주등록</h3>
<span style="color: gray">order register</span>

<form action="" method="POST" id="fr">
<table class="table table-borderless" style="margin-top: 30px;">
  <tr>
    <td>상품코드</td>
    <td>
    <div class="input-group">
    <input type="text"placeholder="상품코드 검색하기" class="form-control" name="material_code" id="material_code" readonly="readonly">
    <button type="button" class="btn btn-primary" onclick="openChildWindow();">검색</button>

    </div>
    </td>
    <td>상품명</td>
    <td><input type="text" placeholder="코드검색시 자동입력" class="form-control" name="material_name" id="material_name" readonly="readonly"></td>
  </tr>
  <tr>
  <td>단가</td>
     <td><input type="text" class="form-control" name="material_price" id="material_price" placeholder="코드검색시 자동입력" readonly="readonly"></td>
    <td>발주수량</td>
     <td><input type="number" class="form-control" name="order_piece"></td>
  </tr>
  <tr>
  		
    	<td><label for="order_date">납기일자</label></td>
        <td><input type="date" class="form-control" name="order_date" id="order_date"></td>
    <td>발주일자</td>
        <td><input type="date" class="form-control" name="pay_date"></td>
  </tr>
  <tr>
    <td>담당자</td>
    <td>  
    <div class="input-group">
    <input type="text"placeholder="담당자 검색하기" class="form-control" name="order_resp" readonly="readonly">
    <button type="button" class="btn btn-primary">검색</button>
    </div>
    </td>
    
    <td>거래처</td>
    <td>
  <div class="input-group">
    <input type="text"placeholder="거래처 검색하기" class="form-control" name="order_trade" readonly="readonly">
    <button type="button" class="btn btn-primary">검색</button>
    </div>
	</td>
  </tr>
</table>
<div style="float: right;margin-bottom: 20px;">
<button type="button" class="btn btn-secondary" style="width: 200px; margin-right: 10px;" onclick="clearInputs();" >초기화</button>
<input type="submit" class="btn btn-primary" style="width: 200px; " value="발주하기">
</div>
</form>
</div>

<script type="text/javascript">
function openChildWindow() {
	var popupWidth = 500;
	var popupHeight = 400;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
    var childWindow = window.open("/inbound/productList", "productList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
    // 자식 창이 로드되면 정보를 받기 위해 리스너를 등록합니다.
    window.addEventListener("message", function(event) {
      var data = event.data;
      document.getElementById("material_code").value = data[0];
      document.getElementById("material_name").value = data[1];
      document.getElementById("material_price").value = data[2];
    });
  }
</script>

</body>
</html>