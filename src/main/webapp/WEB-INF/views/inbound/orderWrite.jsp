<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
<script type="text/javascript">

	
$(document).ready(function() {
    $('#pay_date').click(function() {
      var orderDateValue = $("input[name='order_date']").val();
      $('#pay_date').attr("min", orderDateValue);
    });//납기일자 >= 발주일자 제어
    
    $('#fr').submit(function(event) {
        var materialPrice = $('#material_price').val();
        var materialCode = $('#material_code').val();
        var payDate = $('#pay_date').val();
        var orderDate = $('#order_date').val();
        var orderResp = $('#order_resp').val();
        var orderTrade = $('#order_trade').val();

        if (materialPrice == "" || materialCode == "" || payDate == "" || orderDate == "" || orderResp == "" || orderTrade == "") {
			 event.preventDefault(); // 폼 제출을 막음
      		Swal.fire({
            title: "빈칸을 모두 입력해주세요.",
            icon: "warning"
          });
        }
      }); //빈칸 입력제어
    
  }); 


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
<input type="button" class="btn btn-outline-primary" onclick="location.href='/inbound/orderList'" value="발주리스트로 이동" style=" width: 200px;margin-bottom: 20px;float: right;">

<h3>발주등록</h3>
<span style="color: gray">order register</span>

<form action="" method="POST" id="fr">
<table class="table table-borderless" style="margin-top: 30px;">
  <tr>
    <td>자재코드</td>
    <td>
    <div class="input-group" style="display: flex; align-items: center;">
    <button type="button" class="btn btn-primary" onclick="openChildWindow();" >요청리스트</button>
    <input type="text"placeholder="상품코드 검색하기" class="form-control"  onclick="openChildWindow();" name="material_code" id="material_code" readonly="readonly" style="margin-left: 5px;">
	<input type="hidden" id="request_id" name="request_id">
    </div>
    </td>
    <td>자재이름</td>
    <td><input type="text" placeholder="코드검색시 자동입력" class="form-control" name="material_name" id="material_name" readonly="readonly"></td>
  </tr>
  <tr>
    <td>발주수량</td>
     <td><input type="number" class="form-control" name="order_piece" id="order_piece" readonly="readonly" placeholder="코드검색시 자동입력"></td>
 <td>가격</td>
     <td><input type="text" class="form-control" name="material_price" id="material_price" ></td>
 </tr>
  <tr>
  		
    	<td><label for="order_date">발주일자</label></td>
        <td><input type="date" class="form-control" name="order_date" id="order_date"></td>
    <td>납기일자</td>
        <td><input type="date" class="form-control" name="pay_date" id="pay_date"></td>
  </tr>
  <tr>
    <td>담당자</td>
    <td>  
    <div class="input-group">
    <input type="text"placeholder="담당자 검색하기" class="form-control" name="order_resp" readonly="readonly" id="order_resp"  onclick="openChildWindow2();">
    <button type="button" class="btn btn-primary"  onclick="openChildWindow2();">검색</button>
    </div>
    </td>
    
    <td>거래처</td>
    <td>
  <div class="input-group">
    <input type="text"placeholder="거래처 검색하기" class="form-control" name="order_trade" readonly="readonly" id="order_trade"   onclick="openChildWindow3();">
    <button type="button" class="btn btn-primary"  onclick="openChildWindow3();">검색</button>
    </div>
	</td>
  </tr>
</table>
<div style="float: right;margin-bottom: 20px;">
<button type="reset" class="btn btn-secondary" style="width: 200px; margin-right: 10px;" onclick="clearInputs();" >초기화</button>
<input type="submit" class="btn btn-primary" style="width: 200px; " value="발주하기" id="submit">
</div>

</form>
</div>

<script type="text/javascript">

var popupWidth = 500;
var popupHeight = 400;

var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 

function openChildWindow() {

    var childWindow = window.open("/inbound/requestList", "requestList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);

  } //productList팝업
  
function openChildWindow2() {

    var childWindow2 = window.open("/emp/list?pop=ok", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);

  } //empList팝업
  
function openChildWindow3() {

	popupHeight = 500;  	
    var childWindow3 = window.open("/customer/customerList?pop=ok", "tradeList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
 
  } //tradeList팝업
  
  
</script>

</body>
</html>