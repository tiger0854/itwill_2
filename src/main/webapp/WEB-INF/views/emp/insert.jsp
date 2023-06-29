<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>사원 정보</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkFile(el){ //파일 용량 & 확장자 체크
	//파일 정보 얻기
	var file = el.files;
    var fileSize = file[0].size;
	var fileName = file[0].name;
	var fileLen = fileName.length;
	var fileCom = fileName.lastIndexOf('.');
	var fileExt = fileName.substring(fileCom, fileLen).toLowerCase();
	var arrayExt = new Array(".gif", ".jpg", ".png");
	var result;
	
	if(fileSize > 1024 * 1024 * 10 ){ //용량을 초과했을 때
		alert('10MB 이하 파일만 등록할 수 있습니다.\n\n 현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
		el.outerHTML = el.outerHTML;
		}else { //용량을 초과하지 않았지만 허용하는 확장자가 아닐 경우
			for(var i = 0; i < arrayExt.length; i++){
				if(Object.is(fileExt, arrayExt[i])){
					console.log(fileExt, arrayExt[i], i);
					break;
				}else{
					if(i == (arrayExt.length - 1 )){
						alert('gif, jpg, png 파일만 올릴 수 있습니다 \n\n 현재파일 확장자 : ' + fileExt);
						console.log(fileExt, arrayExt[i], i);
						el.outerHTML = el.outerHTML;
						return -1;
					}// if end
				}// else end
			}// for end

		}// else end
	
	}// if end
	
	$(function(){
		$("#file1").on("change", function(event) {
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview1").attr("src", e.target.result);
	   		}
	    reader.readAsDataURL(file);
		});
	});	

</script>
</head>
<body id="body-pd" style="font-family: 'TheJamsil5';">
<jsp:include page="../common/header.jsp"/>
	<div>
	<br>
	    <h1>사원 추가</h1>
	    <!-- 권한제어 -->
		<form action="" method="post" enctype="multipart/form-data">
<!-- 		<form action="/emp/insert" method="post"> -->
	    <input type="submit" value="등록" >
	    <input type="button" value="뒤로가기" onclick="location.href='/emp/list'">
	    <input type="file" name="employee_photo_link" id= "file1" onchange="checkFile(this)">
        
	    
		    <table class="table table-striped" style="margin-top: 10px;" >
		
		        <tr>
		            <td rowspan="4"><img src="../../resources/default_profile_photo.png" alt="default_image" width="150" height="150" id="preview1"  ></td>
		            
		            <td>성명</td>
		            <td><input type="text" size="50" name="employee_name"></td>
		            <td>주민등록번호</td>
		            <td><input type="text" size="50" name="jumin"></td>
		            <td>성별</td>
		            <td>
		                <select name="gender">
		                    <option value="남">남</option>
		                    <option value="여">여</option>
		                </select></td>
		        </tr>
		        <tr>
		            <td>부서</td>
		            <td><select name="department_name">
			            <optgroup label="생산">
			            	<option value="생산과">생산과</option>
			            	<option value="생산 1팀">생산 1팀</option>
			            	<option value="생산 2팀">생산 2팀</option>
			            </optgroup>
			            <optgroup label="유통">
			            	<option value="유통과">유통과</option>
			            	<option value="입고팀">입고팀</option>
			            	<option value="출고팀">출고팀</option>
			            </optgroup>
			            <optgroup label="관리">
			            	<option value="인사과">인사과</option>
			            </optgroup>
		            </select></td>
		            <td>직급</td>
		        	<td><select name="position">
			            	<option value="이사">이사</option>
			            	<option value="과장">과장</option>
			            	<option value="팀장">팀장</option>
			            	<option value="주임">주임</option>
			            	<option value="사원">사원</option>
			            	<option value="일용">일용</option>
			            	<option value="외주">외주</option>
		            </select></td>
		            <td>입사일</td>
		            <td><input type="date" name="emp_date"></td>
		        </tr>
		        <tr>
		            <td>휴대폰 번호</td>
		            <td><input type="text" size="50" name="phone_num"></td>
		            <td>내선번호</td>
		            <td><input type="text" size="50" placeholder="내선" name="line_num"></td>
		            <td>결혼여부</td>
		            <td>
		                <select name="marriage">
		                    <option value="미혼">미혼</option>
		                    <option value="기혼">기혼</option>
		                </select></td>
		        </tr>
		        <tr>
		            <td>이메일</td>
		            <td><input type="text" size="50" name="email"></td>
		            <td>주소</td>
		            <td><input type="text" size="30" placeholder="주소" id="address" name="address" readonly="readonly">
		            <input type="text" size="18" placeholder="상세주소" id="extraAddress" name="extraaddress"></td>
		            <td><input type="button" value="우편번호 찾기" onclick="execDaumPostcode()"></td>
		            <td><input type="text" size="10" placeholder="우편번호" id="postcode" name="post_num" readonly="readonly"></td>
		
		        </tr>
		    </table>
		            <input type="hidden" name="employee_status" value="재직중">
		   </form>
	 </div>
    
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;

                document.getElementById("extraAddress").focus();
            }
        }).open();
    }
</script>
</html>