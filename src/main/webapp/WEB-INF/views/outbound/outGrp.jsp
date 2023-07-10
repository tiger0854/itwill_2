<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<div>
  <canvas id="myChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
  const ctx = document.getElementById('myChart');

//   new Chart(ctx, {
//     type: 'bar',
//     data: {
//       labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
//       datasets: [{
//         label: '# of Votes',
//         data: [12, 19, 3, 5, 2, 3],
//         borderWidth: 1
//       }]
//     },
//     options: {
//       scales: {
//         y: {
//           beginAtZero: true
//         }
//       }
//     }
//   });
  
  
  
  $.ajax({
	  url: "${cpath}/outGrp",
	  type: "get",
	  data: { out_date: "${signIn.out_date}" },
	  dataType: "json",
	  success: function(data) {
	    // 데이터를 가공하여 차트에 필요한 형식으로 변환합니다.
	    const labels = data.map(item => item.item_name);
	    const counts = data.map(item => item.count);

	    // 차트를 생성합니다.
	    new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: labels,
	        datasets: [{
	          label: '# of Votes',
	          data: counts,
	          borderWidth: 1
	        }]
	      },
	      options: {
	        scales: {
	          y: {
	            beginAtZero: true
	          }
	        }
	      }
	    });
	  },
	  error: function() {
	    alert('실패');
	  }
	});
  
//   $(document).ready(function(){
// 	  getGraph();
//   });
  
//   function getGraph(){
// 	  let dateList = [];
// 	  let itemList = [];
	  
// 	  $.ajax({
// 		  url:"${cpath}/outGrp",
// 		  type:"get",
// 		  data:{out_date:"${signIn.out_date}", item_name:"${signIn.item_name}"},
// 		  dataType:"json",
// 		  success:function(data){
// 			  alert(data[0].out_date);
			  
// 			  for(let i = 0 ; i<data.length ; i++){
// 				  dateList.push(date[i].out_date);
// 				  itemList.push(data[i].item_name);
// 			  }
// 			  alert(dateList);
// 			  alert(itemList);
// 			  // 그래프
// 			  new Chart(document.getElementById("line-chart"), {
// 				  type: 'line',
// 				  data: {
// 					  labels: itemList, //x축
// 					  datasets: [{
// 						  data: dateList,  // 값
// 						  label: "출고 현황",
// 						  borderColor: "#3e95cd",
// 						  fill: false
// 					  }
// 					 ]
// 				  },
// 				  options: {
// 					  title: {
// 						  display: true,
// 						  text: '출고 현황 그래프'
// 					  }
// 				  }
// 			  }); // 그래프
// 		  },
// 		  error:function(){
// 			  alert('실패');
// 		  }
		  
// 	  }); //ajax
	  
//   } // getGraph
</script>
</head>
<body>

</body>
</html>