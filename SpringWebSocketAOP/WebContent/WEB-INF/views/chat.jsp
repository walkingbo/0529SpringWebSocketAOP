<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" href="./resources/css/chat.css">
</head>
<body>

	<a href="chat">채팅 페이지</a><br />
	
	<fieldset>
		<legend>채팅 영역</legend>
		닉네임<input type="text" id="nickname" />
		<input type="button" id="enterBtn" value="입장" />
		<input type="button" id="exitBtn" value="퇴장" />
		
		<h3>메시지 영역</h3>
		<!-- 스크롤 바를 배치하기 위해서 div 안에 div 배치 -->
		<div id="chatArea">
			<div id="chatMessageArea"></div>
		</div>
		<br />
		<input type="text" id="message" size="50" />
		<input type="button" id="sendBtn" value="전송" />
	</fieldset>
	
	<script>
		//웹 소켓 변수
		var wsocket;
		
		//웹 소켓에 연결하고 이벤트 처리 함수를 지정하는 함수
		function connect(){
			//웹 소켓을 생성해서 연결
			wsocket = new WebSocket(
				"ws://localhost:8080/SpringWebSocketAOP/chat-ws")
			//웹 소켓 이벤트 핸들러 연결
			wsocket.addEventListener("open", function(e){
				//메시지 출력 함수 호출
				appendMessage("연결 성공");
			});
			wsocket.addEventListener("close", function(e){
				appendMessage("연결 해제");
			});
			wsocket.addEventListener("message", function(e){
				appendMessage(e.data)
			})
			
			//나가기 버튼을 클릭했을 때 이벤트 처리
			document.getElementById("exitBtn").addEventListener(
					"click", function(e){
				wsocket.close();
			});
			//전송버튼을 누르면 입력한 내용을 보내기
			document.getElementById("sendBtn").addEventListener(
					"click", function(e){
				//입력한 내용 가져오기
				var str = document.getElementById("message").value
				var nick = document.getElementById("nickname").value
				//메시지 전송
				wsocket.send(nick + ":" + str)
				document.getElementById("message").value = ""
			});
			
			//메시지를 입력하다가 Enter를 누르면 메시지를 전송
			document.getElementById("message").addEventListener(
				"keypress", function(e){
					var keycode = e.keyCode ? e.keyCode : e.which
					if(keycode == 13){
						//입력한 내용 가져오기
						var str = document.getElementById("message").value
						var nick = document.getElementById("nickname").value
						//메시지 전송
						wsocket.send(nick + ":" + str)
						document.getElementById("message").value = ""
					}
					//이벤트 전파를 금지
					e.stopPropagation()
			});
		}
		
		//메시지 영역에 메시지를 출력해주는 함수
		function appendMessage(msg){
			document.getElementById("chatMessageArea").innerHTML = 
				msg + "<br />" + 
				document.getElementById("chatMessageArea").innerHTML
		}
		//입장 버튼을 눌렀을 때 connect 함수를 호출하도록 설정
		document.getElementById("enterBtn").addEventListener(
			"click", function(e){
			connect();
		});
	</script>
</body>
</html>







