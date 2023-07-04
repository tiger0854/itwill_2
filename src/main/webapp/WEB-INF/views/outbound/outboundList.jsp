<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>출고 리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

  <h3>outboundList.jsp</h3>
  <h1>출고 리스트</h1>
  	<!-- 팝업창 정보 전달용(수정 삭제시 필요할 수도.) form 얘는 추후에 보고 뺄거 빼기 -->
		<form role="form" id="fr"> 
			<input type="hidden" name="out_num" value="'${vo.out_num }'">
			<input type="hidden" name="out_id" value="'${vo.out_id }'">
			<input type="hidden" name="customer_code" value="'${vo.customer_code }'">
			<input type="hidden" name="create_date" value="'${vo.create_date }'">
		</form>
  
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
  <td>품목명</td>
  <td>재고</td>
  <td>납기일자</td>
  <td>진행상태</td>
  <td>출고일자</td> 
  <td>담당자</td>
  <td>출고처리</td>  
  <td>수정</td>  
  </tr>
  <hr>
  <c:forEach var="vo" items="${outList }">
  <tr>
  <td onclick="location.href='/outbound/outProductList?=${vo.out_num}'">${vo.out_num }</td>
  <td>${vo.customer_code }</td>
  <c:choose>
     <c:when test="${vo.outNumCount > 1}">
        <td onclick="location.href='/outbound/outProductList?=${vo.customer_code}&=${vo.create_date }'"> ${vo.item_name} </td>
     </c:when>
     <c:otherwise>
       <td> ${vo.item_name} </td>
     </c:otherwise>
  </c:choose>
<%--   <td>${vo.item_name }</td> --%>
  <td onclick="location.href='/outbound/outboundStock';">출고불가능</td> <!-- 출고 총 수량이 재고 수량보다 많을 경우 불가능, 적을경우 가능 -->
  <td>${vo.due_date }</td> 
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td>진행중</td>
    </c:when>
    <c:otherwise>
		 <td><font color="red">출고완료</font></td>
    </c:otherwise>
 </c:choose>
  <td>${vo.out_date }</td>
  <td>${vo.employee_id }</td>
 <c:choose>
    <c:when test="${vo.out_state==1 }">
   		<td><button onclick="updateOutState('${vo.out_num}', 0)">출고</button></td> 
   		<td><button type="button" class="btn-update" onclick="openChildWindow(this);">수정</button></td> 
    </c:when>
    <c:otherwise>
   		 <td></td>
		 <td></td>
    </c:otherwise>
 </c:choose>
  
<!--   <td onclick="location.href='outboundPrint.jsp'">인쇄</td>  -->  
  </tr>
  </c:forEach>
  </table>
  <hr>
   <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/outbound/outboundList?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}"
			step="1">
			<li
				class="page-item<c:if test="${pageVO.pageNum eq i}"> active</c:if>">
				<a href="/outbound/outboundList?pageNum=${i}" class="page-link">${i}</a>
			</li>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/outbound/outboundList?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
  
  <button onclick="location.href='/outbound/outboundInsert';">등록</button>
  
  <!-- 진행상태 체크한것 일괄 변경 셀렉트버튼 추가 -->
  
</body>


<script type="text/javascript">

	// 출고 상태 변경
	function updateOutState(out_num, out_state) {
	
	    // AJAX 요청을 통해 서버로 데이터 전송
	    $.ajax({
	      url: "/outbound/outboundList",
	      method: "GET",
	      data: { out_num: out_num, out_state: out_state },
	      success: function(response) {
	  
    	      alert("출고 상태 업데이트 성공");

    	      // 해당 행을 "ongoingButton" 목록에서 찾아서 투명하게 애니메이션 적용 후 사라지도록 함
    	      var row = $("td").filter(function() {
    	        return $(this).text() == out_num; // 출고 번호와 일치하는 행 찾기
    	      }).closest("tr");

    	      // 투명한 애니메이션 효과 적용 후 행을 완전히 숨김
    	      row.fadeOut(function() {
    	      // 애니메이션이 완료된 후 행을 "completedButtonTable"로 이동
    	        row.find("td:nth-child(7)").text("완료");
    	     // row.appendTo("#completedButtonTable");
    	      });
    	  },
	      error: function(xhr, status, error) {
	        // 업데이트 중 오류가 발생한 경우 오류 처리
	        alert("출고 상태 업데이트 오류");
	        alert(xhr.responseText);
	      }
	    });
	  }



	$(document).ready(function() {
		  // 전체 목록 출력
		  $("#allButton").click(function() {
		    updateTable("all");
		  });
		  // 진행중 목록 출력
		  $("#ongoingButton").click(function() {
		    updateTable("ongoing");
		  });
		  // 완료 목록 출력
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
		        $('body').html(response);
		      },
		      error: function() {
		        alert("데이터 요청 실패");
		      }
		    });
		  }
		});
	
	
	// 수정 Popup
	 function openChildWindow(button) {
		   var row = button.parentNode.parentNode;
		   var cells = row.getElementsByTagName("td");
		   var rowData = [];
		   
		   for (var i = 0; i < cells.length - 1; i++) {
		     rowData.push(cells[i].innerText);
		   }
		   
			var popupWidth = 600;
			var popupHeight = 500;

			var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
			var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
		    var childWindow = window.open("/outbound/outboundUpdate", "outboundUpdate",'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
		   
		   // 자식 창이 로드된 후에 데이터를 전송합니다.
		   childWindow.addEventListener("load", function() {
		     childWindow.postMessage(rowData, "*");
		   
		   });
		 }

</script>

</html>