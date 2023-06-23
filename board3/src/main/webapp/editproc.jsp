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
		Statement st = con.createStatement();//고정사용
		
		String sql = "update board3 set b_title='"+title+"', "+"b_id='"+id+"' ,"+"b_content='"+content+"' where b_no='"+editNo+"'"; 
		/* update sql문 쓰는거 헷갈려서 ms에 작성해둔 예시 보고 만듬. */
		System.out.println("sql문:"+sql);
		int ResultCount = st.executeUpdate(sql);
		if(ResultCount == 1){
		System.out.println("수정성공");
		}else{
		System.out.println("sql문:"+sql);
		}
			
%>
			
	
	<%	
	} catch (Exception e) {		
		e.printStackTrace();
	}	
	response.sendRedirect("list.jsp");
%>	
		
</body>
</html>