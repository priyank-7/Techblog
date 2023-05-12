

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,com.tech.blog.helper.ConnectionProvider "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
/*            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 71% 95%, 24% 100%, 0 98%, 0 0);
            }*/

            .hoverable{
              
                transition-timing-function: ease-in-out;
                transition-duration:  .5s;                
                

            }
            .hoverable:hover{
                -webkit-box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);
                -moz-box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);
                opacity: 0.8;
                
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
   
        <!--banner-->

        <div class="container-fluid p-0 m-0 banner-background" >

            <div class="jumbotron bg-secondary text-white" style="border-radius: 0%">

                <div class="container" > 
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>

                    <button class="btn btn btn-secondary btn-outline-light btn-lg hoverable"> <span class="fa fa-user-plus"></span>Starts ! It's Free</button>
                    <a href="login_page.jsp" class="btn btn btn-secondary btn-outline-light btn-lg hoverable"> <span class="fa fa-user-circle-o"></span>Login</a>
                </div>
            </div>



        </div>

        <!--carde-->

        <div class="container align-items-center">
            <div class="row" >
                <div class="col-md-4">
                    <div class="card hoverable">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white" >Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card hoverable">
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card hoverable">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card hoverable" >
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card hoverable" >
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card hoverable">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--<script src="js/myjs.js" type="text/javascript"></script>-->
    </body>
</html>
