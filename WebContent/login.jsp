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
			DataHandler handler = new DataHandler();
			String url = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";
			if(handler.authenticateUser(url, request.getParameter("username"), 
					request.getParameter("password"), request.getSession(true))){
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				if(username != null && username.length() > 0)
					session.setAttribute("username", username);
				if(password != null && password.length() > 0)
					session.setAttribute("password", password);
				
				
				RequestDispatcher req = request.getRequestDispatcher("main_menu.jsp");
				req.include(request, response);
			}
			else{
				RequestDispatcher req = request.getRequestDispatcher("login_form.jsp");
				req.include(request, response);
			}
		%>
	</body>
</html>