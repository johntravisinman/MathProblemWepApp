<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
	<% 
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathdb", "root", "");
		
		int showCategory = Integer.parseInt(request.getParameter("showCategory"));
		
		PreparedStatement category_name = connection.prepareStatement("SELECT category_name FROM categories WHERE catid = ?");
		category_name.setInt(1, showCategory);
		ResultSet category_nameRS = category_name.executeQuery();
		category_nameRS.next();
	%>	
		<b> <% out.print(category_nameRS.getString(1)); %> </b>
		<br>
	<%	
		PreparedStatement categoryProblems = connection.prepareStatement("SELECT content FROM problems WHERE cat_mapping = ?");
		categoryProblems.setInt(1, showCategory);
		ResultSet categoryProblemsRS = categoryProblems.executeQuery();
		
		while(categoryProblemsRS.next()) {
			out.print(categoryProblemsRS.getString(1));
			%> <br> <%
		}
	%>
	<br>
	<a href="MathProblemServlet">Return</a>
</body>
</html>