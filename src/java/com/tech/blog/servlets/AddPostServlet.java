
package com.tech.blog.servlets;


import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
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
import org.apache.tomcat.jni.SSLContext;



@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            int cid = Integer.parseInt(request.getParameter("cid"));
            String title = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pPic");       
            String filename = part.getSubmittedFileName();
            
            //  Getting current userID
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("CU");           
            
            Posts p = new Posts(title, pContent, pCode, filename, null, cid, user.getId());
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            
            if(dao.savePost(p)){                
                String path = request.getRealPath("/") + "Post_Pics"+File.separator+filename;
                helper.saveFile(part.getInputStream(), path);
                out.println("True");
            }
            else{
                out.println("Something Worng");
            }                       
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
