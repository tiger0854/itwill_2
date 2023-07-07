
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
  <title>출고 예정 등록</title>
  <link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
  <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
	  
	<body id="body-pd" style="font-family: 'TheJamsil5';">
	<jsp:include page="../common/header.jsp"/>
   
	<br>
	<br>
  <h4>출고 예정 등록</h4>
 
  <form action="" method="post">
  <table border="1" class="table table-bordered">
  <tr>
  <th>담당자 코드</th>
  <td><input type="text" id="out_empCd" name="outboundList[0].out_empCd" onclick="openChildWindow2();" readonly placeholder="담당자코드"><br></td>
  <th>담당자명</th>
  <td><input type="text" id="out_empNm" name="outboundList[0].out_empNm" onclick="openChildWindow2();" readonly placeholder="담당자명"></td>
  </tr>
  </table>
  <hr>
  <div style="color: red; font-size: small">* 첫번째 행을 먼저 입력해주세요.</div>
  
  <table id="tbl" border="1" class="table table-bordered">
   <thead>
    <tr>
	  <td>수주번호</td>
	  <td>품목코드</td>
	  <td>품목명</td>
	  <td>거래처명</td>
	  <td>수량</td>
	  <td>납기일자</td>  
	  <td>비고</td>
    </tr>
   </thead>
   <tbody>
   <tr name="trProduct" id="trProduct">
	  <td><input type="text" id="re_code" name="outboundList[0].re_code"  
	  		onclick="openChildWindow();" readonly placeholder="수주번호"></td>
	  <td><input type="text" id="item_code" name="outboundList[0].item_code"  
	  		onclick="openChildWindow();" readonly placeholder="품목코드"></td>
	  <td><input type="text" id="item_name" name="outboundList[0].item_name"  
	  		onclick="openChildWindow();" readonly placeholder="품목명"> </td>
	  <td><input type="text" id="out_customerNm" name="outboundList[0].out_customerNm"  
	  		onclick="openChildWindow();" readonly placeholder="거래처명"></td>
	  <td><input type="text" id="out_qty" class="out_qty" name="outboundList[0].out_qty" onclick="openChildWindow();" readonly placeholder="수량"></td>
	  <td><input type="date" id="due_date" name="outboundList[0].due_date" placeholder="년-월-일"></td>
	  <td><input type="text" name="outboundList[0].out_notes" placeholder="비고"></td>
	  <td colspan="8"><input type="button" value="del" id="delProduct"></td>   	
    </tr>
   </tbody>
   

  </table>
  
  		<input type= "hidden" name="create_date">
	    <input type="button" value="add" name="addProduct">
  <hr>
   <p id="check_error" style="color: red; font-size: small;"></p>
  	<input type="submit" class="submitBtn" id="submitBtn" value="출고 등록">
  </form>
</body>
 <script type="text/javascript">


 	  // 품목 행 추가 
 	  $(document).ready(function(){
 		  var idx=1;
	  $(document).on("click","input[name=addProduct]", function(){
		  var employeeCd=document.getElementById("out_empCd").value;
		  var employeeNm=document.getElementById("out_empNm").value;
		  var addProduct = ' <tr name="trProduct">'+
		    ' <input type="hidden" id="out_empCd" name ="outboundList['+(idx)+'].out_empCd" value='+employeeCd+'>'+
		    ' <input type="hidden" id="out_empNm" name ="outboundList['+(idx)+'].out_empNm" value='+employeeNm+'>'+
			'  <td><input type="text" id="re_code" name="outboundList['+(idx)+'].re_code" onclick="openChildWindow();" readonly placeholder="수주번호"></td>' +
			'  <td><input type="text" id="item_code" name="outboundList['+(idx)+'].item_code" onclick="openChildWindow();" readonly placeholder="품목코드"></td>' +
			'  <td><input type="text" id="item_name" name="outboundList['+(idx)+'].item_name" onclick="openChildWindow();" readonly placeholder="품목명"></td>' +
			'  <td><input type="text" id="out_customerNm" name="outboundList['+(idx)+'].out_customerNm" onclick="openChildWindow();" readonly placeholder="거래처명"> </td>' +
			'  <td><input type="text" class="out_qty" id="out_qty" name="outboundList['+(idx)+'].out_qty" onclick="openChildWindow();" readonly placeholder="수량"></td>' +
			'  <td><input type="date" id="due_date" name="outboundList['+(idx)+'].due_date" placeholder="년-월-일"></td>' +
			'  <td><input type="text" name="outboundList['+(idx)+'].out_notes" placeholder="비고"></td>' +
			'  <td><input type="button" value="del" id="delProduct"></td>' +
			' </tr>';
		  var trHtml = $( "tr[name=trProduct]:last" );
		  trHtml.after(addProduct);
		  idx++
		  
		
  		}); // 품목 행 추가 

		// 품목 행 삭제 버튼
		$(document).on("click", "#delProduct", function() {
		  var trHtml = $(this).closest("tr");
		
		  // 첫 번째 행은 delete x
		  if (trHtml.is(':first-child')) {
		    return;
		  }
		  trHtml.remove();
			});
		});

  
  
		// 팝업창
		var popupWidth = 500;
		var popupHeight = 400;
		var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
		var popupY = Math.ceil(( window.screen.height - popupHeight )/2);
  		
	 
	  function openChildWindow() {	
	    var childWindow = window.open("/receive/receiveList?pop=out", "recConnection", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	   
		  }

 
	  function openChildWindow2() {	
		    var childWindow = window.open("/emp/list?pop=out", "empList", 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);		
		  }
	  
	  
	  
	  
		// 유효성
		var errorElement = document.getElementById('check_error');
	
		$(document).ready(function() {
	    $("#submitBtn").click(function() {
	    	var isValid = true; // 유효성 검사 결과 변수 초기화
	    
	    // 모든 행 검사
	    $("tr[name='trProduct']").each(function() {
	        var reCode = $(this).find("input[name^='outboundList']").eq(0).val();
	        var dueDate = $(this).find("input[name^='outboundList']").eq(5).val();
	      
	        if (reCode === '' || $('input#out_empCd').val().trim() == '' || dueDate === ''){
	       	 	  isValid = false;
	       		  return false;
	      }
	    });
	    
	    	if (!isValid) {
	    		  errorElement.textContent = '비고를 제외한 모든 칸을 입력해주세요.';
	    		  return false; // submit 방지
	    } else {
	    	errorElement.text(""); // 경고 메시지 초기화
	    }
	  });
	});
		
		

		

	  	  </script>

</html>