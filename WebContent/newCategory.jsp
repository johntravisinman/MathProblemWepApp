<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding New Category</title>
</head>
<body>
	<%
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathdb", "root", "");
		
		String newCategory = request.getParameter("newCategory");
		
		PreparedStatement validCategory = connection.prepareStatement("SELECT category_name FROM categories ORDER BY catid");
		ResultSet validCategoryRS = validCategory.executeQuery();
		boolean uniqueCategory = true;
		while(validCategoryRS.next()){
			if(validCategoryRS.getString(1).equals(newCategory))
				uniqueCategory = false;		
		}
		
		if(uniqueCategory){
			
			PreparedStatement categories = connection.prepareStatement("SELECT catid FROM categories ORDER BY catid");
			ResultSet categoriesRS = categories.executeQuery();
			int catid = 1;
			while(categoriesRS.next()){
				catid++;
			}
			
			PreparedStatement addCategory;
			addCategory = connection.prepareStatement("INSERT INTO categories (catid, category_name) VALUES (?, ?)");
			addCategory.setInt(1, catid);
			addCategory.setString(2, newCategory);
			addCategory.executeUpdate();
	%>
		*New Category Added*
	<%	} else { %>
		*Duplicate Category*
	<% } %>
	<br>
	<a href="MathProblemServlet">Return</a>
</body>
</html>