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
<title>게시판-리스트</title>

<link rel="stylesheet" href="common.css">
</head>
<body>

<a href="index.jsp">홈으로 이동</a><br>

<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();//고정사용
		ResultSet rs = st.executeQuery("select*from board3");
		while(rs.next()){
			String num = rs.getString("b_no");
			String title = rs.getString("b_title");
			String id = rs.getString("b_id");
			String time = rs.getString("b_time");
		%>	
		
		글번호:<%=num %>| <a href="read.jsp?num=<%=num %>">글제목:<%=title %></a>| 글쓴이:<%=id %>| <%=time %><br>
		<% }
	} catch (Exception e) {		
		e.printStackTrace();
	}	
//동적처리가 필요한데. index에서 부터 다 연결해서 가야되나? 글번호의 파라미터를 가지고 읽기,삭제,수정을 하니까 list에서 동적처리를 한다고 치면 write에서는 데이터베이스에 입력되기만하면된다?
		
%>
<a href="write.jsp">새글쓰기</a>


</body>
</html>