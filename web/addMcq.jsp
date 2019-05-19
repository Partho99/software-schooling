<%-- 
    Document   : addMcq
    Created on : May 19, 2019, 6:02:53 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> Quiz Portal</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">

<!--        <link rel="stylesheet" href="vendor/bootstrap/css/custom-theme.css">-->
        
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        
         <link rel="stylesheet" href="css/fontastic.css">
         


        <!-- Latest compiled and minified JavaScript -->
        <script src="vendor/bootstrap/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
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
                        
        </header>
                        <br>
                        
        <div class="container">
            <header>

            </header>
            <form class="form-horizontal" action="AddMcqController">
                <fieldset>
                    <legend>Add Multiple Choice Question</legend>
                    <div class="form-group">
                        <label for="inputQuestionText" class="col-lg-2 ">Question Text</label>
                        <div class="col-lg-10">
                            <input type="text" name="question_text" class="form-control" id="inputQuestionText"
                                   placeholder="Text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="select" class="col-lg-2 control-label">Select Topic</label>
                        <div class="col-lg-10">
                            <select class="form-control" id="select" name="tags">
                                <option disabled="disabled" selected="selected">Select Topic</option>
                                <option value="java">Java</option>
                                <option value="c++">C++</option>
                                <option value="python">Python</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputChoice_1" class="col-lg-2 control-label">Option 1</label>
                        <div class="col-sm-8">
                            <input type="text" name="choice1_text" class="form-control" id="inputChoice_1" placeholder="Choice Text">
                        </div>
                        <div class="col-sm-2 text-left"><br>
                            <label>
                                <input type="radio" name="correct_choice" value="1">
                                Correct Answer
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputChoice_2" class="col-lg-2 control-label">Option 2</label>
                        <div class="col-sm-8">
                            <input type="text" name="choice2_text" class="form-control" id="inputChoice_2" placeholder="Choice Text">
                        </div>
                        <div class="col-sm-2 text-left"><br>
                            <label>
                                <input type="radio" name="correct_choice" value="2">
                                Correct Answer
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputChoice_3" class="col-lg-2 control-label">Option 3</label>
                        <div class="col-sm-8">
                            <input type="text" name="choice3_text" class="form-control" id="inputChoice_3" placeholder="Choice Text">
                        </div>
                        <div class="col-sm-2 text-left"><br>
                            <label>
                                <input type="radio" name="correct_choice" value="3">
                                Correct Answer
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputChoice_4" class="col-lg-2 control-label">Option 4</label>
                        <div class="col-sm-8">
                            <input type="text" name="choice4_text" class="form-control" id="inputChoice_4" placeholder="Choice Text">
                        </div>
                        <div class="col-sm-2 text-left"><br>
                            <label>
                                <input type="radio" name="correct_choice" value="4">
                                Correct Answer
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-5">
                            <button type="reset" class="btn btn-default">Reset</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>
