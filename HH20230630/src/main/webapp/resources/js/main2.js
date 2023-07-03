/**
 * main2.js
 */

 console.log("main2.js");
 
 //버튼: 클릭이벤트등록 views->main/main.jsp
 
 document.getElementById('saveBtn').addEventListener('click',function(e){
	 let name= document.getElementById('name').value;
	 let age= document.getElementById('age').value;
	  let score= document.getElementById('score').value;
	  
	  let obj={
		  
		  name: name,
		  age: age,
		  score: score
	  }
	  
	 let tr = document.createElement('tr');
	 
	  for(let prop in obj){//밑에 코드 줄일수있음 
		  
		let td =document.createElement('td');
	 	td.innerText=obj[prop];
	 	tr.appendChild(td);//<tr><td>홍길동</td></tr> 까지 완성 
	  }
	 
	 //<tr><td>홍길동</td><td>20</td><td>85</td></tr>
/*	 let td =document.createElement('td');
	 td.innerText=name;
	 tr.appendChild(td);//<tr><td>홍길동</td></tr> 까지 완성 
	 
	 td =document.createElement('td');
	 td.innerText=age;//<tr><td>홍길동</td><td>20</td></tr>까지 완성
	 tr.appendChild(td);
	 
	 td =document.createElement('td');
	 td.innerText=score;
	 tr.appendChild(td);*/
	 
	 //삭제버튼 <tr><td><button>삭제</button></td></tr>
	 let td =document.createElement('td');
	 let btn = document.createElement('button');
	 btn.innerText = '삭제';//버튼안에 삭제
	 
	 //버튼삭제이벤트
	btn.addEventListener('click',function(e){
		console.log(e.target.parentElement.parentElement);//삭제버튼 누른 해당 전체
		e.target.parentElement.parentElement.remove();
		
	});
	
	 
	 td.appendChild(btn);
	 tr.appendChild(td);
	 
	 console.log(tr);
	 document.getElementById('target').appendChild(tr);
	 
	 //initialize. 초기화
	 document.getElementById('name').value="";
	 document.getElementById('age').value="";
	 document.getElementById('score').value="";
	 document.getElementById('name').value="";
 });