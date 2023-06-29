<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>재고</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
  
  <h1>outboundStock.jsp</h1>
  <h1>출고 재고 관리</h1>
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>작업지시번호</th>
  <td>I001-20230618</td>
  <th>납기일</th>
  <td>2023-06-18</td>
  <th>작업지시일자</th>
  <td>2023-06-18</td>
  <th>작업지시 담당자</th>
  <td>002</td>
  </tr>
  <tr>
  <th>출고진행현황</th>
  <td>진행중</td>
  <th>출고일자</th>
  <td>2023-08-08</td>
  <th>출고 담당자</th>
  <td>003</td>
  </tr>
  </table>
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>출고번호</th>
  <th>상품명</th> 
  <th>거래처명</th>
  <th>총출고예정수량</th>
  <th>필요수량</th>
  <th>창고재고</th>
  </tr>

  <tr>
  <td>OUT2023060723</td>
  <td>1234</td>
  <td>스팸마요도시락[box]</td>
  <td>20</td>
  <td>10</td>
  <td>0</td>
  </tr>
  <tr>
  <td>OUT2023060723</td>
  <td>1111</td>
  <td>참치마요도시락[box]</td>
  <td>50</td>
  <td>0</td>
  <td>10</td>  
  </tr>
  </table>
</body>
</html>