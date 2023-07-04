<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
   
	<!-- header && sidebar include -->
<script type="text/javascript">
  window.onload = function() {
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("Date1").setAttribute("min", today);
	
	 $('#in_piece').keyup(function() {
	     var o_piece = parseInt($('#order_piece').val());
	     var in_piece = parseInt($('#in_piece').val());

		  if(o_piece < in_piece){
			  $('#ipmsg').show();
			  $('#ipmsg').css('color','red');
			  $('#ipmsg').text("발주수량보다 많은 수량 입력불가. 발주수량:"+o_piece);  
			  $('#submit').attr('disabled','disabled'); 
		  }else{
			  $('#ipmsg').hide();
			  $('#submit').removeAttr('disabled');
		  }
		   
		});//입고수량이 발주수량보다 많을 수 없음 
	
    };
    
    $(document).ready(function() {

        
        $('#fr').submit(function(event) {
            var orderNumber = $('#order_number').val();
            var inPiece = $('#in_piece').val();
            var Date = $('#Date').val();
            var inResp = $('#in_resp').val();
            var whCode = $('#wh_code').val();
            var inExpir = $('#Date1').val();

            if (orderNumber == "" || inPiece == "" || Date == "" || inResp == "" || whCode == "" || inExpir == "") {
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
td{height: 80px !important; vertical-align: middle;}
</style>
</head>
<body  id="body-pd" style="font-family: 'TheJamsil5';">


<div class="container" style=" width: 1000px; margin: auto; margin-top:100px; ">
<input type="button" class="btn btn-outline-primary" onclick="location.href='/inbound/inboundList'" value="입고리스트로 이동" style=" width: 200px;margin-bottom: 20px;float: right;">
<h3>입고예정등록</h3>
<span style="color: gray">receive register</span>

<input type="hidden" id="order_piece"><!-- 발주수량 -->

<form action="" method="post" id="fr">
<table class="table table-borderless" style="margin-top: 30px;">
  <tr>
    <td>발주서</td>
    <td style="width: 400px;">
  	 <div style="display: flex; align-items: center;">
    <button class="btn btn-primary" type="button" onclick="openChildWindow();"style="width: 200px;">발주서검색</button>
    <input type="text"placeholder="발주번호" class="form-control" name="order_number" id="order_number" readonly="readonly" style="margin-left: 5px" >
   	 </div>
    </td>
    <td>상품명</td>
    <td><input type="text" placeholder="발주서 검색 시 자동입력" class="form-control" id="material_name" readonly="readonly"></td>
  </tr>
  <tr>
    <td>입고수량</td>
     <td><input type="number" class="form-control" name="in_piece" id="in_piece" min="0"><span id="ipmsg"></span></td>
     
    <td>입고예정일자</td>
        <td><input type="date"  id="Date" class="form-control" name="in_date"></td>
  </tr>
  <tr>
    <td>담당자</td>
    <td>  
    <div class="input-group">
    <input type="text"placeholder="담당자 검색하기" class="form-control" name="in_resp" id="in_resp">
    <button class="btn btn-primary" type="button">검색</button>
    </div>
    </td>
    
    <td>입고창고</td>
    <td>
  <div class="input-group">
    <input type="text"placeholder="창고 검색하기" class="form-control" name="wh_code" id="wh_code">
    <button class="btn btn-primary" type="button">검색</button>
    </div>
	</td>
  </tr>
    <tr>
    <td>유통기한</td>
        <td><input type="date"  id="Date1" class="form-control" name="in_expir"></td>
  </tr>
</table>
<div style="float: right;margin-bottom: 20px;">
<input type="reset" class="btn btn-secondary" style="width: 200px; margin-right: 10px;" value="초기화">
<input type="submit" class="btn btn-primary" style="width: 200px;"value="입고등록" id="submit">
</div>
</form>
</div>
<script type="text/javascript">
function openChildWindow() {
	var popupWidth = 600;
	var popupHeight = 400;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
    var childWindow = window.open("/inbound/popOrderList", "popOrderList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
    // 자식 창이 로드되면 정보를 받기 위해 리스너를 등록합니다.
    window.addEventListener("message", function(event) {
      var data = event.data;
      document.getElementById("order_number").value = data[0];
      document.getElementById("material_name").value = data[2];
      document.getElementById("order_piece").value = data[3];
    	
    });
  }
</script> <!-- 팝업창 부르기 -->


</body>
</html>