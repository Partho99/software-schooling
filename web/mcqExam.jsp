<%-- 
    Document   : mcqExam
    Created on : May 19, 2019, 6:44:56 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Quiz Test</title>

        <link rel="stylesheet" href="css/style.mcqExam.css" id="theme-stylesheet"></link>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">

<!--        <link rel="stylesheet" href="vendor/bootstrap/css/custom-theme.css">-->
        
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        
            <link rel="stylesheet" href="css/fontastic.css"></link>
    </head>

    <body style="background-color: #eee">
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
                        
        </header> <br>
        <div id="page-wrap">

            <h1>Final quiz test</h1>

            <form   id="quiz">

                <ol>

                    <li>

                        <h3>CSS Stands for...</h3>

                        <div>
                            <input type="radio" name="question-1-answers" id="question-1-answers-A" value="A" />
                            <label for="question-1-answers-A">A) Computer Styled Sections </label>
                        </div>

                        <div>
                            <input type="radio" name="question-1-answers" id="question-1-answers-B" value="B" required />
                            <label for="question-1-answers-B">B) Cascading Style Sheets</label>
                        </div>

                        <div>
                            <input type="radio" name="question-1-answers" id="question-1-answers-C" value="C" required />
                            <label for="question-1-answers-C">C) Crazy Solid Shapes</label>
                        </div>

                        <div>
                            <input type="radio" name="question-1-answers" id="question-1-answers-D" value="D" required />
                            <label for="question-1-answers-D">D) None of the above</label>
                        </div>

                    </li>

                    <li>

                        <h3>Internet Explorer 6 was released in...</h3>

                        <div>
                            <input type="radio" name="question-2-answers" id="question-2-answers-A" value="A"  required />
                            <label for="question-2-answers-A">A) 2001</label>
                        </div>

                        <div>
                            <input type="radio" name="question-2-answers" id="question-2-answers-B" value="B" required />
                            <label for="question-2-answers-B">B) 1998</label>
                        </div>

                        <div>
                            <input type="radio" name="question-2-answers" id="question-2-answers-C" value="C" required />
                            <label for="question-2-answers-C">C) 2006</label>
                        </div>

                        <div>
                            <input type="radio" name="question-2-answers" id="question-2-answers-D" value="D" required />
                            <label for="question-2-answers-D">D) 2003</label>
                        </div>

                    </li>

                    <li>

                        <h3>SEO Stand for...</h3>

                        <div>
                            <input type="radio" name="question-3-answers" id="question-3-answers-A" value="A" required/>
                            <label for="question-3-answers-A">A) Secret Enterprise Organizations</label>
                        </div>

                        <div>
                            <input type="radio" name="question-3-answers" id="question-3-answers-B" value="B" required />
                            <label for="question-3-answers-B">B) Special Endowment Opportunity</label>
                        </div>

                        <div>
                            <input type="radio" name="question-3-answers" id="question-3-answers-C" value="C" required />
                            <label for="question-3-answers-C">C) Search Engine Optimization</label>
                        </div>

                        <div>
                            <input type="radio" name="question-3-answers" id="question-3-answers-D" value="D" required />
                            <label for="question-3-answers-D">D) Seals End Olives</label>
                        </div>

                    </li>

                    <li>

                        <h3>A 404 Error...</h3>

                        <div>
                            <input type="radio" name="question-4-answers" id="question-4-answers-A" value="A" required />
                            <label for="question-4-answers-A">A) is an HTTP Status Code meaning Page Not Found</label>
                        </div>

                        <div>
                            <input type="radio" name="question-4-answers" id="question-4-answers-B" value="B" required />
                            <label for="question-4-answers-B">B) is a good excuse for a clever design</label>
                        </div>

                        <div>
                            <input type="radio" name="question-4-answers" id="question-4-answers-C" value="C" required />
                            <label for="question-4-answers-C">C) should be monitored for in web analytics</label>
                        </div>

                        <div>
                            <input type="radio" name="question-4-answers" id="question-4-answers-D" value="D" required />
                            <label for="question-4-answers-D">D) All of the above</label>
                        </div>

                    </li>

                    <li>

                        <h3>Your favorite website is</h3>

                        <div>
                            <input type="radio" name="question-5-answers" id="question-5-answers-A" value="A" required />
                            <label for="question-5-answers-A">A) CSS-Tricks</label>
                        </div>

                        <div>
                            <input type="radio" name="question-5-answers" id="question-5-answers-B" value="B" required />
                            <label for="question-5-answers-B">B) CSS-Tricks</label>
                        </div>

                        <div>
                            <input type="radio" name="question-5-answers" id="question-5-answers-C" value="C" required />
                            <label for="question-5-answers-C">C) CSS-Tricks</label>
                        </div>

                        <div>
                            <input type="radio" name="question-5-answers" id="question-5-answers-D" value="D" required />
                            <label for="question-5-answers-D">D) CSS-Tricks</label>
                        </div>

                    </li>

                </ol>

                <input type="submit" value="Submit Quiz" />

            </form>

        </div>

        <script type="text/javascript">
            var gaJsHost = (("https:" === document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            var pageTracker = _gat._getTracker("UA-68528-29");
            pageTracker._initData();
            pageTracker._trackPageview();
        </script>

    </body>

</html>