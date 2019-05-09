<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
</head>
<body>
	<h2>Find the names of all customers who have bought a desktop that costs more than a particular price. </h2>
	<form action = "querry8.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the Price: </th>
			</tr>
			<tr>
				<td>Price:</td>
				<td><div style="text-align: center;">
					<input type=text name=price> 
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