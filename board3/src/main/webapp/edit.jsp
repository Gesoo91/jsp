<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String editNo = request.getParameter("num");
	String title = null;
	String id = null;
	String content = null;
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();//고정사용
		ResultSet rs = st.executeQuery("select*from board3 where b_no="+editNo);
		rs.next();
		
		title = rs.getString("b_title");
		id = rs.getString("b_id");
		content = rs.getString("b_content"); //작업대 불러오기까지 성공.
		
		%>
	
		<%	
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>	
	<a href="list.jsp">글리스트로 이동</a><br>
	글번호:<%=editNo %>	
	<form action="editproc.jsp" method="get">
		<!-- 글번호 적는게 기억안남 확인결과. editproc 에 상단부분에 적힌것을 여기다가 적어야함(read의 값 가져와서 초기화하기) -->
		<input name="num" type="hidden" value="<%= editNo%>"><hr> <!-- num값 넘겨서 수정해야되니까 hidden으로 안보이게 하고 값만넘기기 -->
		아이디:<input name="id" placeholder="id를 써주세요.">	<hr>
		글제목:<input name="title" placeholder="글제목을 써주세요.">	<hr>
		본문:<textarea name="content" placeholder="본문을 써주세요." rows="5" cols="50"></textarea>	<hr>
		<input type="submit" value="수정완료"><hr>	
	</form>

		
</body>
</html>