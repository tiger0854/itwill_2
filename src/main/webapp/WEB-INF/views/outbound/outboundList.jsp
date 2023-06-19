<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>출고 예정 등록</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

	function updateOutState(outNum, newState) {
	
	    // AJAX 요청을 통해 서버로 데이터 전송
	    $.ajax({
	      url: "/outbound/outboundList",
	      method: "GET",
	      data: { out_num: outNum, out_state: newState },
	      success: function(response) {
	    	  
	    	
	    	  
	    	  
//     	  // 출고 완료 여부를 컨펌 창으로 확인
//     	    var confirmMessage = "출고 완료하시겠습니까?";
//     	    if (confirm(confirmMessage)) {
//     	      // 사용자가 확인을 선택한 경우
    	      // 성공적으로 업데이트된 경우 필요한 처리를 수행
    	      alert("출고 상태 업데이트 성공");

    	      // 해당 행을 "ongoingButton" 목록에서 찾아서 투명하게 애니메이션 적용 후 사라지도록 함
    	      var row = $("td").filter(function() {
    	        return $(this).text() == outNum; // 출고 번호와 일치하는 행 찾기
    	      }).closest("tr");

    	      // 투명한 애니메이션 효과 적용 후 행을 완전히 숨김
    	      row.fadeOut(function() {
    	        // 애니메이션이 완료된 후 행을 "completedButtonTable"로 이동
    	        row.find("td:nth-child(7)").text("완료");
    	        // row.appendTo("#completedButtonTable");
    	      });
//     	    } else {
//     	      // 사용자가 취소를 선택한 경우
//     	      // 필요한 처리를 수행
//     	      alert("취소되었습니다.");
//     	    }
    	  },
 
	      error: function(xhr, status, error) {
	        // 업데이트 중 오류가 발생한 경우 오류 처리
	        alert("출고 상태 업데이트 오류");
	        alert(xhr.responseText);
	      }
	    });
	  }



	$(document).ready(function() {
		  // 버튼 클릭 이벤트 핸들러
		  $("#allButton").click(function() {
		    updateTable("all");
		  });
	
		  $("#ongoingButton").click(function() {
		    updateTable("ongoing");
		  });
	
		  $("#completedButton").click(function() {
		    updateTable("completed");
		  });
	
		  // 테이블 업데이트 함수
		  function updateTable(state) {
		    $.ajax({
		      url: "/outbound/outboundList",
		      method: "GET",
		      data: { state: state },
		      success: function(response) {
		        // 서버로부터 받은 데이터로 테이블 업데이트
		        $('body').html(response);
		      },
		      error: function() {
		        alert("데이터 요청 실패");
		      }
		    });
		  }
		});




</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

  <h3>outboundList.jsp</h3>
  <h1>출고 관리</h1>
  
  <div >
  출고번호 <input type="text" style="width:50px;">
  출고일자 <input type="date" placeholder="날짜 선택"> ~ <input type="date" placeholder="날짜 선택">
  담당자 <input type="text" onclick="location.href='user.jsp';"  style="width:50px;">
  품목명 <input type="text" onclick="location.href='productSearch.jsp';"> 
  <button>조회</button>
  </div>
  <hr>
  
  <button id="allButton">전체</button>
  <button id="ongoingButton">진행중</button>
  <button id="completedButton">출고완료</button>

  <table id="table" border="1" class="table table-bordered">
  <tr>
  <td>출고번호</td>
  <td>거래처명</td>
  <td>품목명[규격]</td>
  <td>출고수량합계</td>
  <td>재고</td>
  <td>납기일자</td>
  <td>진행상태</td>
  <td>출고일자</td> 
  <td>담당자</td>
  <td>출고처리</td>  
  </tr>
  <hr>
  <c:forEach var="vo" items="${outList }">
  <tr>
  <td onclick="location.href='outboundUpdate.jsp';">${vo.out_num }</td>
  <td>${vo.customer_code }</td>
  <td onclick="location.href='outProduct.jsp';">${vo.item_name }</td>
  <td>${vo.out_qty }</td>
  <td onclick="location.href='outboundStock.jsp';">출고불가능</td> <!-- 출고 총 수량이 재고 수량보다 많을 경우 불가능, 적을경우 가능 -->
  <td>${vo.due_date }</td> 
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td>진행중</td>
    </c:when>
    <c:otherwise>
		 <td><font color="red">완료</font></td>
    </c:otherwise>
 </c:choose>
  <td>${vo.out_date }</td>
  <td>${vo.employee_id }</td>
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td><button onclick="updateOutState(${vo.out_num}, 0)">출고</button></td> 
   		<td><button>수정</button></td> 
    </c:when>
    <c:otherwise>
   		 <td></td>
		 <td><button>수정</button></td>
    </c:otherwise>
 </c:choose>
  
<!--   <td onclick="location.href='outboundPrint.jsp'">인쇄</td>  -->  
  </tr>
  </c:forEach>
  </table>
  
  <!-- 진행상태 체크한것 일괄 변경 셀렉트버튼 추가 -->
  
</body>
</html>