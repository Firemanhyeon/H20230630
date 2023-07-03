<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3>memberinfo page</h3>
<table class="table">
	<tr>
		<th>아이디</th><td class="uid"><c:out value="${members.userId }"/></td>
	</tr>
	<tr>
		<th>이름</th><td><input type="text" class ="passwd" value="${members.userName }"></td>
	</tr>
	<tr>
		<th>생년월일</th><td><fmt:formatDate pattern="yyyy-mm-dd" value="${members.userBirth }"/></td>
	</tr>
	<tr>
		<th>휴대폰</th><td><input type="text" class="phone" value="${members.userPhone }"/></td>
	</tr>
	<tr>
		<th>주소</th><td><input type="text" class="addr" value="${members.userAddr }"/></td>
	</tr>
	<tr>
		<th>이미지</th><td><img class="image" src="images/${members.userImg }"width="200px"/>
		<input type= "file" id="image" style="display:none;">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button id="saveBtn">저장</button>
		</td>
		
	</tr>
</table>

<script>

	document.getElementById('image').addEventListener('change',function(e){
		console.log(e.target.files[0]);
		//multipart/form-data 폼요소에 있는 정보들을 가져온다
		let formdata = new FormData();
		formdata.append( 'id',document.querySelector('td.uid').innerText ) ;
		formdata.append('image',e.target.files[0]);

		let xhtp = new XMLHttpRequest();
		xhtp.open('post','imageUpload.do');
		xhtp.send(formdata);
		xhtp.onload=function(){
			let result = JSON.parse(xhtp.responseText);
			if(result.retCode =='Success'){
				document.querySelector('img.image').src='images/'+result.path;
				alert("수정 성공")
			}else if(result.retCode =='Fail'){
				alert("수정 실패")
			}else{
				alert("알수없는 코드")
			}
		}
	});
	// img 태그에 클릭이벤트 발생
	document.querySelector('img.image').addEventListener('click',function(e){
		document.getElementById('image').click();
	})

	document.querySelector('#saveBtn').addEventListener('click',function(e){
		let id= document.querySelector('td.uid').innerText;//아이디속성이면 # 클래스속성이면 .
		let pw = document.querySelector('input.passwd').value;
		let ph= document.querySelector('input.phone').value;
		let ad= document.querySelector('input.addr').value;
		
		let xhtp = new XMLHttpRequest();
		
		/* xhtp.open('get','memberModify.do?uid='+id+'&upw='+pw+'&uph='+ph+'&uad='+ad);
		xhtp.send(); */
		
		xhtp.open('post','memberModify.do');
		xhtp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');/* 키와 밸류 없이   */
		xhtp.send('uid='+id+'&upw='+pw+'&uph='+ph+'&uad='+ad);
		
		
		xhtp.onload=function(){
			console.log(xhtp.responseText);
			
			let result =JSON.parse(xhtp.responseText);
			if(result.retCode =='Success'){
				alert("저장 성공");
				location.href="memberList.do";
			}else if(result.retCode =='Fail'){
				alert("저장 실패")
			}else{
				alert("알수없는 코드")
			}
		}
		
	});
</script>
