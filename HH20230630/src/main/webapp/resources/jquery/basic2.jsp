<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
            $(document).ready(function(){//로딩이 전부 된 다음
                //document.addEventListener('DOMContentLoaded',function(){
                    // })
                $('li:nth-child(2)').css('background','yellow');
                
                let li = $('<li />').text('Melon');
                console.log(li);

                $('ul').append(li);//ul요소의 하위에 li 요소를 추가

                //버튼추가
                $('li').append($('<button />').text('삭제').on('click',delBtn));
                function delBtn(e){
                    console.log(e);
                    //e.currentTarget : 자바스크립트의 DOM요소 
                    //$(e.currentTarget): jquery객체
                    $(e.currentTarget).parent().remove();//버튼의부모:li li의부모: ul 전부삭제 

                }


                //이벤트등록 on
                // $('body>button').on('click',function(){
                //     $('li:nth-child(1)').remove();
                // })
                //추가이벤트 등록
                $('#addBtn').on('click',function(e){
                	let li=$('<li />').text($('#userInput').val())
                						.append($('<button />').text('삭제').on('click',delBtn));
                        $('ul').append(li);
                        //$('ul').prepend(li); 제일앞에 붙이기
                        //li.appendTo($('ul'));
                        $('li:nth-child(2)').before(li);//해당번째글뒤,앞에붙이기


                    //init
                    $('#userInput').val('');//쓰고나서 인풋값초기화 

                })
                //$('button').wrap($('<div />'));//ul태그를 div로 감싼다 wrap

            })

        </script>
</head>
<body>
    <button>요소제거</button>
    <input id="userInput"><button id="addBtn">추가</button>
    <ul>
        <li>Apple</li>
        <li>Banana</li>
        <li>Cherry</li>

    </ul>
</body>
</html>