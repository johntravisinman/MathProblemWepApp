<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assigning Category</title>
</head>
<body>
	<%
		int mpid = Integer.parseInt(request.getParameter("mpid"));
		int cat_map = Integer.parseInt(request.getParameter("cat_mapping"));
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathdb", "root", "");
		PreparedStatement assignMapping;
		assignMapping = connection.prepareStatement("UPDATE problems SET cat_mapping = ? WHERE mpid = ?");
		assignMapping.setInt(1, cat_map);
		assignMapping.setInt(2, mpid);
		assignMapping.executeUpdate();
	%>
	<br>
	*Problem Assigned*
	<br>
	<a href="MathProblemServlet">Return</a>
</body>
</html>