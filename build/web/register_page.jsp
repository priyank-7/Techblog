<%-- 
    Document   : register_page
    Created on : 29-Dec-2022, 5:14:41 pm
    Author     : Priyank Patel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>
        <main>
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Register Here
                        </div>
                        
                                                 
                        <div class="card-body">
                            

                            <form id="reg_form"action="signup" method="POST">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter user name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <span>
                                        <input type="radio" id="gender" name = "gender" value="male">Male
                                        <input type="radio" id="gender" name = "gender" value="female">Female
                                    </span>
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" cols="" rows="5" placeholder="Enter something about your self"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loder" style="display: none">
                                    <span class="fa fa-refresh fa-spin"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <br>
                                <button id="submit_btn" type="submit" class="btn btn-secondary">Submit</button>

                            </form>
                        </div>
                        <div class="card-footer primary-background">
                        </div>
                    </div>
                </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("Lodded");
                $('#reg_form').on('submit', function (event) {
                    event.preventDefault();

                    $("#submit_btn").hide();
                    $("loder").show();

                    let form = new FormData(this);
                    //  Send to register servlet

                    $.ajax({
                        url: "signup",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#submit_btn").show();
                            $("loder").hide();

                            if(data.trim() ==='Done')
                            {
                                swal("Registered successfully...Redirecting to Login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            }                           
                            else
                            {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStstus, errorThrown) {
                            
                            $("#submit_btn").show();
                            $("loder").hide();
                            
                            swal("Something went wrong..tyr again")            
                        },
                        processData: false,
                        contentType: false,
                    });
                });
            });
        </script>

    </body>
</html>
