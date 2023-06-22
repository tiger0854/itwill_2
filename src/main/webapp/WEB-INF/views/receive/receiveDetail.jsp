<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<title>수주 상세</title>
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

<h1>receiveDetail.jsp</h1>
  <h1>수주상세</h1>
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>수주번호</th>
  <th>거래처명(수주업체명)</th>
  <th>상품명</th>
  <th>수주일자</th>
  <th>납품예정일</th>
  <th>담당자</th>
  <th>수주수량</th>
  </tr>
  
  <tr>
  <td>I001-20230505</td>
  <td>마켓퀄리</td>
  <td>참치마요 도시락</td>
  <td>2023-04-28</td>
  <td>2023-05-09</td>
  <td>챠효진</td>
  <td>33</td>
  </tr>
  
  </table>
  
  <button>수정</button>
  <button>삭제</button>
  <button>목록</button>


</body>
</html>