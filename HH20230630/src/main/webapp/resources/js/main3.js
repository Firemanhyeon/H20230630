/**
 * 
 */
console.log('main3.js')
 let students = [
	 {name:"홍길동",age:22,score:85}
	 ,{name:"김길동",age:26,score:75}
	 ,{name:"박길동",age:21,score:95}
	 
 ]
 
 function makeTr(obj={}){//줄이는방법2 함수활용
	 let tr=document.createElement('tr');
	 for(let prop in obj){
		 let td= document.createElement('td');
		 td.innerText= obj[prop];
		 tr.appendChild(td);
	 }
	 
	 let td= document.createElement('td');
	 let btn = document.createElement('button');
	 btn.innerText = '삭제';
	 
	 
	 //버튼삭제이벤트 방법2 delFnc함수활용
	 btn.addEventListener('click',delFnc);
	 td.appendChild(btn);
	 tr.appendChild(td);

	 return tr;
 }
 
 function delFnc(e){
	 e.target.parentElement.parentElement.remove();
 }
 //배열의 값을 활용해서 목록에 정보생성.
 //배열의 경우 반복문 for~ of 사용 
 for(let student of students){
	 //student:{name:"홍길동",age:22,score:85}
	 //
	 let tr = makeTr(student);
	 document.getElementById('target').append(tr);
 }