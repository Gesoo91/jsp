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
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();//고정사용
		//todo : write에서 입력된 값 받아오기, 받아온 값 데이터베이스에 insert*from board3 해주기 = sql문 만들어서 넣자.
		String sql = "insert into board3 (b_id,b_title,b_content,b_time) values('" +id+"', '"+title+"', '"+content+"', now())"; //board뒤에 입력할놈들 먼저 ()안에 지정해주기
		System.out.println("sql문:"+sql);
	 	int ResultCount = st.executeUpdate(sql); //int 값으로 하는건 알앗는데 헷갈렷엇음
	 	if(ResultCount ==1){
			System.out.println("성공적으로 작성되었습니다.");
	 	}else{
			System.out.println("작성이 실패했습니다.");
	 	}
	} catch (Exception e) {		
		e.printStackTrace();
	}	

	response.sendRedirect("list.jsp");	// 글리스트 화면으로 강제 이동 이것도 기억 안났음.
%>	
</body>
</html>