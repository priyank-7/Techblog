
<%@page import="com.tech.blog.entities.User, com.tech.blog.entities.*, com.tech.blog.dao.*, com.tech.blog.helper.*,com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.tech.blog.entities.User"%>


<div class='row'>    
    <%
        
    User uuu = (User) session.getAttribute("CU");
        
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts = null;
     
    if(cid == 0){        
        posts = d.getAllPost();
    }
    else{
        posts = d.getPostByCatId(cid);
    }
    
    if(posts.size() == 0){
        out.println("<h3 class='display-3 text-center'>There is No Posts</h3>");
    }
       
    for(Posts p:posts){
    %>

    <div class="card m-1" style="width: 100%">
        <img class="card-img-top" src="Post_Pics/<%= p.getpPic() %>" alt="Card image cap">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
            <pre><%= p.getpCode() %></pre>
        </div>
        <div class="card-footer">

            <% 
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
            %>
            <a href="#!" onclick="doLike(<%=p.getpId()%>, <%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i><span class="like-counter "><%= ld.countLikeOnPost( p.getpId()) %></span></a> 
            <a href="#!" class="btn btn-outline-secondary btn-sm"> <i class="fa fa-commenting-o"></i><span><%= cd.countCommentOnPost(p.getpId())%></span> </a> 
            <a href="show_post.jsp?post_id=<%= p.getpId()%>"class="btn btn-outline-primary btn-sm float-right">Read More</a> 
        </div>
    </div>   
    <%}%>    
</div>