<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert Microchip Manufacturer</title>
</head>
<body>
	<h2>Insert a Microchip Manufacturer</h2>
	<form action = "insert_manufacturer.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the Microchip Manufacturer data: </th>
			</tr>
			<tr>
				<td>Manufacturer Name:</td>
				<td><div style="text-align: center;">
					<input type=text name=manufacturer_name> 
				</div></td>
			</tr>
			<tr>
				<td>Street:</td>
				<td><div style="text-align: center">
				<input type=text name=street>
				</div></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><div style="text-align: center">
					<input type=text name=city>
				</div></td>
			</tr>		
			<tr>
				<td>State:</td>
				<td><div style="text-align: center">
					<input type=text name=state>
				</div></td>
			</tr>		
			<tr>
				<td>ZipCode:</td>
				<td><div style="text-align: center">
					<input type=text name=zipcode>
				</div></td>
			</tr>
			<tr>
				<td><div style="text-align: center">
					<input type=reset name=resetbutton value=Clear>
				</div></td>
				<td><div style="text-align: center">
					<input type=submit name=insertbutton value=Insert>
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