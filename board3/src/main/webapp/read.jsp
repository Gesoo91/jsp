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
<title>읽기</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<a href="list.jsp">글리스트로 이동</a><br>
<%
	String readNo = request.getParameter("num"); 
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();//고정사용
		ResultSet rs = st.executeQuery("select*from board3 where b_no="+readNo);
		rs.next();
		String num = rs.getString("b_no");
		String title = rs.getString("b_title");
		String id = rs.getString("b_id");
		String content = rs.getString("b_content");
%>
	글번호:<%=num %><br>
	글제목:<%=title %><br>
	글쓴이:<%=id %><br>
	본문:<%=content %><br>
<a href="delete.jsp?num=<%=num %>">글삭제</a>
<a href="edit.jsp?num=<%=num %>">글수정</a>
	
	<%	
	} catch (Exception e) {		
		e.printStackTrace();
	}	

%>	
		
</body>
</html>