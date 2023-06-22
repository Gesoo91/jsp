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
<title>writepage</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">practice board</a>
		</div>
	</div>
	<hr>
	<div>
		<div id="write">
			<form action="writeProc.jsp" method="get">
				글제목:<input name="title"><br>
				작성자:<input name="id"><br>
				글내용:<textarea name="content" rows="5" cols="50"></textarea><br>
				<input type="submit" value="글쓰기">
			</form>
		</div>
	</div>



</body>
</html>