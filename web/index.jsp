<%@page import="pojo.java.module.Contents"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>

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
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->

        <link rel="shortcut icon" href="favicon.png">

    </head>
    <body style="background: #eee;">


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
                        <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand font-italic"></a>
                        <!-- Toggle Button title here-->
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

                            <li class=" nav-item" ><a href="addMcq.jsp" class="nav-link fa fa-send" id="linkcolor"> Q/A</a>

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
        <!-- Hero Section-->
        <section style="background: url(img/hero-bg1.jpg); background-size: cover;" class="hero">
            <h1 style="text-align:center">Welcome to software schooling</h1>
            <div class="container">
                <a href="#" style="padding-left: 450px;"><img src="img/JavaScript.png" class="rounded-circle hell" alt="Cinque Terre" width="100px;" height="100"> </a>

                
                <div class="sizefixing">

                    <a href="/software-schooling/BlogController?tagName=javascript" style="padding-left: 50px;"><img src="img/JavaScript.png" class="rounded-circle  hell" alt="Cinque Terre" width="85px;" height="85">
                        <div  style="text-align: center;">javaScript</div>
                    </a>

                    <a href="/software-schooling/BlogController?tagName=java" style="padding-left: 50px;text-decoration: none"><img src="img/java.jpg" class="rounded-circle  hell" alt="Cinque Terre"  width="85px;" height="85">
                        <div style="text-align: center;">java</div>
                    </a>

                    <a href="/software-schooling/BlogController?tagName=mysql" style="padding-left: 50px;"><img src="img/MySQL.png" class="rounded-circle hell" alt="Cinque Terre" width="85px;" height="85">
                        <div style="text-align: center">MySQL</div>
                    </a>

                    <a href="/software-schooling/BlogController?tagName=html" style="padding-left: 50px;"><img src="img/html.jpg" class="rounded-circle hell" alt="Cinque Terre" width="85px;" height="85">
                        <div style="text-align: center">html</div>
                    </a>

                    <a href="/software-schooling/BlogController?tagName=css" style="padding-left: 50px;"><img src="img/css.jpg" class="rounded-circle hell" alt="Cinque Terre" width="85px;" height="85">
                        <div style="text-align: center">css</div>
                    </a>

                    <a href="/software-schooling/BlogController?tagName=rdms" style="padding-left: 50px;"><img src="img/database.jpg" class="rounded-circle hell" alt="Cinque Terre" width="85px;" height="85">
                        <div style="text-align: center">database</div>
                    </a>
                    
                    <a href="/software-schooling/BlogController?tagName=html" style="padding-left: 50px;"><img src="img/html.jpg" class="rounded-circle hell" alt="Cinque Terre" width="85px;" height="85">
                        <div style="text-align: center">html</div>
                    </a>





                </div>



