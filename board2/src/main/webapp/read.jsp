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
<title>read</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">practice board</a>
		</div>
	</div>
	<hr>
	<div id="read">
	글번호|글제목|글쓴이|글내용|글쓴시간 <br>
		<%
			String readNo = request.getParameter("num"); //try안쪽에 있으니가 전역변수로 못써먹엇음. 주의.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from board3 where b_no="+readNo);
			 
				rs.next();
				String num = rs.getString("b_no");
				String title = rs.getString("b_title");
				String content = rs.getString("b_content");
				String id = rs.getString("b_id");
				String time = rs.getString("b_time");
		%>
				<%-- 이상태라면 num 값은 항상 1만 출력된다. rs.next()가 제일 처음꺼만 받아오니까. 이를 막기 위해 변수 하나 추가해서
				request.getParameter();로 해당 글번호값 가져와서 sql문에 추가해 페이지숫자와 맞게 바꿔주자. --%>
		글번호:<%=num %><br>
		글제목:<%=title %><br>
		글내용:<%=content %><br>
		작성자:<%=id %><br> 
		<%
			
			
		} catch (Exception e) {		
			e.printStackTrace();
		}	
		%>
	</div>
	<div id="edit">
		<a href="edit.jsp?num=<%=readNo%>">글수정</a> <%--페이지가 연결되야하므로?num=<%=readNo%>를 넣어서 연결,
														 이거없이햇더니 edit.jsp페이지가 그냥 열려서 null겁나뜸  --%>
	</div>
	<div id="delete">
		<a href="delete.jsp?num=<%=readNo%>">글삭제</a>
	</div>
	
</body>
</html>