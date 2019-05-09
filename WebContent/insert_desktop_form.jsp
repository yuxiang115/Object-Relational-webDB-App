<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert Laptop</title>
</head>
<body>
	<h2>Insert a Desktop</h2>
	<form action = "insert_desktop.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the desktop data: </th>
			</tr>
			<tr>
				<td>Serial Number:</td>
				<td><div style="text-align: center;">
					<input type=text name=serial_no> 
				</div></td>
			</tr>
			<tr>
				<td>Speed:</td>
				<td><div style="text-align: center">
				<input type=text name=speed>
				</div></td>
			</tr>
			<tr>
				<td>Price:</td>
				<td><div style="text-align: center">
					<input type=text name=price>
				</div></td>
			</tr>		
			<tr>
				<td>Memory:</td>
				<td><div style="text-align: center">
					<input type=text name=memory>
				</div></td>
			</tr>		
			<tr>
				<td>Customer Name:</td>
				<td><div style="text-align: center">
					<input type=text name=customer_name>
				</div></td>
			</tr>
			<tr>
				<td>Facturer Name:</td>
				<td><div style="text-align: center">
					<input type=text name=facturer_name>
				</div></td>
			</tr>
			<tr>
				<td>Softwares:</td>
				<td><div style="text-align: center">
					<input type=text name=softwares>
				</div></td>
			</tr>
			
			<tr>
				<td>Monitor Type:</td>
				<td><div style="text-align: center">
					<input type=text name=monitor_type>
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