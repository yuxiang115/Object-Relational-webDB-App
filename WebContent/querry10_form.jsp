<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DELETION</title>
</head>
<body>
	<h2> Delete all customers who have not made any order since a particular year.  </h2>
	<form action = "querry10.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the year: </th>
			</tr>
			<tr>
				<td>Year:</td>
				<td><div style="text-align: center;">
					<input type=text name=year> 
				</div></td>
			</tr>
			
			<tr>
				<td><div style="text-align: center">
					<input type=reset name=resetbutton value=Clear>
				</div></td>
				<td><div style="text-align: center">
					<input type=submit name=insertbutton value=Submit>
				</div></td>
			</tr>
			<tr>
				<td colspan = 2><div style="text-align: center">
					<input type=submit name=backbutton value=Back>
				</div></td>
			</tr>
		</table>
	</form>
</body>
</html>