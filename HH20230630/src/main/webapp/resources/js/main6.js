/*document.querySelectorAll('#page-content-wrapper table')
          .tables.forEach(function (tbl) {
				tbl.innerTextHTML="";
});
document.querySelectorAll('#page-content-wrapper h3')
          .tables.forEach(function (elem) {
				elem.remove();
});
*/

const str = `Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores eligendi iusto culpa dolore? Doloremque, molestias! Atque, sunt corrupti. Amet velit iste hic, unde architecto veniam quam voluptate expedita autem aperiam.`;

const strAry= str.split(' ');//공간잘라서 배열로 나눠줌

let secs=10;
let job=setInterval(function(){
	document.getElementById('time').innerText=secs--;
	if(secs<0){
		clearInterval(job);
	}
},1000);


	let outer = document.querySelector('div.outer');
	strAry.forEach(function(word){
	let span = document.createElement('span');
	span.innerText = word;
	outer.appendChild(span);
})

document.querySelector('#userInput').addEventListener('change',function(){
	let userVal = this.value;
	document.querySelectorAll('.outer span').forEach(function(item){
		if(item.innerText == userVal){
			item.remove();
			
		}
	})
	this.value = "";
	
})
	