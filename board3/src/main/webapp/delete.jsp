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
<title>글지우기</title>
<link rel="stylesheet" href="common.css">
</head>
<body>

<%
	String delNo = request.getParameter("num");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();//고정사용
		//todo : write에서 입력된 값 받아오기, 받아온 값 데이터베이스에 insert*from board3 해주기 = sql문 만들어서 넣자. 완료
		String sql = "delete from board3 where b_no="+delNo;
		System.out.println("sql문:"+sql);
	 	int ResultCount = st.executeUpdate(sql); //int 값으로 하는건 알앗는데 헷갈렷엇음
	 	if(ResultCount ==1){
			System.out.println("성공적으로 삭제되었습니다.");
	 	}else{
			System.out.println("삭제가 실패했습니다.");
	 	}
	} catch (Exception e) {		
		e.printStackTrace();
	}	

	response.sendRedirect("list.jsp");
%>	
</body>
</html>