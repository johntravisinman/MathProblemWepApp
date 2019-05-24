<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*"%>
<%@ page import="edu.umsl.java.beans.*"%>
<%@ page import="edu.umsl.java.web.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Math Problems</title>
<script type="text/javascript"
	src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script type="text/javascript">
	window.MathJax = {
		tex2jax : {
			inlineMath : [ [ '$', '$' ], [ "\\(", "\\)" ] ],
			processEscapes : true
		}
	};
</script>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>Category</th>
		</tr>
		<c:forEach var="cat" items="${catlist}">
		<tr>
			<td align="center">${cat.catid}</td>
			<td align="center">${cat.category_name}</td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<form method="post" action="showCategory.jsp">
		<b>Show only problems in category:</b>
		<select name="showCategory">
			<c:forEach var="cat" items="${catlist}">
				<option value="${cat.catid}">${cat.catid}</option>
			</c:forEach>
		</select>
		<input type="submit" name="Submit" value="Show Category">
	</form>
	<br>
	<table>
		<tr>
			<th>ID</th>
			<th>Problem</th>
			<th>Category ID</th>
		</tr>
		<c:forEach var="prob" items="${problist}">
			<tr>
				<td>${prob.mpid}</td>
				<td>${prob.content}</td>
				<td>${prob.cat_mapping}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form method="post" action="assign.jsp">
	<table>
		<tr>
			<th>Problem ID</th>
			<th>Category ID</th>
		</tr>
		<tr>
			<td align="center">
				<select name="mpid">
					<c:forEach var="prob" items="${problist}">
						<option value="${prob.mpid}">${prob.mpid}</option>
					</c:forEach>
				</select>
			</td>
			<td align="center">	
 				<select name="cat_mapping">
					<c:forEach var="cat" items="${catlist}">
						<option value="${cat.catid}">${cat.catid}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="submit" name="Submit" value="Assign Category">		
			</td>
		</tr>
	</table>

	</form>
	<br>
	<form method="post" action="newProblem.jsp">
		Enter a new Problem:
		<br>
		<input type="text" name="newProblem">
		<input type="submit" name="Sumbit" value="Add Problem">
	</form>
	<br>
	<form method="post" action="newCategory.jsp">
		Enter a new category:
		<br>
		<input type="text" name="newCategory">
		<input type="submit" name="Sumbit" value="Add Category">
	</form>
</body>
</html>