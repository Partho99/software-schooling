<%-- 
    Document   : createpost
    Created on : Feb 12, 2019, 5:41:34 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="vendor/bootstrap/js/bootstrap.js">
        <link rel="stylesheet" href="vendor/bootstrap/js/bootstrap.min.js">


        <script src="ckeditor/ckeditor.js"></script>
        <script src="ckeditor/config.js"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css">
        <!-- Google fonts - Open Sans-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <!-- Fancybox-->
        <link rel="stylesheet" href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->


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
            <nav class="navbar navbar-expand-lg ">
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
                        <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand" id="blog">Software-Schooling</a>
                        <!-- Toggle Button-->
                        <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
                    </div>
                    <!-- Navbar Menu -->
                    <div id="navbarcollapse" class="collapse navbar-collapse " >
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item" ><a href="index.jsp" class="nav-link  fa fa-home" id="linkcolor"> Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="/software-schooling/BlogController" class="nav-link dropdown-toggle fa fa-rss"  id="navbarDropdown" id="linkcolor" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Blog </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="/software-schooling/BlogController">Blogs</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" id="linkcolor" href="#">Java Programming</a>
                                    <a class="dropdown-item" href="#">RDMS Tutorial</a>
                                    <a class="dropdown-item" href="#">Unix Operating System</a>
                                </div>
                            </li>  
                            <li class="nav-item" ><a href="#" class="nav-link active fa fa-clipboard" id="linkcolor"> New Post</a>
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
                                <a class="nav-link dropdown-toggle fa fa-user-secret" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%=session.getAttribute("loginusername")%>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="personal_info.jsp">Personal Information</a>
                                    <a class="dropdown-item" href="createpost.jsp">Create Post</a>
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

        <div class="container-fluid ">


            <div class="row">
                <div class="col-lg-8 ">
                    <div class="card editorsStyle">
                        <div class="card-body">
                            <form  id="form" action="BlogController" method="post" >


                                <h4>Enter Post Title </h4>
                                <input type="text"  name="title" id="firstname" style="width: 100%;" required>
                                <h4>Enter Post Title </h4>
                                <textarea   name="description" id="editor" ></textarea> 
                                Tags(e.g : java,javascript,html etc)
                                <input type="text"  name="tag" id="firstname" placeholder="please tag the name about your technology you wrote,seperated by comma " style="width: 100%;" required>

                                <button type="submit" class="submit float-right btn btn-primary" >Submit Post</button>

                            </form>
                        </div>
                    </div>
                </div>

                <aside class="col-lg-3">



                    <!-- Widget [Search Bar Widget]-->
                    <div class="card">
                        <div class="card-body">
                            <div class="widget search">
                                <header>
                                    <h3 class="h6">Search the blog</h3>
                                </header>
                                <form action="#" class="search-form">
                                    <div class="form-group">
                                        <input type="search" placeholder="What are you looking for?">
                                        <button type="submit" class="submit"><i class="icon-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Widget [Latest Posts Widget]        -->

                    <div class="card editorsStyle">
                        <div class="card-body">

                            <div class="widget latest-posts">
                                <header>
                                    <h3 class="h6">Latest Posts</h3>
                                </header>

                                <div class="blog-posts"><a href="/software-schooling/PostController?contentId=">
                                        <div class="item d-flex align-items-center" id="imghov">
                                            <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                                            <div class="title"><strong id="txt"></strong>
                                                <div class="d-flex align-items-center">
                                                    <div class="views"><i class="icon-eye"></i></div>
                                                    <div class="comments"><i class="icon-comment"></i>12</div>
                                                </div>
                                            </div>
                                        </div></a>
                                </div>
                            </div>

                        </div>


                    </div>
                    <!-- Widget [Categories Widget]-->
                    <div class="card editorsStyle">
                        <div class="card-body">
                            <div class="widget categories">
                                <header>
                                    <h3 class="h6">Categories</h3>
                                </header>
                                <div class="item d-flex justify-content-between" id="categorieslinkcolor"><a id="cattext" href="#">Java</a><span>12</span></div>
                                <div class="item d-flex justify-content-between" id="categorieslinkcolor"><a id="cattext" href="#">Operating System</a><span>25</span></div>
                                <div class="item d-flex justify-content-between" id="categorieslinkcolor"><a id="cattext" href="#">Html & Css</a><span>8</span></div>
                                <div class="item d-flex justify-content-between" id="categorieslinkcolor"><a id="cattext" href="#">Servlet</a><span>17</span></div>
                                <div class="item d-flex justify-content-between" id="categorieslinkcolor"><a id="cattext" href="#">Database</a><span>25</span></div>
                            </div>
                        </div>
                    </div>
                    <!-- Widget [Tags Cloud Widget]-->
                    <div class="widget tags">  
                        <header>
                            <h3 class="h6">Tags</h3>
                        </header>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="#" class="tag" id="categorieslinkcolor">#Business</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Technology</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Fashion</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Sports</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Economy</a></li>
                        </ul>
                    </div>

                </aside>
            </div>
        </div>

        <script>
            CKEDITOR.replace('editor', {
                removePlugins: 'save'
               
                

            });
            $("form").submit(function (e) {
                var messageLength = CKEDITOR.instances['editor'].getData().replace(/<[^>]*>/gi, '').length;
                if (!messageLength) {
                    window.alert('Post Details cannot be blank');
                    e.preventDefault();
                }
            });
        </script>


    </body>



</html>  


