<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Oracle DB Home Page</title>
</head>
<body>
	<h2>Xiang Yu's Homework 2 Hame Page</h2>
	<form action = "menu_action.jsp">
		<table border = 1>
			<tr>
				<th colspan="2">Querries </th>
			</tr>
			<tr>
				<td>1.Insert a microchip manufacturer</td>
				<td><div style="text-align: center;">
					<input type="submit" name=querry1 value="Go To"> 
				</div></td>
			</tr>
			<tr>
				<td>2.1 Insert a Laptop</td>
				<td><div style="text-align: center">
				<input type=submit name=querry2.1 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>2.2 Insert a Desktop</td>
				<td><div style="text-align: center">
				<input type=submit name=querry2.2 value="Go To">
				</div></td>
			</tr>		
			<tr>
				<td>3 Insert a Customer</td>
				<td><div style="text-align: center">
				<input type=submit name=querry3 value="Go To">
				</div></td>
			</tr>		
			<tr>
				<td>4. Give technical support to a computer ordered by a particular customer</td>
				<td><div style="text-align: center">
					<input type=submit name=querry4 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>5. Find all laptops ordered by a particular customer in a particular year</td>
				<td><div style="text-align: center">
						<input type=submit name=querry5 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>6. List all the information of the customer(s) who have technical support for a computer using the microchip manufactured by a particular manufacturer. </td>
				<td><div style="text-align: center">
						<input type=submit name=querry6 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>7. List the names of all customers who ordered a laptop running a particular operating system. </td>
				<td><div style="text-align: center">
						<input type=submit name=querry7 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>8. Find the names of all customers who have bought a desktop that costs more than a particular price.  </td>
				<td><div style="text-align: center">
						<input type=submit name=querry8 value="Go To">
				</div></td>
			</tr>
			<tr>
				<td>9. Display all the software a particular laptop has.  </td>
				<td><div style="text-align: center">
						<input type=submit name=querry9 value="Go To">
				</div></td>
			</tr>
			
			<tr>
				<td>10. Delete all customers who have not made any order since a particular year. </td>
				<td><div style="text-align: center">
						<input type=submit name=querry10 value="Go To">
				</div></td>
			</tr>
		</table>
		
		<table cellspacing="3" cellpadding="2" border="0">
			<tr>
				<td><input type="submit" name="customer_tab" value="Customer Table"/></td>
				<td><input type="submit" name="computer_tab" value="Computer Table"/></td>
				<td><input type="submit" name="desktop_tab" value="Desktop Table"/></td>
				<td><input type="submit" name="laptop_tab" value="Laptop Table"/></td>
				<td><input type="submit" name="manufacturer_tab" value="Manufacturer Table"/></td>
				<td><input type="submit" name="order_tab" value="Order Table"/></td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" name="logoutbutton" value="Logout"/>
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>