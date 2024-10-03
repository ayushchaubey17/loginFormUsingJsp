package com.youtube;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String name = request.getParameter("user_name");
        String passsword = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        
        System.out.print("<h2>Hello " + name + ", your email " + email + " has been registered successfully</h2>");
        
        String url = "jdbc:mysql://127.0.0.1:3306/form";
        String username = "root";
        String password = "Tapoor@1234";
        
        Connection connection = null; // Declare outside try block for scope
        try {
        	Thread.sleep(3000);
        	Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            
            connection = DriverManager.getConnection(url, username, password);
            
         
            String query = "insert into user(username,email,password,image) values(?,?,?,?);";
            
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName(); // gives null
            System.out.println(fileName);
            
           
//            out.println("<h4>Your data is saved successfully</h4>");
            PreparedStatement preparedStatement =  connection.prepareStatement(query);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, passsword);
            preparedStatement.setString(4, fileName);
            
           
            
            int rowsAffected = preparedStatement.executeUpdate();
            
            out.print((rowsAffected>=1)?"done":"fail");
            
        } catch (ClassNotFoundException | InterruptedException e) {
            System.out.println("Driver not found: " + e.getMessage());
            out.println("<h4>Error: Database driver not found!</h4>");
        } catch (SQLException e) {
            System.out.println("Connection failed: " + e.getMessage());
//            out.println("<h4>Error: Could not connect to database!</h4>");
        } finally {
            // Ensure the connection is closed to prevent resource leaks
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("Failed to close connection: " + e.getMessage());
                }
            }
        }
    }
}
