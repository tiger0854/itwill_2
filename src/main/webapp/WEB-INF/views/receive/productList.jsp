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
	    window.opener.document.getElementById("item_code").value = data[0];
	    window.opener.document.getElementById("item_name").value = data[1];
	    window.close();
	  }  

  </script>

</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<h1>productSearch.jsp</h1>
	
	 품목 검색
  <input type="text" placeholder="제품">
  <button>Search</button>
  
  <form action="receiveInsert.jsp">
  <table border="1" class="table table-bordered">
  <tr>
  <td>품목코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>품목명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0001</td>
  <td>스팸마요 도시락</td>
  </tr>
  
   <tr onclick="sendInfo(this);">
  <td>0002</td>
  <td>참치마요 도시락</td>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0003</td>
  <td>제육덮밥 도시락</td>
  </tr>
  
  </table>
  
  
  </form>

</body>
</html>