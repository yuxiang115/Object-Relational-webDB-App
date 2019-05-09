<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>Query Result</title>
</head>
<body>
	<%@page import="WebDB.DataHandler"%>
	<%@page import="java.sql.ResultSet"%> 
	<%@page import="java.sql.Array"%>
	
	<%
	if (request.getParameter("backbutton") != null) {
		response.sendRedirect("main_menu.jsp");
	}
	
		DataHandler handler = new DataHandler();
		String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";

		boolean auth = handler.authenticateUser(jdbcUrl, session.getAttribute("username").toString(),
				session.getAttribute("password").toString(), request.getSession(true));

		if (request.getParameter("insertbutton") != null && auth) {

		
		String manufacturerName = request.getParameter("manufacturer_name");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipCode = request.getParameter("zipcode");
		

			Boolean success = handler.insertManufacturer(manufacturerName, street, city, state, zipCode);
			
			%>
				<form action='goMenuAction.jsp' align='center'>
				<div align='center'><p>&nbsp;</p>
				<table cellspacing='2' cellpadding='3' border='1' width='100%'>
					<tr>
						<th>Manufacturer Name</th>
						<th>Street</th>
				 		<th>City</th>
						<th>State</th>
						<th>Zip Code</th>
					</tr>
			<%
			if(success){
				%>
						<tr>
							<td align=\"center\"> <%= manufacturerName %> </td>
							<td align=\"center\"><%= street %></td>
							<td align=\"center\"><%= city%></td>
							<td align=\"center\"><%= state %></td>
							<td align=\"center\"><%= zipCode%></td>						
						</tr>

					</tr>		
				<%
			}
			else{
				%>
				 <h2>There was a problem inserting the Manufacturer</h2> 
<%
			}
			%>
			</table>
				<table cellspacing='2' cellpadding='3' border='0' width='100%'>
				<tr>
				<td><input type='submit' name='backbutton' value='Home'/></td>
				</tr>
				</table>
				</div></form>
			<% 
			
		}
		%>
</body>
</html>