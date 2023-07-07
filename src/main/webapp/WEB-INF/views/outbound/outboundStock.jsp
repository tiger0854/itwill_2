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
   <c:forEach var="vo" items="${outList }">
  <tr>
  <th rowspan="2">수주번호</th>
  <td rowspan="2">${vo.re_code }</td>
  <th>생산진행현황</th>
  <c:choose>
     <c:when test="${vo.out_qty <= vo.proOrderVO.pQTY }">
        <td> <font color="blue">생산완료</font> </td>
     </c:when>
     <c:otherwise>
       <td> 진행중 </td>
     </c:otherwise>
  </c:choose>
  
  <th>출고진행현황</th>
   <c:choose>
     <c:when test="${vo.out_state==1}">
  <td>진행중</td>
   </c:when>
     <c:otherwise>
         <td><font color="red">출고 완료</font></td>
     </c:otherwise>
  </c:choose>
  </tr>
  <tr>
  
  <th>납기일자</th>
  <td>${vo.due_date }</td>
  <th>출고 담당자</th>
  <td>${vo.out_empNm }</td>
  </tr>
  </c:forEach>
  </table>
  
  
  <table border="1" class="table table-bordered">
  <tr>
  <th>출고번호</th>
  <th>상품명</th> 
  <th>거래처명</th>
  <th>출고예정수량</th>
  <th>생산수량</th>
  <th>비고</th>
  </tr>
  <c:forEach var="vo" items="${outList }">
  <tr>
    <td>${vo.out_num }</td>
    <td>${vo.item_name }</td>
    <td>${vo.out_customerNm }</td>
    <td>${vo.out_qty }</td>
<%--     <td>${vo.out_qty -10}</td><!-- 창고에서 수량 끌고오기 --> --%>
    <td>${vo.proOrderVO.pQTY }</td>
    <td>${vo.out_notes }</td>
  </tr>
   </c:forEach>

  </table>
</body>
</html>