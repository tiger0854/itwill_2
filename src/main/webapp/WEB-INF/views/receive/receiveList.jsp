<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 리스트</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">
	function receiveDelete() {
		var valArr = new Array();
		var list = $("input[name='rowCheck']");
		for(var i=0; i<list.length;i++){
			if(list[i].checked){
			valArr.push(list[i].value);
		  }	
		}
		if(valArr.length == 0){
	    	Swal.fire("선택된 목록이 없습니다.")
		}else{
	      	Swal.fire({
	            title: "수주를 삭제하겠습니까?",
	            text: "선택된 수주 목록 수 :"+valArr.length,
				icon: "warning",
	           	   showCancelButton: true, 
	           	   confirmButtonColor: '#3085d6', 
	           	   cancelButtonColor: '#d33',
	           	   confirmButtonText: '예', 
	           	   cancelButtonText: '아니오', 
	            }).then(result => {
	                if (result.isConfirmed) { 
	          		  $.ajax({
	    				  url : "/receive/receiveRemove",
	    				  type : 'POST',
	    				  traditional : true,
	    				  data: {
	    					  valArr : valArr
	    				  },
	    				  success:function(data){
	    						 Swal.fire({
	    				                title: "수주 삭제가 완료되었습니다.",
	    				                text: "",
	    				                icon: "success"
	    				              }).then(function() {
	    				            	  location.reload()
	    				              });
	    				  }//success 
	    			  });// ajax
	                } else if (result.isDismissed) { 
	                }
	            });
			}
		}

</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>

  <h1>receiveList</h1>
  <h1>수주 목록</h1>
   <!-- select box 검색 품목명, 수주업체 -->
  <form action="" method="get">
  	<select name="kind" id="kind">
  		<option value="itemName">품목명</option>
  		<option value="customerName">수주업체명</option>
  	</select>
  <input type="text" placeholder="검색어를 입력하세요" name="search" value="${pageVO.search }"> 
  <button type="submit" class="btn btn-outline-info">Search</button>
  </form>
  <table border="1" class="table table-bordered">
  <tr>
  <td></td>
  <th>수주번호</th>
  <th>상품명</th>
  <th>수주업체</th>
  <th>수주일자</th>
  <th>담당자</th>
  <th>수주수량</th>
  </tr>
  
  <c:forEach var="vo" items="${receiveList }">
  <tr>
  <td class="text_ct"><input type="checkbox" name="rowCheck" value="${vo.re_code }"/></td>
  <td><a href="/receive/receiveDetail?re_code=${vo.re_code}">${vo.re_code }</td> <!-- join 하면 concat item_code 되는지 확인 -->
  <td>${vo.item_code }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.customer_code }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.re_date }</td>
  <td>${vo.employee_id }</td> <!-- join 해서 이름으로 가져오기  -->
  <td>${vo.re_qty }</td> 
  </tr>
  </c:forEach>
  </table>
  
  <!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
	 		<ul class="pagination" id="pagination">
		<c:choose>
			<c:when test="${pageVO.startPage > pageVO.pageBlock}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage - pageVO.pageBlock}"
					class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
				<c:choose>
					<c:when test="${pageVO.kind != null }">
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pageNum=${i}&kind=${pageVO.kind}&search=${pageVO.search}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item ${pageVO.pageNum eq i ? 'active' : ''}"><a href="/receive/receiveList?pageNum=${i}" style="margin: 0.5em;border-radius: 2px;"  class="page-link">${i}</a></li>
					</c:otherwise>
				</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.endPage < pageVO.pageCount}">
				<li class="page-item"><a
					href="/receive/receiveList?pageNum=${pageVO.startPage + pageVO.pageBlock}"
					class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- -------------------------------------------------------------------------------페이징 구현부-------------------------------------------------------------------------------------------------------- -->
  <button type="button" class="btn btn-outline-info" onclick="receiveDelete(this);">수주 삭제</button>
  <button class="btn btn-outline-info" onclick="location.href='./receiveInsert';">등록</button>

</body>
</html>