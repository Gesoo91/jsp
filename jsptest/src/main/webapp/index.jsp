<%@page import="java.util.ArrayList" %>
<%@page import="com.peisia.hello.Cat" %>
<%@page errorPage = "error.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!// Cat cat = new Cat(); 
	Cat cat = null;
	%>
<%= cat.name %>
<%-- webapp이 기준폴더가 된다. 프로젝트에서 run as server를 하게되면 index가 우선 가동된다. 이럴때 404에러가 나올 수 있다 --%>
</body>
</html>