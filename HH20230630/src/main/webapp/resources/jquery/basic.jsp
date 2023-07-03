<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resources/jquery/basic.jsp</title>
<style >
p:nth-child(2){
	color:red;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<p>Hello,World</p>
<p>Hello,World</p>
<script>
 
 $('p').css('background','yellow');
 //document.querySelectorAll('p').forEach(pTag=>{
     // pTag.style.background='yellow';
     //})
 $('p:nth-child(1)').after($('<p />').text('Hello, World3'));

 //pTag= document.querySelector('p:nth-child(1)')
 //let newPTag = document.createElement('p').appendChild(document.createTextNode('Hello,World3'))
</script>
</body>
</html>