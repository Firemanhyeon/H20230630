<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
  
    	let aryData = [];
    	aryData.push(['Department','Cnt']);
    	let xhtp = new XMLHttpRequest();
  		xhtp.open('get','chartData.do');
  		xhtp.send();
  		xhtp.onload = function(){
  			console.log(xhtp.responseText);
  			console.log(JSON.parse(xhtp.responseText));
  			let data = JSON.parse(xhtp.responseText);
  			console.log(data);
  			
  			for(let i =0; i<data.length; i++){
  				let obj = data[i]//{Adminstrator: 1}
  				for(let prop in obj){
  					console.log(prop,obj[prop])
  				aryData.push([prop,obj[prop]])  					
  				}
  			}
  				
  			/* console.log("이름:"+data.name); */
  			console.log(aryData);
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
  		}//end of onload
  		
    
    
    

      function drawChart() {

        var data = google.visualization.arrayToDataTable(aryData);

        var options = {
          title: '부서별 인원 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>
