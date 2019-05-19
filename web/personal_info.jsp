<%-- 
    Document   : personal_info
    Created on : Jan 23, 2019, 5:08:39 PM
    Created on : Jan 23, 2019, 5:22:43 PM
    Author     : partho
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Software-Schooling</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css">
        <!-- Google fonts - Open Sans-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <!-- Fancybox-->
        <link rel="stylesheet" href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
        <!-- theme stylesheet-->
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="favicon.png">
        <script src="js/personal_info.js"></script>
        <link rel="stylesheet" href="css/style.personalinfo.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/personalinfo.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);


        %> 

        <header class="header">
            <!-- Main Navbar-->
            <nav class="navbar navbar-expand-lg">
                <div class="search-area">
                    <div class="search-area-inner d-flex align-items-center justify-content-center">
                        <div class="close-btn"><i class="icon-close"></i></div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-8">
                                <form action="">
                                    <div class="form-group">
                                        <input type="search" name="search" id="search" placeholder="What are you looking for?">
                                        <button type="submit" class="submit"><i class="icon-search-1 "></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="container">
                    <!-- Navbar Brand -->
                    <div class="navbar-header d-flex align-items-center justify-content-between">
                        <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand font-italic"> 𝖘𝖔𝖋𝖙𝖜𝖆𝖗𝖊𝖘𝖈𝖍𝖔𝖔𝖑𝖎𝖓𝖌</a>
                        <!-- Toggle Button-->
                        <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
                    </div>
                    <!-- Navbar Menu -->
                    <div id="navbarcollapse" class="collapse navbar-collapse " >
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item" ><a href="index.jsp" class="nav-link active  fa fa-home" id="linkcolor">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="/software-schooling/BlogController" class="nav-link dropdown-toggle fa fa-rss"  id="navbarDropdown" id="linkcolor" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Blog </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="/software-schooling/BlogController">Blogs</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Java Programming</a>
                                    <a class="dropdown-item" href="#">RDMS Tutorial</a>
                                    <a class="dropdown-item" href="#">Unix Operating System</a>
                                </div>
                            </li>  
                            <li class="nav-item" ><a href="#" class="nav-link fa fa-phone " id="linkcolor"> Contact</a>

                            <li class=" nav-item" ><a href="#" class="nav-link fa fa-send" id="linkcolor"> Q/A</a>

                            </li>
                            <%                                if (session.getAttribute("loginusername") == null) {
                            %>
                            <li class="nav-item" ><a href="login_register.jsp" class="nav-link fa fa-sign-in" id="linkcolor"> Log in</a>
                            </li>   
                            <%
                            } else {
                            %>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle fa fa-user-secret" href="#" id="linkcolor" role="button" data-toggle="dropdown">
                                    <%=session.getAttribute("loginusername")%>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="personal_info.jsp">Account Setting</a>
                                    <a class="dropdown-item" href="logout.jsp">Log Out</a>
                                </div>
                            </li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <div class="inset">
                                    <img  src="img/profile_picture/<%=session.getAttribute("loginusername")%>.jpg" class="profile">
                                </div>
                            </li> 
                        </ul>
                        <%
                            }
                        %>

                        <!--                        <form class="form-inline md-form mx-auto">
                                                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                                                    <button class="btn btn-success" type="submit">Search</button>
                                                </form>-->
                        <div class="navbar-text"><a href="#" class="search-btn"><i class="icon-search-1"></i></a></div>
                    </div>
                </div>
            </nav>
        </header>


        <div class="container">
            <div class="row my-2">
                <div class="col-lg-8 order-lg-2">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a href="#"  class="nav-link" id="profilelink">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a href="#"  class="nav-link" id="editlink">Edit</a>
                        </li>
                    </ul>
                    <div class="tab-content py-4">
                        <div class="tab-pane active" id="profile">

                            <h5 class="mb-3"><%out.print(session.getAttribute("loginusername"));%></h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <h6>About</h6>
                                    <p>
                                        Java Full stack developer
                                    </p>
                                    <h6>Hobbies</h6>
                                    <p>
                                        Love Hindi music, skiing and hiking. I love the great outdoors.Love to Programming very much
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <h6>Experienced in </h6>
                                    <a href="#" class="badge badge-dark badge-pill">html5</a>
                                    <a href="#" class="badge badge-dark badge-pill">react</a>
                                    <a href="#" class="badge badge-dark badge-pill">codeply</a>
                                    <a href="#" class="badge badge-dark badge-pill">angularjs</a>
                                    <a href="#" class="badge badge-dark badge-pill">css3</a>
                                    <a href="#" class="badge badge-dark badge-pill">jquery</a>
                                    <a href="#" class="badge badge-dark badge-pill">bootstrap</a>
                                    <a href="#" class="badge badge-dark badge-pill">JavaEE</a>
                                    <a href="#" class="badge badge-dark badge-pill">Mysql</a>
                                    <a href="#" class="badge badge-dark badge-pill">JavaSE</a>
                                    <a href="#" class="badge badge-dark badge-pill">Oracle</a>
                                    <hr>
                                    <span class="badge badge-primary"><i class="fa fa-user"></i> 900 Followers</span>
                                    <span class="badge badge-success"><i class="fa fa-cog"></i> 43 Forks</span>
                                    <span class="badge badge-danger"><i class="fa fa-eye"></i> 245 Views</span>
                                </div>
                                <div class="col-md-12">
                                    <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Recent Activity</h5>
                                    <table class="table table-sm table-hover table-striped">
                                        <tbody>                                    
                                            <tr>
                                                <td>
                                                    <strong>Abby</strong> joined ACME Project Team in <strong>`Collaboration`</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Gary</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Kensington</strong> deleted MyBoard3 in <strong>`Discussions`</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>John</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Skell</strong> deleted his post Look at Why this is.. in <strong>`Discussions`</strong>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--/row-->
                        </div>
                        <div class="tab-pane" id="edit-form">
                            <form class="form" action="RegistrationController" method="post">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="Jane">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="Bishop">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="email" value="email@gmail.com">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Username</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="janeuser">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="password" value="11111122333">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="password" value="11111122333">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input type="reset" class="btn btn-secondary" value="Cancel">
                                    <input type="button" class="btn btn-primary" value="Save Changes">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 order-lg-1 text-center">


                    <%
                        if (session.getAttribute("loginusername") == null) {
                    %>

                    <div class="profile-img">



                        <form id="register-form" action="FileUploadController" method="post" role="form" enctype="multipart/form-data">
                            <img src="img/profile_picture/<%=session.getAttribute("loginusername")%>.jpg" class="avatar  img-thumbnail">
                            <label class="custom-file">
                                <input type="file" name="file" style="width:200px" accept="image/*" id="imgInp"><br><br>
                                <button class="btn btn-lg btn-info fa fa-pencil-square-o"> Save</button>
                            </label>
                        </form>
                    </div>

                    <% } else {%>

                    <div class="profile-img">
                        <form id="register-form" action="FileUploadController" method="post" role="form" enctype="multipart/form-data">
                            <div class="imgbtn">
                                <img id="blah" src="img/profile_picture/<%=session.getAttribute("loginusername")%>.jpg" class="rounded">
                                <label class="custom-file">
                                    <input type="file" name="file" style="width:200px" accept="image/*" id="imgInp">
                                </label>
                                <button class="btn fa fa-pencil-square-o" style="position: absolute"> Update</button>
                            </div>
                        </form >

                    </div>
                    <% }%>
                </div>
            </div>
        </div>

        <script>
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#imgInp").change(function () {
                readURL(this);
            });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

       
    </body>
</html>
