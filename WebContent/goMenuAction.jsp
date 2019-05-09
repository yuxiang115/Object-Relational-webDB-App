<%@page import="WebDB.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
		<%
			RequestDispatcher req = request.getRequestDispatcher("main_menu.jsp");
			req.include(request, response);
		%>
</body>
</html>