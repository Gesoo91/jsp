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
<title>delete</title>
</head>
<body>
	<div id="delete">
		<%
			String delNo = request.getParameter("b_no"); 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
			Statement st = con.createStatement();
			String sql = "delete from board3 where b_no ="+delNo;
			System.out.println("==== 전송하려는 sql:" + sql);
			int resultCount = st.executeUpdate(sql);
			if(resultCount == 1){
				System.out.println("삭제성공");
			}
			else{
				System.out.println("삭제실패");
			}			
		} catch (Exception e) {		
			e.printStackTrace();
		}	
		response.sendRedirect("list.jsp");	// 글리스트 화면으로 강제 이동
		%>
		
	</div>
</body>
</html>