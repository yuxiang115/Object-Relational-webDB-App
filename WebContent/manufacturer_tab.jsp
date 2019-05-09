<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manufacturer Table</title>
</head>
<body>
	<%@page import="WebDB.DataHandler"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>

	<%
	
		DataHandler handler = new DataHandler();
		String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";

		boolean auth = handler.authenticateUser(jdbcUrl, session.getAttribute("username").toString(),
				session.getAttribute("password").toString(), request.getSession(true));


		ResultSet rset = handler.getManufacturerTable();
		
			%>	
				<form action='goMenuAction.jsp' align='center'>
				<div align='center'><p>&nbsp;</p>
				<table cellspacing='2' cellpadding='3' border='1' width='100%'>
					<tr>
						<th>Microchip Manufacturer Name</th>
						<th>Street</th>
						<th>City</th>
						<th>State</th>
						<th>Zip Code</th>
						
					</tr>
			<%

				
				while(rset.next()){
								
				out.println("<tr>");
				out.println("<td align=\"center\">" + rset.getString(1) + "</td>");
				out.println("<td align=\"center\">" + rset.getString(2) + "</td>");
				out.println("<td align=\"center\">" + rset.getString(3) + "</td>");
				out.println("<td align=\"center\">" + rset.getString(4) + "</td>");
				out.println("<td align=\"center\">" + rset.getString(5) + "</td>");
				out.println("</tr>");
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
			
		%>
</body>
</html>