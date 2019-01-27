<%-- 
    Document   : personal_info
<<<<<<< HEAD
    Created on : Jan 23, 2019, 5:08:39 PM
=======
    Created on : Jan 23, 2019, 5:22:43 PM
>>>>>>> abbd9e42680210bae202d0a91ab484ab50130239
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>hi partho</h1>
    </body>
=======


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
        <link rel="stylesheet" href="css/style.personalinfo.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="favicon.png">

    </head>

    <div class="container">
        <div class="row">
            <div class="col-sm-10"><h1>User name</h1></div>
            <div class="col-sm-2"><a href="/users" class="pull-right"><img title="profile image" class="rounded" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div>
        </div>
        <div class="row">
            <div class="col-sm-3"><!--left col-->


                <div class="text">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar rounded img-thumbnail" alt="avatar">
                    <h6>Upload a different photo...</h6>
                    <input type="file" class="text-center center-block file-upload">
                </div><br>


                <div class="card">
                    <div class="card-header">Website <i class="fa fa-link"></i></div>
                    <div class="card-body"><a href="http://bootnipets.com">bootnipets.com</a></div>
                </div>


                <ul class="list-group">
                    <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
                </ul> 
            </div><!--/col-3-->
            <div class="col-sm-9">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                </ul>


                <div class="tab-content">
                    <div class="tab-pane active" id="home">

                        <form class="" action="UserProfileController" method="post" id="registrationForm">

                            <div class="form-group">


                                <div class="col-sm-4">
                                    <label>First name</label>
                                    <input type="text" class="form-control" name="first_name" id="first_name" placeholder="" value="<%=session.getAttribute("loginfirstname")%>">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label for="last_name">Last name</label>
                                    <input type="text" class="form-control" name="last_name" id="last_name" placeholder="" value="<%=session.getAttribute("loginlastname")%>">
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="" value="<%=session.getAttribute("loginemail")%>">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label for="password">Username</label>
                                    <input type="text" class="form-control" name="user_name" id="user_name" placeholder="" value="<%=session.getAttribute("loginusername")%>">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="password" >
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label for="password2">Verify</label>
                                    <input type="password" class="form-control" name="password2" id="password2" placeholder="password2">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <br>
                                    <button class="btn btn-lg btn-success" type="submit"><i class=""></i> Save</button>
                                    <button class="btn btn-lg" type="reset"><i class=""></i> Reset</button>
                                </div>
                            </div>
                        </form>

                    </div><!--/tab-pane-->

                </div><!--/tab-pane-->
            </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
>>>>>>> abbd9e42680210bae202d0a91ab484ab50130239
</html>
