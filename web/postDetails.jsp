<%-- 
    Document   : postDetails
    Created on : May 9, 2019, 8:55:20 PM
    Author     : partho
--%>

<%@page import="connection.jdbc.module.RegistrationLoginDB"%>
<%@page import="pojo.java.module.User"%>
<%@page import="pojo.java.module.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.java.module.Contents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/style.postdetails.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->

        <link rel="shortcut icon" href="favicon.png">
<!--              <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>

       
            

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
                    <a href="#menu-toggle" id="menu-toggle"><button class="btn-danger"><i class="fa fa-list"></i></button></a> 
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
                           
                           
                
                           
                <div id="wrapper" class="toggled">
                    
                    <!-- Sidebar -->
                    <div id="sidebar-wrapper">
                        <ul class="sidebar-nav">
                            <li class="sidebar-brand"> <a href="#" style="text-align: center"> <%= session.getAttribute("technologyName") %> </a> </li>
                            <%  ArrayList<Contents> postItem1 = (ArrayList<Contents>) request.getAttribute("contentsTitle");
                                    for(Contents title : postItem1) {
                                %>
                            <li> <a href="/software-schooling/DetailsController?contentId=<%=title.getContentId()%>&technologyName=<%= session.getAttribute("technologyName") %>"> <%=title.getContentTitle() %> </a> </li>
                            <% } %>
                        </ul>
                    </div> 
                            <!-- /#sidebar-wrapper -->
                    <!-- Page Content -->
                    <!-- /#page-content-wrapper -->
                </div>
                <!-- /#wrapper -->
                <!-- Bootstrap core JavaScript -->
               <div class="container">
            
            <div class="row">
                <!-- Latest Posts -->
                <main class="post blog-post col-lg-8"> 
                    <div class="container">
                        <div class="post-single">
                            <!--   <div class="post-thumbnail"><img src="img/blog-post-1.jpeg" alt="..." class="img-fluid"></div> -->
                            <div class="post-details">

                                <div class="post-meta d-flex justify-content-between">
                                    <div class="category"><a href="#">Business</a><a href="#">Financial</a></div>
                                </div>


                                <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="#" class="author d-flex align-items-center flex-wrap">
                                        <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid"></div>

                                        <div class="title"><span>John Doe</span></div></a>
                                    <div class="d-flex align-items-center flex-wrap">       
                                        <div class="date"><i class="icon-clock"></i></div>
                                        <div class="views"><i class="icon-eye" id="iconcolor"></i></div>
                                        <div class="comments meta-last"><i class="icon-comment"></i>12555</div>


                                       
                                    </div>
                                    <form class="form" id="login-form" action="VotingController" method="post" role="form" style="display: block;">
                                        <div class="like-content">
                                            <input  name="contentid" value="" hidden="" /> 
                                            <input  name="upvote" value=""  hidden=""/>
                                            <button class="btn-secondary like-review" type="submit">

                                                <i class="fa fa-thumbs-up" aria-hidden="true"></i>

                                            </button>

                                        </div>
                                    </form>
                                    <form class="form" id="login-form" action="VotingController" method="post" role="form" style="display: block;">
                                        <div class="like-content">
                                            <input  name="contentid" value="" hidden="" /> 
                                            <input  name="downvote" value=""  hidden=""/>
                                            <button class="btn-secondary like-review" type="submit">
                                                <i class="fa fa-thumbs-down" aria-hidden="true" ></i>
                                            </button>

                                        </div>
                                    </form>
                                </div>


                                            

                                <div class="post-body">



                                    <p class="lead"></p>
                                    <p></p>
                                    <p> <img src="img/featured-pic-3.jpeg" alt="..." class="img-fluid"></p>

                                    <h2></h2>
                                    
                                    <%
                                     ArrayList<Contents> postItem = (ArrayList<Contents>) request.getAttribute("contents");
                                     for (int i = 0; i < 1; i++){
                                    
                                    
                                    
                                    
                                    %>
                                     <div class="card editorsStyle">
                        <div class="card-body">
                            <h1><% out.println(postItem.get(i).getContentTitle()); %></h1><br>
                            <% out.println(postItem.get(i).getContentText()); %>
                        </div>
                    </div>
                                    
                                    
                                    
                                    
                                    
                                    <% } %>

                                </div>

                                <div class="post-tags" id="textcolor"><a href="#" class="tag" >#Business</a><a href="#" class="tag">#Tricks</a><a href="#" class="tag">#Financial</a><a href="#" class="tag">#Economy</a></div>
                                <div class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row"><a href="#" class="prev-post text-left d-flex align-items-center">
                                        <div class="icon prev"><i class="fa fa-angle-left"></i></div>
                                        <div class="text"><strong class="text-primary">Previous Post </strong>
                                            <h6>I Bought a Wedding Dress.</h6>
                                        </div></a><a href="#" class="next-post text-right d-flex align-items-center justify-content-end">
                                        <div class="text"><strong class="text-primary">Next Post </strong>
                                            <h6>I Bought a Wedding Dress.</h6>
                                        </div>
                                        <div class="icon next"><i class="fa fa-angle-right">   </i></div></a></div>
                                <div class="post-comments">

                                    <% //ArrayList<Comment> commentslength = (ArrayList<Comment>) request.getAttribute("comments");%> 
                                    <header>
                                        <h3 class="h6" style="color:#930505;">Post Comments<span class="no-of-comments" style="color:blue;"></span></h3>
                                    </header>

                                    
                                    <div class="comment">
                                        <div class="comment-header d-flex justify-content-between">
                                            <div class="user d-flex align-items-center">
                                                <div class="image"><img src="img/profile_picture/.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                                <div class="title"><strong></strong><span class="date">May 2016</span></div>
                                            </div>
                                        </div>
                                        <div class="comment-body">
                                            <p></p>
                                        </div>
                                    </div>

                                </div>

                                <div class="add-comment">
                                    <header>
                                        <h3 class="h6">Leave a reply</h3>
                                    </header>
                                    <form action="CommentsController?contentId=" method="post" class="commenting-form">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <textarea name="usercomment" id="usercomment" placeholder="Type your comment" class="form-control"></textarea>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <button type="submit" class="btn btn-danger">Submit Comment</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                
                                <a href="login_register.jsp" >Please login to comment</a> 
                                
                            </div>
                        </div>
                    </div>
                </main>
                <aside class="col-lg-4">
                    <!-- Widget [Search Bar Widget]-->
                    <div class="widget search">
                        <header>
                            <h3 class="h6">Search the blog</h3>
                        </header>
                        <form action="http://www.google.com" class="search-form">
                            <div class="form-group">
                                <input type="search" placeholder="What are you looking for?">
                                <button type="submit" class="submit"><i class="icon-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <!-- Widget [Latest Posts Widget]        -->


                    <div class="widget latest-posts ">
                        <header>
                            <h3 class="h6">Latest Posts</h3>
                        </header>
                       
                        <div class="blog-posts"><a href="/software-schooling/PostController?contentId=">
                                <div class="item d-flex align-items-center">
                                    <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                                    <div class="title"><strong ></strong>
                                        <div class="d-flex align-items-center">
                                            <div class="views"><i class="icon-eye"></i></div>
                                            <div class="comments"><i class="icon-comment"></i>12</div>
                                        </div>
                                    </div>
                                </div></a></div>
                                
                    </div>


                    <!-- Widget [Categories Widget]-->
                    <div class="widget categories">
                        <header>
                            <h3 class="h6">Categories</h3>
                        </header>
                        <div class="item d-flex justify-content-between"><a href="#">Growth</a><span>12</span></div>
                        <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
                        <div class="item d-flex justify-content-between"><a href="#">Sales</a><span>8</span></div>
                        <div class="item d-flex justify-content-between"><a href="#">Tips</a><span>17</span></div>
                        <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
                    </div>
                    <!-- Widget [Tags Cloud Widget]-->
                    <div class="widget tags">       
                        <header>
                            <h3 class="h6">Tags</h3>
                        </header>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="#" class="tag">#Java</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#MySql</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Operating System</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Linux</a></li>
                            <li class="list-inline-item"><a href="#" class="tag">#Technology</a></li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
            
        <script>
            $(function () {
                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });

                $(window).resize(function (e) {
                    if ($(window).width() <= 768) {
                        $("#wrapper").removeClass("toggled");
                    } else {
                        $("#wrapper").addClass("toggled");
                    }
                });
            });

        </script>
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
    </body>
</html>
