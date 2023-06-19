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

// function sendInfo(row) {
//     var data = [];
//     var cells = row.getElementsByTagName("td");
//     for (var i = 0; i < cells.length; i++) {
//       data.push(cells[i].innerText);
//     }
//     // 정보를 부모 창으로 전달합니다.
//     window.opener.document.getElementById("item_code").value = data[0];
//     window.opener.document.getElementById("item_name").value = data[1];
//     window.opener.document.getElementById("standard").value = data[2];
//     window.opener.document.getElementById("price").value = data[3];
//     window.close();
//   } 
  
  
 function sendInfo(row) {
  var data = [];
  var cells = row.getElementsByTagName("td");
  for (var i = 0; i < cells.length; i++) {
    data.push(cells[i].innerText);
  }
  
  // 부모 창의 행 추가 버튼을 클릭하여 새로운 행을 생성합니다.
  window.opener.openChildWindow4();

  // 새로운 행의 요소들을 선택하고 값들을 설정합니다.
  var newRow = window.opener.$("tr[name=trProduct]:last");
  newRow.find("input[name=item_code]").val(data[0]);
  newRow.find("input[name=item_name]").val(data[1]);
  newRow.find("input[name=standard]").val(data[2]);
  newRow.find("input[name=price]").val(data[3]);

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
  
  <form action="outboundInsert.jsp">
  <table border="1" class="table table-bordered">
  <tr>
  <td>품목코드</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>품목명</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>규격</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>단가</td> <!-- 클릭하면 팝업창 꺼지면서 폼에 입력 -->
  <td>전체재고</td>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0001</td>
  <td>스팸마요 도시락</td>
  <td>Box</td>
  <td>2000</td>
  <td>100</td>
  </tr>
  
   <tr onclick="sendInfo(this);">
  <td>0002</td>
  <td>참치마요 도시락</td>
  <td>Box</td>
  <td>2500</td>
  <td>33</td>
  </tr>
  
  <tr onclick="sendInfo(this);">
  <td>0003</td>
  <td>제육덮밥 도시락</td>
  <td>Box</td>
  <td>3000</td>
  <td>22</td>
  </tr>
  
  </table>
  
  
  </form>

</body>
</html>