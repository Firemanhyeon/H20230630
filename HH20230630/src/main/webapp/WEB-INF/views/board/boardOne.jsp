<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<style>
   .main {
      width: 100%;
   }

   .content {
      padding: 35px;
      width: 80%;
      margin: 0 auto;
   }

   .last {
      text-align: center;
   }

   ul {
      list-style: none;
   }

   .table {}
</style>
<div class="main">
   <div class="content">
      <h2>상세보기</h2>
      <h2>${logId}</h2>
      <table border="1" class="table">
         <tr>
            <th>글번호</th>
            <td>${board.brdNo}</td>
            <th>조회수</th>
            <td>${board.clickCnt}</td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${board.brdWriter}</td>
            <th>작성일</th>
            <td>
               <fmt:formatDate value="${board.createDate}" />
            </td>
         </tr>
         <tr>
            <th>제목</th>
            <td colspan="3">${board.brdTitle}</td>
         </tr>
         <tr>
            <td class="last" colspan="4">
               <textarea rows="8" cols="150px" readonly align="center">${board.brdContent}</textarea>
            </td>
         </tr>
      </table>
      <hr>
      <!--  댓글부분 시작 -->
      <div class="row" style="width: 90%; margin: 0 auto;">
         <div class="col-lg=12">
            <div class="panel panel-default">
               <!-- heading -->
               <div class="panel-heading" style="height: 40px;">
                  <i class="fa fa-comments fa-fw"></i>Reply
                  <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
                     New Reply
                  </button>
               </div>
               <!-- body -->
               <div class="panel-body">
                  <ul class="chat">
                     <!-- <li class="left clearfix">
                        <div>
                           <div class="header">
                              <strong class="primary-font">user01</strong>
                              <small class="pull-right text-muted">2023-06-05 15:25</small>
                           </div>
                           <p>Good Job!!</p>
                        </div>
                     </li> -->
                  </ul>
               </div>
               <!-- footer -->
               <div class="panel-footer">

               </div>
            </div>
         </div>
      </div>
   </div>
   <!--  댓글부분 종료 -->

   <!-- 모달창 -->
   <div class="modal fade" id="myModal" style="top:150px;">
      <div class="modal-dialog">
         <div class="modal-content">
            <!-- header -->
            <div class="modal-header" style="margin-top: 20px;">
               <button class="close">&times;</button>
               <h4 class="modal-title">Reply Modal</h4>
               <input type="hidden" name="replyNo">
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <label for="">Reply</label>
                  <input class="form-control" name="reply" value="New Reply...">
               </div>
               <div class="form-group">
                  <label for="">Replyer</label>
                  <input class="form-control" name="replyer" value="${logId}" readonly>
               </div>
               <div class="form-group">
                  <label for="">Reply Date</label>
                  <input class="form-control" name="replyDate" value="2023-06-30" readonly>
               </div>
            </div>
            <div class="modal-footer">
               <button id="modalModBtn" class="btn btn-warning">Modify</button>
               <button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
               <button id="modalRegisterBtn" class="btn btn-primary">Register</button>
               <button id="modalCloseBtn" class="btn btn-secondary">Close</button>
            </div>
         </div>
      </div>
   </div>
   <!-- 모달창 종료 -->
</div>

