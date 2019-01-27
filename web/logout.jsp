<%-- 
    Document   : logout.jsp
    Created on : Jan 25, 2019, 7:12:07 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession logoutSession = request.getSession();
   // logoutSession.removeAttribute("");
   
    logoutSession.invalidate();
            response.sendRedirect("index.jsp");
        %>