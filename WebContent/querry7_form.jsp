<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>List the names of all customers who ordered a laptop running a particular operating system. </h2>
	<form action = "querry7.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Enter the Operate System Name: </th>
			</tr>
			<tr>
				<td>Operate System Name:</td>
				<td><div style="text-align: center;">
					<input type=text name=software> 
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