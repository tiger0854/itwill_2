<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8"> 
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<title>재고</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.7/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body id="body-pd">
<jsp:include page="../common/header.jsp"/>
  
<div class="container" style="margin-top: 120px;max-width: 100% !important;">
<h4 style="font-weight: bold;" ><i class="bx bx-book"></i>출고 상세</h4>
<hr style="border: 2px solid black;">

<div class="tab-content" style="margin-top: 20px; " >
  
  <table border="1" class="table table-bordered" style="width: 100%;">
   <c:forEach var="vo" items="${outList }">
  <tr>
  <th rowspan="2" style="border-top:3px; border-bottom:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">수주번호</th>
  <td rowspan="2" style="border-bottom:3px; border-top:3px solid #E9E9E9; ">${vo.re_code }</td>
  <th style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">생산진행현황</th>
  <c:choose>
     <c:when test="${vo.out_qty <= vo.proOrderVO.pQTY }">
        <td style="border-top:3px solid #E9E9E9; "> <font color="blue">생산완료</font> </td>
     </c:when>
     <c:otherwise>
       <td style="border-top:3px solid #E9E9E9; "> 진행중 </td>
     </c:otherwise>
  </c:choose>
  
  <th style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">출고진행현황</th>
   <c:choose>
     <c:when test="${vo.out_state==1}">
  <td style="border-top:3px solid #E9E9E9; ">진행중</td>
   </c:when>
     <c:otherwise>
         <td style="border-top:3px solid #E9E9E9; "><font color="red">출고 완료</font></td>
     </c:otherwise>
  </c:choose>
  </tr>
  <tr>
  
  <th style="border-bottom:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">납기일자</th>
  <td style="border-bottom:3px solid #E9E9E9; ">${vo.due_date }</td>
  <th style="border-bottom:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">출고 담당자</th>
  <td style="border-bottom:3px solid #E9E9E9; ">${vo.out_empNm }</td>
  </tr>
  </c:forEach>
  </table>
  
  
  <table border="1" class="table table-bordered" style="width: 100%;">
 <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
  <tr>
  <th>출고번호</th>
  <th>상품명</th> 
  <th>거래처명</th>
  <th>출고예정수량</th>
  <th>생산수량</th>
  <th>비고</th>
  </tr>
  </thead>
  <tbody style="border-bottom:3px solid #E9E9E9; ">
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
</tbody>
  </table>
  </div>
  </div>
</body>
</html>