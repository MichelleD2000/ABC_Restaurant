package com.abc.service;

import com.abc.dao.QueryDAO;
import com.abc.model.Query;

import java.sql.SQLException;
import java.util.List;

public class QueryService {
    private QueryDAO queryDAO;

    public QueryService() {
        queryDAO = new QueryDAO();
    }

    public void addQuery(Query query) throws SQLException {
        queryDAO.createQuery(query);
    }

    public List<Query> getQueries() throws SQLException {
        return queryDAO.getAllQueries();
    }

    public void removeQuery(int id) throws SQLException {
        queryDAO.deleteQuery(id);
    }
}
