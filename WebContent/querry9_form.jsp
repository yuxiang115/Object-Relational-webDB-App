<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>softwares</title>
</head>
<body>
	<h2>Display all the software a particular laptop has.  </h2>
	<form action = "querry9.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the Price: </th>
			</tr>
			<tr>
				<td>Serial Number:</td>
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