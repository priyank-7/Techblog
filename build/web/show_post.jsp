<%@page import="java.lang.*"%>
<%@page import="com.tech.blog.entities.User, com.tech.blog.entities.*, com.tech.blog.dao.*, com.tech.blog.helper.*,com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("CU");
    if(user == null){
        response.sendRedirect("login_page.jsp");
    }    
%>

<%
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    Posts p = pd.getPostbyPostId(post_id);
    User u = pd.getUserById(p.getUserId());
    int ui = p.getpId();
    int pi = user.getId();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
            }
            .post-user-info{

            }

            /*            body{
                            background: url(img/x2.jpg);
                            background-size: cover;
                            background-attachment: fixed;
                            
                        }*/
        </style>            
    </head>
    <body class="bg-light">


        <!--Start of nav bar-->

        <nav class="navbar navbar-expand-lg navbar-dark  primary-background">
            <a class="navbar-brand" href="index.jsp" style="font-family: Playfair Display, Georgia, Times New Roman, serif;"><span class="fa fa-asterisk"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Profile_.jsp"> <span class="fa fa-house-user"></span>Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-plus-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item hoverable" id="hoverr" href="#">Programming Language</a>
                            <a class="dropdown-item hoverable" id="hoverr" href="#">DSA</a>
                            <!--<div class="dropdown-divider"></div>-->
                            <a class="dropdown-item hoverable" id="hoverr" href="#">Project Implimentation</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-phone"></span> Contact Us</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#New_Post"> <span class="fa fa-plus-square"></span> Post</a>
                    </li>      
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#Profile-modal"><span class="fa fa-user-circle"></span> <%=user.getName()%></a>
                    </li>    
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span>Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--End Of Nav Bar-->


        <!--Stsrting Of Main Content of Body-->

        <div class="container">
            <div class="row ">
                <div class="col-md-10 offset-md-1">

                    <div class="card">
                        <div class="card-header bg-light">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>

                        <img class="card-img-top" style="border-radius : 0px" src="Post_Pics/<%= p.getpPic() %>" alt="Card image cap">

                        <div class="card-body bg-light">
                            <div class="row mt-2">
                                <div class="col-md-8">
                                    <p class="post-user-info"> Posted by <a href="User_Account.jsp?userid=<%=u.getId()%>"><%= u.getName() %> </a> </p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                </div>
                            </div>

                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
                        </div>

                        <div class="card-footer bg-light">

                            <% 
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
                            %>
                            <a href="#!" onclick="doLike(<%=p.getpId()%>, <%= user.getId()%>)" class="btn btn-outline-secondary btn-sm"> <i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost( p.getpId())%></span> </a> 
                            <a href="#!" class="btn btn-outline-secondary btn-sm"> <i class="fa fa-commenting-o"></i><span><%= cd.countCommentOnPost(p.getpId())%></span> </a> 
                        </div>

                        <div class="card-footer">

                            <div class="input-group mb-3">
                                <input id="cmt" type="text" class="form-control" placeholder="Comment" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button onclick="comments(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-outline-secondary" type="button">Post</button>
                                </div>
                            </div>
                        </div>

                        <div class="card-footer" id="comment-sec">                                                        
                            <button onclick="getComment_(<%=p.getpId()%>)" id="comment_btn" class="btn btn-secondary btn-lg">View Comment</button>                                                                                                          
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--End Of Main Content of Body-->


        <!--Stsreting of Profile Modal-->

        <div class="modal fade" id="Profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="padding: 0px">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" style="border-radius: 48%">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>      

                            <!--PROFILE DETAILE-->

                            <div id="profile-detail">
                                <table class="table">                               
                                    <tbody>
                                        <tr>
                                            <th scope="row">Id:</th>
                                            <td><%= user.getId() %></td>                                      
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>                                    
                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>     
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on: </th>
                                            <td><%= user.getDateTime()%></td>     
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--EDIT PROFILE-->

                            <div id="profile-edit" style="display:none">
                                <form id="edit_PForm"action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID : </td>
                                            <td> <%= user.getId() %></td>
                                        </tr>
                                        <tr>
                                            <td>Email : </td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name : </td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password : </td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>     
                                        <tr>
                                            <td>About : </td>
                                            <td>
                                                <textarea class="form-control" name="user_about" rows="1" cols="10"></textarea>
                                            </td>
                                        <tr>
                                            <td>Profile Picture: </td>
                                            <td><input type="file" name="profile_pic" class="form-control"></td>
                                        </tr>                                                                                                                           
                                    </table>
                                    <div class="container">
                                        <button id ="save_profile"type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit_profile_btn"type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--PROFILE MODAL END-->

        <!-- Stsrt Modal Foe New POst-->

        <div class="modal fade" id="New_Post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id ="new_post_form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>                                    
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = new ArrayList<>();
                                        list = postd.getAllCategorys();
                                        for(Category c:list){
                                    %> 
                                    <option value="<%=c.getCid()%>"> <%= c.getcName() %> </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" placeholder="Content" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" placeholder="Code" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <input name="pPic" type="file" class="form-control">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary ">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-dark btn-primary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-outline-dark btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End Of New Post Modal-->




        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>      

        <script>
            $(document).ready(function () {

                let edit_status = false;

                $('#edit_profile_btn').click(function () {
                    if (edit_status == false) {
                        $('#profile-detail').hide();
                        $('#profile-edit').show();
                        $(this).text("Back");
                        edit_status = true;

                        $('#edit_PForm').on('submit', function (event) {
                            event.preventDefault();

                            let form = new FormData(this);
                            //  Send to register servlet

                            $.ajax({
                                url: "EditServlet",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    if (data.trim() === 'True')
                                    {
                                        swal("Updated")
                                                .then((value) => {
                                                    window.location = "Profile_.jsp"
                                                });
                                    } else
                                    {
                                        swal(data);
                                    }
                                },
                                error: function (jqXHR, textStstus, errorThrown) {
                                    swal("Something went wrong..tyr again")
                                },
                                processData: false,
                                contentType: false,

                            });
                        });
                    } else {
                        $(this).text("Edit");
                        $('#profile-detail').show();
                        $('#profile-edit').hide();
                        edit_status = false;
                    }
                });
            });
        </script>

        <!--adding new Post-->
        <script>

            $(document).ready(function () {
                $("#new_post_form").on("submit", function (event) {
                    event.preventDefault();

                    let formdata = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: formdata,
                        success: function (data) {
                            if (data.trim() === 'True') {

                                swal({
                                    title: "Posted",
                                    icon: "success",
                                    button: "OK",
                                }).then((value) => {
                                    window.location = "Profile_.jsp"
                                });
                            }
                            
                            console.log("After if");
                            console.log(data);
                        },
                        error: function (data) {
                            console.log(data);
                        },
                        processData: false,
                        contentType: false,
                    })
                })
            })

        </script>

        <!--loading post-->
        <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();

                $(".c-link").removeClass('active_');

                $.ajax({
                    url: "Load_Page.jsp",
                    data: {cid: catId},
                    success: function (data) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data)
                        $(temp).addClass('active_');
                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);
            })
        </script>   

        <script>
            function getComment_(postid_) {
                console.log("asdasd");

                $.ajax({
                    url: "Load_Comment.jsp",
                    data: {pid: postid_},
                    success: function (data) {
                        console.log(data);
                        $("#comment-sec").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                })
            }
        </script>


        <script>

            function comments(postid, userid) {
                const cmt = document.getElementById("#cmt");
                doComment(postid, userid, cmt);
            }

        </script>
    </body>
</html>
