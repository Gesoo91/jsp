<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">practice board</a>
		</div>
	</div>
	<hr>
	<div id="list">
	글번호|글제목|글쓴이|글내용|글쓴시간<br>
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from board3");
			 
			while(rs.next()){
				String num = rs.getString("b_no");
				String title = rs.getString("b_title");
				String content = rs.getString("b_content");
				String id = rs.getString("b_id");
				String time = rs.getString("b_time");
		%>
				
		<%=num %> <a href="read.jsp?num=<%=num%>"><%=title %></a> <%=id %> <%=time %><br> <%--mysql-connector-j-8.-.33.jar을 안넣어서 안나오더라 --%>
		<%
			}
			
		} catch (Exception e) {		
			e.printStackTrace();
		}	
		%>
	</div>
	<div id="write">
	<a href="write.jsp">글작성</a>
	</div>
</body>
</html>