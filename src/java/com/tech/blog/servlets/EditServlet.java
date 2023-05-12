/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Priyank Patel
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            try {
//                fatch all data

                String email = request.getParameter("user_email");
                String name = request.getParameter("user_name");
                String password = request.getParameter("user_password");
                String about = request.getParameter("user_about");
                Part part = request.getPart("profile_pic");
                String imagename = part.getSubmittedFileName();

                //  Get the user from the session
                HttpSession s = request.getSession();
                User user = (User) s.getAttribute("CU");
                user.setEmail(email);
                user.setName(name);
                user.setPassword(password);
                user.setAbout(about);
                user.setProfile(imagename);

                //  Update database...
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean flag = userDao.updateUser(user);
                if (flag) {
                    String real_path = request.getRealPath("/") + "pics";
                    String path = real_path + File.separator + user.getProfile();
                    helper.deleteFile(path);
                    path = real_path + File.separator + imagename;
                    if (helper.saveFile(part.getInputStream(), path)) {
                        user.setProfile(imagename);
                        out.println("True");
                    }
                    else {
                        out.println("Something Went Wrong...");
                    }
                }
                else{
                    out.println("Something Went Wrong...");
                }
                out.print("asd");
            } catch (Exception e) {
                
                e.printStackTrace();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
