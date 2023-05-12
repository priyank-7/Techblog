/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;
import com.tech.blog.entities.*;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {          
//            fatch all the data from form
            String check = request.getParameter("check");
            if (check == null) 
            {
                out.println("Accept terms and condition");
            }
            else 
            {

                String email = request.getParameter("user_email");
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                
                if (dao.getUserByEmail(email)) 
                {

                    String name = request.getParameter("user_name");
                    String password = request.getParameter("user_password");
                    String gender = request.getParameter("gender");
                    String about = request.getParameter("about");

                    User user = new User(name, email, password, gender, about);

                    //  Create user dao object
                    if (dao.InsertUser(user)) 
                    {
                        out.println("Done");
                    } 
                    else 
                    {
                        out.println("Error");
                    }
                }
                else
                {
                    out.println("UserAlreadyExist");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
