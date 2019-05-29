<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" href="./resources/css/chat.css">
</head>
<body>
	<fieldset>
	<legend>로그인 창</legend>
	<c:if test="${user==null }">
	<a href="login">로그인</a><br/>
	</c:if>
	<c:if test="${user !=null }">
	${user.nickname}님 환영합니다.<br/> 
	<a href="logout">로그아웃</a><br/>
	</c:if>
	</fieldset>
	
	<a href="arrayinsert">ArrayList 삽입</a><br />
	<a href="linkedinsert">LinkedList 삽입</a><br />
	<a href="arrayread">ArrayList 읽기</a><br />
	<a href="linkedread">LinkedList 읽기</a><br />
	
	<a href="chat">채팅 페이지</a><br />
	
	<!--  
	<script>
		
		document.getElementById("sendbtn").addEventListener(
				"click", function(e){
			//웹 소켓에 연결
			var websocket = new WebSocket(
				"ws://localhost:8080/pk/echo-ws")
			//웹 소켓에 연결되면 메시지를 전송
			websocket.addEventListener("open", function(e){
				//입력한 메시지 전송
				websocket.send(document.getElementById("msg").value);
			});
			
			//웹 소켓이 닫힐 때 호출될 로직
			websocket.addEventListener("close", function(e){
				//입력한 메시지 전송
				alert("웹 소켓 연결 종료");
			});
			
			//서버에서 메시지가 왔을 때 호출될 로직
			websocket.addEventListener("message", function(e){
				//입력한 메시지 전송
				alert(e.data);
				//웹 소켓 연결 해제
				websocket.close();
			});
		});
	
	</script>
	-->
	
</body>
</html>







