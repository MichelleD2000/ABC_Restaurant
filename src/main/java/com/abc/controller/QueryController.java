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

@WebServlet("/queries")
public class QueryController extends HttpServlet {
    private QueryService queryService;

    @Override
    public void init() throws ServletException {
        queryService = QueryService.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String customerEmail = request.getParameter("customerEmail");
        String question = request.getParameter("question");

        Query query = new Query();
        query.setCustomerName(customerName);
        query.setCustomerEmail(customerEmail);
        query.setQuestion(question);

        try {
            queryService.saveQuery(query);
            request.setAttribute("message", "Your query has been submitted successfully!");
        } catch (SQLException e) {
            request.setAttribute("error", "There was an error submitting your query. Please try again.");
            e.printStackTrace();
        }

        request.getRequestDispatcher("Queries.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("queries", queryService.getAllQueries());
        } catch (SQLException e) {
            request.setAttribute("error", "Unable to load queries.");
            e.printStackTrace();
        }
        request.getRequestDispatcher("StaffQueries.jsp").forward(request, response);
    }
}
