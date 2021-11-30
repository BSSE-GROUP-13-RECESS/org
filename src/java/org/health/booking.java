package org.health;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Joshua
 */
public class booking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ResultSet resultSet;

        //use this to get path of sqlite in any servlet and pass it in the different methods
        String dbPath = getServletContext().getRealPath("/WEB-INF/web.xml");

        String message = "<p>No data fetched</p>";
        try {
            resultSet = database.executeQuery("select * from user;",dbPath);
            message = "<ol>";
            while (resultSet.next()){
                message+="<li>"+resultSet.getString("name")+"</li>";
            }
            message+="</ol>";
        } catch (SQLException | ClassNotFoundException e) {
            message = "<p style='color: red'>"+e.getMessage()+"</p>";
        }

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet booking</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet booking at " + request.getContextPath() + "</h1>");
        out.println("Guys database connection works!!! Use database.sqlite in the root directory as our database");
        out.println(message);
        out.println("</body>");
        out.println("</html>");
    }
}