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

		<h2>4.Give technical support to a computer ordered by a particular customer</h2>
	
	<%
	if (request.getParameter("backbutton") != null) {
		response.sendRedirect("main_menu.jsp");
	}
	
		DataHandler handler = new DataHandler();
		String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";

		boolean auth = handler.authenticateUser(jdbcUrl, session.getAttribute("username").toString(),
				session.getAttribute("password").toString(), request.getSession(true));

		if (request.getParameter("insertbutton") != null && auth) {

		
		String serial_no = request.getParameter("serial_no");


		boolean	 success = handler.querry4(serial_no);
			%>
				<form action='goMenuAction.jsp' align='center'>
				<div align='center'><p>&nbsp;</p>
				<table cellspacing='2' cellpadding='3' border='1' width='100%'>
					<tr>
						<th>Serial Number</th>
						<th>Customer' Name</th>


			<%
			if(success){
				ResultSet rset = handler.getQuerry4Res(serial_no);

				
				while(rset.next()){
				
				

				out.println("<tr>");
				out.println("<td align=\"center\">" + rset.getInt(1) + "</td>" +
							"<td align=\"center\"> " + rset.getString(2) + "</td> ");
				out.println("</tr>");
			}
				
			}
			else{
				%>
				 <h2>There was a problem executing querry 4</h2> 
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