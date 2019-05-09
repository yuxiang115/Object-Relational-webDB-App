<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>4.Give technical support to a computer ordered by a particular customer</title>
</head>
<body>
	<h2>4.Give technical support to a computer ordered by a particular customer</h2>
	<form action = "querry4.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the Tech-Support data: </th>
			</tr>

			<tr>
				<td>Computer Serial Number:</td>
				<td><div style="text-align: center;">
					<input type=text name=serial_no> 
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