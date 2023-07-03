<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>달력보기</h3>

<select  id="year">
	<option value="2021">2021</option>
	<option value="2022">2022</option>
	<option value="2023">2023</option>
	<option value="2024">2024</option>
</select>
<select  id="month">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
</select>
<table border="1" class="table">

</table>

<script>
	function makeHead(){
		//월~일 thead붙이는 기능 
		let days = ['Sun','Mon','Teu','Wed','Tur','Fri','Sat']
		let thead= document.createElement('thead');
		let tr= document.createElement('tr');
		for(let day of days){
			let td= document.createElement('th');
			td.innerText=day;
			
			tr.appendChild(td);
		}
		thead.appendChild(tr);
		return thead;
	}
	function makeBody(firstDay,lastDate){
		let tbody=document.createElement('tbody');
		let tr=document.createElement('tr');


		//빈공간
		for(let day = 0; day<firstDay;day++){
			let td= document.createElement('td');
			td.innerText="";
			tr.appendChild(td);

		}
		//날짜출력
		for(let day=1 ; day<=lastDate;day++){
			let td= document.createElement('td');
			td.innerText=day;
			tr.appendChild(td);
			
			if((day+firstDay) % 7 ==1){
				td.style="red";
			}
			if((day+firstDay) % 7 ==0){
				tbody.appendChild(tr);
				tr=document.createElement('tr');
			}
		}
		tbody.appendChild(tr);
		return tbody;
	}

	function makeCalendar(year,month){
		document.querySelector('table').innerHTML="";
		let today= new Date(year,month-1,1);
		let firstDay=today.getDay();//요일정보

		today= new Date(year,month,0);//말일 정보
		let lastDate=today.getDate();
		console.log(firstDay,lastDate);

		let thead = makeHead();
		let tbody = makeBody(firstDay, lastDate);//첫 날짜 요일 , 일 수 
		document.querySelector('table').appendChild(thead);
		document.querySelector('table').appendChild(tbody);
	}
	makeCalendar(2023,6);
	document.getElementById('month').addEventListener('change',function(e){
		let year=document.getElementById('year').value;
		let month=document.getElementById('month').value;
		makeCalendar(year,month);
	})
	document.getElementById('year').addEventListener('change',function(e){
		let year=document.getElementById('year').value;
		let month=document.getElementById('month').value;
		makeCalendar(year,month);
	})
	
</script>