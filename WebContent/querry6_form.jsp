<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Technical support</title>
</head>
<body>
	<h2>List all the information of the customer(s) who have technical support for a computer using the microchip manufactured by a particular manufacturer. </h2>
	<form action = "querry6.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the year: </th>
			</tr>
			<tr>
				<td>Microchip Manufacturer Name</td>
				<td><div style="text-align: center;">
					<input type=text name=facturer_name> 
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