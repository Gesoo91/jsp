<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<a href="list.jsp">글리스트로 이동</a><br>
	<form action="writeproc.jsp" method="get"> <%-- form 데이터를 "url"로 보낸다는 뜻. 이때 해당 url에 도착하여 처리해야함. method는 get과 post가 있다.
	get으로 하면 폼데이터를 url 매개변수로 첨부하여 전송하고 ?name=value&email=example@example.com과 같은 형식으로 데이터가 전송 폼데이터가 url에 노출되므로 보안적이슈
	method="post"는 폼데이터가 요청의 본문(html)에 포함되어 전송되고,  url에 노출되지 않는다. 보안성이 높고 데이터 길이제한이 없으나 서버측에서 post요청을 처리해야한다.
	주로 사용자입력을 서버에 전달하거나 중요한 데이터를 전송할때 주로 쓴다.
	 이부분이랑 submit이 기억이 잘 안남. 아이디위에는 뭐잇던거 같앗는데 아니엇음 본문은 textarea로 해주자.  --%>
		아이디:<input name="id" placeholder="id를 써주세요.">	<hr>
		글제목:<input name="title" placeholder="글제목을 써주세요.">	<hr>
		본문:<textarea name="content" placeholder="본문을 써주세요." rows="5" cols="50"></textarea>	<hr>
		<input type="submit" value="글쓰기완료"><hr>	
	</form>
</body>
</html>