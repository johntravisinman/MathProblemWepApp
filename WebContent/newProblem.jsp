<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding New Problem</title>
</head>
<body>
	<%
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathdb", "root", "");
		
		PreparedStatement categories = connection.prepareStatement("SELECT mpid FROM problems ORDER BY mpid");
		ResultSet problemsRS = categories.executeQuery();
		int mpid = 1;
		while(problemsRS.next()){
			mpid++;
		}
		

		String newProblem = request.getParameter("newProblem");
		
		PreparedStatement addProblem;
		addProblem = connection.prepareStatement("INSERT INTO problems (mpid, content) VALUES (?, ?)");
		addProblem.setInt(1, mpid);
		addProblem.setString(2, newProblem);
		addProblem.executeUpdate();
	%>
	<br>
	*New Problem Added*
	<br>
	<a href="MathProblemServlet">Return</a>
</body>
</html>