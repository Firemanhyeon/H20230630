<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <h3>검색조건</h3>
    시도:<input type="text" id="search"><button id="searchBtn">조회</button>
    <div id="show">
        <table border="1">
            <thead>
                <tr>
                    <th>센터id</th>
                    <th>센터명</th>
                    <th>연락처</th>
                    <th>시도</th>
                    <th>우편번호</th>
                </tr>
            </thead>
            <tbody id="list">

            </tbody>
        </table>
    </div>


    <script>
    	let totalData = [];
        let url =
            `https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=1D1rf9nqkTbhM42UySCyHKTstRlrUjCz8AMTLRRoKVP2xZdk5PUefe%2BRDOY2Kw6JGoB%2Fo%2F5AVZo6bY4nJaeFtA%3D%3D`
        
        //Ajax호출    		
        let xhtp = new XMLHttpRequest();
        xhtp.open('get', url);
        xhtp.send();

        xhtp.onload = function () {
            let tbody = document.getElementById("list")
            let data = JSON.parse(xhtp.responseText);
            console.log(data.data);
            totalData=data.data;//데이터를찾고 데이터값을 새로운 배열에 저장
            for (let i = 0; i < data.data.length; i++) {
                tbody.appendChild(makeRow(data.data[i]));
            }
            
         //sido정보=>sidoAry
         //totalData=>[{},{},....{}]
	 	let sidoAry=[];
		for(let tr of totalData){
         if(sidoAry.indexOf(tr.sido)==-1){
        	 sidoAry.push(tr.sido);
         		}
			}
         console.log(sidoAry)
        }


        let fields = ['id', 'centerName', 'phoneNumber', 'sido', 'zipCode']

        function makeRow(obj = {}) {
            let tr = document.createElement('tr');
            for (let field of fields) { // 필드의개수만큼반복
                let td = document.createElement('td');
            	if(field=='centerName'){
				let ahref=document.createElement('a');
				ahref.setAttribute('href', 'map.jsp?lat='+obj.lat+'&lng='+obj.lng +'&name='+obj.centerName);//==ahref.href='map.jsp';
				ahref.target="_blank";
				ahref.innerText = obj[field];
				td.appendChild(ahref);
            	}else{
                td.innerText = obj[field];
            		
            	}
                tr.appendChild(td);
            	

            }
            return tr;
        }

        document.getElementById('searchBtn').addEventListener('click', findFnc2);
        
        function findFnc2(){//1은 가지고온 값 자체가 tr 이였다. 2는 데이터를 가지고 
        	let ary = [];
        	console.log(totalData);
        	// 1.기존 목록 clear 2. 사용자 입력했던값이랑 비교 (같은지) vs totalData 3. tbody.appendChild(makeRow(obj))
        	document.getElementById('list').innerHTML = "";
        	for(let tr of totalData){
                if( tr.sido ==document.getElementById('search').value){
                    document.getElementById('list').appendChild(makeRow(tr));
                }
            }
        }

        function findFnc1() {
        	
            let trs = document.querySelectorAll('tbody tr'); //tbody안에있는 tr을 모두 가져온다. (화면에서 값을 가져온다)
            let ary = [];
            for (let tr of trs) {
                if (tr.children[3].innerText == document.getElementById('search').value) { //4번째 시도 정보 와 id가 search 인 인풋태그랑 같을때만 푸쉬하겠다
                    ary.push(tr);
                }
            }
            console.log(ary);
            document.getElementById('list').innerHTML = ""; //원래있던 목록 지워주고 
            for (let tr of ary) {
                document.getElementById('list').appendChild(tr);
            }
        }
    </script>

</body>

</html>