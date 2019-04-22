<%-- 
    Document   : logout.jsp
    Created on : Jan 25, 2019, 7:12:07 PM
    Author     : partho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

        
    HttpSession logoutsession = request.getSession(false);
    
    if (logoutsession != null) {
        logoutsession.removeAttribute("loginusername");
        logoutsession.invalidate();
    }
   // request.getRequestDispatcher("/index.jsp").forward(request, response);
   response.sendRedirect("index.jsp");
%>