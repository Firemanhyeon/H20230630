/**
 * main4.js
 */
let jsonData = `[{"id":1,"first_name":"Chilton","last_name":"Banasiak","email":"cbanasiak0@github.io","gender":"Male","salary":4792},
{"id":2,"first_name":"Ferdinande","last_name":"Handforth","email":"fhandforth1@altervista.org","gender":"Female","salary":4068},
{"id":3,"first_name":"Guinna","last_name":"Pashler","email":"gpashler2@vistaprint.com","gender":"Genderfluid","salary":2369},
{"id":4,"first_name":"Lise","last_name":"McClymond","email":"lmcclymond3@toplist.cz","gender":"Female","salary":2335},
{"id":5,"first_name":"Rosita","last_name":"Wethey","email":"rwethey4@cloudflare.com","gender":"Female","salary":1766},
{"id":6,"first_name":"Burtie","last_name":"Beentjes","email":"bbeentjes5@mysql.com","gender":"Male","salary":1361},
{"id":7,"first_name":"Yoshi","last_name":"Desouza","email":"ydesouza6@senate.gov","gender":"Female","salary":4389},
{"id":8,"first_name":"Harald","last_name":"Bullent","email":"hbullent7@oakley.com","gender":"Male","salary":2708},
{"id":9,"first_name":"Nonna","last_name":"Ellingsworth","email":"nellingsworth8@hugedomains.com","gender":"Female","salary":1549},
{"id":10,"first_name":"Brynne","last_name":"Rittmeyer","email":"brittmeyer9@g.co","gender":"Female","salary":3917},
{"id":11,"first_name":"Hersch","last_name":"Randerson","email":"hrandersona@state.tx.us","gender":"Male","salary":2856},
{"id":12,"first_name":"Chrissie","last_name":"D'Agostino","email":"cdagostinob@cdc.gov","gender":"Female","salary":2257},
{"id":13,"first_name":"Ikey","last_name":"Merlin","email":"imerlinc@eepurl.com","gender":"Male","salary":3350},
{"id":14,"first_name":"Anastasie","last_name":"Marl","email":"amarld@ebay.co.uk","gender":"Genderfluid","salary":3888},
{"id":15,"first_name":"Tobin","last_name":"Glover","email":"tglovere@sogou.com","gender":"Male","salary":4049}]`;

let data = JSON.parse(jsonData);//제이슨타입으로 바꾼다
/*console.log(data);*/

let xhtp = new XMLHttpRequest();//데이터를 가져오는데 비동기방식
xhtp.open('get', 'chartData.do');//데이터 가져오기
xhtp.send();//실제 실행해야 서버에서 정보를 가져온다
xhtp.onreadystatechange = function() {//on~~은 이벤트와 관련되어있다  
	if (xhtp.readyState == 4 && xhtp.status == 200) {//state 4번 , status 200이면 정상실행한다는 의미.
		console.log(xhtp.responseText);//서버에서 받아온 결과값이 리스폰스텍스트라는메소드로 결과담기
		let data = JSON.parse(xhtp.responseText);
		console.log(data);
	}

}