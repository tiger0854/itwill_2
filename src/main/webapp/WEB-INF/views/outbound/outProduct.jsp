<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<script type="../js/jquery-3.6.4.js"></script>
<script type="text/javascript">

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
            </div> 
            <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>

<h1>outProduct.jsp</h1>

<form action="outboundInsert.jsp">
	<table border="1">
	  <tr>
	    <td>품목코드</td>
	    <td>품목명</td>
	    <td>규격</td>
	    <td>수량</td>
	    <td>납기일자</td>
	    <td>비고</td>
	  </tr>
	  
	   <tr>
	    <td>0001</td>
	    <td>치킨마요 도시락</td>
	    <td>Box</td>
	    <td>20</td>
	    <td>2023-07-13</td>
	    <td></td>
	  </tr>
	  
	  <tr>
	    <td>0002</td>
	    <td>참치마요 도시락</td>
	    <td>Box</td>
	    <td>50</td>
	    <td>2023-07-13</td>
	    <td></td>
	  </tr>
	
	</table>

  
</form>
</body>
</html>