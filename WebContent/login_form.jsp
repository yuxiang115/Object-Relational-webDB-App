<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
		<h2 align="center">
			Login with your Oracle Account.
		</h2>
		<h2 align="center">
			<jsp:useBean id="empsbean" class="WebDB.DataHandler" scope="session"/>
		</h2>	
		
		<form action="login.jsp" method="post">
			<div align="center">
				<p>&nbsp;</p>
				<table style="with: 50%">
					<tr>
						<td width="38%">
							<strong>Username:</strong>
						</td>
						<td width="62%">
							<input type="text" name="username"/>
						</td>
					</tr>
					<tr>
						<td width="38%">
							<strong>Password:</strong>
						</td>
						<td width="62%">
							<input type="password" name="password"/>
						</td>
					</tr>
				</table>
				<input type="submit" value="Login"/>
				<p>
					&nbsp;
				</p>
			</div>
		</form>
	</body>
</html>