<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--  <%@ include file="../../common/header.jsp"%> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/product.css">
<script>
function itemwrite() {
  // 새 창을 열기 위한 URL
  var popupUrl = 'itemdetailUpload';
  // 새 창 열기
  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
}

function itemedit() {
	  // 새 창을 열기 위한 URL
	  var popupUrl = 'itemEdit.jsp';
	  // 새 창 열기
	  window.open(popupUrl, '_blank', 'width=500,height=600,resizable=yes');
	}


//토글 드랍기능
function toggleDropdown() {
	  const collapseSale = document.getElementById('collapseSale');
	  collapseSale.classList.toggle('show');
	}

document.addEventListener("DOMContentLoaded", function(event) {
	

	   
	const showNavbar = (toggleId, navId, bodyId, headerId) =>{
	const toggle = document.getElementById(toggleId),
	nav = document.getElementById(navId),
	bodypd = document.getElementById(bodyId),
	headerpd = document.getElementById(headerId)

	// Validate that all variables exist
	if(toggle && nav && bodypd && headerpd){
	toggle.addEventListener('click', ()=>{
	// show navbar
	nav.classList.toggle('show')
	// change icon
	toggle.classList.toggle('bx-x')
	// add padding to body
	bodypd.classList.toggle('body-pd')
	// add padding to header
	headerpd.classList.toggle('body-pd')
	})
	}
	}

	showNavbar('header-toggle','nav-bar','body-pd','header')

	/*===== LINK ACTIVE =====*/
	const linkColor = document.querySelectorAll('.nav_link')

	function colorLink(){
	if(linkColor){
	linkColor.forEach(l=> l.classList.remove('active'))
	this.classList.add('active')
	}
	}
	linkColor.forEach(l=> l.addEventListener('click', colorLink))

	 // Your code to run since DOM is loaded and ready
	});
</script>



</head>

<body>
<body id="body-pd" style="font-family: 'TheJamsil5';">
    <header class="header" id="header" style="background-color: white; box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.2);" >
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        <div> 
        <a style="margin: 10px;">로그인</a>
        <a>회원가입</a>
        </div>
    </header>
   
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name" style="font-size: 25px;">또시락🍱<span></a>
                <div class="nav_list"> <a href="#" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">HOME</span> </a>
                  <div class="nav_list">
                   <a href="#" class="nav_link" onclick="toggleDropdown()"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">인사관리  ></span> </a> 
                <div class="nav_link collapse" id="collapseSale">
                
		  			<a href="#" class="nav_link"> -사원등록</a><br>
		  		    <a href="#" class="nav_link">-사원관리</a>
				</div>
					</div>
                 <a href="#" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">구매관리</span> </a> </div>
                 <a href="#" class="nav_link"> <i class='bx bx-bookmark nav_icon'></i> <span class="nav_name">창고관리</span> </a> 
                 <a href="#" class="nav_link"> <i class='bx bx-folder nav_icon'></i> <span class="nav_name">입/출고관리</span> </a> 
		  			<a href="productorderList.jsp" class="nav_link"> 생산관리 - 작업지시</a>
		  		   	<a href="productEtc.jsp" class="nav_link"> 생산관리 - 실적등록</a>
		  		    <a href="productEtcstatus.jsp" class="nav_link"> 생산관리 - 실적현황</a>
				</div>
            <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>
     </div>


<div class="height-100">
        <div class="container mt-3">
        
<h4 style="margin-top: 150px;"><i class="bx bx-book"></i> 품목정보 관리</h4>
<div style="margin-top: 10px;">
<hr width="100%" style="border: 2px solid black">
<!-- 상품목록 검색, 등록버튼 -->
<div class=btn-container>
<button class=btn-search><i class='bx bx-search-alt-2'></i> 조회</button>
<button class=btn-add onclick="location.href='itemdetailUpload';"><i class='bx bx-plus-medical'></i> 추가</button>
</div>

<!-- 품목 검색박스 -->
<table class="product-box3"style="margin-top: 20px; width: 100%; " border="1">
<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
     <tr>
        <th>품명</th>
        <td><input type="text" value="" placeholder="품명"><td>
        <th>품번</th>
        <td>
        <input type="text" value="" placeholder="품번">
        </td>
        <th>자재유형</th>
        <td>
        <select>
        <option>전체</option>
        <option>완제품</option>
        <option>부자재</option>
        </select>
        </td>
        <th>사용여부</th>
        <td>
        <select>
        <option>전체</option>
        <option>Y</option>
        <option>N</option>
        </select>
		</td>
      </tr>
  </table>
</div>

<!-- 품목 리스트 -->
<!--  품번, 품명, 자재유형(완제품,부자재), 재고단위, 사용여부,단가 등록	 -->
 <h4 style="margin-top: 50px;"><i class='bx bx-list-ol icon'></i> 품목 목록</h4>     
  <table class="product-table"style="margin-top: 20px;width: 100%;">
    <thead>
      <tr>
        <th>품번</th>
        <th>품명</th>
        <th>단위</th>
        <th>상품가격</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${resultlist}">
      <tr>
        <td>${vo.item_code}</td>
        <td>${vo.item_name}</td>
        <td>${vo.unit }</td>
        <td>${vo.item_price }</td>
        <td><button class=btn-edit onclick="location.href='itemdetailUpdate?item_code=${vo.item_code}';"><i class='bx bx-edit'></i></button></td>
        <td><button class=btn-delete><i class='bx bxs-trash'></i></button></td>
      </tr>
     </c:forEach>
        
      
    </tbody>
  </table>
  
  
  <!-- 페이징처리 -->
  
<!--   		  	<div class="container" style="margin-top: 30px; margin-bottom: 30px"> -->
<!-- 			  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;"> -->
<%-- 		  <c:if test="${startPage > pageBlock }">  --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage-pageBlock} "><sapn> < </sapn></a></li> --%>
<%-- 			</c:if> --%>
<%-- 		    <c:forEach var="i" begin="1" end="5" step="1"> --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${i }"><span>${i }</span></a></li> --%>
<%-- 			</c:forEach> --%>
<%-- 		    <c:if test="${endPage<pageCount }"> --%>
<%-- 			<li class="page-item"><a class="page-link" href="./AdminQNAList.qn?pageNum=${startPage+pageBlock} "><span> > </span></a></li> --%>
<%-- 			</c:if> --%>
<!-- 		  </ul> -->
<!--   		</div> -->
  		
  		
  	<!-- 임시 페이징처리 출력용 -->
  		<div class="container" style="margin-top: 40px; margin-bottom: 30px">
  		<ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
  			<li class="page-item"><a class="page-link" href="#"><sapn> < </sapn></a></li>
  			<c:forEach var="i" begin="1" end="5" step="1">
			<li class="page-item"><a class="page-link" href="#"><span>${i }</span></a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="#"><span> > </span></a></li>
		 </ul>
  		</div>
  		
  		<br>
</div>
</div>



</body>
</html>