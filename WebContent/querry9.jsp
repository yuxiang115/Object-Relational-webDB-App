<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
</head>
<body>
	<%@page import="WebDB.DataHandler"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>

	<h1>Display all the software a particular laptop has.</h1>
	<%
	
		DataHandler handler = new DataHandler();
		String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";

		boolean auth = handler.authenticateUser(jdbcUrl, session.getAttribute("username").toString(),
				session.getAttribute("password").toString(), request.getSession(true));

		if (request.getParameter("insertbutton") != null && auth) {


		String serialNo = request.getParameter("serial_no");
		ResultSet rset = handler.querry9(Integer.parseInt(serialNo));
		
			%>	
				<form action='goMenuAction.jsp' align='center'>
				<div align='center'><p>&nbsp;</p>
				<table cellspacing='2' cellpadding='3' border='1' width='100%'>
					<tr>
						<th>Softwares</th>
					</tr>
			<%

				
				while(rset.next()){
				Array a = rset.getArray(1);
				String[] result = (String[])a.getArray();
								
				out.println("<tr>");
				out.println("<td align=\"center\">" + Arrays.toString(result) + "</td>");
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