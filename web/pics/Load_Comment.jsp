<%@page import="java.lang.*"%>
<%@page import="com.tech.blog.entities.User, com.tech.blog.entities.*, com.tech.blog.dao.*, com.tech.blog.helper.*,com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>


<div>
<%       
        
        CommentDao cd = new CommentDao(ConnectionProvider.getConnection());          
        int post_id = Integer.parseInt(request.getParameter("pid"));               
        ArrayList<Comment> lst = cd.getAllComment(post_id);                
        for(Comment rs : lst){  
        User us = cd.getUserById(getUid());
        if(us.equals(null)){
            out.println("mayday mayday");
        }
        else{
%>
<!--<script>console.log("asdfgh")</script>-->

    <div class="card-header">
        <div class="row">
            <div class="col md-6">
                <a href="#!"><span><%=(cd.getUserById(rs.getUid())).getId()%></span></a>
            </div>
            <div class="col md-6 offset-md-6">
                <span><%=rs.getTmsp()%></span>
            </div>
            <hr>
            <div class="col-md-12">
                <div class="container">
                    <p><%=rs.getCmt()%></p>
                </div>
            </div>           
        </div>
    </div>
    <%}%>
</div>