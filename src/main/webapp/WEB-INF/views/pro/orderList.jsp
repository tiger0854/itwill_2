<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<jsp:include page="../common/header.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
function orderwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = '/pro/orderWrite';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function orderedit(wo_code) {
	  var popupUrl = '/pro/orderEdit?wo_code='+ wo_code;
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}

</script>

</head>
<body>


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 작업지시</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/pro/orderList.jsp


<!-- 작업지시목록 검색박스 -->

<form id="instr">
========
>>>>>>>> origin/0622kbs:src/main/webapp/WEB-INF/views/pro/oderList.jsp
<!-- 작업지시목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<button class=btn-add onclick="orderwrite()"><i class='bx bx-plus-medical'></i> 추가</button>
</div>

<!-- 작업지시목록 검색박스 -->
<table class="product-box"style="margin-top: 20px; width: 100%; " border="1">
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/pro/orderList.jsp
			<tr>
				<td>라인</td>
				<td><select name="line_code" class="line_code">
						<option value="" selected>전체</option>
						<c:forEach var="line" items="${lineList}">
							<option value="${line.line_code}">${line.line_name}</option>
						</c:forEach>
					</select></td>
				<td>지시일자</td>
				<!-- 시작시 기본 날짜 설정은 value를 이용 -->
				<td><input type="date" id="wo_date" class="form-control" name="wo_date" placeholder="날짜를 선택해주세요" />
			</tr>
			<tr>	
				<td>품번</td>
				<td><input type="hidden" id="pid" name="pid">
				<label>
				  <input type="text" id="item_code" name="item_code" placeholder="품번" onclick="openItem()" width="100%" readonly>
				  <i class='bx bx-search-alt-2'></i>  
				  <input type="text" id="item_name" placeholder="품명" style="border:1px solid" readonly></td>
				</label>
				<td>지시상태</td>
				<td colspan="8">
				<select name="wo_status">
				<option value="">전체</option>
				<option value="지시">지시</option>
				<option value="시작">시작</option>
				<option value="마감">마감</option>
				</select>
				</td>
			</tr>
========
 	
     <tr>
        <th>라인</th>
        <td>
        <select>
        <option>전체</option>
        <option>A</option>
        <option>B</option>
        </select>
        <td>
        <th>품번</th>
        <td>
        <input type="text" value="" placeholder="품번 검색하기"><input type="text" value="" placeholder="품명">
        </td>
      </tr>

      <tr>
        <th>지시일자</th>
        <td><input type="date" value=""><td>
        <th>지시상태</th>
        <td>
        <select>
        <option>전체</option>
        <option>지시</option>
        <option>시작</option>
        <option>마감</option>
        </select>
		</td>
      </tr>
>>>>>>>> origin/0622kbs:src/main/webapp/WEB-INF/views/pro/oderList.jsp
  </table>
</div>

<!-- 작업지시목록 리스트 -->
<!-- 작업지시상태 시작/지시 :  작업지시 현황 리스트 -->
<!-- 작업지시상태 마감 :  실적현황 -> 실적등록 -->

 <h4 style="margin-top: 100px;"><i class='bx bx-list-ol icon'></i> 작업지시 목록</h4>    
 <span style="color: red; font-size: 13px">* 작업 지시 번호 클릭시 해당작업 실적등록 가능 / 상품번호 클릭시 해당 레시피 확인가능</span> 
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>작업지시번호</th>
        <th>수주번호</th>
        <th>작업지시자</th>
        <th>지시상태</th>
        <th>납품예정일</th>
        <th>라인코드</th>
        <th>상품번호</th>
        <th>상품이름</th>
        <th>지시수량</th>
        <th>생산수량</th>
<!--         <th>수정</th> -->
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${oderList }">
      <tr>
		<c:choose>
		  <c:when test="${vo.wo_status eq '지시' or vo.wo_status eq '시작'}">
		    <td><a href="/pro/orderstatusList?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
		  </c:when>
		  <c:when test="${vo.wo_status eq '마감'}">
		    <td><a href="/pro/closedOrders?wo_code=${vo.wo_code}">${vo.wo_code}</a></td>
		  </c:when>
		  <c:otherwise>
		    <td>${vo.wo_code}</td>
		  </c:otherwise>
		</c:choose>
        <td>${vo.so_code}</td>
        <td>${vo.employee_id}</td>
        <c:choose>
	  <c:when test="${vo.wo_status eq '지시'}">
	    <td style="color: blue;">${vo.wo_status}</td>
	  </c:when>
	  <c:when test="${vo.wo_status eq '마감'}">
	    <td style="color: red;">${vo.wo_status}</td>
	  </c:when>
	  <c:when test="${vo.wo_status eq '시작'}">
	    <td style="color: green;">${vo.wo_status}</td>
	  </c:when>
	  <c:otherwise>
	    <td>${vo.wo_status}</td>
	  </c:otherwise>
	</c:choose>
        <td>${vo.delivery_date}</td>
        <td>${vo.line_code}</td>
        <td>${vo.item_code}</td>
        <td>${vo.item_name}</td>
        <td>${vo.oQTY}</td>
        <td>${vo.pQTY}</td>
		<c:choose>
		  <c:when test="${vo.wo_status eq '지시'}">
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/pro/orderList.jsp
<%-- 		    <td><button class="btn-edit" onclick="orderedit('${vo.wo_code}')"><i class="bx bx-edit"></i></button></td> --%>
		    <td><button class="btn-delete" onclick="ProOrderDelete('${vo.wo_code}')"><i class="bx bxs-trash"></i></button></td>
========
		    <td><button class="btn-edit" onclick="orderedit('${vo.wo_code}')"><i class="bx bx-edit"></i></button></td>
		    <td><button class="btn-delete"><i class="bx bxs-trash"></i></button></td>
>>>>>>>> origin/0622kbs:src/main/webapp/WEB-INF/views/pro/oderList.jsp
		  </c:when>
		  <c:otherwise>
		    <td></td>
		    <td></td>
		  </c:otherwise>
		</c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  
  <!-- 페이징처리 -->
<%--   		${Search} --%>
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
	    <c:if test="${pageVO.startPage > pageVO.pageBlock}"> 
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${pageVO.startPage - pageVO.pageBlock}"><sapn> < </sapn></a></li>
	    </c:if>
	    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${i}"><span>${i}</span></a></li>
	    </c:forEach>
	    <c:if test="${pageVO.endPage < pageVO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pro/orderList?line_code=${Search.line_code}&wo_date=${Search.wo_date}&pid=${Search.pid}&item_code=${Search.item_code}&wo_status=${Search.wo_status}&pageNum=${pageVO.startPage + pageVO.pageBlock}"><span> > </span></a></li>
	    </c:if>
	  </ul>
	</div>
  		
</div>
</div>



</body>
</html>