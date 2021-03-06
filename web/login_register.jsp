<%-- 
    Document   : account
    Created on : Dec 12, 2018, 8:00:55 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.login.css">
        <script src="js/login.js"></script>

        <meta charset="UTF-8">

        <style type="text/css">
            input:required:invalid, input:focus:invalid {
                background-image: url("img/invalid.png");
                background-position: right;
                background-repeat: no-repeat;
            }
            input:required:valid{
                background-image: url("img/valid.png");
                background-position: right;
                background-repeat: no-repeat;
            }
        </style>

    </head>
    <body>

       
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto my-md-5">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md">
                                    <a href="#" class="active" id="login-form-link">Login</a>
                                </div>
                                <div class="col-md">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md">
                                    <form class="form" id="login-form" action="LoginController" method="post" role="form" style="display: block;">
                                        <%
                                            int postId = 0;

                                            try {
                                                postId = Integer.parseInt(String.valueOf(request.getAttribute("postid")));
                                                
                                            } catch (Exception e) {
                                            }
                                            
                                        %>
                                        <input  name="postid" value="<%=postId%>" hidden="" />
                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-user" ></i></span>
                                            <input type="text" name="loginusername" id="loginusername" tabindex="1" class="form-control" placeholder="User Name/Email"  required>
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-lock" ></i></span>
                                            <input type="password" name="loginpassword" id="loginpassword" tabindex="2" class="form-control" placeholder="Password"  required>
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember"> Remember Me</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6 mx-auto">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="text-center">
                                                        <a href="" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </form>
                                    <form id="register-form" action="RegistrationController" method="post" role="form" style="display: none;">


                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-user" ></i></span>
                                            <input type="text" name="firstname" id="firstname" tabindex="1" class="form-control" placeholder="First Name" required>
                                        </div> 

                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-user" ></i></span>
                                            <input type="text" name="lastname" id="lastname" tabindex="1" class="form-control" placeholder="Last Name" required>
                                        </div>

                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-envelope" ></i></span>
                                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" required>
                                        </div>

                                        <div class="form-group input-group ">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-user" ></i></span>
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control " placeholder="Username" required>
                                        </div>

                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-lock" ></i></span>
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" required>
                                        </div>

                                        <div class="form-group input-group">
                                            <span class="input-group-addon" id="iconcolor"><i class="fa fa-lock" ></i></span>

                                            <input type="password" name="confirmpassword" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password"  required>

                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6 mx-auto">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now" >
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>