<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css.css">
<script type="text/javascript">
var openWin;

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/inbound/productList",
            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
}
</script>

<!-- 판매목록 drop 기능 -->
<style type="text/css">
td{
height: 50px; vertical-align: middle;
}
  
</style>

</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
	
	<!-- header && sidebar include -->
    <jsp:include page="../common/header.jsp"></jsp:include>
	<!-- header && sidebar include -->
   

	
	
    
<!-- Nav tabs -->

<div class="container" style="margin-top: 100px;">
<h3 style="font-style: italic;">발주현황</h3>
<ul class="nav nav-tabs" id="myTab" role="tablist" style="flex-direction: row;justify-content: flex-start;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="notend-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">발주대기</button>
  </li>
   <li class="nav-item" role="presentation">
    <button class="nav-link" id="end-tab" data-bs-toggle="tab" data-bs-target="#end" type="button" role="tab" aria-controls="profile" aria-selected="false">발주완료</button>
  </li>
</ul>
<!-- Tab panes -->
<div class="tab-content" style="margin-top: 30px; " >

<!-- 전체 -->
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary" onclick="openChild();">검색</button>
	</div>
 <table class="table table-striped" style="width: 1200px;">
    <thead style="border-bottom: 1px solid">
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>거래처</th>
        <th>진행상황</th>
        <th>수정/취소</th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${orderList}">
    
      <tr>
        <td>${vo.order_number }</td>
        <td>${vo.material_code }</td>
        <td>${vo.material_name }</td>
        <td>${vo.order_piece }개</td>
        <td>${vo.order_date }</td>
        <td>${vo.pay_date }</td>
        <td><fmt:formatNumber>${vo.material_price }</fmt:formatNumber>원</td>
        <td><fmt:formatNumber>${vo.material_price*vo.order_piece }</fmt:formatNumber>원</td>
        <td>${vo.order_resp }</td>
        <td>${vo.order_trade }</td>
        <c:choose>
       		<c:when test="${vo.order_state == 0 }">
       		<td style="color: red;">발주대기</td>
       		</c:when>
       		<c:otherwise>
       		<td style="color: blue;">발주완료</td>
       		</c:otherwise>
        </c:choose>
         <td>
         <c:choose>
         <c:when test="${vo.order_state == 0 }">
      <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" onclick="openModal()">수정</button>
        <button type="button" class="btn btn-secondary btn-sm">취소</button>
        </c:when>
        <c:otherwise>
        --
        </c:otherwise>
        </c:choose>
        </td>
      </tr>
  
      </c:forEach>
     
  </table>
</div>
<!-- 전체 -->

<!-- 발주대기 -->
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
   <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
  <table class="table table-bordered" style="box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.2);width: 1100px;">
    <thead style="background-color: #F3F2F2;">
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>진행상황</th>
        <th>수정/취소</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a>13123414</a></td>
        <td>1</td>
        <td>이천쌀</td>
        <td>14개</td>
        <td>2023/06/06</td>
        <td>2023/06/05</td>
        <td>1,500원</td>
        <td>2,500원</td>
        <td>김동길</td>
        <td style="color: red;">발주대기</td>
        <td><button type="button" class="btn btn-primary btn-sm">수정</button>
        <button type="button" class="btn btn-secondary btn-sm">취소</button>
        </td>
      </tr>
    </tbody>
  </table>
  </div>
  <!-- 발주대기 -->
  
  <!-- 발주완료 -->
    <div class="tab-pane" id="end" role="tabpanel" aria-labelledby="profile-tab" style="max-width: 100%;">
     <div class="input-group mb-3"style="width: 500px;justify-content: flex-start;">
   	  <select class="form-select" aria-label="Default select example" style="max-width: 120px;">
  <option value="1">상품코드</option>
  <option value="2">상품명</option>
  <option value="3">발주번호</option>
	</select>
	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
	 <button type="button" class="btn btn-primary">검색</button>
	</div>
	 <table class="table table-bordered" style="box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.2);width: 1100px;">
    <thead style="background-color: #F3F2F2;">
      <tr>
        <th>발주번호</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>발주수량</th>
        <th>발주일자</th>
        <th>납기일자</th>
        <th>물품단가</th>
        <th>총액</th>
        <th>담당자</th>
        <th>진행상황</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      <td>14123414</td>
        <td>2</td>
        <td>잡곡쌀</td>
        <td>16개</td>
        <td>2023/06/07</td>
        <td>2023/06/05</td>
        <td>2,500원</td>
        <td>3,500원</td>
        <td>김김이</td>
        <td style="color: blue;">발주완료</td>
      </tr>

    </tbody>
  </table>
  
</div>
  <!-- 발주완료 -->
    </div>
  <button type="button" class="btn btn-outline-primary"style="margin-bottom: 30px;margin-right:50px; float: right;" onclick="location.href='/inbound/orderWrite'">발주등록</button>
 
    </div>
  </div>
    
  
    
    
</body>
</html>