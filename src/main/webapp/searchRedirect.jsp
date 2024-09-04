<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve the search query parameter
    String query = request.getParameter("query");

    // Check for null or empty query
    if (query == null || query.trim().isEmpty()) {
        // Redirect to home or show an error message
        response.sendRedirect("index.jsp");
    } else {
        // Redirect based on the query
        String searchTerm = query.trim().toLowerCase();
        
        if (searchTerm.contains("table booking")) {
            response.sendRedirect("reservation.jsp");
        } else if (searchTerm.contains("private events")) {
            response.sendRedirect("ServicesPage.jsp");
        } else if (searchTerm.contains("products")) {
            response.sendRedirect("menu.jsp?search=" + query);
        } else {
            // Default or not found page
            response.sendRedirect("searchResults.jsp?query=" + query);
        }
    }
%>