<script>
   let pageNum = 1;
   let modal = document.getElementById('myModal')
   document.getElementById('addReplyBtn').addEventListener('click', function (e) {
      modal.style.display = 'block';
      modal.style.opacity = '1';
      // 수정 삭제 숨김
      document.getElementById('modalModBtn').style.display = 'none';
      document.getElementById('modalRemoveBtn').style.display = 'none';
      document.getElementById('modalRegisterBtn').style.display = 'block';
      // document.querySelector('body').style.backgroundColor = 'rgba(0, 0, 0, 0.5)';

      // 등록날짜 항목 숨김.
      document.querySelector('#myModal div.modal-body div.form-group:nth-child(3)').style.display='none';


   });

   // 조회버튼
   function searchList(){
      document.querySelectorAll('ul.chat li').forEach(function (tag) { // tag = li 전체
         tag.addEventListener('click', function (e) {
            let id = '${logId}';
            let replyId = tag.dataset.user;
      
      
            modal.style.display = 'block';
            modal.style.opacity = '1';
            // 수정 삭제 숨김
            if(id == replyId){
               document.getElementById('modalModBtn').style.display = 'block';
               document.getElementById('modalRemoveBtn').style.display = 'block';
               document.getElementById('modalRegisterBtn').style.display = 'none';
            }else{
               document.getElementById('modalModBtn').style.display = 'none';
               document.getElementById('modalRemoveBtn').style.display = 'none';
               document.getElementById('modalRegisterBtn').style.display = 'none';
            }
            
            // data-rno ="2"
            let rno = tag.dataset.rno // data-rno 값을 가져올때 사용
            fetch('getReply.do?rno=' + rno)
            .then(response => response.json())// 오브젝트형으로 바꿔주는게 json(response가 가지고있음) 화살표 함수써서 간단하게도 만들수있음 
            .then(function(result){
               document.querySelector('#myModal input[name="replyNo"]').value = result.replyNo;
               document.querySelector('#myModal input[name="reply"]').value = result.reply;
               document.querySelector('#myModal input[name="replyer"]').value = result.replyer;
               document.querySelector('#myModal input[name="replyDate"]').value = result.replyDate;
            })
            .catch(function(err){
               console.log(err);
            })
         })
      })
   }

   // 수정
   document.getElementById('modalModBtn').addEventListener('click',function(){
      let replyno = document.querySelector('#myModal input[name="replyNo"]').value
      let reply = document.querySelector('#myModal input[name="reply"]').value

      // fetch('editReply.do?rno='+replyno + '&reply='+reply)
      // .then(function(response){
      //    return response.json();
      // })
      // .then(function(result){
      //    document.querySelector('#myModal input[name="reply"]').value = result.reply;
      //    document.querySelector('#myModal input[name="replyer"]').value = result.replyer;
      //    document.querySelector('#myModal input[name="replyDate"]').value = result.updateDate;
      //    document.querySelector('.chat p').innerHTML = result.reply;

      //    modal.style.display = 'none';
      //    modal.style.opacity = '0';
      // })
      // .catch(function(err){
      //    console.log(err);
      // })

      fetch('editReply.do',{
         method:'post',
         headers:{
            'Content-Type' : 'application/x-www-form-urlencoded'
         },
         body:'rno=' + replyno + '&reply=' + reply
      })
      .then(response => response.json())
      .then(result =>{
         
         let replyNo = result.replyNo;
         let targetLi = document.querySelector('.chat li[data-rno="'+ replyNo + '"]');
         targetLi.querySelector('p').innerText = result.reply;
         
         modal.style.display = 'none';
         modal.style.opacity = '0';
         alert("수정완료");
         
      })
      .catch(function(err){
         console.log(err);
      })
   })

   // 삭제(해야함)
   document.getElementById('modalRemoveBtn').addEventListener('click',function(){
      let replyno = document.querySelector('#myModal input[name="replyNo"]').value
      let reply = document.querySelector('#myModal input[name="reply"]').value

      fetch('delReply.do',{
         method:'post',
         headers:{
            'Content-Type' : 'application/x-www-form-urlencoded'
         },
         body:'rno=' + replyno
      })
      .then(response => response.json())
      .then(result =>{   
         // let replyNo = result.replyNo;
         // let targetLi = document.querySelector('.chat li[data-rno="'+ replyNo + '"]');
         // targetLi.remove();
         
         replyFnc(bno,pageNum);
         modal.style.display = 'none';
         modal.style.opacity = '0';
         alert("삭제완료");
      })
      .catch(function(err){
         console.log(err);
      })
   })




   document.getElementById('modalCloseBtn').addEventListener('click', function (e) {
      modal.style.display = 'none';
      modal.style.opacity = '0';

   });

   document.querySelector('.close').addEventListener('click', function (e) {
      modal.style.display = 'none';
      modal.style.opacity = '0';
   });

   // 댓글목록 리스트 보여주기
   const bno = '${board.brdNo}';
   const replyUl = document.querySelector('ul.chat');


   // li 만드는 것
   function makeList(reply={}){
      let str ='';
      str += '<li class="left clearfix" data-rno= '+ reply.replyNo +' data-user=' + reply.replyer + '><div><div class="header">';
      str += '<strong class="primary-font">'+reply.replyer +'</strong>';
      str += '<small class="pull-right text-muted">' + reply.replyDate + '</small></div>';
      str += '<p>' + reply.reply + '</p></div></li>';
      
      return str;
   }

   // 댓글 목록 가져오기
   function replyFnc(bno,page){
      
      fetch('replyList.do?brdNo='+ bno + '&page=' + page) // 목록 json형태로 가져옴
      .then(function(response){
         return response.json();
      }) // 정상적으로 들어오면 then
      .then(function(result){ // count : 39, list:[]
         if(page == -1){
            pageNum = Math.ceil(result.count / 10.0);
            replyFnc(bno, pageNum);
            return;
         }

         replyUl.innerHTML ="";
         for(let reply of result.list){
            replyUl.innerHTML += makeList(reply);
         }
         searchList();
         showReplyPage(result.count);
         // replyFnc(bno,page);
   
      })
      .catch(function(err){
         console.log(err);
      }) // 문제 발생하면 catch
   }

   replyFnc(bno, 1); //첫번째 페이지

   
   // 등록
   document.querySelector('#modalRegisterBtn').addEventListener('click', function(){
      let replyer = document.querySelector('#myModal input[name="replyer"]').value;
      let reply = document.querySelector('#myModal input[name="reply"]').value;
      fetch('addReply.do',{
         method : 'post',
         headers:{
            'Content-Type' : 'application/x-www-form-urlencoded'
         },
         body: 'bno=' + bno +'&replyer='+ replyer +'&reply=' + reply
      })
      .then(response => response.json())
      .then(result =>{
         // replyUl.innerHTML += makeList(result);
         // searchList();
         
         replyFnc(bno, 1);
         modal.style.display = 'none';
          modal.style.opacity = '0';

      })
      .catch(err => console.log(err));
   })
   

   // 댓글갯수를 기준으로 페이지 계산
   

   function showReplyPage(replyCnt){
      let endPage = Math.ceil(pageNum / 10) * 10;
      let startPage = endPage - 9;
      let prev = startPage != 1;
      let next = false;

      if(endPage * 10 > replyCnt){
         endPage = Math.ceil(replyCnt / 10.0);
      }

      if(endPage * 10 < replyCnt){
         next = true;
      }

      // 계산한 값으로 페이지 출력
      let str = '<ul class="pagination pull-right">';
      if(prev){
         str += '<li class="page-item"><a data-page="'+ (startPage - 1) +'" href="" class="paging"> prev </a></li>';
      }

      for(let i = startPage; i <= endPage; i++){
         str += '<li class="page-item"><a data-page="'+ i +'" href="" class="paging">' + i +'</a></li>';
      }

      if(next){
         str += '<li class="page-item"><a data-page=" '+(endPage + 1) +'" href="" class="paging"> next </a></li>';
      }
      str += '</ul>';
      document.querySelector('div.panel-footer').innerHTML = str;

      // 링크클릭 이벤트.
      document.querySelectorAll('a.paging').forEach(aTag =>{
         aTag.addEventListener('click', function(e){
            e.preventDefault();
            let pageNum = aTag.dataset.page;
            replyFnc(bno,pageNum); // 원본글, 페이지 호출
         })

      })
   }
   // showReplyPage(156);
</script>