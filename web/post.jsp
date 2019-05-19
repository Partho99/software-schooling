<%@page import="connection.jdbc.module.RegistrationLoginDB"%>
<%@page import="pojo.java.module.User"%>
<%@page import="pojo.java.module.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.java.module.Contents"%>
<%@page import="pojo.java.module.Contents"%>
<%@page import="connection.jdbc.module.JdbcDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bootstrap Blog - B4 Template by Bootstrap Temple</title>
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
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="favicon.png">
        


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
                                <a href="blog.jsp" class="nav-link dropdown-toggle fa fa-rss"  id="navbarDropdown" id="linkcolor" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Blog </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="/software-schooling/BlogController">Blogs</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" id="linkcolor" href="#">Java Programming</a>
                                    <a class="dropdown-item" href="#">RDMS Tutorial</a>
                                    <a class="dropdown-item" href="#">Unix Operating System</a>
                                </div>
                            </li>  
                            <li class="nav-item" ><a href="#" class="nav-link active fa fa-clipboard" id="linkcolor"> Post</a>
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


        <%

        %>
        <div class="container">

            <div class="row">
                <!-- Latest Posts -->
                <main class="post blog-post col-lg-8"> 
                    <div class="container">
                        <div class="post-single">
                            <!--   <div class="post-thumbnail"><img src="img/blog-post-1.jpeg" alt="..." class="img-fluid"></div> -->
                            <div class="post-details">

                                <%  ArrayList<Contents> postItem = (ArrayList<Contents>) request.getAttribute("postitem");
                                    for (int i = 0; i < postItem.size(); i++) {
                                %>
                                <div class="post-meta d-flex justify-content-between">
                                    <div class="category"><a href="#">Business</a><a href="#">Financial</a></div>
                                </div>


                                <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="#" class="author d-flex align-items-center flex-wrap">
                                        <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid"></div>

                                        <div class="title"><span>John Doe</span></div></a>
                                    <div class="d-flex align-items-center flex-wrap">       
                                        <div class="date"><i class="icon-clock"></i><%=postItem.get(i).getCreationDtm()%></div>
                                        <div class="views"><i class="icon-eye" id="iconcolor"></i></div>
                                        <div class="comments meta-last"><i class="icon-comment"></i>12555</div>



                                        <%
                                            HttpSession session1 = request.getSession();
                                            // session.setAttribute("contentId", postItem.get(i).getContentId());


                                        %>
                                    </div>
                                    <form class="form" id="login-form" action="VotingController" method="post" role="form" style="display: block;">
                                        <div class="like-content">
                                            <input  name="contentid" value="<%=postItem.get(i).getContentId()%>" hidden="" /> 
                                            <input  name="upvote" value="<%="upvote"%>"  hidden=""/>
                                            <button class="btn-secondary like-review" type="submit">

                                                <i class="fa fa-thumbs-up" aria-hidden="true"></i>

                                            </button>

                                        </div>
                                    </form>
                                    <form class="form" id="login-form" action="VotingController" method="post" role="form" style="display: block;">
                                        <div class="like-content">
                                            <input  name="contentid" value="<%=postItem.get(i).getContentId()%>" hidden="" /> 
                                            <input  name="downvote" value="<%="downvote"%>"  hidden=""/>
                                            <button class="btn-secondary like-review" type="submit">
                                                <i class="fa fa-thumbs-down" aria-hidden="true" ></i>
                                            </button>

                                        </div>
                                    </form>
                                </div>




                                <div class="post-body">



                                    <p class="lead"></p>
                                    <p><%%></p>
                                    <p> <img src="img/featured-pic-3.jpeg" alt="..." class="img-fluid"></p>

                                    <div class="card">
                        <div class="card-body">
                              <h2><%=postItem.get(i).getContentTitle()%></h2> 
                        </div>
                    </div>
                                    
                                    
                                </div>
                                
                    <div class="card editorsStyle">
                        <div class="card-body">
                             <% out.println(postItem.get(i).getContentText()); %>
                        </div>
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

                                    <% ArrayList<Comment> commentslength = (ArrayList<Comment>) request.getAttribute("comments");%> 
                                    <header>
                                        <h3 class="h6" style="color:#930505;">Post Comments<span class="no-of-comments" style="color:blue;">(<%=commentslength.size()%>)</span></h3>
                                    </header>

                                    <%  ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
                                        for (Comment comment : comments) {

                                            User userDetails = new User();
                                            RegistrationLoginDB rldb = new RegistrationLoginDB();
                                            userDetails = rldb.showUserDetails(comment.getUserId());

                                    %>
                                    <div class="comment">
                                        <div class="comment-header d-flex justify-content-between">
                                            <div class="user d-flex align-items-center">
                                                <div class="image"><img src="img/profile_picture/<%=comment.getUserName()%>.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                                <div class="title"><strong><%=userDetails.getFirstName() + " " + userDetails.getLastName()%></strong><span class="date">May 2016</span></div>
                                            </div>
                                        </div>
                                        <div class="comment-body">
                                            <p><%=comment.getCommentText()%></p>
                                        </div>
                                    </div>

                                    <% } %>
                                </div>

                                <%

//                                    HttpSession session1 = request.getSession();
                                    String username = (String) session1.getAttribute("loginusername");
                                    if (username != null) {
                                %>
                                
                                <div class="add-comment">
                                    <header>
                                        <h3 class="h6">Leave a reply</h3>
                                    </header>
                                    <form action="CommentsController?contentId=<%=postItem.get(i).getContentId()%>" method="post" class="commenting-form">
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
                                <% } else {

                                %>
                                <a href="login_register.jsp" >Please login to comment</a> 
                                <% } %>
                                <% } %>
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
                        <%
                            ArrayList<Contents> listItem = (ArrayList<Contents>) request.getAttribute("latestitem");
                            for (Contents contents : listItem) {
                        %>
                        <div class="blog-posts"><a href="/software-schooling/PostController?contentId=<%=contents.getContentId()%>">
                                <div class="item d-flex align-items-center">
                                    <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                                    <div class="title"><strong ><%out.print(contents.getContentTitle()); %></strong>
                                        <div class="d-flex align-items-center">
                                            <div class="views"><i class="icon-eye"></i></div>
                                            <div class="comments"><i class="icon-comment"></i>12</div>
                                        </div>
                                    </div>
                                </div></a></div>
                                <% }%>
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
                            <p>Phone: (020) 123 456 789</p>
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