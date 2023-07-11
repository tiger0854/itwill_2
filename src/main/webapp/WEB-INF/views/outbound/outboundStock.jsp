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
<input type="button" class="btn btn-outline-primary" onclick="location.href='/outbound/outboundList'" value="목록" style=" width: 200px;margin-bottom: 20px;float: right;">

<div class="tab-content" style="margin-top: 20px; " >
  
  <table border="1" class="table table-bordered" style="width: 100%;">
   <c:forEach var="vo" items="${outList }">
  <tr>
  <td rowspan="2" style="border-top:3px solid #E9E9E9; border-bottom:3px solid #E9E9E9; background-color: #F9F9F9; text-align: center; vertical-align: middle;">수주번호</td>
  <td rowspan="2" style="border-bottom:3px solid #E9E9E9; border-top:3px solid #E9E9E9; vertical-align: middle;">${vo.re_code }</td>
  <td style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">생산진행현황</td>
  <c:choose>
     <c:when test="${vo.out_qty <= vo.proOrderVO.pQTY }">
        <td style="border-top:3px solid #E9E9E9; "> <font color="blue">생산완료</font> </td>
     </c:when>
     <c:otherwise>
       <td style="border-top:3px solid #E9E9E9; "> 진행중 </td>
     </c:otherwise>
  </c:choose>
  
  <td style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">출고진행현황</td>
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
  
  <td style="border-bottom:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">납기일자</td>
  <td style="border-bottom:3px solid #E9E9E9; ">${vo.due_date }</td>
  <td style="border-bottom:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">출고 담당자</td>
  <td style="border-bottom:3px solid #E9E9E9; ">${vo.out_empNm }</td>
  </tr>
  </c:forEach>
  </table>
  
  
  <table border="1" class="table table-bordered" style="width: 100%;">
 <thead style="border-top:3px solid #E9E9E9; background-color: #F9F9F9;text-align: center;">
  <tr>
  <td>출고번호</td>
  <td>상품명</td> 
  <td>거래처명</td>
  <td>출고예정수량</td>
  <td>생산수량</td>
  <td>비고</td>
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