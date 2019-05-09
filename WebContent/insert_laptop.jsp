<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

			int serialid = Integer.parseInt(request.getParameter("serial_no"));
			String speed = request.getParameter("speed");
			int price = Integer.parseInt(request.getParameter("price"));
			String memory = request.getParameter("memory");
			String customerName = request.getParameter("customer_name");
			String facturerName = request.getParameter("facturer_name");
			String softwares = request.getParameter("softwares");
			String weight = request.getParameter("weight");
			boolean success;
			if(customerName == null || customerName.length() == 0)
				success = handler.insertLaptop(serialid, speed, 
						price, memory, "", facturerName, softwares.split(","), weight);
			else
				success = handler.insertLaptop(serialid, speed, 
						price, memory, customerName, facturerName, softwares.split(","), weight);
			 
	%>
				<form action='goMenuAction.jsp' align='center'>
				<div align='center'><p>&nbsp;</p>
				<table cellspacing='2' cellpadding='3' border='1' width='100%'>
					<tr>
						<th>Serial Number</th>
						<th>Speed</th>
				 		<th>Price</th>
						<th>Memory</th>
						<th>Customer Name</th>
						<th>Manufacturer Name</th>
						<th>Softwares</th>
						<th>Weight</th>

					</tr>			
	<%
				if(success){
	%>
						<tr>
							<td align=\"center\"> <%= serialid %> </td>
							<td align=\"center\"><%= speed %></td>
							<td align=\"center\"><%= price%></td>
							<td align=\"center\"><%= memory %></td>
							<td align=\"center\"><%= customerName%></td>
							<td align=\"center\"><%= facturerName%></td>
							<td align=\"center\"><%= softwares%></td>
							<td align=\"center\"><%= weight%></td>							
						</tr>
	<%
				}
				else{
					%>
					 <h2>There was a problem inserting the laptop</h2> 
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