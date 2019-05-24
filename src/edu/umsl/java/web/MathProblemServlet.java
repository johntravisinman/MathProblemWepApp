package edu.umsl.java.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.umsl.java.beans.Problem;
import edu.umsl.java.beans.Category;
//import edu.umsl.java.beans.Mapping;

//@WebServlet("/MathProblemServlet")
public class MathProblemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement problems, categories;
	//private PreparedStatement updateProblems, updateCategories, updateMappings;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathdb", "root", "");
			
			problems = connection.prepareStatement("SELECT mpid, content, cat_mapping FROM problems ORDER BY mpid");
			categories = connection.prepareStatement("SELECT catid, category_name FROM categories ORDER BY catid");
//			mappings = connection.prepareStatement("SELECT mpid, catid FROM mappings ORDER BY mpid");
		
		} catch (Exception exception) {
			exception.printStackTrace();
			throw new UnavailableException(exception.getMessage());
		}
	}
	public void destroy() {
		try {
			problems.close();
			categories.close();
//			mappings.close();
			connection.close();
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Problem> problist = new ArrayList<Problem>();
		List<Category> catlist = new ArrayList<Category>();
//		List<Mapping> maplist = new ArrayList<Mapping>();
		
		RequestDispatcher dispatcher = 
                request.getRequestDispatcher("list.jsp");
		
		try {
			ResultSet problemsRS = problems.executeQuery();
			ResultSet categoriesRS = categories.executeQuery();
//			ResultSet mappingsRS = mappings.executeQuery();
			
			while (problemsRS.next()) {
				Problem prob = new Problem();

				prob.setMpid(problemsRS.getInt(1));
				prob.setContent(problemsRS.getString(2));
				prob.setCat_mapping(problemsRS.getInt(3));

				problist.add(prob);
			}
			while (categoriesRS.next()) {
				Category category = new Category();

				category.setCatid(categoriesRS.getInt(1));
				category.setCategory_name(categoriesRS.getString(2));

				catlist.add(category);
			}
//			while (mappingsRS.next()) {
//				Mapping map = new Mapping();
//
//				map.setMpid(problemsRS.getInt(1));
//				map.setCatid(problemsRS.getInt(2));
//
//				maplist.add(map);
//			}
//			
			request.setAttribute("problist", problist);
			request.setAttribute("catlist", catlist);
//			request.setAttribute("maplist", maplist);
			
			} catch (SQLException sqlException) {
				sqlException.printStackTrace();
			}
		
		dispatcher.forward(request, response);
	}
	

}