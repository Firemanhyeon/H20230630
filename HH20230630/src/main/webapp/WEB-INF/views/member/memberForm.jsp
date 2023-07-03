<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/jquery/3.7.0.min.js"></script>
<script>
    let today = new Date('Dec 4 , 2023 , 12:00:00 AM');
    Date.prototype.timeFormat = function(){
        console.log(this.getFullYear());
        let yyyy=this.getFullYear();
        let mm=this.getMonth()+1;
        let dd = this.getDate();

        return yyyy+'-'+ ('0'+mm).slice(-2) + '-'+('0'+dd).slice(-2);
    }
    console.log(today.timeFormat());


    $(document).ready(function(){
        //jquery의 ajax 실행
        $.ajax({
            url:'memberListJson.do',
            method:'get',
            success: function(result){
                console.log(result);
                result.forEach(item => {
                    let tr = $('<tr />').append(
                                 $('<td />').text(item.userId)
                                ,$('<td />').text(item.userName)
                                ,$('<td />').text(new Date(item.userBirth).timeFormat());
                                ,$('<td />').text(item.userPhone)
                                ,$('<td />').append($('<img>').attr('src','images/'+item.userImg)
                                                            .attr('width','125px'))
                    )
                    tr.on('click',modifyFnc)
                    $('#list').append(tr);
                });
            },
            error: function(err){
                console.log(err);
            }
        })

function modifyFnc(e){
    // console.log($(this).children().eq(0).text());//this가 tr을 가리킴
   let id= $(this).find('td:nth-child(1)').eq(0).text();//

   $.ajax({
    url:'memberInfoJson.do',
    method:'post',
    data:{uid: id},//컨트롤에서  req.getparameter('uid')의 uid 
    success: function(result){
        console.log(result);
        $('#uid').val(result.userId);
        $('#upw').val(result.userPw);
        $('#uid').val(result.userId);
        $('#uid').val(result.userId);

    },
    error: function (err){
        console.log(err);
        }
   })
}

        //등록버튼 클릭시.
        $('form[name="myFrm"]').on('submit',submitForm);
        function submitForm(e){
            e.preventDefault();
            console.log(e);
            $.ajax({
                url:$('form[name="myFrm"]').attr('action'),
                method:'post',
                data: $('form[name="myFrm"]').serialize(),//uid= //서버쪽으로 넘어갈 데이터
                success:function(result){
                    let tr = $('<tr />').append(
                                 $('<td />').text(result.userId)
                                ,$('<td />').text(result.userName)
                                ,$('<td />').text(result.userBirth)
                                ,$('<td />').text(result.userPhone)
                                ,$('<td />').append($('<img>').attr('src','images/'+result.userImg)
                                                            .attr('width','125px'))
                    )
                    $('#list').append(tr);
                    console.log(result);
                },
                error : function(err){
                    console.log(err);
                }
                
                
          });
        }
    })
</script>

<h3>Jquery연습(memberForm.jsp Ajax:single page application)</h3>
<form name ="myFrm" action="memberAdd.do">
    <table class="table">
        <tr>
            <th>아이디</th>
            <td><input type="text" name= "uid" id= "uid" value="newbie"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name= "upw" id= "upw"value="newbie"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name= "uname" id= "uname" value="홍길동"></td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" name= "uphone" id= "uphone" value="010-1111-2222"></td>
        </tr>
        <tr>
            <th>주소</th>
            <td><input type="text" name= "uaddr" id= "uaddr" value="대구시 100번지"></td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td><input type="date" name= "ubirth" id= "ubirth" value="1995-04-23"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록">
                <input type="reset" value="초기화">
                <input type="submit" value="변경">
            </td>
        </tr>
        
    </table>
</form>
<br><br><br>
<table class="table">
	 <thead>
	    <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>생일</th>
	        <th>연락처</th>
	        <th>사진</th>
	    </tr>
	 </thead>
	<tbody id="list">
	
	</tbody>
</table>