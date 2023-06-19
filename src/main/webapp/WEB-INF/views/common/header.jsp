<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
function toggleDropdown() {
	  const collapseSale = document.getElementById('collapseSale');
	  collapseSale.classList.toggle('show');
	}
	
function toggleDropdown2() {
	  const collapseSale = document.getElementById('collapseSale2');
	  collapseSale.classList.toggle('show');
	}	

function proDropdown() {
	  const collapseSale = document.getElementById('pro');
	  collapseSale.classList.toggle('show');
	}
	
function foundDropdown() {
	  const collapseSale = document.getElementById('foundation');
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
<!-- 판매목록 drop 기능 -->

<body>
	<header class="header" id="header" style="background-color: white; box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.2);" >
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
		<button onclick="window.open('hello.jsp','출근','width=430,height=500,location=no,status=no,scrollbars=no');">출근</button>
		<button onclick="window.open('bye.jsp','퇴근','width=430,height=500,location=no,status=no,scrollbars=no');">퇴근</button>
        <div> 
        <a style="margin: 10px;">로그인</a>
        <a>회원가입</a>
        </div>
    </header>
    
  
					
      
        
	<div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name" style="font-size: 25px;">또시락🍱</span></a>
                <div class="nav_list"> <a href="#" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">HOME</span> </a>
                  <div class="nav_list">
                   <a href="#" class="nav_link" onclick="toggleDropdown()"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">인사관리  ></span> </a> 
                <div class="nav_link collapse" id="collapseSale">
                <!-- 0607 -->
					<a href="/emp/list" class="nav_link"> - 사원관리</a><br>
		  		    <a href="/emp/vacationlist" class="nav_link" > - 휴가관리</a><br>
		  		    <a href="/emp/salary" class="nav_link"> - 급여관리</a><br>
		  		    <a href="#" class="nav_link"> - 이력관리</a><br>
		  		<!-- 0607 -->
		  		<!-- 0615 -->
		  			<a href="/emp/myvacationList" class="nav_link" > - 나의 휴가내역</a><br>
		  			<a href="/emp/vacationregist" class="nav_link" > - 휴가신청</a><br>
		  		<!-- 0615 -->
				</div>
					</div>
                 <a href="#" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">구매관리</span> </a> </div>
                <div class="nav_list">
                  <a href="#" class="nav_link" onclick="foundDropdown()"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">기반관리 ></span> </a> 
                <div class="nav_link collapse" id="foundation">
		  			<a href="/foundation/warehouse/warehouseList" class="nav_link"> - 창고관리</a><br>
		  		    <a href="/foundation/materialdetail/materialdetailList" class="nav_link"> - 자재관리</a><br>
		  		    <a href="/foundation/itemdetail/itemdetailList" class="nav_link"> - 상품관리</a><br>
		  		    <a href="/pro/oderList" class="nav_link"> - 재고관리</a><br>
		  		    <a href="/line/lineList" class="nav_link"> - 라인관리</a><br>
				</div>
				</div>
          
                <div class="nav_list">
                  <a href="#" class="nav_link" onclick="proDropdown()"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">생산관리 ></span> </a> 
                <div class="nav_link collapse" id="pro">
		  			<a href="/pro/oderList" class="nav_link"> - 작업지시</a><br>
		  		    <a href="/pro/oderList" class="nav_link"> - 실적등록</a><br>
				</div>
				</div>

				<div class="nav_list">
					<a href="#" class="nav_link" onclick="toggleDropdown2()"> <i class="bx bxs-cart-alt nav_icon"></i> <span class="nav_name">입/출고관리  ></span> </a> 
					<div class="nav_link collapse" id="collapseSale2">
					<!--입출고-->
						  <a href="/inbound/orderWrite" class="nav_link"> - 발주등록</a><br>
						  <a href="/inbound/orderList" class="nav_link"> - 발주현황</a><br>
						  <a href="/inbound/inboundWrite" class="nav_link"> - 입고등록</a><br>
						  <a href="/inbound/inboundList" class="nav_link"> - 입고현황</a><br>
						  <a href="/outbound/insert" class="nav_link"> - 출고등록</a><br>
						  <a href="/outbound/list" class="nav_link"> - 출고현황</a><br>
					  <!--입출고-->
	
				  </div>
				  </div>
            </div> 
            <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>
    
          <!--   <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a> -->
</body>
</html>