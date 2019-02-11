<%-- 
    Document   : logout.jsp
    Created on : Jan 25, 2019, 7:12:07 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession logoutsession = request.getSession(false);
    
    if (logoutsession != null) {
        logoutsession.removeAttribute("loginusername");
        logoutsession.invalidate();
    }
    request.getRequestDispatcher("/index.jsp").forward(request, response);
%>