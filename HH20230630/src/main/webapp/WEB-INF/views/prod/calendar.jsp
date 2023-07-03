<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />
  <script src='fullcalendar/dist/index.global.js'></script>
  <script>
    let data = [{
      title: '회의',
      start: '2023-01-02T13:00:00',
      end: '2023-01-02T15:00:00'
    }]
    /*  */
    document.addEventListener('DOMContentLoaded', function () {

      // ajax 호출
      let xhtp = new XMLHttpRequest();
      xhtp.open('get', 'eventList.do');
      xhtp.send();
      xhtp.onload = function () {
    	  console.log("asd");
        let result = JSON.parse(xhtp.responseText);
        for (let cal of result) {
          let obj = {
            title: cal.title,
            start: cal.startDate,
            end: cal.endDate
          }
          data.push(obj);
        }
        console.log(data);


        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          initialDate: '2023-01-01',
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          
          
          /* 일정을 추가가능 */
          selectMirror: true,
          select: function (arg) { // 함수 안에 정의 (메서드)
            var title = prompt('일정을 등록하세요');
            if (title) {
              console.log(arg);
              console.log(title);
              let addXhtp = new XMLHttpRequest();
              addXhtp.open('post','addEvent.do');
              addXhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
              addXhtp.send('title=' + title + '&start=' + arg.startStr + '&end=' + arg.endStr);

              addXhtp.onload = function(){
                let result = JSON.parse(addXhtp.responseText);
                if(result.retCode = 'Success'){
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                  }) // 성공하면 화면에 등록
                  alert('등록성공');
                }else if(result.retCode = 'Fail'){
                  alert('등록실패');
                }else{
                  alert('등록실패(에러)');
                }
              } // end of addXttp.onload
            }  // end of if
            calendar.unselect()
          },
          
          
          
          eventClick: function (arg) { // 지우기
            if (confirm('일정을 삭제하시겠습니까?')) {
            	console.log(arg);//타이틀 값 위치 확인
            	let delAjax= new XMLHttpRequest();
              console.log(arg.event._def.title);
            	delAjax.open('post','removeEvent.do');
              	delAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
            	delAjax.send('title=' + arg.event._def.title);
              
              
              delAjax.onload = function(){
                  let result = JSON.parse(delAjax.responseText);
                  if(result.retCode = 'Success'){
                     arg.event.remove()
                    alert('삭제성공');
                  }else if(result.retCode = 'Fail'){
                    alert('삭제실패');
                  }else{
                    alert('삭제실패(에러)');
                  }
                }
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          /*  events: [
             {
               title: 'All Day Event',
               start: '2023-01-01'
             },
             {
               title: 'Long Event',
               start: '2023-01-07',
               end: '2023-01-10'
             },
             {
               groupId: 999,
               title: 'Repeating Event',
               start: '2023-01-09T16:00:00'
             },
             {
               groupId: 999,
               title: 'Repeating Event',
               start: '2023-01-16T16:00:00'
             },
             {
               title: 'Conference',
               start: '2023-01-11',
               end: '2023-01-13'
             },
             {
               title: 'Meeting',
               start: '2023-01-12T10:30:00',
               end: '2023-01-12T12:30:00'
             },
             {
               title: 'Lunch',
               start: '2023-01-12T12:00:00'
             },
             {
               title: 'Meeting',
               start: '2023-01-12T14:30:00'
             },
             {
               title: 'Happy Hour',
               start: '2023-01-12T17:30:00'
             },
             {
               title: 'Dinner',
               start: '2023-01-12T20:00:00'
             },
             {
               title: 'Birthday Party',
               start: '2023-01-13T07:00:00'
             },
             {
               title: 'Click for Google',
               url: 'http://google.com/',
               start: '2023-01-28'
             }
           ] */
          events: data
        });
        calendar.render();
      } // end of onload 
    });
  </script>
  <style>
    body {
      margin: 40px 10px;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 0 auto;
    }
  </style>
</head>

<body>

  <div id='calendar'></div>

</body>

</html>
