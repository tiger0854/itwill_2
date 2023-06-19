<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

function sendInfo(row) {
    var data = [];
    var cells = row.getElementsByTagName("td");
    for (var i = 0; i < cells.length; i++) {
      data.push(cells[i].innerText);
    }
    // 정보를 부모 창으로 전달합니다.
    window.opener.document.getElementById("factory_code").value = data[1];
    window.close();
  }  

  </script>

</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<h1>warehouse.jsp</h1>
	 창고 검색
  <input type="text" placeholder="창고">
  <button>Search</button>
  
  <form action="outboundInsert.jsp">
  <table border="1" class="table table-bordered">
  <tr>
  <td>창고코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>창고명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0001</td>
  <td>A창고</td>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0002</td>
  <td>B창고</td>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0003</td>
  <td>C창고</td>
  </tr>
  
  </table>
  
  
  </form>

</body>
</html>