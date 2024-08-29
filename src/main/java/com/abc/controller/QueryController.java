package com.abc.controller;

import com.abc.model.Query;
import com.abc.service.QueryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/queries")
public class QueryController extends HttpServlet {
    private QueryService queryService;

    @Override
    public void init() throws ServletException {
        queryService = new QueryService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Query query = new Query(0, name, email, message);
        try {
            queryService.addQuery(query);
            response.sendRedirect("WEB-INF/view/listQuery.jsp"); // Redirect to listQuery.jsp after adding
        } catch (SQLException e) {
            throw new ServletException("Error adding query", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                queryService.removeQuery(id);
                response.sendRedirect("WEB-INF/view/listQuery.jsp"); // Redirect to listQuery.jsp after deleting
            } catch (SQLException e) {
                throw new ServletException("Error deleting query", e);
            }
        } else {
            List<Query> queries;
            try {
                queries = queryService.getQueries();
                request.setAttribute("queries", queries);
                request.getRequestDispatcher("WEB-INF/view/listQuery.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException("Error retrieving queries", e);
            }
        }
    }
}
