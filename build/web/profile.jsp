




<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User, com.tech.blog.entities.*, com.tech.blog.dao.*, com.tech.blog.helper.*,com.tech.blog.servlets.*"%>
<%@page import="java.util.ArrayList"%>


<%
    User user = new User();
    user = (User)session.getAttribute("CurrentUser");
    if(user == null){
        response.sendRedirect("login_page.jsp");
    }
%>





<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark  primary-background">
            <a class="navbar-brand" href="index.jsp" style="font-family: Playfair Display, Georgia, Times New Roman, serif;"><span class="fa fa-asterisk"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="# "> <span class="fas fa-house-user"></span>Home <span class="sr-only">(current)</span></a>
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
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add_post_modal"> <span class="fa fa-plus-square"></span> Post</a>
                    </li>      
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#Profilr-modal"><span class="fa fa-user-circle"></span> <%=user.getName()%></a>
                    </li>    
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span>Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <%                
                massage m = (massage)session.getAttribute("msg");
                if(m != null){
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>                            
        <%
            session.removeAttribute("msg");
        }
        %> 


        <!--profile modadl-->

        <!-- Modal -->
        <div class="modal fade" id="Profilr-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <img src="pics/<%= user.getProfile()%>" style="border-radius: 50%">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>                            

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

                            <!--profile edit-->
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



        <!--end of profile modal-->

        <!--start of post model-->

        <div class="modal fade" id="add_post_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Post Detaile...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                                                
                        <form action="AddPostServlet" method="post">                            
                            <div class="form-group">
                                <select class="form-control">
                                    <option selected disabled>---Select Category---</option>
                                    <% 
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = new ArrayList<>();
                                    list = postd.getAllCategorys();
                                    for(Category c:list)
                                    {
                                    %>
                                    <option><%= c.getcName() %></option>                                    
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" placeholder="Post Title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" placeholder="Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Code"></textarea>
                            </div>
                            <div class="form-group">
                                <label> select Pic</label>
                                <input type="file">
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!--END add post modal-->



        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {

                let edit_status = false;

                $('#edit_profile_btn').click(function () {
                    if (edit_status == false) {
                        $('#profile-detail').hide();
                        $('#profile-edit').show();
                        $(this).text("Back");

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
                                                    window.location = "profile.jsp"
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

                        edit_status = true;



                    } else {
                        $('#profile-detail').show();
                        $('#profile-edit').hide();
                        edit_status = false;
                    }
                });

            })

        </script>
    </body>
</html>
