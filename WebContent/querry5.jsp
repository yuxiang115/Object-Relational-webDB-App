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
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<h2>Find all laptops ordered by a particular customer in a particular year. </h2>

	
	<%
	if (request.getParameter("backbutton") != null) {
		response.sendRedirect("main_menu.jsp");
	}
	
		DataHandler handler = new DataHandler();
		String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";

		boolean auth = handler.authenticateUser(jdbcUrl, session.getAttribute("username").toString(),
				session.getAttribute("password").toString(), request.getSession(true));

		if (request.getParameter("insertbutton") != null && auth) {

		
		String year = request.getParameter("year");


		ResultSet rset = handler.querry5(Integer.parseInt(year));
		
			%>	<h1>Laptop sold in <%=year %></h1>
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
						<th>Order Month:</th>
					</tr>
			<%

				
				while(rset.next()){
					Array a = rset.getArray(7);
					String[] result = (String[])a.getArray();
					
				out.println("<tr>");
				out.println("<td align=\"center\">" + rset.getInt(1) + "</td>" +
							"<td align=\"center\"> " + rset.getString(2) + "</td> " +
							"<td align=\"center\"> " + rset.getInt(3) + "</td> " +
							"<td align=\"center\"> " + rset.getString(4) + "</td> " +
							"<td align=\"center\"> " + rset.getString(5) + "</td> " +
							"<td align=\"center\"> " + rset.getString(6) + "</td> " +
							"<td align=\"center\"> " + Arrays.toString(result) + "</td> " +
							"<td align=\"center\"> " + rset.getString(8) + "</td> " +
							"<td align=\"center\"> " + rset.getInt(9) + "</td> " );
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
			
		}
		%>
</body>
</html>