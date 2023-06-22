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
</head>
<body>
	<%
	String editNo = request.getParameter("num");
	String title = request.getParameter("title");
	String id = request.getParameter("id");
	String content = request.getParameter("content");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();
		String sql = "update board3 set "
				+"b_title='"
				+title
				+"', "
				+"b_content='"
				+content
				+"', "
				+"b_id='"
				+id
				+"' "
				+"where b_no=" + editNo;
		System.out.println("전송할 sql문:"+sql);
		int resultCount = st.executeUpdate(sql);
		if(resultCount == 1){
			System.out.println("수정완료");
		}
		else{
			System.out.println("수정실패");
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}
	response.sendRedirect("list.jsp");
	 %>
</body>
</html>