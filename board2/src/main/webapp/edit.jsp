<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>edit</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">practice board</a>
		</div>
	</div>
	<div id="edit_load">
		<%
		
		String editNo = request.getParameter("num"); //파라미터값을 사용하기 때문에 ""안에는 매개변수가 들어가야한다. 테이블의 콘솔네임이 아니다. 헷갈리지말자.
		String title = null; 
		String content = null; 
		String id = null; 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
			Statement st = con.createStatement();
			String sql = "select * from board3 where b_no="+editNo;
			System.out.println("전송한sql문="+sql);
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			title = rs.getString("b_title");
			content = rs.getString("b_content");
			id = rs.getString("b_id");
			
		} catch (Exception e) {		
			e.printStackTrace();
		}	
		%>
		글번호:<%=editNo %><br>		
		
	</div>
	<div id = "edit_form">
		<form action="editproc.jsp" method="get">
		<input name="num" type="hidden" value=<%=editNo%>>
		글제목:<input name="title" value="<%=title%>"><br>
		글내용:<textarea name="content" rows="5" cols="50"></textarea><br>
		글작성자id:<input name="id">
		<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>