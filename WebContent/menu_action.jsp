<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	
	<body>
		<%

			if(request.getParameter("querry1") != null)				
				response.sendRedirect("insert_manufacturer_form.jsp");
		
			else if(request.getParameter("querry2.1") != null)
				response.sendRedirect("insert_laptop_form.jsp");
		
			else if(request.getParameter("querry2.2") != null)
				response.sendRedirect("insert_desktop_form.jsp");
		
			else if(request.getParameter("querry3") != null)
				response.sendRedirect("insert_customer_form.jsp");
		
			else if(request.getParameter("querry4") != null)
				response.sendRedirect("querry4_form.jsp");		
		
			else if(request.getParameter("querry5") != null)
				response.sendRedirect("querry5_form.jsp");
		
			else if(request.getParameter("querry6") != null)
				response.sendRedirect("querry6_form.jsp");	
		
			else if(request.getParameter("querry7") != null)
				response.sendRedirect("querry7_form.jsp");
			
			else if(request.getParameter("querry8") != null)
				response.sendRedirect("querry8_form.jsp");
		
			else if(request.getParameter("querry9") != null)
				response.sendRedirect("querry9_form.jsp");
		
			else if(request.getParameter("querry10") != null)
				response.sendRedirect("querry10_form.jsp");
		
			else if(request.getParameter("customer_tab") != null)
				response.sendRedirect("customer_tab.jsp");
		
			else if(request.getParameter("computer_tab") != null)
				response.sendRedirect("computer_tab.jsp");
		
			else if(request.getParameter("desktop_tab") != null)
				response.sendRedirect("desktop_tab.jsp");
		
			else if(request.getParameter("laptop_tab") != null)
				response.sendRedirect("laptop_tab.jsp");
		
			else if(request.getParameter("manufacturer_tab") != null)
				response.sendRedirect("manufacturer_tab.jsp");
		
			else if(request.getParameter("order_tab") != null)
				response.sendRedirect("order_tab.jsp");
		
			else if(request.getParameter("logoutbutton") != null)
				response.sendRedirect("login_form.jsp");
		
		
		
		%>
	</body>
</html>