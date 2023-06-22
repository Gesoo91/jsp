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
<title>writeprocess</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">practice board</a>
		</div>
	</div>
	<div id="writeproc">
		<%
		String title = request.getParameter("title"); 
		String content = request.getParameter("content"); 
		String id = request.getParameter("id"); 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
			Statement st = con.createStatement();
			String sql = "insert into board3 (b_title,b_content,b_id,b_time) values('"
					+title
					+"','"
					+content
					+"','"
					+id
					+"',now())";
					
			System.out.println("전송한sql문="+sql);
			int resultCount = st.executeUpdate(sql);	// 글쓰기 sql 전송, 보통 insert문을 실행할때 새로운 행이 추가되므로 성공의 경우 영향받은 행의 수는 1이다.
			if(resultCount == 1){
				System.out.println("글쓰기 성공");
			}
			else{
				System.out.println("글쓰기 실패");
				
			}
		} catch (Exception e) {		
			e.printStackTrace();
		}	
		response.sendRedirect("list.jsp");	// 글리스트 화면으로 강제 이동
		%>
		
	</div>
</body>
</html>