<!--                                                <a href=".intro" class="continue link-scroll"><i class="fa fa-long-arrow-down"></i> Scroll Down</a>-->
            </div>
        </section><br>
        <!--         Intro Section
                <section class="intro">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <h2 class="h3">Some great intro here</h2>
                                <p class="text-big">Place a nice <strong>introduction</strong> here <strong>to catch reader's attention</strong>. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi.</p>
                            </div>
                        </div>
                    </div>
                </section>-->
        <section class="featured-posts no-padding-top intro">

            <a href="#" style="position: absolute"><img > </a>
            <h3 style="text-align: center"><img src="img/images.png" class="rounded-circle" width="35px;" height="35"> Tutorials Library</h3>

            <div class="container">
                <!-- Post-->


                <!-- Post                            -->
                <div class="row" style=" ">

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                        <!-- Card -->
                         <div class="card gradient-card ">

                            <div class="card-image">
                                <div class="card-title" style="text-align: center">
                                    <h4>Programming</h4>
                                </div>

                                <!-- Content -->

                                <a href="/software-schooling/DetailsController?technologyName=JAVA" style="padding-left: 30px;"><img src="img/cplus.png" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div style="text-align: center;">C++</div>
                                </a>
                                <a href="/software-schooling/DetailsController?technologyName=CSS" style="padding-left: 30px;"><img src="img/c.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">C</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/phyton.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/oracledatabase.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>

                            </div>

                            <!-- Data -->
                            <div class="third-content ml-auto mr-4 mb-2">

                            </div>

                            <!-- Content -->
                            <div class="card-body white">


                            </div>

                        </div>
                        <!-- Card -->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                        <!-- Card -->
                        <div class="card gradient-card ">

                            <div class="card-image">
                                <div class="card-title" style="text-align: center">
                                    <h4>Programming</h4>
                                </div>

                                <!-- Content -->

                                <a href="/software-schooling/DetailsController?technologyName=JAVA" style="padding-left: 30px;"><img src="img/cplus.png" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div style="text-align: center;">C++</div>
                                </a>
                                <a href="/software-schooling/DetailsController?technologyName=CSS" style="padding-left: 30px;"><img src="img/c.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">C</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/phyton.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/oracledatabase.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>

                            </div>

                            <!-- Data -->
                            <div class="third-content ml-auto mr-4 mb-2">

                            </div>

                            <!-- Content -->
                            <div class="card-body white">
                            </div>

                        </div>
                        <!-- Card -->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                        <!-- Card -->
                        <div class="card gradient-card ">

                            <div class="card-image">
                                <div class="card-title" style="text-align: center">
                                    <h4>Programming</h4>
                                </div>

                                <!-- Content -->

                                <a href="/software-schooling/DetailsController?technologyName=JAVA" style="padding-left: 30px;"><img src="img/cplus.png" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div style="text-align: center;">C++</div>
                                </a>
                                <a href="/software-schooling/DetailsController?technologyName=CSS" style="padding-left: 30px;"><img src="img/c.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">C</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/phyton.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/oracledatabase.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>

                            </div>

                            <!-- Data -->
                            <div class="third-content ml-auto mr-4 mb-2">

                            </div>

                            <!-- Content -->
                            <div class="card-body white">


                            </div>

                        </div>
                        <!-- Card -->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                        <!-- Card -->
                        <div class="card gradient-card ">

                            <div class="card-image">
                                <div class="card-title" style="text-align: center">
                                    <h4>Programming</h4>
                                </div>

                                <!-- Content -->

                                <a href="/software-schooling/DetailsController?technologyName=JAVA" style="padding-left: 30px;"><img src="img/cplus.png" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div style="text-align: center;">C++</div>
                                </a>
                                <a href="/software-schooling/DetailsController?technologyName=CSS" style="padding-left: 30px;"><img src="img/c.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">C</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/phyton.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>
                                <a href="#" style="padding-left: 30px;"><img src="img/oracledatabase.jpg" class="rounded-circle" alt="Cinque Terre" width="85px;" height="85">
                                    <div  style="text-align: center;">Python</div>
                                </a>

                            </div>

                            <!-- Data -->
                            <div class="third-content ml-auto mr-4 mb-2">

                            </div>

                            <!-- Content -->
                            <div class="card-body white">

                            </div>

                        </div>
                        <!-- Card -->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->
            </div>
        </section>
        <!-- Divider Section-->
        <section style="background: url(img/divider-bg.jpg); background-size: cover; background-position: center bottom" class="divider">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                    <h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</h2><a href="#" class="hero-link">View More</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Posts -->
    <section class="latest-posts"> 
        <div class="container">
            <header> 
                <h2>Popular from the blog</h2>
                <p class="text-big">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </header>
            <div class="row">

                

                <div class="post col-md-3">
                    <div class="post-thumbnail"><a href="post.jsp"><img src="img/blog-3.jpg" alt="..." class="img-fluid"></a></div>
                    <div class="post-details">
                        <div class="post-meta d-flex justify-content-between">
                            <div class="date">20 May | 2016</div>
                            <div class="category"><a href="#" id="linkcolor">Financial</a></div>
                        </div><a href="post.jsp">
                            <h3 class="h4" id="textcolor"></h3></a>
                            <p class="text-muted"></p>
                    </div>
                </div>
                

                
            </div>
        </div>
    </section>
    <!-- Newsletter Section-->
    <section class="newsletter no-padding-top">    
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Subscribe to Newsletter</h2>
                    <p class="text-big">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
                <div class="col-md-8">
                    <div class="form-holder">
                        <form action="#">
                            <div class="form-group">
                                <input type="email" name="email" id="email" placeholder="Type your email address">
                                <button type="submit" class="submit"> Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Gallery Section-->
    <section class="gallery no-padding">    
        <div class="row">
            <div class="mix col-lg-3 col-md-3 col-sm-6">
                <div class="item"><a href="img/gallery-1.jpg" data-fancybox="gallery" class="image"><img src="img/gallery-1.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div></a></div>
            </div>
            <div class="mix col-lg-3 col-md-3 col-sm-6">
                <div class="item"><a href="img/gallery-2.jpg" data-fancybox="gallery" class="image"><img src="img/gallery-2.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div></a></div>
            </div>
            <div class="mix col-lg-3 col-md-3 col-sm-6">
                <div class="item"><a href="img/gallery-3.jpg" data-fancybox="gallery" class="image"><img src="img/gallery-3.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div></a></div>
            </div>
            <div class="mix col-lg-3 col-md-3 col-sm-6">
                <div class="item"><a href="img/gallery-4.jpg" data-fancybox="gallery" class="image"><img src="img/gallery-4.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div></a></div>
            </div>
        </div>
    </section>
    <!-- Page Footer-->
    <footer class="main-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="logo">
                        <h6 class="text-white">Bootstrap Blog</h6>
                    </div>
                    <div class="contact-details">
                        <p>53 Broadway, Broklyn, NY 11249</p>
                        <p>Phone: (+880) 1785 38 19 89</p>
                        <p>Email: <a href="mailto:info@company.com">Info@Company.com</a></p>
                        <ul class="social-menu">
                            <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-behance"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="menus d-flex">
                        <ul class="list-unstyled">
                            <li> <a href="#">My Account</a></li>
                            <li> <a href="#">Add Listing</a></li>
                            <li> <a href="#">Pricing</a></li>
                            <li> <a href="#">Privacy &amp; Policy</a></li>
                        </ul>
                        <ul class="list-unstyled">
                            <li> <a href="#">Our Partners</a></li>
                            <li> <a href="#">FAQ</a></li>
                            <li> <a href="#">How It Works</a></li>
                            <li> <a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="latest-posts"><a href="#">
                            <div class="post d-flex align-items-center">
                                <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                                <div class="title"><strong>Hotels for all budgets</strong><span class="date last-meta">October 26, 2016</span></div>
                            </div></a><a href="#">
                            <div class="post d-flex align-items-center">
                                <div class="image"><img src="img/small-thumbnail-2.jpg" alt="..." class="img-fluid"></div>
                                <div class="title"><strong>Great street atrs in London</strong><span class="date last-meta">October 26, 2016</span></div>
                            </div></a><a href="#">
                            <div class="post d-flex align-items-center">
                                <div class="image"><img src="img/small-thumbnail-3.jpg" alt="..." class="img-fluid"></div>
                                <div class="title"><strong>Best coffee shops in Sydney</strong><span class="date last-meta">October 26, 2016</span></div>
                            </div></a></div>
                </div>
            </div>
        </div>
        <div class="copyrights">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p>&copy; 2017. All rights reserved. Your great site.</p>
                    </div>
                    <div class="col-md-6 text-right">
                        <p>Template By <a href="https://bootstraptemple.com" class="text-white">Bootstrap Temple</a>
                            <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="js/front.js"></script>
</body>
</html>