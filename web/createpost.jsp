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
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="ckeditor/ckeditor.js"></script>

    </head>
    <body>

        <form  id="form" action="BlogController" method="post">

            <div align="left">
                <h1>Enter Post Title </h1><br/>
                <input type="text" name="title" id="firstname" style="width:50%" required>
                <h1>Enter Post details</h1><br/>
                <textarea id="editor" name="description"></textarea> <input type="file" name="file" style="width:200px" accept="image/*">
                <input type="submit" value="Submit a Post">
            </div>

        </form>
        
        <script>
            CKEDITOR.replace('editor');
            $("form").submit(function (e) {
                var messageLength = CKEDITOR.instances['editor'].getData().replace(/<[^>]*>/gi, '').length;
                if (!messageLength) {
                    alert('Post Details cannot be blank');
                    // console.warn("This is a warning!");       
                    e.preventDefault();

                }
            });
        </script>
    </body>


</html>  


